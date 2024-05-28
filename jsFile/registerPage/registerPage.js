const autoHyphen2 = (target) => {
    target.value = target.value
    .replace(/[^0-9]/g, '')
    .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
    }

function checkId() {
    var userId = document.getElementById("userId").value;
    if (userId) {
        window.open('idCheckActionPage.jsp?userId=' + userId, 'IDCheck', 'width=400,height=200');
    } else {
        alert("아이디를 입력하세요.");
    }
}

function select_position(e){
    if(e==1){
        document.getElementById("leader").style.backgroundColor="grey";
        document.getElementById("member").style.backgroundColor="white";
    }
    else{
        document.getElementById("leader").style.backgroundColor="white";
        document.getElementById("member").style.backgroundColor="grey";
    }

}

function select_department(e){
    if(e==1){
        document.getElementById("plan").style.backgroundColor="grey";
        document.getElementById("develpe").style.backgroundColor="white";
    }
    else{
        document.getElementById("plan").style.backgroundColor="white";
        document.getElementById("develpe").style.backgroundColor="grey";
    }

}