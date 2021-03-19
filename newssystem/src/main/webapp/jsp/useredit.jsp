<%--<%@ page import="java.util.List" %>--%>
<%--<%@ page import="User.User" %>--%>
<%--<%@ page import="User.UserDemo" %>--%>
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
    <%--String userid=request.getParameter("name");--%>

    <%--List<User> userList = null;--%>

    <%--int id = Integer.parseInt(userid) - 1;--%>
    <%--UserDemo userDemo = new UserDemo();--%>
    <%--userDemo.select();--%>
    <%--userList = userDemo.getUserList();--%>


<%--%>--%>
<%--<%session.setAttribute("name",userid);%>--%>
<head>
<meta charset="utf-8">
<meta name="description" content="xxxxx">
<meta name="author" content="xxxxx">
<meta name="keyword" content="xxxxx">
<meta name="viewport" content="width=device-width, initial-scale=1">


<title>用户编辑</title>
<!-- start: Css -->
<link rel="stylesheet" type="text/css" href="asset/css/bootstrap.min.css">
<!-- plugins -->
<link rel="stylesheet" type="text/css" href="asset/css/plugins/font-awesome.min.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/simple-line-icons.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/animate.min.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/fullcalendar.min.css"/>
<link href="asset/css/style.css" rel="stylesheet">

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
  <div id="left-menu">
    <div class="sub-left-menu scroll">
      <ul class="nav nav-list">
        <li>
          <div class="left-bg"></div>
        </li>
        <li class="active ripple"> <a class="tree-toggle nav-header"  id="left-menu-1"><a href="/index.do"><span class="fa-home fa"></span> 首页 <span class="fa-angle-right fa right-arrow text-right"></span></a> </a> </li>
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
          <ul class="nav nav-list tree">
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

  <div id="content">
    <div class="panel">
      <div class="panel-body">
        <div class="col-md-12">
          <h3 class="animated fadeInLeft">编辑页面</h3>
          <p class="animated fadeInDown"> 业务 <span class="fa-angle-right fa"></span> 编辑页面 </p>
        </div>
      </div>
    </div>
      <%--<form action="/douseredit.do&userid=${user.userid}" method="post">--%>
    <form action="#" method="post">
    <div class="form-element">
      <div class="col-md-12 padding-0">
        <div class="col-md-12">
          <div class="panel form-element-padding">
            <div class="panel-heading">
              <h4>基本表单</h4>
            </div>
            <div class="panel-body" style="padding-bottom:30px;">
              <div class="col-md-12">
                <div class="form-group">
                  <label class="col-sm-1 control-label text-right" style="display: none;">用户名</label>
                  <div class="col-sm-3">
                    <input id="button1" type="text" class="form-control" style="display: none;" value="${user.userid}">
                  </div>
                  <label class="col-sm-1 control-label text-right" >用户名</label>
                  <div class="col-sm-3">
                    <input id="button2" type="text" name="username" class="form-control" value="${user.username}" readonly="readonly">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-1 control-label text-right" style="display: none;">用户名</label>
                  <div class="col-sm-3">
                    <input type="text" class="form-control" style="display: none;">
                  </div>
                  <label class="col-sm-1 control-label text-right">密码</label>
                  <div class="col-sm-3">
                    <input id="button3" type="text" name="password" class="form-control" value="${user.password}">
                  </div>
                </div>
                <%--<div class="form-group">--%>
                  <%--<label class="col-sm-1 control-label text-right" style="display: none;">用户名</label>--%>
                  <%--<div class="col-sm-3">--%>
                    <%--<input type="text" class="form-control" style="display: none;">--%>
                  <%--</div>--%>
                  <%--<label class="col-sm-1 control-label text-right">性别</label>--%>
                  <%--<div class="col-sm-3">--%>
                    <%--<input id="button4" type="text" name="usersex" class="form-control" value="">--%>
                  <%--</div> --%>
                <%--</div>--%>
                <div class="form-group">
                  <label class="col-sm-1 control-label text-right" style="display: none;">用户名</label>
                  <div class="col-sm-3">
                    <input type="text" class="form-control" style="display: none;">
                  </div>
                  <label class="col-sm-1 control-label text-right">身份权限</label>
                  <div class="col-sm-3">
                    <input id="button5" type="text" name="userlevel" class="form-control" value="${user.userlevel}" readonly="readonly">
                  </div>
                </div>
                <%--<div class="form-group">--%>
                  <%--<label class="col-sm-1 control-label text-right" style="display: none;">用户名</label>--%>
                  <%--<div class="col-sm-3">--%>
                    <%--<input type="text" class="form-control" style="display: none;">--%>
                  <%--</div>--%>

                  <%--<label class="col-sm-1 control-label text-right">手机号</label>--%>
                  <%--<div class="col-sm-3">--%>
                    <%--<input id="button6" type="text" name="usertel" class="form-control" value="">--%>
                  <%--</div>--%>
                <%--</div>--%>

              </div>
            </div>
              <div style="margin-left: 450px;">
                  <p>PS:0:管理员,1:普通用户</p>
              </div>

          </div>
          <div class="col-md-12 text-center" style="margin:20px; margin-left: -70px;">
              <input class="submit btn btn-danger" type="button" value="修改" onclick="changePassword()">
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input class="submit btn btn-danger" type="button" value="删除" onclick="deleteUser()">
          </div>
        </div>
      </div>
    </div>
      </form>
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
<script src="js/login.js"></script>
<script src="asset/js/moment.js"></script>
<script src="js/Confim.js"></script>
<!-- end: Javascript -->
<script>
$("#left-menu-2").click() ;
</script>
<script src="js/Confim.js"></script>
</body>
</html>