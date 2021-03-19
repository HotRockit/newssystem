<%@ page import="java.util.List" %>
<%@ page import="com.wdy.domain.News" %>
<%@ page import="com.wdy.domain.User" %>
<%@ page import="com.github.pagehelper.PageInfo" %><%--<%@ page import="News.NewsDemo" %>--%>
<%--<%@ page import="java.util.List" %>--%>
<%--<%@ page import="News.News" %>--%>
<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragrma","no-cache");
    response.setDateHeader("Expires",0);
%>

<%--<%--%>
<%--String username= (String) session.getAttribute("username");--%>
<%--%>--%>
<%--<%--%>
<%--NewsDemo newsDemo=new NewsDemo();--%>
<%--newsDemo.select();--%>
<%--List<News> newsList=null;--%>
<%--newsList=newsDemo.getNewsList();--%>
<%--%>--%>
<head>
    <meta charset="utf-8">
    <meta name="description" content="xxxxx">
    <meta name="author" content="xxxxx">
    <meta name="keyword" content="xxxxx">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>新闻列表</title>
    <!-- start: Css -->
    <link rel="stylesheet" type="text/css" href="asset/css/bootstrap.min.css">
    <!-- plugins -->
    <link rel="stylesheet" type="text/css" href="asset/css/plugins/font-awesome.min.css"/>
    <link rel="stylesheet" type="text/css" href="asset/css/plugins/simple-line-icons.css"/>
    <link rel="stylesheet" type="text/css" href="asset/css/plugins/animate.min.css"/>
    <link rel="stylesheet" type="text/css" href="asset/css/plugins/fullcalendar.min.css"/>
    <link href="asset/css/style.css" rel="stylesheet">
    <!-- end: Css -->
    <script type="text/javascript">
        //绘制饼图
        function drawCircle(canvasId, data_arr, color_arr, text_arr)
        {
            var c = document.getElementById(canvasId);
            var ctx = c.getContext("2d");

            var radius = c.height / 2 - 20; //半径
            var ox = radius + 20, oy = radius + 20; //圆心

            var width = 30, height = 10; //图例宽和高
            var posX = ox * 2 + 20, posY = 30;   //
            var textX = posX + width + 5, textY = posY + 10;

            var startAngle = 0; //起始弧度
            var endAngle = 0;   //结束弧度
            for (var i = 0; i < data_arr.length; i++)
            {
                //绘制饼图
                endAngle = endAngle + data_arr[i] * Math.PI * 2; //结束弧度
                ctx.fillStyle = color_arr[i];
                ctx.beginPath();
                ctx.moveTo(ox, oy); //移动到到圆心
                ctx.arc(ox, oy, radius, startAngle, endAngle, false);
                ctx.closePath();
                ctx.fill();
                startAngle = endAngle; //设置起始弧度

                //绘制比例图及文字
                ctx.fillStyle = color_arr[i];
                ctx.fillRect(posX, posY + 20 * i, width, height);
                ctx.moveTo(posX, posY + 20 * i);
                ctx.font = 'bold 12px 微软雅黑';    //斜体 30像素 微软雅黑字体
                ctx.fillStyle = color_arr[i]; //"#000000";
                var percent = text_arr[i] + "：" + (100 * data_arr[i]).toFixed(1) + "%";
                ctx.fillText(percent, textX, textY + 20 * i);
            }
        }

        function init() {
            //绘制饼图
            //比例数据和颜色
            var data_arr = [${array[0]}, ${array[1]}, ${array[2]}, ${array[3]},${array[4]},${array[5]}];
            var color_arr = ["#00FF21", "#DD0000", "#00AABB", "#FF4400","#FFAA00","#BBCC00"];
            var text_arr = ["时政", "军事", "娱乐", "科技","人文","体育"];

            drawCircle("canvas_circle", data_arr, color_arr, text_arr);
        }

        //页面加载时执行init()函数
        window.onload = init;
    </script>
    <style type="text/css">
        .ul{
            margin:50px auto 0;
            width: 958px;
            height: 40px;
            border: 1px solid grey;
            text-align: center;
            font-size: 0px;
            padding: 0;
            line-height: 40px;
        }
        .ul li{
            list-style: none;
            display: inline-block;
            color: #333;
            font-size: 14px;
            margin:0px 20px;
        }
        .ul li a{
            text-decoration: none;
            font-family: 'Microsoft Yahei';
            color: #333;
        }
        .ul li a:hover{
            color:red;
        }
    </style>
</head>

