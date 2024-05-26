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
            <form action="logInActionPage.jsp" id="first">
                <input type=text name="id_value" class="button" id="id" placeholder="아이디" maxlength="20">
                <br>
                <br>
                <input type=password name="pw_value" class="button" id="pw" placeholder="비밀번호" maxlength="20">
                <br>
                <br>
                <input type="submit" value="로그인" class=button>
            </form>
            <div>
                <form action="../findIdPage/findIdPage.jsp" class=inlineBlock>
                    <input type="submit" value="아이디 찾기" class=button_2>
                </form>
                <form action="../findPwPage/findPwPage.jsp" class=inlineBlock>
                    <input type="submit" value="비밀번호 찾기" class=button_2>
                </form>
                <form action="../registerPage/registerPage.jsp" class=inlineBlock>
                    <input type="submit" value="회원가입 하기" class=button_2>
                </form>
            </div>
        </main>
    </div>





</body>