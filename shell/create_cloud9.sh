export AWS_REGION=ap-northeast-2
export EC2_TYPE=m5.xlarge
export C9_ROLE_NAME=kw_role
export C9_PROFILE=kw_profile
export C9_NAME=kw_Cloud9

aws iam create-role --path / \
--role-name ${C9_ROLE_NAME} \
--description "Role used by Cloud9 environment" \
--assume-role-policy-document "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"ec2.amazonaws.com\"]},\"Action\":[\"sts:AssumeRole\"]}]}"
aws iam attach-role-policy --role-name ${C9_ROLE_NAME} --policy-arn arn:aws:iam::aws:policy/AdministratorAccess

aws iam create-instance-profile --instance-profile-name ${C9_PROFILE}
aws iam add-role-to-instance-profile --instance-profile-name ${C9_PROFILE} --role-name ${C9_ROLE_NAME}

# 기본 서브넷 ID 가져오기
SUBNET_ID=$(aws ec2 describe-subnets --query 'Subnets[0].SubnetId' --output text --region "${AWS_REGION}")

aws cloud9 create-environment-ec2 --name ${C9_NAME} --description "Cloud9 Environment." --instance-type "${EC2_TYPE}" --image-id resolve:ssm:/aws/service/cloud9/amis/amazonlinux-2023-x86_64 --region $AWS_REGION --automatic-stop-time-minutes 300 --subnet-id ${SUBNET_ID}

C9_IDS=$(aws cloud9 list-environments | jq -r '.environmentIds | join(" ")')
C9_EC2=$(aws cloud9 describe-environments --environment-ids "${C9_IDS}" | jq -r '.environments[] | select(.name == "'${C9_NAME}'") | .id')

sleep 60

C9_EC2_ID=$(aws ec2 describe-instances --region "${AWS_REGION}" --filters "Name=tag:aws:cloud9:environment,Values=${C9_EC2}" --query "Reservations[*].Instances[*].InstanceId" --output text)

# EC2 인스턴스가 실행될 때까지 기다림
while [ "$(aws ec2 describe-instances --instance-ids "${C9_EC2_ID}" --query "Reservations[*].Instances[*].State.Name" --output text)" != "running" ]; do
    echo "Waiting for EC2 instance to be in 'running' state..."
    sleep 10
done

if [ -n "${C9_EC2_ID}" ]; then
    aws ec2 associate-iam-instance-profile --instance-id "${C9_EC2_ID}" --iam-instance-profile Name=${C9_PROFILE} --region "${AWS_REGION}"
else
    echo "Error: Could not retrieve a valid EC2 instance ID for Cloud9 environment."
fi

aws cloud9 update-environment --environment-id "${C9_EC2}" --managed-credentials-action DISABLE
