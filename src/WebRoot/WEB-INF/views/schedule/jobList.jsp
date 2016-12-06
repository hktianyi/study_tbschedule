<%@ page pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh_cn">
<head>
  <%@include file="/WEB-INF/common/common.jsp" %>
</head>
<body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-full-width">
<jsp:include page="/WEB-INF/common/header.jsp?menu=job" />
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
            任务列表
          </li>
        </ul>
        <div class="page-toolbar">
          <a href="${_PATH}/schedule/jobEdit" class="btn btn-circle green btn-sm"><i class="fa fa-plus"></i> 添加 </a>
        </div>
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
                "url": _PATH + "/schedule/job",
                "type": "GET",
                "data": function (params) {
                    params.q = $("#q").val();
                }
            },
            "columns": [
                {"sTitle": "序号", "sWidth": "3%", "defaultContent": ''},
//                {"sTitle": "任务类型", "data": "baseTaskType", "sWidth": "8%"},
                {"sTitle": "任务处理Bean", "data": "dealBeanName", "sWidth": "6%"},
//                {"sTitle": "心跳频率(毫秒)", "data": "heartBeatRate", "sWidth": "8%"},
//                {"sTitle": "死亡间隔(毫秒)", "data": "judgeDeadInterval", "sWidth": "8%"},
                {"sTitle": "线程数", "data": "threadNumber", "sWidth": "5%"},
                {"sTitle": "每次获取数据量", "data": "fetchDataNumber", "sWidth": "5%"},
                {"sTitle": "每次执行数量", "data": "executeNumber", "sWidth": "5%"},
                {"sTitle": "没有数据时休眠时长(毫秒)", "data": "sleepTimeNoData", "sWidth": "5%"},
                {"sTitle": "处理模式", "data": "processorType", "sWidth": "5%"},
                {"sTitle": "每次处理完数据后休眠时间(毫秒)", "data": "sleepTimeInterval", "sWidth": "5%"},
//                {"sTitle": "清除处理域信息时长(小时)", "data": "expireOwnSignInterval", "sWidth": "5%"},
                {"sTitle": "执行开始时间", "data": function (data) {
                    return data.permitRunStartTime ? data.permitRunStartTime : '-';
                }, "sWidth": "5%"},
                {"sTitle": "执行结束时间", "data": function (data) {
                    return data.permitRunEndTime ? data.permitRunEndTime : '-';
                }, "sWidth": "5%"},
//                {"sTitle": "单线程组最大任务项", "data": "maxTaskItemsOfOneThreadGroup", "sWidth": "5%"},
//                {"sTitle": "自定义参数", "data": "taskParameter", "sWidth": "5%"},
//                {"sTitle": "任务项", "data": "taskItems", "sWidth": "5%"},
                {
                    "sTitle": "操作", "data": function (data) {
                    return '<a href="' + _PATH + '/schedule/jobEdit?id=' + data.baseTaskType + '" type="button" class="btn btn-xs default blue-stripe">详情</a>' +
                        '<a href="javascript:clearJob(\'' + data.baseTaskType + '\');" type="button" class="btn btn-xs default green-stripe">清理</a>' +
                        '<a href="javascript:del(\'' + data.baseTaskType + '\');" type="button" class="btn btn-xs default red-stripe">删除</a>';
                }, "sWidth": "8%"
                }
            ]
        });
    }
    function clearJob(baseTaskType) {
        $.ajax(_PATH + '/schedule/job?id=' + baseTaskType, {
            type: 'PUT',
            success: function () {
                layer.msg('清理成功');
            },
            error: function () {
                layer.msg('清理失败');
            }
        })
    }
    function del(baseTaskType) {
        $.ajax(_PATH + '/schedule/job?id=' + baseTaskType, {
            type: 'DELETE',
            success: function () {
                layer.msg('删除成功');
                window.location.reload();
            },
            error: function () {
                layer.msg('删除失败');
            }
        })
    }
</script>
</body>
</html>