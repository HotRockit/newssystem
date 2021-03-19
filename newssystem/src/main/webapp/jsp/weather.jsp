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
    <title>天气查询</title>
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
            $.ajax({
                url: "/dofindweather.do",
                type: 'POST',
                dataType: 'text',
                data: {
                    city: $("#city").val(),
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
    </script>
</head>
<body>
<div class="main">
    <div class="login-form">
        <h1>天气查询</h1>
        <form action="#" method="post">
            <input type="text" id="city" class="text" placeholder="城市名称" name="city" autocomplete="off">
            <div class="submit">
                <input type="button" value="查询" onclick="find()">
            </div>
        </form>
    </div>

</div>
<!-----//end-main---->
</body>
</html>