<%@ page pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh_cn">
<head>
  <%@include file="/WEB-INF/common/common.jsp" %>
</head>
<body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-full-width">
<jsp:include page="/WEB-INF/common/header.jsp?menu=strategy"/>
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
            调度策略
          </li>
        </ul>
        <div class="page-toolbar">
          <a href="${_PATH}/schedule/strategyEdit" class="btn btn-circle green btn-sm"><i class="fa fa-plus"></i> 添加 </a>
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
                "url": _PATH + "/schedule/strategy",
                "type": "GET",
                "data": function (params) {
                    params.q = $("#q").val();
                }
            },
            "columns": [
                {"sTitle": "序号", "sWidth": "3%", "defaultContent": ''},
                {"sTitle": "策略名称", "name": "strategyName", "data": "strategyName", "sWidth": "8%"},
                {"sTitle": "任务类型", "name": "kind", "data": "kind", "sWidth": "6%"},
                {"sTitle": "任务名称", "name": "taskName", "data": "taskName", "sWidth": "8%"},
                {"sTitle": "任务参数", "name": "taskParameter", "data": "taskParameter", "sWidth": "8%"},
                {"sTitle": "单JVM最大线程组数量", "name": "numOfSingleServer", "data": "numOfSingleServer", "sWidth": "5%"},
                {"sTitle": "最大线程组数量", "name": "assignNum", "data": "assignNum", "sWidth": "5%"},
                {
                    "sTitle": "IP地址(逗号分隔)", "data": function (data) {
                    return data.IPList ? data.IPList : '';
                }, "sWidth": "8%"
                },
                {
                    "sTitle": "任务状态", "name": "sts", "data": function (data) {
                    return '<input type="checkbox" class="make-switch" data-id="' + data.strategyName + '" data-on-text="运行" data-off-text="暂停" data-on-color="success" data-off-color="danger" ' + (data.sts == 'resume' ? 'checked' : '') + '>';
                }, "sWidth": "8%"
                },
                {
                    "sTitle": "操作", "name": "createTime", "data": function (data) {
                    return '<a href="' + _PATH + '/schedule/strategyEdit?id=' + data.strategyName + '" type="button" class="btn btn-xs default blue-stripe">详情</a>' +
                        '<a href="javascript:del(\'' + data.strategyName + '\');" type="button" class="btn btn-xs default red-stripe">删除</a>';
                }, "sWidth": "8%"
                }
            ]
        });

        dataTable.on('draw.dt', function () {
            $('.make-switch').on('switchChange.bootstrapSwitch', function (e, state) {
                e.preventDefault();
                $.ajax(_PATH + '/schedule/strategy?status=' + state + '&id=' + $(this).data('id'), {
                    type: 'PUT',
                    success: function () {
                        layer.msg('操作成功');
                    },
                    error: function () {
                        alert('操作失败！');
                        window.location.reload();
                    }
                });
            }).bootstrapSwitch();
        });
    }
    function del(strategyName) {
        $.ajax(_PATH + '/schedule/strategy?id=' + strategyName, {
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