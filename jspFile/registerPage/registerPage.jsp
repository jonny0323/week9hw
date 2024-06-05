<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../../cssFile/registerPage/registerPage.css">
</head>
<body>
    <div id="container">
        <main>
            <div  id="server" action="result.jsp">
                <input type="text" class="button" name="id_value" placeholder="아이디" maxlength="20" id="id">
                <button type="button" onclick="checkId()">중복 체크</button>
                <input type=password class="button" placeholder="비밀번호" maxlength="20" id="pw">
                <input type=password class="button" placeholder="비밀번호확인" maxlength="20" id="re_pw">
                <input type=text class="button" placeholder="이름" maxlength="10" id=name>
                <div>
                    <input type=button class="selct_button" value="팀장" onclick=select_position(1) id="leader">
                    <input type=button class="selct_button"value="팀원" onclick=select_position(2) id="member">
                </div>
                <input type=text class="button" placeholder="전화번호" oninput="autoHyphen(this)" id="tell" maxlength="13" autofocus >
                <div>
                    <input type=button class="selct_button" value="기획팀" onclick=select_department(1) id="plan">
                    <input type=button class="selct_button" value="개발팀" onclick=select_department(2) id="develp">
                </div>
                <input type=button id="register_button" value="회원가입하기" onclick=register()>
            </div>
        </main>
    </div>
    <script src="../../jsFile/registerPage/registerPage.js"></script>

</body>