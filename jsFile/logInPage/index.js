var year=2024;
function logInEvent()
    {
        var id_value=document.getElementById("id").value;
        var pw_value=document.getElementById("pw").value;
        if(!id_value){
            alert("아이디를 입력해주세요");
        }   
        else if(!pw_value){
            alert("비밀번호를 입력해주세요")
        }
        else{
           location.href = "logInAction.jsp?id_value="+document.getElementById('id').value+"&pw_value="+document.getElementById('pw').value;
        }
    }