<body id="mimin" class="dashboard">
<!-- start: Header -->
<nav class="navbar navbar-default header navbar-fixed-top">
    <div class="col-md-12 nav-wrapper">
        <div class="navbar-header" style="width:100%;">
            <div class="opener-left-menu is-open"> <span class="top"></span> <span class="middle"></span> <span class="bottom"></span> </div>
            <a href="/index.do" class="navbar-brand"> <b>返回首页</b> </a>
            <ul class="nav navbar-nav navbar-right user-nav">
                <li class="user-name"><span>${user.username}</span></li>
                <li class="dropdown avatar-dropdown"> <img src="asset/img/avatar.jpg" class="img-circle avatar" alt="user name" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"/>
                    <ul class="dropdown-menu user-dropdown">
                        <li><a href="#"><p value="${user.username}" id="backli1" onclick="update()"><span class="fa fa-power-off"></span> 账户管理</p></a></li>
                        <li><a href="#"><p value="${user.username}" id="backli" onclick="back()"><span class="fa fa-power-off"></span> 退出登录</p></a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- end: Header -->
<div class="container-fluid mimin-wrapper">
    <!-- start:Left Menu -->
    <div id="left-menu">
        <div class="sub-left-menu scroll">
            <ul class="nav nav-list">
                <li>
                    <div class="left-bg"></div>
                </li>
                <li class="ripple">
                    <a class="tree-toggle nav-header" id="left-menu-1"><a href="/index.do"><span class="fa-home fa"></span> 首页
                        <span class="fa-angle-right fa right-arrow text-right"></span></a>
                    </a>
                </li>
                <li class="ripple">
                    <a class="tree-toggle nav-header"><p id="leveljudge" value="2${user.userlevel}" onclick="leveljudge()"> <span class="fa-diamond fa"></span> 系统管理
                        <span class="fa-angle-right fa right-arrow text-right"></span> </p>
                    </a>
                    <ul class="nav nav-list tree">
                        <li id="leveljudge1"><a href="/showuserlist.do">用户列表</a>
                        <a href="/shownewsreport.do">新闻报表</a></li>
                        <%--<li><a href="useredit.jsp">信息编辑</a></li>--%>
                    </ul>
                </li>
                <li class="ripple">
                    <a class="tree-toggle nav-header"><span class="fa fa-check-square-o"></span> 新闻管理
                        <span class="fa-angle-right fa right-arrow text-right"></span>
                    </a>
                    <ul class="nav nav-list tree" >
                        <li><a href="/shownewslist.do?newstype=全部">新闻列表</a></li>
                        <%--<li><a href="newsitem.jsp">新闻详情</a></li>--%>
                        <li><a href="/newsupload.do">发表新闻</a></li>
                    </ul>
                </li>
                <li class="ripple">
                    <a class="tree-toggle nav-header"><span class="fa fa-check-square-o"></span> 第三方服务
                        <span class="fa-angle-right fa right-arrow text-right"></span>
                    </a>
                    <ul class="nav nav-list tree">
                        <li><a href="/tonumber.do">号码归属地查询</a></li>
                        <%--<li><a href="newsitem.jsp">新闻详情</a></li>--%>
                        <li><a href="/toweather.do">天气查询</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>

    <!-- end: Left Menu -->

    <!-- start: content -->
    <div id="content">
        <div class="panel">
            <div class="panel-body">
                <div class="col-md-12">
                    <h3 class="animated fadeInLeft">新闻报表</h3>
                    <p class="animated fadeInDown"> 业务 <span class="fa-angle-right fa"></span> 新闻报表 </p>
                </div>
            </div>
        </div>
        <div style="margin-left: 300px">
            <h3 style="margin-left: 180px">新闻报表饼图</h3>
            <p>
                <canvas id="canvas_circle" width="500" height="300" style="border:2px solid #0026ff;" >
                    浏览器不支持canvas
                </canvas>
            </p>
        </div>
    </div>
    <!-- end: content -->
</div>
<!-- start: Javascript -->
<script src="asset/js/jquery.min.js"></script>
<script src="asset/js/jquery.ui.min.js"></script>
<script src="asset/js/bootstrap.min.js"></script>
<!-- plugins -->
<script src="asset/js/plugins/jquery.nicescroll.js"></script>
<!-- custom -->
<script src="asset/js/main.js"></script>
<script src="asset/js/moment.js"></script>
<script src="js/Confim.js"></script>
<!-- end: Javascript -->
<script>
    $("#left-menu-2").click() ;
</script>
<%--<script type="text/javascript">--%>
<%--function test(userlevel,id){--%>
<%--if(userlevel==0){--%>
<%--window.location.href="/donewsedit.do?newsid="+id;--%>
<%--}--%>
<%--else{--%>
<%--alert("您的权限不够");--%>
<%--}--%>
<%--}--%>
<%--</script>--%>
</body>
</html>