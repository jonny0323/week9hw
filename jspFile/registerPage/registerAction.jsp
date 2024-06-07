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
    String idValue=request.getParameter("id");
    String pwValue=request.getParameter("pw");
    String nameValue=request.getParameter("name");
    String positionValue=request.getParameter("position");
    String tellValue=request.getParameter("tell");
    String departmentValue=request.getParameter("department");
    
    //백엔드 예외처리
    if(idValue.length()==0){
        return;
    }   
    else if(pwValue.length()==0){
        return;
    }
    else if(nameValue.length()==0){
        return;
    }
    else if(positionValue.length()==0){
        return;
    }
    else if(departmentValue.length()==0){
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
    
   
    

    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/9hw","stageus","1234");

    String sql="INSERT INTO account (id,pw,name,position,tell,department) VALUES (?,?,?,?,?,?);";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1,idValue);
    query.setString(2,pwValue);
    query.setString(3,nameValue);
    query.setString(4,positionValue);
    query.setString(5,tellValue);
    query.setString(6,departmentValue);

    query.executeUpdate();
   

%>


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <%-- <p> 아이디 : <%=idValue%> </p> --%>
    <script>
        location.href = "../logInPage/index.jsp"
    </script>
</body>


<%-- 프론트엔드 예외처리와 백엔드 예외처리는 동일 --%>
<%-- 다만, 백엔드 예외처리에 몇몇개가 더 추가될 수 있음 --%>

<%-- 백엔드 개발자는 그 어떠한 사용자 행동으로 이상이 생기지 않게 해야 함 --%>
<%-- 프론트엔드 개발자는 센스가 있어야 하지만, 백엔드 개발자는 매우 꼼꼼해야 함 --%>