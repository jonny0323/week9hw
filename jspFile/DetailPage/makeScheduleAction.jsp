<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>

<%@ page import="java.sql.ResultSet" %>

<%
    // 전처리
    request.setCharacterEncoding("utf-8");
    String timeValue=request.getParameter("time");
    String textValue=request.getParameter("text");
    String yearValue=request.getParameter("year");
    String monthValue=request.getParameter("month");
    String dayValue=request.getParameter("day");
    String dateTimeValue = yearValue + "-" + monthValue + "-" + dayValue + " " + timeValue;
    String sessionId = (String) session.getAttribute("session_id");
    
    if (sessionId == null) {
        // 세션 아이디가 없으면 접근 차단
        response.sendRedirect("../logInPage/index.jsp"); // 로그인 페이지로 리디렉션
        return;
    }

    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/9hw","stageus","1234");

    // INSERT
    String sql="INSERT INTO schedule (account_id,datetime,content) VALUES (?,?,?)" ;
    PreparedStatement query = connect.prepareStatement(sql);
    // Prepared state
    query.setString(1,sessionId);
    query.setString(2,dateTimeValue);
    query.setString(3,textValue);

    // Execute1
    query.executeUpdate();

    //db로 부터 값 받기 (SELECT 일때 사용)
%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <script>
        location.href="detailPage.jsp?year=<%=yearValue%>&month=<%=monthValue%>&day=<%=dayValue%>"
    </script>
</body>