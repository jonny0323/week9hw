<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>

<%@ page import="java.sql.ResultSet" %>


<%


    request.setCharacterEncoding("utf-8"); //안해주면 전 페이지가 준 한글이 깨진다.
    String yearValue=request.getParameter("year");
    String monthValue=request.getParameter("month");
    String dayValue=request.getParameter("day");



%>



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
            <div id="show_day">
                <%=yearValue%>년<%=monthValue%>월<%=dayValue%>일 
            </div>
            <form action="../logInPage/index.jsp">
                <input type="submit" id=main_button value="메인페이지로">
            </form>
        </footer>



    </div>
</body>