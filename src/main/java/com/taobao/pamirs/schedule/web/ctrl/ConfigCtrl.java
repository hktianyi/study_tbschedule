package com.taobao.pamirs.schedule.web.ctrl;

import com.taobao.pamirs.schedule.ConsoleManager;
import com.taobao.pamirs.schedule.zk.ZKManager;
import com.taobao.pamirs.schedule.zk.ZKTools;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import java.io.IOException;
import java.util.Map;
import java.util.Properties;

/**
 * Created by tianyi on 2016/12/5.
 */
@Controller
@RequestMapping("/config")
public class ConfigCtrl extends BaseCtrl {

  /**
   * zkConn
   * @return
   */
  @RequestMapping(value = "/zkConn", method = RequestMethod.GET)
  public String zkConn(ModelMap modelMap) throws IOException {
    modelMap.addAttribute(ConsoleManager.loadConfig());
    return "/config/zkConn.jsp";
  }
  /**
   * zkData
   * @return
   */
  @RequestMapping(value = "/zkData", method = RequestMethod.GET)
  public String zkData(ModelMap modelMap) throws Exception {
    modelMap.addAttribute("data", ZKTools.getTree(ConsoleManager.getScheduleStrategyManager().getZooKeeper(), ConsoleManager.getScheduleStrategyManager().getRootPath()));
    return "/config/zkData.jsp";
  }

  /**
   * zkConn
   * @return
   */
  @RequestMapping(value = "/zkConn", method = RequestMethod.POST)
  public String saveZkConn(Map params, ModelMap modelMap) throws IOException {
    Properties p = new Properties();
    p.setProperty(ZKManager.keys.zkConnectString.toString(), request.getParameter(ZKManager.keys.zkConnectString.toString()));
    p.setProperty(ZKManager.keys.rootPath.toString(), request.getParameter(ZKManager.keys.rootPath.toString()));
    p.setProperty(ZKManager.keys.userName.toString(), request.getParameter(ZKManager.keys.userName.toString()));
    p.setProperty(ZKManager.keys.password.toString(), request.getParameter(ZKManager.keys.password.toString()));
    p.setProperty(ZKManager.keys.zkSessionTimeout.toString(), request.getParameter(ZKManager.keys.zkSessionTimeout.toString()));
    try {
      ConsoleManager.saveConfigInfo(p);
    } catch (Exception e) {
      e.printStackTrace();
      modelMap.put("error", e.getMessage());
    }
    return InternalResourceViewResolver.REDIRECT_URL_PREFIX + "/config/zkConn";
  }

}
