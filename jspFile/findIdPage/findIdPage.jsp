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
            <input type=text name="name_value" class="login_button" id="name" placeholder="이름" maxlength="20"> 
            <input type=text name="tell_value" class="login_button" id="tell" placeholder="전화번호" oninput="autoHyphen(this)" maxlength="13" autofocus >
            <p onclick="findIdEvent()"  class="login_button" >
                아이디 찾기
            </p>
        </button>
        
    </div>
    <script src="../../jsFile/findIdPage/findIdPage.js"></script>
</body>