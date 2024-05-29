var day=31;
var ear=1;

function yearMoveEvent(e){
    if(e==1){
        var year = getCurrYear() - 1;

    }
    else{
        var year = getCurrYear() + 1;

    }
    
    location.href = `/week9hw/jspFile/mainPage/mainPage.jsp?year=` + year.toString();
}

function getCurrYear() {
    return Number(document.getElementById('year_container').innerText);
}


window.onload = () => {
    var url = new URLSearchParams(location.search);
    var year = url.get('year');
    

    if (!year) { 
        year = new Date().getFullYear();
    }
    ear=year;
    document.getElementById('year_container').innerText = year;
};


function monthMoveEvent(e){
    //location.href = `/week9hw/jspFile/mainPage/mainPage.jsp?year=` + ear.toString()+'&month='+e.toString();

    document.getElementById("month_"+e).style.backgroundColor="blue"
    for(var i=1;i<=12;i++){
        if(i!=e){
            document.getElementById("month_"+i).style.backgroundColor="white"
        }
    }

    if(
        e == 1 || 
        e == 3 || 
        e == 5 || 
        e == 7 || 
        e == 8 || 
        e == 10 || 
        e == 12
    ) {
        day=31;
    }
    else if(e == 2){
        day=28;
    }
    else if(e == 4 || e == 6 || e == 9 || e == 11 ){
        day=30;
    }
    

    makeDay(day)

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
        headerRow.appendChild(th);
    });

    table.appendChild(headerRow);
    



    for (var i = 1; i <= day; i++) {
        if(i%7==1){
            var tr = document.createElement("tr");
        }
        var td = document.createElement("th");
        td.innerText = i;
        td.style.height="110px";
        td.onclick=function(){
            location.href="../DetailPage/detailPage.jsp";

        }

        tr.appendChild(td);
        table.appendChild(tr);
    }


}
