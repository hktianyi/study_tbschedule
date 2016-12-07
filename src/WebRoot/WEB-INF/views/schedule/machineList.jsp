<%@ page pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh_cn">
<head>
  <%@include file="/WEB-INF/common/common.jsp" %>
</head>
<body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-full-width">
<jsp:include page="/WEB-INF/common/header.jsp?menu=machine"/>
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
            机器列表
          </li>
        </ul>
      </div>
      <div class="row">
        <div class="col-md-12">
          <table id="machine" class="table table-striped table-hover table-header-fixed"></table>
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
        dataTable = $("#machine").DataTable({
            "ajax": {
                "url": _PATH + "/schedule/machine",
                "type": "GET",
                "data": function (params) {
                    params.q = $("#q").val();
                }
            },
            "columns": [
                {"sTitle": "序号", "sWidth": "5%", "defaultContent": ''},
                {"sTitle": "详情", "sWidth": "5%", "defaultContent": '<i class="row-details fa fa-plus-square-o"></i>'},
                {"sTitle": "任务处理机", "data": "uuid", "sWidth": "65%"},
                {
                    "sTitle": "状态", "data": function (data) {
                    return '<input type="checkbox" class="make-switch" data-id="'+data.uuid+'" data-on-text="运行" data-off-text="停止" data-on-color="success" data-off-color="danger" ' + (data.start ? 'checked' : '') + '>';
                }, "sWidth": "15%"
                }
            ]
        });
        dataTable.on('draw.dt', function () {
            $('tbody tr').click(function (e) {
                if (e.target.localName === 'span') return;

                var obj = $(this).find('.row-details');
                var row = dataTable.row(this);
                if (row.child.isShown()) {
                    row.child.hide();
                    obj.removeClass('fa-minus-square-o').addClass('fa-plus-square-o');
                } else {
                    fnFormatDetails(row);
                    obj.removeClass('fa-plus-square-o').addClass('fa-minus-square-o');
                }
            });
            $('.make-switch').on('switchChange.bootstrapSwitch', function (e, state) {
                e.preventDefault();
                $.ajax(_PATH + '/schedule/machine?status='+state+'&id=' + $(this).data('id'), {
                    type: 'PUT',
                    success: function () {
                        layer.msg('操作成功');
                    },
                    error: function () {
                        layer.msg('操作失败');
                        window.location.reload();
                    }
                });
            }).bootstrapSwitch();
        });
    }
    function fnFormatDetails(row) {
        $.get(_PATH + "/schedule/runtimeByUUID?key=" + row.data().uuid, function (json) {
            var html = new Array();
            html.push('<table class="table"><tr><th width="10%">任务类型</th><th width="90%">处理机器</th><th width="10%">线程组数量</th><th width="10%">错误信息</th></tr>');
            var data = json.data;
            for (var i in data) {
                html.push('<tr><th>' + data[i].strategyName + '</th><th>' + data[i].uuid + '</th><th>' + data[i].requestNum + '</th><th>' + data[i].message + '</th></tr>');
            }
            html.push('</table>');
            row.child(html.join('')).show();
        });
    }
</script>
</body>
</html>