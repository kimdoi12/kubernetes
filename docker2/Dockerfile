FROM tomcat:9.0

ENV TZ=Asia/Seoul
ENV CATALINA_HOME /usr/local/tomcat
ENV JAVA_HOME /opt/java/openjdk

RUN apt-get update \
  && apt-get install -y vim curl git

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
  
RUN rm -Rf /usr/local/tomcat/webapps
RUN mkdir -p /usr/local/tomcat/webapps/ROOT

WORKDIR /home
# COPY ./post/*.* /usr/local/tomcat/webapps/ROOT/.
RUN mkdir /var/lib/tomcat9/webapps/images/
COPY ./mxl/* /var/lib/tomcat9/webapps/images
RUN git clone https://github.com/unicom31/tomcat9.git

COPY mysql-connector-j-8.0.33.jar /usr/local/tomcat/lib/.

COPY tomcat /etc/default/.

CMD ["cp", "/home/tomcat9", "/usr/local/tomcat/webapps/ROOT"]
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
 