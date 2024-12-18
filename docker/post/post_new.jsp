<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신규 게시글 작성</title>
</head>
<body>
    <h1>신규 게시글 작성</h1>
    <!-- 입력값을 전송하기 위한 post method 방식의 form action 선언 -->
    <form action="post_new_send.jsp" method="post">
        <table>
            <tr>
                <td>작성자</td>
                <td><input type="text" name="writer"></td>
            </tr>
            <tr>
                <td>제목</td>
                <td><input type="text" name="title"></td>
            </tr>
            <tr>
                <td>내용</td>
                <td><textarea rows="10" cols="20" name="content"></textarea></td>
            </tr>
            <tr>
                <td colspan="2">
                    <!-- 저장 버튼을 누르면 post_read_send.jsp로 연결되며, -->
                    <!-- submit 형식의 button을 통해, post 방식으로 내용 전송 -->
                    <button type="submit">저장</button>
                    <!-- 목록으로 버튼을 누르면 post_list.jsp로 연결됨 -->
                    <button type="button" onclick="location.href='post_list.jsp'">목록으로</button>
                    <!-- 초기화 버튼을 누르면 text 입력값이 모두 초기화됨 -->
                    <button type="reset">초기화</button>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>