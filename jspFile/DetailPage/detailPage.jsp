<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>

<%@ page import="java.sql.ResultSet" %>


<%
    request.setCharacterEncoding("utf-8"); //안해주면 전 페이지가 준 한글이 깨진다.
    String yearValue=request.getParameter("year");
    String monthValue=request.getParameter("month");
    String dayValue=request.getParameter("day");

    if (monthValue.length() == 1) {
        monthValue = "0" + monthValue;
    }
    if (dayValue.length() == 1) {
        dayValue = "0" + dayValue;
    }

    String dateValue = yearValue + "-" + monthValue + "-" + dayValue;

    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/9hw","stageus","1234");
    
    String sql="SELECT idx,account_id,datetime,content FROM schedule WHERE datetime= ? ;";


    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1,dateValue);

    ResultSet result = query.executeQuery();

%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../../cssFile/DetailPage/detailPage.css">
</head>
<body>
    <div id="container">
        <main>
            <div id="schedule">
            <%
            while(result.next()){
                %>
                  
                <div>
                    작성자:  <%=result.getString(2)%> 시간 : <%=result.getString(3)%> 내용 : <%=result.getString(4)%> 
                    <input type="button" value="수정하기" onclick=changeScheduleEvent()>
                    <input type="button" value="삭제하기" onclick=deleteScheduleEvent()>
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

    function changeScheduleEvent(){
        window.open

    }

    function deleteScheduleEvent(){
        location.href='deleteSchedule.jsp'

    }
    </script>

</body>