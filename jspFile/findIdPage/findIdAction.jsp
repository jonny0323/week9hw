<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="java.util.regex.Matcher" %>
<%

    // 전 페이지에서의 값을 받아오는 것 과정(이 과정은 Delete , Update , INSERT 과정때 필요하다.)
    request.setCharacterEncoding("utf-8"); //안해주면 전 페이지가 준 한글이 깨진다.
    String nameValue=request.getParameter("name_value");
    String tellValue=request.getParameter("tell_value");

    if(nameValue.length()==0){
        
        %>
        <script>
        alert("아이디를 입력해주세요");
        </script>
        <%
        return;
    }
    else if(tellValue.length()!=13){   // 정규표현식 ( 000-0000-0000 의 형식인지 )        
        return;
    }

    String tellPattern = "^\\d{3}-\\d{4}-\\d{4}$";
    Pattern pattern = Pattern.compile(tellPattern);
    Matcher matcher = pattern.matcher(tellValue);

    if (!matcher.matches()) {
        return;
    }
    //데이터베이스에서는 필수 이다!! 출입구 여는 느낌
    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/9hw","stageus","1234");

    //치고자 싶은 명령어!!
    String sql="SELECT id FROM account WHERE name = ?  AND tell = ? ;";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1,nameValue);
    query.setString(2,tellValue);

    ResultSet result = query.executeQuery();

    if(result.next()){
    %>    
        <script>
            alert("아이디는 '<%=result.getString(1)%>' 입니다");
            location.href="../logInPage/index.jsp"
        </script>

    <%
    }else{
    %>
        <script>
            alert("매칭되는 <%=nameValue%><%=tellValue%>아이디가 없습니다");
            location.href="findIdPage.jsp"
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