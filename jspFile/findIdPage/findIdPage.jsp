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
    <link rel="stylesheet" href="../../cssFile/findIdPage/findIdPage.css">
</head>
<body>
    <div id="container">
        <main>
                <form action="findIdAction.jsp" id="first">
                <input type=text class="button" placeholder="이름" name="name_value" maxlength="10"  >
                <br>
                <br>
                <input type=text class="button" placeholder="전화번호" name="tell_value" oninput="autoHyphen2(this)" maxlength="13" autofocus>
                <br>
                <br>
                <br>
                <input type=submit  class=button value="아이디찾기">
                </form>
                
        </main>
    </div>


    <script>

        const autoHyphen2 = (target) => {
        target.value = target.value
        .replace(/[^0-9]/g, '')
        .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
        }
    </script>

</body>