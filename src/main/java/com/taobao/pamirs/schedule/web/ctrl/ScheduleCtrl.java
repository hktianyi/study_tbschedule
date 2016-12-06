package com.taobao.pamirs.schedule.web.ctrl;

import com.taobao.pamirs.schedule.ConsoleManager;
import com.taobao.pamirs.schedule.strategy.ScheduleStrategy;
import com.taobao.pamirs.schedule.taskmanager.ScheduleTaskType;
import com.taobao.pamirs.schedule.web.entity.RespBody;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import java.util.List;

/**
 * Created by tianyi on 2016/12/5.
 */
@Controller
@RequestMapping("/schedule")
public class ScheduleCtrl {

  /**
   * 列表页面
   * @param type
   * @return
   */
  @RequestMapping(value = "/{type}List", method = RequestMethod.GET)
  public String indexList(@PathVariable String type) {
    return "/schedule/" + type + "List.jsp";
  }

  /**
   * 编辑 & 添加页面
   * @param type
   * @param id
   * @param modelMap
   * @return
   * @throws Exception
   */
  @RequestMapping(value = "/{type}Edit", method = RequestMethod.GET)
  public String edit(@PathVariable String type, @RequestParam(required = false, defaultValue = "-1") String id, ModelMap modelMap) throws Exception {
    switch (type) {
      case "strategy": modelMap.put("data", ConsoleManager.getScheduleStrategyManager().loadStrategy(id)); break;
      case "job": modelMap.put("data", ConsoleManager.getScheduleDataManager().loadTaskTypeBaseInfo(id)); break;
      default: break;
    }
    return "/schedule/" + type + "Edit.jsp";
  }

  /**
   * 动态加载列表
   * @param type
   * @return
   * @throws Exception
   */
  @RequestMapping(value = "/{type}", method = RequestMethod.GET)
  @ResponseBody
  public RespBody load(@PathVariable String type, @RequestParam(required = false) String key) throws Exception {
    while (!ConsoleManager.getScheduleManagerFactory().isZookeeperInitialSucess()) {
      Thread.sleep(1000);
    }
    List list;
    switch (type) {
      case "strategy": list = ConsoleManager.getScheduleStrategyManager().loadAllScheduleStrategy(); break;
      case "job": list = ConsoleManager.getScheduleDataManager().getAllTaskTypeBaseInfo(); break;
      case "machine": list = ConsoleManager.getScheduleStrategyManager().loadAllManagerFactoryInfo(); break;
      case "server": list = ConsoleManager.getScheduleDataManager().selectScheduleServer(null,null,null,null); break;
      case "runtimeByUUID": list = ConsoleManager.getScheduleStrategyManager().loadAllScheduleStrategyRunntimeByUUID(key); break;
      case "runtimeByTaskType": list = ConsoleManager.getScheduleStrategyManager().loadAllScheduleStrategyRunntimeByTaskType(key); break;
      default: list = null; break;
    }
    return RespBody.ok(list);
  }

  /**
   * 删除
   * @param type
   * @param id
   * @return
   */
  @RequestMapping(value = "/{type}", method = RequestMethod.DELETE)
  @ResponseBody
  public RespBody delete(@PathVariable String type, @RequestParam String id) throws Exception {
    switch (type) {
      case "strategy": ConsoleManager.getScheduleStrategyManager().deleteMachineStrategy(id); break;
      case "job": ConsoleManager.getScheduleDataManager().deleteTaskType(id); break;
      default: break;
    }
    return RespBody.ok();
  }

  /**
   * 保存
   * @param action
   * @param scheduleStrategy
   * @return
   */
  @RequestMapping(value = "/strategy", method = RequestMethod.POST)
  public String saveStrategy(@RequestParam String action, @RequestParam(required = false, defaultValue = "127.0.0.1") String ips, ScheduleStrategy scheduleStrategy) throws Exception {
    scheduleStrategy.setIPList(ips.split(","));
    switch (action) {
      case "create": ConsoleManager.getScheduleStrategyManager().createScheduleStrategy(scheduleStrategy); break;
      case "update": ConsoleManager.getScheduleStrategyManager().updateScheduleStrategy(scheduleStrategy); break;
      default: break;
    }
    return InternalResourceViewResolver.REDIRECT_URL_PREFIX + "/schedule/strategyList";
  }

  /**
   * 保存
   * @param action
   * @param scheduleTaskType
   * @return
   */
  @RequestMapping(value = "/job", method = RequestMethod.POST)
  public String saveJob(@RequestParam String action, @RequestParam(required = false, defaultValue = "127.0.0.1") String ips, ScheduleTaskType scheduleTaskType) throws Exception {
    switch (action) {
      case "create": ConsoleManager.getScheduleDataManager().createBaseTaskType(scheduleTaskType); break;
      case "update": ConsoleManager.getScheduleDataManager().updateBaseTaskType(scheduleTaskType); break;
      default: break;
    }
    return InternalResourceViewResolver.REDIRECT_URL_PREFIX + "/schedule/jobList";
  }

  /**
   * 清理运行期信息
   * @param id
   * @return
   */
  @RequestMapping(value = "/job", method = RequestMethod.PUT)
  @ResponseBody
  public RespBody clearJob(@RequestParam String id) throws Exception {
    ConsoleManager.getScheduleDataManager().clearTaskType(id);
    return RespBody.ok();
  }

  /**
   * 切换状态
   * @param status true 运行，false 暂停
   * @param id
   * @return
   */
  @RequestMapping(value = "/strategy", method = RequestMethod.PUT)
  @ResponseBody
  public RespBody statusStrategy(@RequestParam boolean status, @RequestParam String id) throws Exception {
    if (status) ConsoleManager.getScheduleStrategyManager().resume(id);
    else ConsoleManager.getScheduleStrategyManager().pause(id);
    return RespBody.ok();
  }

  /**
   * 切换机器状态
   * @param status true 运行，false 暂停
   * @param id
   * @return
   */
  @RequestMapping(value = "/machine", method = RequestMethod.PUT)
  @ResponseBody
  public RespBody statusMachine(@RequestParam boolean status, @RequestParam String id) throws Exception {
    ConsoleManager.getScheduleStrategyManager().updateManagerFactoryInfo(id, status);
    return RespBody.ok();
  }

}
