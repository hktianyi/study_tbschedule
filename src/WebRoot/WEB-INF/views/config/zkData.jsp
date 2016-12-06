<%@ page pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh_cn">
<head>
  <%@include file="/WEB-INF/common/common.jsp" %>
</head>
<body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-full-width">
<jsp:include page="/WEB-INF/common/header.jsp?menu=conf_zkData"/>
<div class="page-container">
  <div class="page-content-wrapper">
    <div class="page-content">
      <div class="page-bar">
        <ul class="page-breadcrumb">
          <li>
            <a href="${_PATH}/view/home">首页</a>
            <i class="fa fa-angle-right"></i>
          </li>
          <li>
            <a href="javascript:;">系统配置</a>
            <i class="fa fa-angle-right"></i>
          </li>
          <li>
            Zookeeper数据
          </li>
        </ul>
      </div>
      <div class="row">
        <div class="col-md-12">
          <div class="portlet box blue">
            <div class="portlet-title">
              <div class="caption">
                <i class="fa fa-tag"></i>Zookeeper数据
              </div>
            </div>
            <div class="portlet-body form">
              <p class="form-control-static">
                <c:forEach items="${data}" var="data">
                  ${data}<br>
                </c:forEach>
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<%@include file="/WEB-INF/common/footer.jsp" %>
</body>
</html>