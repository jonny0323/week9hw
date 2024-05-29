<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>

<%@ page import="java.sql.ResultSet" %>




<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../../cssFile/DetailPage/detailPage.css">
</head>
<body>
    <div id="container">
        <main>
            <div id="schedule">
            </div>
            <form id=set_schedule_div>
                <input type="time" class="make_button">
                <br>
                <input type="text" class="make_button">
                <br>
                <input type="button" value="일정 만들기" class="make_button">  
            </form>
            
        </main>

        <footer>
            <div>
            </div>
            <form action="../logInPage/index.jsp">
                <input type="submit" id=main_button value="메인페이지로">
            </form>
        </footer>



    </div>
</body>