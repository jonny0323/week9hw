var position=0;
var department=0;

const autoHyphen = (target) => {
    target.value = target.value
    .replace(/[^0-9]/g, '')
    .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
}

function checkId() {
    var id = document.getElementById("id").value;
    if (id) {
        window.open('idCheckAction.jsp?id=' + id, 'IDCheck', 'width=500,height=200');
    } else {
        alert("아이디를 입력하세요.");
    }
}
function setIdFixed(id) {
    document.getElementById("id").value = id;
    document.getElementById("id").readOnly = true; // 아이디 입력창을 읽기 전용으로 설정
    document.getElementById("id").style.backgroundColor="gray";
}

function select_position(e){
    if(e==1){
        document.getElementById("leader").style.backgroundColor="grey";
        document.getElementById("member").style.backgroundColor="white";
        position=1;
        console.log(position)
    }
    else{
        document.getElementById("leader").style.backgroundColor="white";
        document.getElementById("member").style.backgroundColor="grey";
        position=2;
        console.log(position)
    }
}

function select_department(e){
    if(e==1){
        document.getElementById("plan").style.backgroundColor="grey";
        document.getElementById("develp").style.backgroundColor="white";
        department=1;
        console.log(department)
    }
    else{
        document.getElementById("plan").style.backgroundColor="white";
        document.getElementById("develp").style.backgroundColor="grey";
        department=2;
        console.log(department)
    }

}

function register(){
    var id_value=document.getElementById("id").value;
    var pw_value=document.getElementById("pw").value;
    var re_pw_value=document.getElementById("re_pw").value;
    var name_value=document.getElementById("name").value;
    var tell_value=document.getElementById("tell").value;
    if(!id_value){
        alert("아이디를 입력해주세요");
        return;
    }   
    else if(!pw_value){
        alert("비밀번호를 입력해주세요");
    }
    else if(!re_pw_value){
        alert("비밀번호확인을 입력해주세요");
    }
    else if(pw_value!=re_pw_value){
        alert("비밀번호와 비밀번호 확인이 서로 다릅니다");
    }
    else if(!name_value){
        alert("이름을 입력해주세요");
    }
    else if(!(position==1||position==2)){   // 1 or 2 중에 있는지
        alert("팀장 팀원을 선택해주세요");
        console.log(position)
    }
    else if((tell_value.length)!=13){   // 정규표현식 ( 000-0000-0000 의 형식인지 )        
         alert("전화번호 형식이 잘못되었습니다")
    }
   
    else if(!(department==1 || department==2)){   // 1 or 2 중에 있는지
        alert("부서를 선택해주세요");
    }
    else{
        alert("회원가입 성공!")

        if(position==1){
            position="leader"
        }
        else{
            position="member"
        }
        if(department==1){
            department="plan"
        }
        else{
            department="develop"
        }
        location.href = "registerAction.jsp?id="+id_value+"&pw="+pw_value+"&name="+name_value+"&position="+position+"&tell="+tell_value+"&department="+department


        // if(position==1){
        //     if(department==1){
        //         location.href = "registerAction.jsp?id="+id_value+"&pw="+pw_value+"&name="+name_value+"&position=leader&tell="+tell_value+"&department=plan"
        //     }
        //     else{
        //         location.href = "registerAction.jsp?id="+id_value+"&pw="+pw_value+"&name="+name_value+"&position=leader&tell="+tell_value+"&department=develop"
        //     }
        // }
        // else{
        //     if(department==1){
        //         location.href = "registerAction.jsp?id="+id_value+"&pw="+pw_value+"&name="+name_value+"&position=member&tell="+tell_value+"&department=plan"
        //     }
        //     else{
        //         location.href = "registerAction.jsp?id="+id_value+"&pw="+pw_value+"&name="+name_value+"&position=member&tell="+tell_value+"&department=develop"
        //     }
        // }
    }
}

//아이디 중복체크
