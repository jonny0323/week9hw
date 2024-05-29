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
    <link rel="stylesheet" href="../../cssFile/mainPage/mainPage.css">
</head>
<body>
    <div id="container">
        <div id="left_container">
            <div id="year_container">
                2024
            </div>
            <div id=select_button_div>
                <input type="button" value="<" onclick=yearMoveEvent(1)>
                <input type="button" value=">" onclick=yearMoveEvent(2)>
            </div>


            <div>
            </div>
        </div>
        
        <div id="right_container">
            
            <div>
                <input type=button class=month_button value="1" onclick=monthMoveEvent(1) id="month_1"> 
                <input type=button class=month_button value="2" onclick=monthMoveEvent(2) id="month_2">
                <input type=button class=month_button value="3" onclick=monthMoveEvent(3) id="month_3">
                <input type=button class=month_button value="4" onclick=monthMoveEvent(4) id="month_4">
                <input type=button class=month_button value="5" onclick=monthMoveEvent(5) id="month_5">
                <input type=button class=month_button value="6" onclick=monthMoveEvent(6) id="month_6">
                <input type=button class=month_button value="7" onclick=monthMoveEvent(7) id="month_7">
                <input type=button class=month_button value="8" onclick=monthMoveEvent(8) id="month_8">
                <input type=button class=month_button value="9" onclick=monthMoveEvent(9) id="month_9">
                <input type=button class=month_button value="10" onclick=monthMoveEvent(10) id="month_10">
                <input type=button class=month_button value="11" onclick=monthMoveEvent(11) id="month_11">
                <input type=button class=month_button value="12" onclick=monthMoveEvent(12) id="month_12">
            </div>
            <div id="space">
            </div>



             <table>
        <thead id="table">
            <tr>
                <th>일</th>
                <th>월</th>
                <th>화</th>
                <th>수</th>
                <th>목</th>
                <th>금</th>
                <th>토</th>
            </tr>
        </thead>
        <tbody>
            
        </tbody>
    </table>
    </div>
    <script src="../../jsFile/mainPage/mainPage.js"></script>
</body>