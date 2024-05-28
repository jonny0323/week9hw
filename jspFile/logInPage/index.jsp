<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../../cssFile/logInPage/logInPage.css">
</head>
<body>
    <div id="container">
        <div id="space">
        </div>
        <button  id="login_button_div">
            <input type=text name="id_value" class="login_button" id="id" placeholder="아이디" maxlength="20"> 
            <input type=password name="pw_value" class="login_button" id="pw" placeholder="비밀번호" maxlength="20">
            <p onclick="logInEvent()"  class="login_button" >
                로그인하기
            </p>
        </button>
        <div id="find_button_div">
            <a href="../findIdPage/findIdPage.jsp" value="아이디 찾기" class="find_button">
            아이디찾기
            </a> 
            <a href="../findPwPage/findPwPage.jsp" value="비밀번호 찾기" class="find_button">
            비밀번호 찾기
            </a> 
            <a href="../registerPage/registerPage.jsp" value="회원가입 하기" class="find_button">
            회원가입 하기
            </a> 
        </div>
    </div>
    <script src="../../jsFile/logInPage/index.js"></script>
</body>