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
    <link rel="stylesheet" href="../../cssFile/registerPage/registerPage.css">
</head>
<body>
    <div id="container">
        <main>
            <div id="first">
                <form  id="server" action="result.jsp">
                    <input type="text" class="button" name="id_value" placeholder="아이디" maxlength="20" id="userId">
                    <button type="button" onclick="checkId()">중복 체크</button>
                </form>
                
                <input type=password class="button" placeholder="비밀번호" maxlength="20">
                <br>
                <br>
                <input type=password class="button" placeholder="비밀번호확인" maxlength="20">
                <br>
                <br>
                <input type=text class="button" placeholder="이름" maxlength="10">
                <br>
                <br>
                <input type=button class="selct_button" value="팀장">
                <input type=button class="selct_button2"value="팀원">
                <br>
                <br>
                <input type=text class="button" placeholder="전화번호" maxlength="13">
                <br>
                <br>
                <input type=button class="selct_button" value="기획팀">
                <input type=button class="selct_button2" value="개발팀">
            </div>
            <div>
                <input type=button class=button_2 value="회원가입하기">
            </div>
        </main>
    </div>

    <script>
        function checkId() {
            var userId = document.getElementById("userId").value;
            if (userId) {
                window.open('idCheckActionPage.jsp?userId=' + userId, 'IDCheck', 'width=400,height=200');
            } else {
                alert("아이디를 입력하세요.");
            }
        }
        


    </script>

</body>