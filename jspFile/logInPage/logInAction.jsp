<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%

    // 전처리
    request.setCharacterEncoding("utf-8");
    String idValue=request.getParameter("id_value");
    String pwValue=request.getParameter("pw_value");
    //백엔드 예외처리
    if(idValue.length()==0){
        
        %>
        <script>
        alert("아이디를 입력해주세요");
        </script>
        <%
        return;
    }
    else if(pwValue.length()==0){
        %>
        <script>
        alert("비밀번호를 입력해주세요");
        </script>
        <%
       
        return;
    }

    //데이터베이스 통신
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
        session.setAttribute("session_id", idValue);
        
        String sql1="SELECT position, department FROM account WHERE id = ?  AND pw = ? ;";
        PreparedStatement query1 = connect.prepareStatement(sql1);
        query1.setString(1,idValue);
        query1.setString(2,pwValue);

        //db로 부터 값 받기 (SELECT 일때 사용)
        ResultSet result1 = query1.executeQuery();
        result1.next();
        String position = result1.getString("position");
        String department = result1.getString("department");

        session.setAttribute("position", "leader".equals(position) ? "leader" : "member");
        session.setAttribute("department", "plan".equals(department) ? "plan" : "develop");
    
        if("leader".equals(position)){
            session.setAttribute("see", "yes");
        }
        else{
            session.setAttribute("see", "no");

        }
        %>
        <script>
            alert("로그인 성공!<%= session.getAttribute("position") %><%= session.getAttribute("department") %><%= session.getAttribute("see") %>")
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
    
</body>