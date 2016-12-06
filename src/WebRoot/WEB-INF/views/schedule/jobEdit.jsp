<%@ page pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh_cn">
<head>
  <%@include file="/WEB-INF/common/common.jsp" %>
</head>
<body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-full-width">
<jsp:include page="/WEB-INF/common/header.jsp?menu=job"/>
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
            <a href="${_PATH}/view/jobList">任务列表</a>
            <i class="fa fa-angle-right"></i>
          </li>
          <li>
            ${data.baseTaskType}
          </li>
        </ul>
      </div>
      <div class="row">
        <div class="col-md-12">
          <div class="portlet box blue">
            <div class="portlet-title">
              <div class="caption">
                <i class="fa fa-tag"></i>任务详情
              </div>
            </div>
            <div class="portlet-body form">
              <form class="form-horizontal" role="form" action="${_PATH}/schedule/job" method="post">
                <input type="hidden" name="action" value="${not empty data.baseTaskType ? 'update' : 'create'}">
                <div class="form-body">
                  <h3 class="form-section">基础信息</h3>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="control-label col-md-4"> 任务名称 <span class="required" aria-required="true"> * </span>:</label>
                        <div class="col-md-8">
                          <input class="form-control" name="baseTaskType" value="${data.baseTaskType}" ${not empty data.baseTaskType ? 'readonly' : ''} placeholder="请输入新的任务类型..."/>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="control-label col-md-4">任务处理的SpringBean <span class="required" aria-required="true"> * </span>:</label>
                        <div class="col-md-8">
                          <input class="form-control" name="dealBeanName" value="${data.dealBeanName}" placeholder="Spring中的beanName"/>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="control-label col-md-4">心跳频率(毫秒) <span class="required" aria-required="true"> * </span>:</label>
                        <div class="col-md-8">
                          <input class="form-control" name="heartBeatRate" value="${data.heartBeatRate}" placeholder="5.0"/>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="control-label col-md-4">假定服务死亡间隔(毫秒) <span class="required" aria-required="true"> * </span>:</label>
                        <div class="col-md-8">
                          <input class="form-control" name="judgeDeadInterval" value="${data.judgeDeadInterval}" placeholder="60.0"/>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="control-label col-md-4">线程数 <span class="required" aria-required="true"> * </span>:</label>
                        <div class="col-md-8">
                          <input class="form-control" name="threadNumber" value="${data.threadNumber}" placeholder="5">
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="control-label col-md-4">处理模式 <span class="required" aria-required="true"> * </span>:</label>
                        <div class="col-md-8">
                          <select class="form-control" name="processorType">
                            <option value="SLEEP" ${data.processorType eq 'SLEEP' ? 'selected' : ''}>SLEEP</option>
                            <option value="NOTSLEEP" ${data.processorType eq 'NOTSLEEP' ? 'selected' : ''}>NOTSLEEP</option>
                          </select>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="control-label col-md-4">每次获取数据量 <span class="required" aria-required="true"> * </span>:</label>
                        <div class="col-md-8">
                          <input class="form-control" name="fetchDataNumber" value="${data.fetchDataNumber}" placeholder="500">
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="control-label col-md-4">每次执行数量 <span class="required" aria-required="true"> * </span>:</label>
                        <div class="col-md-8">
                          <input class="form-control" name="executeNumber" value="${data.executeNumber}" placeholder="1">
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="control-label col-md-4">没有数据时休眠时长(毫秒) <span class="required" aria-required="true"> * </span>:</label>
                        <div class="col-md-8">
                          <input class="form-control" name="sleepTimeNoData" value="${data.sleepTimeNoData}" placeholder="3000">
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="control-label col-md-4">每次处理完数据后休眠时间(毫秒) <span class="required" aria-required="true"> * </span>:</label>
                        <div class="col-md-8">
                          <input class="form-control" name="sleepTimeInterval" value="${data.sleepTimeInterval}" placeholder="3000">
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="control-label col-md-4">执行开始时间:</label>
                        <div class="col-md-8">
                          <input class="form-control" name="permitRunStartTime" value="${data.permitRunStartTime}">
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="control-label col-md-4">执行结束时间:</label>
                        <div class="col-md-8">
                          <input class="form-control" name="permitRunEndTime" value="${data.permitRunEndTime}">
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="control-label col-md-4">单线程组最大任务项 <span class="required" aria-required="true"> * </span>:</label>
                        <div class="col-md-8">
                          <input class="form-control" name="maxTaskItemsOfOneThreadGroup" value="${data.maxTaskItemsOfOneThreadGroup}" placeholder="每一组线程能分配的最大任务数量，避免在随着机器的减少把正常的服务器压死，0或者空表示不限制">
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="control-label col-md-4">自定义参数(字符串):</label>
                        <div class="col-md-8">
                          <input class="form-control" name="taskParameter" value="${data.taskParameter}">
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label class="control-label col-md-2">任务项(","分隔):</label>
                        <div class="col-md-10">
                          <input class="form-control" name="taskItems" value="${fn:join(data.taskItems, ',')}">
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label class="control-label col-md-2">说明:</label>
                        <div class="col-md-10">
                          <p class="form-control-static">
                            执行开始时间说明：<br>
                            1.允许执行时段的开始时间crontab的时间格式.'0 * * * * ?' 表示在每分钟的0秒开始<br>
                            2.以startrun:开始，则表示开机立即启动调度.<br>
                            3.格式参见： http://dogstar.javaeye.com/blog/116130<br><br>
                            执行结束时间说明：<br>
                            1.允许执行时段的结束时间crontab的时间格式,'20 * * * * ?' 表示在每分钟的20秒终止<br>
                            2.如果不设置，表示取不到数据就停止<br>
                            3.格式参见：http://dogstar.javaeye.com/blog/116130<br><br>
                            任务项的说明：<br>
                            1、将一个数据表中所有数据的ID按10取模，就将数据划分成了0、1、2、3、4、5、6、7、8、9供10个任务项。<br>
                            2、将一个目录下的所有文件按文件名称的首字母(不区分大小写)， 就划分成了A、B、C、D、E、F、G、H、I、J、K、L、M、N、O、P、Q、R、S、T、U、V、W、X、Y、Z供26个任务项。<br>
                            3、将一个数据表的数据ID哈希后按1000取模作为最后的HASHCODE,我们就可以将数据按[0,100)、[100,200) 、[200,300)、[300,400) 、[400,500)、[500,600)、[600,700)、[700,800)、[800,900)、 [900,1000)划分为十个任务项， 当然你也可以划分为100个任务项，最多是1000个项。<br>
                            4、任务项是进行任务分配的最小单位。一个任务队列只能由一个ScheduleServer来进行处理。但一个Server可以处理任意数量的任务项。<br>
                          </p>
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
                baseTaskType: "required",
                dealBeanName: "required",
                heartBeatRate: "required",
                judgeDeadInterval: "required",
                threadNumber: "required",
                fetchDataNumber: "required",
                executeNumber: "required",
                sleepTimeNoData: "required",
                sleepTimeInterval: "required",
                maxTaskItemsOfOneThreadGroup: "required"
            },
            messages: {
                baseTaskType: "请输入任务名称",
                dealBeanName: "请输入任务处理的SpringBean",
                heartBeatRate: "请输入心跳频率",
                judgeDeadInterval: "请输入死亡间隔",
                threadNumber: "请输入线程数",
                fetchDataNumber: "请输入每次获取数据量",
                executeNumber: "请输入每次执行数量",
                sleepTimeNoData: "请输入休眠时长",
                sleepTimeInterval: "请输入休眠时间",
                maxTaskItemsOfOneThreadGroup: "请输入最大任务项"
            }
        });
    });
</script>
</body>
</html>