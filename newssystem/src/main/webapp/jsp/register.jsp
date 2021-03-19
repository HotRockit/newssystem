<!DOCTYPE html>
<html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragrma","no-cache");
	response.setDateHeader("Expires",0);
%>

<head>
	<title>注册</title>
		<meta charset="utf-8">
		<link href="css/style.css" rel='stylesheet' type='text/css' />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="js/login.js"></script>
	<script type="text/javascript">
        function register () {
            //用户名正则，4到16位（字母，数字）
            var uPattern = /^[a-zA-Z0-9]{4,16}$/;
            var uname = $("#username").val();

            //密码强度正则，6到15位，包括至少1个字母，1个数字
            var pPattern = /^.*(?=.{6,15})(?=.*\d)(?=.*[A-Za-z]).*$/;
            var upassword1 = $("#password1").val();
            var upassword3 = $("#password3").val();
            if(!uPattern.test(uname)){
                alert("用户名由4-16位的数字或字母组成");
            }
            else if(!pPattern.test(upassword1) || !pPattern.test(upassword3)){
                alert("密码6到15位，包括至少1个字母，1个数字");
            }
            else {
                $.ajax({
                    url: "/doregister.do",
                    type: 'POST',
                    dataType: 'text',
                    data: {
                        // userid: $("#button1").val(),
                        username: $("#username").val(),
                        password1: $("#password1").val(),
                        password3: $("#password3").val(),
                        // usersex:$("#button4").val(),
                        // userlevel:$("#button5").val(),
                        // usertel:$("#button6").val()
                    },
                })
                    .done(function (data) {
                        if (data == 0) {
                            alert("注册成功");
                            window.location.href = "/login.do";
                        }
                        else if (data == 1) {
                            alert("用户名已存在");
                        }
                        else {
                            alert("两次密码不一样")
                        }
                    })
                    .fail(function () {
                        console.log("error");
                    })
                    .always(function () {
                        console.log("complete");
                    });
            }
        }
	</script>
</head>
<body>
	 <div class="main">
		<div class="login-form">
			<h1>用户注册</h1>
					<div class="head">
						<img src="images/user.png" alt=""/>
					</div>
				<form action="/doregister.do" method="post">
						<input type="text" id="username" class="text" value="用户名" name="username" autocomplete="off" placeholder="4到16位字母或数字">
						<input type="text" id="password" name="password" value="密码">
						<input type="password" id="password1" name="password1" style="display: none;" placeholder="6到15位包括至少1个字母，1个数字">
						<input type="text" id="password2" name="password2" value="确认密码">
						<input type="password" id="password3" name="password3" style="display: none;" placeholder="6到15位包括至少1个字母，1个数字">
						<%--<input type="text" name="tel" value="手机号" id="tel">--%>
						<%--<p class="p1">性别：--%>
							<%--<input type="radio" name="sex" class="sex" value="男">男--%>
							<%--<input type="radio" name="sex" class="sex" value="女">女--%>
						<%--</p>--%>
						<div class="submit">
							<input type="button" value="注册" onclick="register()">
						</div>	
					<%--<p>--%>
						<%--<a href="#">忘记密码 ?</a> &nbsp;&nbsp;&nbsp;--%>
						<%--<a href="login.jsp">登陆</a>--%>
					<%--</p>--%>
				</form>
			</div>
			<!--//End-login-form-->
   			<div class="copy-right">
				<a><p> &nbsp;&nbsp;&nbsp;Copyright &copy; 2018</a></p>
			</div>
		</div>
			 <!-----//end-main---->
</body>
</html>