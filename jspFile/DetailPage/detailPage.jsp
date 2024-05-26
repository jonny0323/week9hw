<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>

<%@ page import="java.sql.ResultSet" %>



<%

   




%>


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../../cssFile/logInPage/logInPage.css">
</head>
<body>
    <div id="container">
        <main>
            <div id="first">
                <input type=text class="button">
                <br>
                <br>
                <input type=password class="button" palceholder="비밀번호">
                <br>
                <br>
                <input type=button class="button" value="로그인">
            </div>
            <div>
                <input type=button class=button_2 value="아이디 찾기">
                
                <input type=button class=button_2 value="비밀번호 찾기">
                
                <input type=button class=button_2 value="회원가입하기">
            </div>
        </main>
    </div>
</body>