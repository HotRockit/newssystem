<%@ page import="com.wdy.domain.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.github.pagehelper.PageInfo" %><%--<%@ page import="com.wdy.domain.User" %>--%>
<%--<%@ page import="java.util.List" %>&lt;%&ndash;<%@ page import="java.util.List" %>&ndash;%&gt;--%>
<%--<%@ page import="User.User" %>--%>
<%--<%@ page import="User.UserDemo" %>--%>
<%--<%--%>
    <%--String username= (String) session.getAttribute("username");--%>
<%--%>--%>
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
    <%--List<User> userList=null;--%>
    <%--UserDemo userDemo=new UserDemo();--%>
    <%--userDemo.select();--%>
    <%--userList=userDemo.getUserList();--%>
<%--%>--%>
<head>
<meta charset="utf-8">
<meta name="description" content="xxxxx">
<meta name="author" content="xxxxx">
<meta name="keyword" content="xxxxx">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>用户列表</title>
<!-- start: Css -->
<link rel="stylesheet" type="text/css" href="asset/css/bootstrap.min.css">
<!-- plugins -->
<link rel="stylesheet" type="text/css" href="asset/css/plugins/font-awesome.min.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/simple-line-icons.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/animate.min.css"/>
<link rel="stylesheet" type="text/css" href="asset/css/plugins/fullcalendar.min.css"/>
<link href="asset/css/style.css" rel="stylesheet">
<!-- end: Css -->

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
        <li class="ripple"> <a class="tree-toggle nav-header" id="left-menu-1"><a href="/index.do"><span class="fa-home fa"></span> 首页 <span class="fa-angle-right fa right-arrow text-right"></span></a> </a> </li>
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
        <li class=" ripple">
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

  <!-- end: Left Menu --> 
  
  <!-- start: content -->
  <div id="content">
    <div class="panel">
      <div class="panel-body">
        <div class="col-md-12">
          <h3 class="animated fadeInLeft">用户列表</h3>
          <p class="animated fadeInDown"> 业务 <span class="fa-angle-right fa"></span> 用户列表 </p>
        </div>
      </div>
    </div>
    <div class="col-md-12 padding-0 form-element">
      <div class="col-md-12">
       <div class="panel form-element-padding">
            
        <div class="panel">
          <div class="panel-heading">
            <h3>列表名称</h3>
          </div>
          <div class="panel-body">
            <div class="responsive-table">
              <div id="datatables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                <div class="row">
                  <div class="col-sm-12">
                    <table class="table table-striped table-bordered dataTable no-footer" width="100%" cellspacing="0"  style="width: 100%;">
                      <thead>
                        <tr role="row">
                          <th class="sorting_asc" style="width: 100px;">id</th>
                          <th class="sorting" style="width: 100px;">账号</th>
                          <th class="sorting" style="width: 100px;">密码</th>
                          <th class="sorting" style="width: 100px;">身份权限</th>
                          <%--<th class="sorting"  style="width: 60px;">手机号</th>--%>
                          <th class="sorting"  style="width: 100px;">编辑</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr role="row" class="odd">
                            <%
                                PageInfo pageInfo = (PageInfo) session.getAttribute("pageInfo");
                                List<User> userlist = pageInfo.getList();
                                if(userlist!=null){
                                for (User user: userlist){%>
                                <tr role="row" class="odd">
                                    <td class="sorting_1"><%=user.getUserid()%></td>
                                    <td><%=user.getUsername()%></td>
                                    <td><%=user.getPassword()%></td>
                                    <%--<%if (user.getUserlevel()==0){%>--%>
                                        <%--<td>管理员</td>--%>
                                    <%--<%}--%>
                                    <%--else{%>--%>
                                        <%--<td>普通用户</td>--%>
                                    <%--<%}%>--%>
                                    <td>普通用户</td>
                                    <%--<td><%=user.getUsertel()%></td>--%>
                                    <td>
                                        <a href="javascript:void(0);" id="a1" onclick="addlevel(<%=user.getUserid()%>)"><h7>添加权限</h7></a>
                                        <a href="javascript:void(0);" id="a2" onclick="deluser(<%=user.getUserid()%>)"><h7>删除</h7></a>
                                    </td>
                                </tr>
                                <%}}
                            %>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

           <!--显示分页信息-->
           <div class="row">
               <!--文字信息-->
               <div class="col-md-6">
                   &nbsp;&nbsp;&nbsp;当前第 ${pageInfo.pageNum} 页.总共 ${pageInfo.pages} 页.一共 ${pageInfo.total} 条记录
               </div>

               <!--点击分页-->
               <div class="col-md-6">
                   <nav aria-label="Page navigation">
                       <ul class="pagination">

                           <li><a href="showuserlist.do?pn=1">首页</a></li>

                           <!--上一页-->
                           <li>
                               <c:if test="${pageInfo.hasPreviousPage}">
                                   <a href="showuserlist.do?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                       <span aria-hidden="true">上一页</span>
                                   </a>
                               </c:if>
                           </li>

                           <!--循环遍历连续显示的页面，若是当前页就高亮显示，并且没有链接-->
                           <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
                               <c:if test="${page_num == pageInfo.pageNum}">
                                   <li class="active"><a href="#">${page_num}</a></li>
                               </c:if>
                               <c:if test="${page_num != pageInfo.pageNum}">
                                   <li><a href="showuserlist.do?pn=${page_num}">${page_num}</a></li>
                               </c:if>
                           </c:forEach>

                           <!--下一页-->
                           <li>
                               <c:if test="${pageInfo.hasNextPage}">
                                   <a href="showuserlist.do?pn=${pageInfo.pageNum+1}"
                                      aria-label="Next">
                                       <span aria-hidden="true">下一页</span>
                                   </a>
                               </c:if>
                           </li>

                           <li><a href="showuserlist.do?pn=${pageInfo.pages}">尾页</a></li>
                       </ul>
                   </nav>
               </div>

           </div>

        </div>
      </div>
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

<script type="text/javascript">
function addlevel(userid) {
    var sta=confirm("确定为此用户赋予管理员权限吗？");
    if (sta==true){
        $.ajax({
            url: "/doaddlevel.do",
            type: 'POST',
            dataType: 'text',
            data: {userid: userid},
        })
            .done(function(data) {
                if (data){
                    alert("修改成功");
                    window.location.href="/showuserlist.do";
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

function deluser(userid) {
    var sta=confirm("确定删除此用户吗？");
    if (sta==true){
        $.ajax({
            url: "/douserdelete.do",
            type: 'POST',
            dataType: 'text',
            data: {userid: userid},
        })
            .done(function(data) {
                if (data){
                    alert("删除成功");
                    window.location.href="/showuserlist.do";
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

</script>
<!-- end: Javascript -->
<script>
$("#left-menu-2").click() ;
</script>

</body>

</html>