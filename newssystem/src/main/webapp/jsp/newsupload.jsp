<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
<head>
<meta charset="utf-8">
<meta name="description" content="xxxxx">
<meta name="author" content="xxxxx">
<meta name="keyword" content="xxxxx">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>发表新闻</title>
<!-- start: Css -->
<link rel="stylesheet" type="text/css" href="asset/css/bootstrap.min.css">
<!-- plugins -->
<link rel="stylesheet" type="text/css" href="asset/css/plugins/font-awesome.min.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/simple-line-icons.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/animate.min.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/fullcalendar.min.css"/>
<link href="asset/css/style.css" rel="stylesheet">

  <script type="text/javascript">
    function upload() {
            var sta=confirm("确定上传此新闻吗？");
            if (sta==true){
                var formData = new FormData($('form')[0]);
                $.ajax({
                    url: "/doupload.do",
                    type: 'POST',
                    contentType:false,
                    dataType: 'text',
                    processData:false,
                    cache:false,
                    data:formData,
                })
                    .done(function(data) {
                        if (data==1){
                            alert("上传成功");
                            window.location.href="/shownewslist.do?newstype=全部";
                        }
                        else {
                            alert("上传失败");
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
  </script>

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
            <li><a href="#"><p value="" id="backli" onclick="back()"><span class="fa fa-power-off"></span> 退出登录</p></a></li>
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
        <li class="active ripple"> 
          <a class="tree-toggle nav-header"  id="left-menu-1"><a href="/index.do"><span class="fa-home fa"></span> 首页
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
    <form action="/doupload.do" method="post" enctype="multipart/form-data">
  <div id="content">
    <div class="panel">
      <div class="panel-body">
        <div class="col-md-12">
          <h3 class="animated fadeInLeft">发表新闻</h3>
          <p class="animated fadeInDown"> 业务 <span class="fa-angle-right fa"></span> 发表页面 </p>
        </div>
      </div>
    </div>
    <div class="form-element">
      <div class="col-md-12 padding-0">
        <div class="col-md-12">
          <div class="panel form-element-padding">
            <div class="panel-heading">
              <h4>新闻信息</h4>
            </div>
            <div class="panel-body" style="padding-bottom:30px;">
              <div class="col-md-12">
                <div class="form-group">
                  <label class="col-sm-1 control-label text-right" style="display: none;">用户名</label>
                  <div class="col-sm-3">
                    <input type="text" class="form-control" style="display: none;">
                  </div>
                  <label class="col-sm-1 control-label text-right" style="font-size: 18px">新闻标题</label>
                  <div class="col-sm-3">
                    <input type="text" id="newstitle" name="newstitle" class="form-control" autocomplete="off">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-1 control-label text-right" style="display: none;">用户名</label>
                  <div class="col-sm-3">
                    <input type="text" class="form-control" style="display: none;">
                  </div>
                  <label class="col-sm-1 control-label text-right" style="font-size: 18px">作者</label>
                  <div class="col-sm-3">
                    <input type="text" id="newsauthor" name="newsauthor" class="form-control" autocomplete="off">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-1 control-label text-right" style="display: none;">用户名</label>
                  <div class="col-sm-3">
                    <input type="text" class="form-control" style="display: none;">
                  </div>
                  <label class="col-sm-1 control-label text-right" style="font-size: 18px">发表日期</label>
                  <div class="col-sm-3">
                    <input type="text" id="newsdate" name="newsdate" class="form-control" autocomplete="off" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>" readonly="readonly">
                  </div> 
                </div>
                <div class="form-group">
                  <label class="col-sm-1 control-label text-right" style="display: none;">用户名</label>
                  <div class="col-sm-3">
                    <input type="text" class="form-control" style="display: none;">
                  </div>
                  <label class="col-sm-1 control-label text-right" style="font-size: 18px">文件上传</label>
                  <div class="col-sm-3">
                    <input type="file" id="newsfile" name="newsfile" class="form-control" style="border: 0">
                  </div> 
                </div>
                <br />
                <div class="form-group">
                  <label class="col-sm-1 control-label text-right" style="display: none;">用户名</label>
                  <div class="col-sm-3">
                    <input type="text" class="form-control" style="display: none;">
                  </div>
                  <label class="col-sm-1 control-label text-right" style="font-size: 18px">新闻类型</label>
                  <div class="col-sm-3">
                    <select id="newstype" name="newstype" class="form-control" style="border: 0">
                      <option value="时政">时政</option>
                      <option value="军事">军事</option>
                      <option value="娱乐">娱乐</option>
                      <option value="科技">科技</option>
                      <option value="人文">人文</option>
                      <option value="体育">体育</option>
                    </select>
                  </div>
                </div>

              </div>
            </div>
              <p style="font-size: 16px; margin-left: 450px;" >ps:时间日期格式为:xxxx-xx-xx   新闻文件的格式为.txt</p>
          </div>
          <div class="col-md-12 text-center" style="margin:20px; margin-left: -70px;">
              <input class="submit btn btn-danger" type="button" onclick="upload()" value="上传">
          </div>
        </div>
      </div>
    </div>

  </div>
    </form>
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
</body>
</html>