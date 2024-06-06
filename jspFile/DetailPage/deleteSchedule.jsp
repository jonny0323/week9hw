<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>

<%@ page import="java.sql.ResultSet" %>



<%

    // 전 페이지에서의 값을 받아오는 것 과정(이 과정은 Delete , Update , INSERT 과정때 필요하다.)
    request.setCharacterEncoding("utf-8"); //안해주면 전 페이지가 준 한글이 깨진다.
    String yearValue = request.getParameter("year");
    String monthValue = request.getParameter("month");
    String dayValue = request.getParameter("day");
    String idxValue=request.getParameter("idx");

    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/9hw","stageus","1234");

    String sql="DELETE FROM schedule WHERE idx = ? ;";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1,idxValue);

   

    //db로 전송하기 (UPDATE INSERT DELETE) 때 사용한다
    query.executeUpdate();

%>


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <script>
        alert("삭제 성공");
        location.href = 'detailPage.jsp?year=<%=yearValue%>&month=<%=monthValue%>&day=<%=dayValue%>';

    </script>
</body>