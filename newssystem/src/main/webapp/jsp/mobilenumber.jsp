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
    <title>号码归属地查询</title>
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
        function find () {
            var nu = $("#phonenumber").val();
            var uPattern = /^[0-9]{7,11}$/;
            if (!uPattern.test(nu)) {
                alert("至少输入7位数字");
            } else {
                $.ajax({
                    url: "/dofindphone.do",
                    type: 'POST',
                    dataType: 'text',
                    data: {
                        number:nu,
                    },
                })
                    .done(function (data) {
                        alert(data);
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
        <h1>号码归属地查询</h1>
        <form action="#" method="post">
                <input type="text" id="phonenumber" class="text" placeholder="手机号" name="phonenumber" autocomplete="off">
                <div class="submit">
                    <input type="button" value="查询" onclick="find()">
                </div>
        </form>
    </div>

</div>
<!-----//end-main---->
</body>
</html>