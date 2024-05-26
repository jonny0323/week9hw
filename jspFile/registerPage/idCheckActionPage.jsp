<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>

<%@ page import="java.sql.ResultSet" %>



<%

    // 전 페이지에서의 값을 받아오는 것 과정(이 과정은 Delete , Update , INSERT 과정때 필요하다.)
    request.setCharacterEncoding("utf-8"); //안해주면 전 페이지가 준 한글이 깨진다.
    String idValue=request.getParameter("userId");
    

    //위에서 받아온 값으로 데이터베이스 통신
   
    //데이터베이스 통신
     //여기서 에러시 톰캣 db connector가 없다 이 3개중에 있다.
    //데이터베이스에서는 필수 이다!! 출입구 여는 느낌
    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/9hw","stageus","1234");





    //치고자 싶은 명령어!!
    String sql="SELECT id FROM account WHERE id = ?;";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1,idValue);

   

    //db로 전송하기 (UPDATE INSERT DELETE) 때 사용한다




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
    <p>아이디 사용 가능합니다.</p>
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
    <%-- <p> 아이디 : <%=idValue%> </p> --%>

    
</body>