<%@ page pageEncoding="UTF-8" language="java" %>
<div class="page-header navbar navbar-fixed-top">
  <div class="page-header-inner ">
    <div class="page-logo">
      <a href="${_PATH}/home">
        <img src="${_PATH}/static/img/logo.png" alt="Logo" class="logo-default" style="width: 120px;height: auto;margin: auto;margin-top: 3px;"/>
      </a>
    </div>
    <div class="hor-menu   hidden-sm hidden-xs">
      <ul class="nav navbar-nav">
        <li class="<%="strategy".equals(request.getParameter("menu")) ? "active" : ""%>"><a href="${_PATH}/schedule/strategyList" class="hover-initialized"> 调度策略 <%="strategy".equals(request.getParameter("menu")) ? "<span class=\"selected\"> </span>" : ""%> </a></li>
        <li class="<%="job".equals(request.getParameter("menu")) ? "active" : ""%>"><a href="${_PATH}/schedule/jobList" class="hover-initialized"> 任务管理 <%="job".equals(request.getParameter("menu")) ? "<span class=\"selected\"> </span>" : ""%> </a></li>
        <li class="<%="machine".equals(request.getParameter("menu")) ? "active" : ""%>"><a href="${_PATH}/schedule/machineList" class="hover-initialized"> 机器管理 <%="machine".equals(request.getParameter("menu")) ? "<span class=\"selected\"> </span>" : ""%> </a></li>
        <li class="<%="server".equals(request.getParameter("menu")) ? "active" : ""%>"><a href="${_PATH}/schedule/serverList" class="hover-initialized"> 处理线程组列表 <%="server".equals(request.getParameter("menu")) ? "<span class=\"selected\"> </span>" : ""%> </a></li>
        <li class="classic-menu-dropdown <%=request.getParameter("menu").startsWith("conf_") ? "active" : ""%>"><a href="${_PATH}" data-hover="megamenu-dropdown" data-close-others="true" class="hover-initialized"> 系统配置 <i class="fa fa-angle-down"></i> <%=request.getParameter("menu").startsWith("conf_") ? "<span class=\"selected\"> </span>" : ""%> </a>
          <ul class="dropdown-menu pull-left">
            <li class="<%=request.getParameter("menu").endsWith("zkConn") ? "active" : ""%>"><a href="${_PATH}/config/zkConn"><i class="fa fa-tachometer"></i> Zookeeper连接配置 </a></li>
            <li class="<%=request.getParameter("menu").endsWith("zkData") ? "active" : ""%>"><a href="${_PATH}/config/zkData"><i class="fa fa-camera"></i> Zookeeper数据 </a></li>
            <li class="<%=request.getParameter("menu").endsWith("export") ? "active" : ""%>"><a href="${_PATH}/config/export"><i class="fa fa-eye"></i> Export配置数据 </a></li>
          </ul>
        </li>
      </ul>
    </div>
    <div class="top-menu">
      <ul class="nav navbar-nav pull-right">
        <li class="dropdown dropdown-user">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
            <img alt="" class="img-circle" src="${_PATH}/static/img/${_USER.avatarUrl}_small.jpg"/>
            <span class="username">
              ${_USER.nickname} </span>
            <i class="fa fa-angle-down"></i>
          </a>
          <ul class="dropdown-menu">
            <li>
              <a href="${_PATH}/sysUser/profile">
                <i class="fa fa-user"></i> 个人中心 </a>
            </li>
            <li>
              <a href="${_PATH}/logout.html">
                <i class="icon-power"></i> 退出 </a>
            </li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</div>
<div class="clearfix"></div>
