<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>

<%@ page import="java.sql.ResultSet" %>


<%
    request.setCharacterEncoding("utf-8"); //안해주면 전 페이지가 준 한글이 깨진다.
    String yearValue = request.getParameter("year");
    String monthValue = request.getParameter("month");
    String dayValue = request.getParameter("day");

    String sessionId = (String) session.getAttribute("session_id");
    if (sessionId == null) {
        // 세션 아이디가 없으면 접근 차단
        response.sendRedirect("../logInPage/index.jsp"); // 로그인 페이지로 리디렉션
        return;
    }

    if (monthValue.length() == 1) {
        monthValue = "0" + monthValue;
    }
    if (dayValue.length() == 1) {
        dayValue = "0" + dayValue;
    }

    String dateValue = yearValue + "-" + monthValue + "-" + dayValue;
    String timeValue = yearValue + "-" + monthValue + "-" + dayValue+' ';
    
    String see = (String) session.getAttribute("see");
    String idValue = (String) session.getAttribute("session_id");
    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/9hw", "stageus", "1234");

    String sql;
    PreparedStatement query = null;
    ResultSet result = null;


   if ("yes".equals(see)) { // 수정됨
            sql = "SELECT idx, account_id, DATE_FORMAT(datetime, '%H:%i') AS time, content FROM schedule WHERE DATE(datetime) = ? ORDER BY datetime ASC;"; // 수정됨
            query = connect.prepareStatement(sql);
            query.setString(1, dateValue);
        } else {
            sql = "SELECT idx, account_id, DATE_FORMAT(datetime, '%H:%i') AS time, content FROM schedule WHERE DATE(datetime) = ? AND account_id = ? ORDER BY datetime ASC;"; // 수정됨
            query = connect.prepareStatement(sql);
            query.setString(1, dateValue);
            query.setString(2, idValue);
        }
        result = query.executeQuery();
%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="detailPage.css">
</head>
<body>
    <div id="container">
        <main>
            <div id="schedule">
            <%
            while(result.next()){
                 int idx = result.getInt("idx"); // 수정됨
                %>
                  
                <div>
                    작성자: <%=result.getString("account_id")%> 시간: <%=result.getString("time")%> 내용: <%=result.getString("content")%>
                    <% if(result.getString("account_id").equals(session.getAttribute("session_id"))){
                        %>
                    <input type="button" value="수정하기" onclick=changeScheduleEvent(<%= idx %>)>
                    <input type="button" value="삭제하기" onclick=deleteScheduleEvent(<%= idx %>)>

                        <%
                    }
                    %>
                </div>
            <%
            }
             %>
             </div>
            <form id=set_schedule_div>
                <input type="time" class="make_button" id="time">
                <br>
                <input type="text" class="make_button" id="text">
                <br>
                <input type="button" value="일정 만들기" class="make_button" onclick=makeScheduleEvent() >  
            </form>
            
        </main>

        <footer>
            <div id="show_day">
                <%=yearValue%>년<%=monthValue%>월<%=dayValue%>일 
            </div>
            <a href="../mainPage/mainPage.jsp?year=<%=yearValue%>&month=<%=monthValue%>&day=<%=dayValue%>">
                <button id="main_button">메인페이지로</button>
            </a>
        </footer>

    </div>
    <script>

    function makeScheduleEvent(){
        var time=document.getElementById('time').value;
        var text=document.getElementById('text').value;
        
        if(!time){
            alert("시간을 입력해주세요");
            return;
        }
        if(!text){
            alert("일정을 입력해주세요");
            return;
        }
        
        location.href = `makeScheduleAction.jsp?time=`+document.getElementById('time').value+"&text="+ document.getElementById('text').value+"&year=<%=yearValue%>&month=<%=monthValue%>&day=<%=dayValue%>"
    }

    function changeScheduleEvent(idx){
        var time = document.getElementById('time').value;
        window.open(`changeSchedule.jsp?idx=` + idx, 'changeWindow', 'width=600,height=400');
    }

    function deleteScheduleEvent(idx){
        if (confirm("정말 삭제하시겠습니까?")) {
            location.href = 'deleteSchedule.jsp?year=<%=yearValue%>&month=<%=monthValue%>&day=<%=dayValue%>&idx='+idx;
        }
    }
    </script>

</body>