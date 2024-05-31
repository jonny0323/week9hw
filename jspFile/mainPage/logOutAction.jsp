<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<%
    // 세션 속성 제거
    session.removeAttribute("session_id");
    session.removeAttribute("position");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그아웃</title>
</head>
<body>
    <script>
        // 로그아웃 후 로그인 페이지로 리다이렉션
        alert("로그아웃 성공!");
        location.href = "../logInPage/index.jsp";
    </script>
</body>
</html>