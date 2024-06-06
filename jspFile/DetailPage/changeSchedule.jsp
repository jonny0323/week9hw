<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>

<%@ page import="java.sql.ResultSet" %>

<%
    request.setCharacterEncoding("utf-8"); //안해주면 전 페이지가 준 한글이 깨진다.
    String idxValue = request.getParameter("idx_value");

    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/9hw", "stageus", "1234");

    String sql="SELECT content FROM schedule WHERE idx = ?;";
    PreparedStatement query = connect.prepareStatement(sql);
    

    query.setString(1,idxValue);

    //db로 부터 값 받기 (SELECT 일때 사용)
    // ResultSet result = query.executeQuery();
    // result.next();
    // String contentValue = result.getString("content");
    //String contentValue = result.getString("content");

    String contentValue = "";

%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <%-- <p> 아이디 : <%=idValue%> </p> --%>
    <form id="set_schedule_div">
        <input type="time" class="make_button" id="time">
        <br>
        <input type="text" class="make_button" id="text">
        <br>
        <input type="button" value="일정 만들기" class="make_button" onclick="makeScheduleEvent()">
    </form>
    <script>
        
        
        document.getElementById("text").value = "<%=contentValue%>";

        function makeScheduleEvent() {
            var time = document.getElementById('time').value;
            var text = document.getElementById('text').value;

            if (!time) {
                alert("시간을 입력해주세요");
                return;
            }
            if (!text) {
                alert("일정을 입력해주세요");
                return;
            }

            location.href = `makeScheduleAction.jsp?time=` + time + "&text=" + text;
        }
        
    </script>
</body>