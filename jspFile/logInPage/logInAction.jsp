<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>

<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>


<%

    // 전 페이지에서의 값을 받아오는 것 과정(이 과정은 Delete , Update , INSERT 과정때 필요하다.)
    request.setCharacterEncoding("utf-8"); //안해주면 전 페이지가 준 한글이 깨진다.
    String idValue=request.getParameter("id_value");
    String pwValue=request.getParameter("pw_value");





    //위에서 받아온 값으로 데이터베이스 통신
   
    //데이터베이스 통신
     //여기서 에러시 톰캣 db connector가 없다 이 3개중에 있다.
    //데이터베이스에서는 필수 이다!! 출입구 여는 느낌
    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/9hw","stageus","1234");





    //치고자 싶은 명령어!!
    String sql="SELECT id, pw FROM account WHERE id = ?  AND pw = ? ;";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1,idValue);
    query.setString(2,pwValue);

   





    //db로 부터 값 받기 (SELECT 일때 사용)
    ResultSet result = query.executeQuery();



     //가져온 Table 에서 row 1개를 읽어 (jsp 문법이라는게 문제)
    if(result.next()){
    Date date=new Date();
    SimpleDateFormat simpleDate=new SimpleDateFormat("yyyy-MM-dd");
    String strDate = simpleDate.format(date);
    String year_date = strDate.substring(0, 4);
    String month_date = strDate.substring(5, 7);
    String day_date = strDate.substring(8, 10);




        
    %>
    <script>
        alert("로그인 성공!")
        location.href = "../mainPage/mainPage.jsp?year=<%= year_date %>&month=<%= month_date %>&day=<%= day_date %>";
    </script>
    <%
    }else{
    %>
    <script>
        alert("아이디 혹은 비밀번호가 틀렸습니다")
        location.href="index.jsp"
       
    </script>
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