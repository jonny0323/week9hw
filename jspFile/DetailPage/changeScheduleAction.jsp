<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>

<%@ page import="java.sql.ResultSet" %>

<%
    request.setCharacterEncoding("utf-8"); //안해주면 전 페이지가 준 한글이 깨진다.
    String timeValue = request.getParameter("time");
    String textValue = request.getParameter("text");
    String idxValue = request.getParameter("idx");

    String sessionId = (String) session.getAttribute("session_id");
    if (sessionId == null) {
        // 세션 아이디가 없으면 접근 차단
        response.sendRedirect("../logInPage/index.jsp"); // 로그인 페이지로 리디렉션
        return;
    }

    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/9hw", "stageus", "1234");

    String sql="UPDATE schedule SET datetime = CONCAT(DATE(datetime), ' ', ?) , content=? WHERE idx = ?;";
    PreparedStatement query = connect.prepareStatement(sql);
    

    query.setString(1,timeValue);
    query.setString(2,textValue);
    query.setString(3,idxValue);

    query.executeUpdate();

%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <script>
        alert("수정완료")
        window.close(); 
        console.log("<%=timeValue%>")
    </script>
</body>