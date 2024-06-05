<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>

<%@ page import="java.sql.ResultSet" %>



<%

    // 전처리
    request.setCharacterEncoding("utf-8"); 
    String idValue=request.getParameter("id");

    //위에서 받아온 값으로 데이터베이스 통신
    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/9hw","stageus","1234");

    //치고자 싶은 명령어!!
    String sql="SELECT id FROM account WHERE id = ?;";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1,idValue);

    //db로 부터 값 받기 (SELECT 일때 사용)
    ResultSet result = query.executeQuery();

    if(result.next()){
    %>

    <body>
    <p><%= result.getString(1)%>는 이미 사용 중인 아이디 입니다.</p>
    </body>

    <%
    }else{
        %>
    <body>
        <script>
            alert("사용 가능한 아이디입니다.");
            window.opener.setIdFixed("<%= idValue %>");
            window.close();
        </script>
    </body>
    <%
    }
%>


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

</body>