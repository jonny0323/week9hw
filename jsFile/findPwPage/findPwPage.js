function findIdEvent()
    {
        var name_value=document.getElementById("name").value;
        var tell_value=document.getElementById("tell").value;
        if(!name_value){
            alert("이름을 입력해주세요");
            return;
        }   
        if((tell_value.length)==13){
           location.href = "findPwAction.jsp";
        }
        else{
            alert("전화번호 형식이 잘못되었습니다")
        }




    }

    const autoHyphen2 = (target) => {
        target.value = target.value
        .replace(/[^0-9]/g, '')
        .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
        }