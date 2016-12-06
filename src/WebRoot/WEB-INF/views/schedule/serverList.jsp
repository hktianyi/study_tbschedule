<%@ page pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh_cn">
<head>
  <%@include file="/WEB-INF/common/common.jsp" %>
</head>
<body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-full-width">
<jsp:include page="/WEB-INF/common/header.jsp?menu=server" />
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
            处理线程组列表
          </li>
        </ul>
      </div>
      <div class="row">
        <div class="col-md-12">
          <table class="table table-striped table-hover table-header-fixed"></table>
        </div>
      </div>
    </div>
  </div>
</div>
<%@include file="/WEB-INF/common/footer.jsp" %>
<script type="text/javascript">
    var dataTable;
    $(function () {
        getDataList();
    });
    function getDataList() {
        if (typeof dataTable !== 'undefined') {
            dataTable.draw();
            return;
        }
        dataTable = $("table").DataTable({
            "ajax": {
                "url": _PATH + "/schedule/server",
                "type": "GET",
                "data": function (params) {
                    params.q = $("#q").val();
                }
            },
            "columns": [
                {"sTitle": "序号", "sWidth": "3%", "defaultContent": ''},
                {"sTitle": "任务类型<BR/>[TASK_TYPE]", "data": "baseTaskType", "sWidth": "5%"},
                {"sTitle": "域<BR/>[OWN_SIGN]", "data": "ownSign", "sWidth": "5%"},
                {"sTitle": "IP地址<BR/>[IP]", "data": "ip", "sWidth": "5%"},
                {"sTitle": "主机名称[HOST_NAME]", "data": "hostName", "sWidth": "5%"},
                {"sTitle": "线程<BR/>[THREAD_NUM]", "data": "threadNum", "sWidth": "5%"},
                {"sTitle": "注册时间<BR/>[REGISTER_TIME]", "data": "registerTime", "sWidth": "5%"},
                {"sTitle": "心跳时间<BR/>[HEARTBEAT_TIME]", "data": "heartBeatTime", "sWidth": "5%"},
                {"sTitle": "取数时间<BR/>[LAST_FETCH_DATA_TIME]", "data": function (data) {
                    return data.lastFetchDataTime ? data.lastFetchDataTime : '-';
                }, "sWidth": "5%"},
                {"sTitle": "版本<BR/>[VERSION]", "data": "version", "sWidth": "5%"},
                {"sTitle": "下次开始<BR/>[NEXT_RUN_START_TIME]", "data": function (data) {
                    return data.nextRunStartTime ? data.nextRunStartTime : '-';
                }, "sWidth": "5%"},
                {"sTitle": "下次结束<BR/>[NEXT_RUN_END_TIME]", "data": function (data) {
                    return data.nextRunEndTime ? data.nextRunEndTime : '-';
                }, "sWidth": "5%"},
                {"sTitle": "处理器<BR/>[MANAGER_FACTORY]", "data": "managerFactoryUUID", "sWidth": "5%"},
                {"sTitle": "处理详情", "data": "dealInfoDesc", "sWidth": "5%"}
            ]
        });
    }
</script>
</body>
</html>