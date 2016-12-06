<%@ page pageEncoding="UTF-8" language="java" %>
<div class="page-footer">
  <div class="page-footer-inner"> TaobaoSchedule调度管理控制台. </div>
  <div class="scroll-to-top">
    <i class="icon-arrow-up"></i>
  </div>
</div>
<!-- BEGIN CORE PLUGINS -->
<script src="${_CDN}/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="${_CDN}/bootstrap-switch/3.3.2/js/bootstrap-switch.min.js"></script>
<script src="${_CDN}/Cookies.js/1.2.1/cookies.min.js"></script>
<script src="${_CDN}/jQuery-slimScroll/1.3.8/jquery.slimscroll.min.js"></script>
<script src="${_CDN}/Uniform.js/4.0.1/js/jquery.uniform.standalone.js"></script>
<script src="${_CDN}/datatables/1.10.12/js/jquery.dataTables.min.js"></script>
<script src="${_CDN}/jquery-validate/1.15.1/jquery.validate.min.js"></script>
<script src="${_CDN}/layer/2.4/layer.min.js"></script>
<script src="${_PATH}/static/js/app.min.js" type="text/javascript"></script>
<script src="${_PATH}/static/js/layout.min.js" type="text/javascript"></script>
<script src="${_PATH}/static/js/demo.min.js" type="text/javascript"></script>
<script>
    !(function () {
        // DataTable配置
//        $.fn.dataTable.ext.errMode = 'throw';
        $.fn.dataTable.defaults = $.extend($.fn.dataTable.defaults, {
            language: {'sUrl': _PATH + '/static/datatables-zh-cn.lang'},
            dom: "<'row'<'col-sm-6'f>><'row'<'col-sm-12'tr>><'row'<'col-sm-3'l><'col-sm-6'p>>",
            lengthMenu: [[10, 50, 100], [10, 50, 100]], info: true, stateSave: true, paging: false, scrollX: true,
            processing: true, serverSide: true, deferRender: true, searching: false, ordering: false, pageLength: 50,
            fnCreatedRow: function (nRow, aData, iDataIndex) {
                $('td:eq(0)', nRow).html(++iDataIndex);
            }
        });
    })(window);
</script>