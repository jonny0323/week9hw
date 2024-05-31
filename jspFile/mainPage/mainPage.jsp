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
    String position = (String) session.getAttribute("position");
    
    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/9hw","stageus","1234");


    if ("leader".equals(position)){
        
    String sql="SELECT COUNT(*) FROM schedule WHERE date = ? ;";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1,idValue);
    query.setString(2,pwValue);


    }



    else{
    String sql="SELECT id, pw FROM account WHERE id = ?  AND pw = ? ;";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1,idValue);
    query.setString(2,pwValue);



    }

    ResultSet result = query.executeQuery();


%>


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../../cssFile/mainPage/mainPage.css">
</head>
<body>
    <div id="container">
        <div id="left_container">
            <div id="year_container">
                2024
            </div>
            <div id=select_button_div>
                <input type="button" value="<" onclick=yearMoveEvent(1)>
                <input type="button" value=">" onclick=yearMoveEvent(2)>
            </div>

            <a href="logOutAction.jsp">로그아웃하기 </a>
            <br>
            <br>
<%
    
                if ("leader".equals(position)){
%>
    <input type="button" value="팀원꺼 보기/끄기">



<%
    }
%>






            <div>
            </div>
        </div>
        
        <div id="right_container">
            
            <div>
                <input type=button class=month_button value="1" onclick=monthMoveEvent(1) id="month_1"> 
                <input type=button class=month_button value="2" onclick=monthMoveEvent(2) id="month_2">
                <input type=button class=month_button value="3" onclick=monthMoveEvent(3) id="month_3">
                <input type=button class=month_button value="4" onclick=monthMoveEvent(4) id="month_4">
                <input type=button class=month_button value="5" onclick=monthMoveEvent(5) id="month_5">
                <input type=button class=month_button value="6" onclick=monthMoveEvent(6) id="month_6">
                <input type=button class=month_button value="7" onclick=monthMoveEvent(7) id="month_7">
                <input type=button class=month_button value="8" onclick=monthMoveEvent(8) id="month_8">
                <input type=button class=month_button value="9" onclick=monthMoveEvent(9) id="month_9">
                <input type=button class=month_button value="10" onclick=monthMoveEvent(10) id="month_10">
                <input type=button class=month_button value="11" onclick=monthMoveEvent(11) id="month_11">
                <input type=button class=month_button value="12" onclick=monthMoveEvent(12) id="month_12">
            </div>
            <div id="space">
            </div>



             <table>
        <thead id="table">
            <tr>
                <th>일</th>
                <th>월</th>
                <th>화</th>
                <th>수</th>
                <th>목</th>
                <th>금</th>
                <th>토</th>
            </tr>
        </thead>
        <tbody>
            
        </tbody>
    </table>
    </div>


    <script>
        var year=<%=yearValue %>
        var month=<%=monthValue %>
        var now_day=<%= dayValue%>

    
    
    
    
var day=31;
// var month=1;
// var ear=1;
// var now_day=1;

function yearMoveEvent(e){
    if(e==1){
        year = year - 1;

    }
    else{
        year = year + 1;

    }
    
    location.href = `/week9hw/jspFile/mainPage/mainPage.jsp?year=` + year.toString();
}




window.onload = () => {
    // var url = new URLSearchParams(location.search);
    // var year = url.get('year');
    

    // if (!year) { 
    //     year = new Date().getFullYear();
    // }
    // ear=year;
     document.getElementById('year_container').innerText = year;


    // 페이지 들어오자 해줘야하는 내용









    document.getElementById("month_"+month).style.backgroundColor="blue"
    for(var i=1;i<=12;i++){
        if(i!=month){
            document.getElementById("month_"+i).style.backgroundColor="white"
        }
        
    }
    

    if(
        month == 1 || 
        month == 3 || 
        month == 5 || 
        month == 7 || 
        month == 8 || 
        month == 10 || 
        month == 12
    ) {
        day=31;
    }
    else if(month == 2){
        day=28;
    }
    else if(month == 4 || month == 6 || month == 9 || month == 11 ){
        day=30;
    }

    makeDay(day)
};


function monthMoveEvent(e){
    location.href = `/week9hw/jspFile/mainPage/mainPage.jsp?year=` + year.toString()+'&month='+ e.toString();
}

function makeDay(day){

    var table = document.getElementById("table");
    table.innerHTML = "";
    var tr=document.createElement("tr")
    var th=document.createElement("th")

    var headerRow = document.createElement("tr");
    var daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"];

    daysOfWeek.forEach(day => {
        var th = document.createElement("th");
        th.innerText = day;
        th.classList.add('day_div');
        headerRow.appendChild(th);
    });

    table.appendChild(headerRow);
    



    for (var i = 1; i <= day; i++) {
        if(i%7==1){
            var tr = document.createElement("tr");
        }
        var td = document.createElement("th");
        td.innerText = i;
        td.classList.add('date_div');
        
        

        // Evnet 객체 응용했음
        td.onclick = function(e) {
            var dayIndex = e.target.innerText
            location.href="../DetailPage/detailPage.jsp?year="+year+'&month='+month+'&day='+ dayIndex;
        }

        tr.appendChild(td);
        table.appendChild(tr);
    }


}

function dayMoveEvent() {
}

















































    </script>
</body>