<%@ page pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <%@include file="/WEB-INF/common/common.jsp" %>
  <link href="${_PATH}/static/css/login.min.css?${_VERSION}" rel="stylesheet" type="text/css"/>
  <style>.page-footer { display: none !important; }</style>
</head>
<body class="login">
<div id="parallax">
  <div class="logo layer" data-depth="0.6">
    <a href="${_PATH}/">
      <img src="${_PATH}/static/img/logo.png" alt="" width="270px"/> </a>
  </div>
  <!-- END LOGO -->
  <!-- BEGIN LOGIN -->
  <div class="content layer" data-depth="0.4" style="left: 0;right: 0;">
    <!-- BEGIN LOGIN FORM -->
    <form action="${_PATH}/login" class="login-form" method="post">
      <h4 class="form-title font-green" style="text-align: center;font-weight:500">TBS 任务调度管理系统</h4>
      <c:if test="${not empty errorInfo}">
        <div class="alert alert-danger">
          <button class="close" data-close="alert"></button>
          <span>${errorInfo}</span>
        </div>
      </c:if>
      <div class="form-group">
        <label class="control-label visible-ie8 visible-ie9">用户名</label>
        <input class="form-control form-control-solid placeholder-no-fix" type="text" autocomplete="off" placeholder="用户名"
               name="username"/></div>
      <div class="form-group">
        <label class="control-label visible-ie8 visible-ie9">密码</label>
        <input class="form-control form-control-solid placeholder-no-fix" type="password" autocomplete="off"
               placeholder="密码" name="password"/></div>
      <div class="form-actions">
        <button type="submit" class="btn green uppercase">登录</button>
        <label class="rememberme check">
          <input type="checkbox" name="remember" value="1"/>记住我 </label>
        <a href="javascript:;" id="forget-password" class="forget-password">忘记密码?</a>
      </div>
    </form>
    <!-- END LOGIN FORM -->
  </div>
  <div id="particles" class="particles layer" data-depth="0.3"></div>
</div>
<%@include file="../common/footer.jsp" %>
<script src="${_CDN}/particles.js/2.0.0/particles.min.js"></script>
<script src="${_PATH}/static/js/login.js?${_VERSION}"></script>
</body>
</html>