<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>

<%@ page import="java.sql.ResultSet" %>



<%
    request.setCharacterEncoding("utf-8"); //안해주면 전 페이지가 준 한글이 깨진다.
    String yearValue=request.getParameter("year");
    String monthValue=request.getParameter("month");
    String seeValue=request.getParameter("see");

    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/9hw","stageus","1234");

    if(seeValue.equals("yes")){
        session.setAttribute("see", "yes");
    }
    else{
        session.setAttribute("see", "no");
    }
    
    

    
%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

    <script>

        var year=<%=yearValue %>
        var month=<%=monthValue %>
        location.href = `/week9hw/jspFile/mainPage/mainPage.jsp?year=` + year.toString() + '&month=' + month.toString() // 수정됨

    </script>
</body>