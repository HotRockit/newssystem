function deleteUser () {
    var sta=confirm("确定删除此用户吗？");
    if (sta==true){
        $.ajax({
            url: "/douserdelete.do",
            type: 'POST',
            dataType: 'text',
            data: {userid: $("#button1").val()},
        })
            .done(function(data) {
                if (data){
                    alert("删除成功");
                    window.location.href="/login.do";
                }
                else {
                    alert("删除失败");
                }
            })
            .fail(function() {
                console.log("error");
            })
            .always(function() {
                console.log("complete");
            });
    }
}
function changePassword () {
    var sta=confirm("确定修改此用户吗？");
    if (sta==true){
        $.ajax({
            url: "/dochangepassword.do",
            type: 'POST',
            dataType: 'text',
            data: {
                userid: $("#button1").val(),
                // username:$("#button2").val(),
                password:$("#button3").val(),
                // usersex:$("#button4").val(),
                // userlevel:$("#button5").val(),
                // usertel:$("#button6").val()
            },
        })
            .done(function(data) {
                if (data){
                    alert("修改成功");
                    window.location.href="/login.do";
                }
                else {
                    alert("修改失败");
                }
            })
            .fail(function() {
                console.log("error");
            })
            .always(function() {
                console.log("complete");
            });
    }
}



function back() {
    var st=confirm("是否退出?");
    if (st==true){
        $.ajax({
            url: "/doback.do",
            type: 'POST',
            dataType: 'text',
            // data: {
            //     username:$("#backli").attr("value")
            // },
        })
            .done(function(data) {
                if (data==0){
                    alert("退出成功");
                    window.location.href="/login.do";
                }
                else {
                    alert("退出失败");
                }
            })
            .fail(function() {
                console.log("error");
            })
            .always(function() {
                console.log("complete");
            });
    }
}
function leveljudge() {

    var a=$("#leveljudge").attr("value");
    if (a==1 || a==2 || a==21) {
        alert("你的身份权限不够");
        $("#leveljudge1").hide();
        $("#leveljudge").css("color","#EE5C42");
    }
}

function update() {
    window.location.href = "/useredit.do";
}


