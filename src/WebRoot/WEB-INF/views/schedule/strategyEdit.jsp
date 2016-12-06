<%@ page pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh_cn">
<head>
  <%@include file="/WEB-INF/common/common.jsp" %>
</head>
<body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-full-width">
<jsp:include page="/WEB-INF/common/header.jsp?menu=strategy" />
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
            <a href="${_PATH}/view/strategyList">调度策略</a>
            <i class="fa fa-angle-right"></i>
          </li>
          <li>
            ${data.strategyName}
          </li>
        </ul>
      </div>
      <div class="row">
        <div class="col-md-12">
          <div class="portlet box blue">
            <div class="portlet-title">
              <div class="caption">
                <i class="fa fa-tag"></i>调度策略
              </div>
            </div>
            <div class="portlet-body form">
              <form class="form-horizontal" role="form" action="${_PATH}/schedule/strategy" method="post">
                <input type="hidden" name="action" value="${not empty data.strategyName ? 'update' : 'create'}">
                <div class="form-body">
                  <h3 class="form-section">基础信息</h3>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="control-label col-md-4"> 策略名称 <span class="required" aria-required="true"> * </span>:</label>
                        <div class="col-md-8">
                          <input class="form-control" name="strategyName" value="${data.strategyName}" ${not empty data.strategyName ? 'readonly' : ''} placeholder="不能有中文和特殊字符"/>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="control-label col-md-4">任务类型:</label>
                        <div class="col-md-8">
                          <select class="form-control" name="kind">
                            <option value="Schedule" ${data.kind eq 'Schedule' ? 'selected' : ''}>Schedule</option>
                            <option value="Java" ${data.kind eq 'Java' ? 'selected' : ''}>Java</option>
                            <option value="Bean" ${data.kind eq 'Bean' ? 'selected' : ''}>Bean</option>
                          </select>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="control-label col-md-4">任务名称 <span class="required" aria-required="true"> * </span>:</label>
                        <div class="col-md-8">
                          <input class="form-control" name="taskName" value="${data.taskName}" placeholder="与任务类型匹配的名称, 例如:1、任务管理中配置的任务名称(对应Schedule) 2、Class名称(对应java) 3、Bean的名称(对应Bean)"/>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="control-label col-md-4">任务参数:</label>
                        <div class="col-md-8">
                          <input class="form-control" name="taskParameter" value="${data.taskParameter}" placeholder="逗号分隔的Key-Value。 对任务类型为Schedule的无效，需要通过任务管理来配置的"/>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="control-label col-md-4">单JVM最大线程组数量 <span class="required" aria-required="true"> * </span>:</label>
                        <div class="col-md-8">
                          <input type="number" class="form-control" name="numOfSingleServer" value="${data.numOfSingleServer}" placeholder="单JVM最大线程组数量，如果是0，则表示没有限制.每台机器运行的线程组数量 =总量/机器数">
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="control-label col-md-4">最大线程组数量 <span class="required" aria-required="true"> * </span>:</label>
                        <div class="col-md-8">
                          <input type="number" class="form-control" name="assignNum" value="${data.assignNum}" placeholder="所有服务器总共运行的最大数量">
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label class="control-label col-md-2">IP地址(逗号分隔) <span class="required" aria-required="true"> * </span>:</label>
                        <div class="col-md-10">
                          <textarea class="form-control" name="ips" placeholder="127.0.0.1或者localhost会在所有机器上运行">${fn:join(data.IPList, ',')}</textarea>
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
<script type="text/javascript">
  $(function () {
      $("form").validate({
          rules: {
              strategyName: "required",
              taskName: "required",
              numOfSingleServer: "required",
              assignNum: "required",
              ips: "required"
          },
          messages: {
              strategyName: "请输入策略名称",
              taskName: "请输入任务名称",
              numOfSingleServer: "请输入单JVM最大线程组数量, 0 限制",
              assignNum: "请输入最大线程组数量",
              ips: "请输入IP列表，127.0.0.1 可以在所有机器上运行"
          }
      });
  });
</script>
</body>
</html>