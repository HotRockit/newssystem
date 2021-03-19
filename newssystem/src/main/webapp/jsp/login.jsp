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

<%--<%--%>
	<%--String username =request.getParameter("username");--%>
	<%--application.setAttribute("user",username);--%>
<%--%>--%>
<head>
	<title>登陆</title>
		<meta charset="utf-8">
		<link href="css/style.css" rel='stylesheet' type='text/css' />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="js/login.js"></script>
    <%--<script type="text/javascript">--%>
        <%--$(function () {--%>
            <%--if(${msg} = null){--%>
                <%--alert(${msg});--%>
            <%--}--%>
        <%--});--%>
    <%--</script>--%>
	<script type="text/javascript">
        function login (redirectURL) {
			//用户名正则，4到16位（字母，数字）
            var uPattern = /^[a-zA-Z0-9]{4,16}$/;
            var uname = $("#username").val();

			//密码强度正则，6到15位，包括至少1个字母，1个数字
            var pPattern = /^.*(?=.{6,})(?=.*\d)(?=.*[A-Za-z]).*$/;
            var upassword = $("#password1").val();
            if(!uPattern.test(uname)){
                alert("用户名由4-16位的数字或字母组成");
			}
			else if(!pPattern.test(upassword)){
			    alert("密码6到15位，包括至少1个字母，1个数字");
			}
			else {
                $.ajax({
                    url: "/dologin.do",
                    type: 'POST',
                    dataType: 'text',
                    data: {
                        // userid: $("#button1").val(),
                        username: $("#username").val(),
                        password1: $("#password1").val(),
                        // redirectURL:redirectURL,
                        // password:$("#password3").val(),
                        // usersex:$("#button4").val(),
                        // userlevel:$("#button5").val(),
                        // usertel:$("#button6").val()
                    },
                })
                    .done(function (data) {
                        if (data == 0) {
                            if (redirectURL == "") {
                                window.location.href = "index.do";
                            }
                            else {
                                window.location.href = redirectURL;
                            }
                        }
                        else {
                            alert("账号或密码");
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
			<h1>用户登陆</h1>
					<div class="head">
						<img src="images/user.png" alt=""/>
					</div>
			<%if (request.getAttribute("url")==null){%>
			<form action="/dologin.do?redirectURL=index.do" method="post">
			<%}
			else{%>
			<form action="/dologin.do?redirectURL=${url}" method="post">
			<%}%>
						<input type="text" id="username" class="text" value="用户名" name="username" autocomplete="off">
						<input type="text" id="password" name="password" value="密码">
						<input type="password" id="password1" name="password1" value="password" style="display: none;">
						<div class="submit">
						<input type="button" value="登陆" onclick="login('${url}')">
					</div>	
					<p>
						<a href="#">忘记密码 ?</a> &nbsp;&nbsp;&nbsp;
						<a href="/register.do">注册</a>
					</p>
				</form>
			</div>
			<!--//End-login-form-->
   			<div class="copy-right">
				<p><a> &nbsp;&nbsp;&nbsp;Copyright &copy; 2018</a></p>
			</div>
		</div>
			 <!-----//end-main---->
</body>
</html>