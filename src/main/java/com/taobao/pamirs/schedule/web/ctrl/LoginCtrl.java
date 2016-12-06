package com.taobao.pamirs.schedule.web.ctrl;

import com.taobao.pamirs.schedule.web.entity.SysUser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

/**
 * Created by tianyi on 2016/12/5.
 */
@Controller
@RequestMapping
public class LoginCtrl extends BaseCtrl {

  /**
   * 登录页
   *
   * @return
   */
  @RequestMapping(value = "/login", method = RequestMethod.GET)
  public String login() {
    if (session.getAttribute(KEY_SESSION_USER) != null) {
      return InternalResourceViewResolver.REDIRECT_URL_PREFIX + "/schedule/strategyList";
    }
    return "/login.jsp";
  }

  /**
   * 用户登录
   *
   * @param username
   * @param password
   * @param modelMap
   * @return
   */
  @RequestMapping(value = "/login", method = RequestMethod.POST)
  public String login(String username, String password, ModelMap modelMap) {
    if ("admin".equals(username) && "111111".equals(password)) {
      SysUser sysUser = new SysUser();
      sysUser.setId(1l);
      sysUser.setUsername("admin");
      sysUser.setNickname("管理员");
      session.setAttribute(KEY_SESSION_USER, sysUser);
      return InternalResourceViewResolver.REDIRECT_URL_PREFIX + "/schedule/strategyList";
    } else {
      modelMap.put("errorInfo", "用户名或密码错误");
      return "/login.jsp";
    }
  }

  /**
   * 退出登录
   *
   * @return
   */
  @RequestMapping(value = "/logout", method = RequestMethod.GET)
  public String logout() {
    session.removeAttribute(KEY_SESSION_USER);
    return InternalResourceViewResolver.REDIRECT_URL_PREFIX + "/login";
  }
}
