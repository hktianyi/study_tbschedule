<%@ page pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh_cn">
<head>
  <%@include file="/WEB-INF/common/common.jsp" %>
</head>
<body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-full-width">
<jsp:include page="/WEB-INF/common/header.jsp?menu=conf_zkConn" />
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
            Zookeeper配置
          </li>
        </ul>
      </div>
      <div class="row">
        <div class="col-md-12">
          <div class="portlet box blue">
            <div class="portlet-title">
              <div class="caption">
                <i class="fa fa-tag"></i>Zookeeper配置
              </div>
            </div>
            <div class="portlet-body form">
              <form class="form-horizontal" role="form" action="${_PATH}/config/zkConn" method="post">
                <div class="form-body">
                  <h3 class="form-section">基础信息</h3>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="control-label col-md-4"> Zookeeper地址:</label>
                        <div class="col-md-8">
                          <input class="form-control" name="zkConnectString" value="${properties.zkConnectString}" placeholder="格式: IP地址：端口"/>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="control-label col-md-4"> Zookeeper超时:</label>
                        <div class="col-md-8">
                          <input class="form-control" name="zkSessionTimeout" value="${properties.zkSessionTimeout}" placeholder="单位毫秒"/>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="control-label col-md-4">Zookeeper用户:</label>
                        <div class="col-md-8">
                          <input class="form-control" name="userName" value="${properties.userName}" placeholder=""/>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="control-label col-md-4">Zookeeper密码:</label>
                        <div class="col-md-8">
                          <input class="form-control" name="password" value="${properties.password}" placeholder=""/>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label class="control-label col-md-2">Zookeeper根目录:</label>
                        <div class="col-md-10">
                          <input class="form-control" name="rootPath" value="${properties.rootPath}" placeholder="例如：/taobao-schedule/demo，可以是一级目录，也可以是多级目录，注意不同调度域间不能有父子关系通过切换此属性来实现多个调度域的管理">
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="form-actions">
                  <div class="row">
                    <div class="col-md-6">
                      <div class="row">
                        <div class="col-md-offset-3 col-md-9">
                          <button type="submit" class="btn green">
                            <i class="fa fa-pencil"></i> 保存
                          </button>
                          <button type="button" class="btn default" onclick="history.back()">取消</button>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6"></div>
                  </div>
                </div>
              </form>
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