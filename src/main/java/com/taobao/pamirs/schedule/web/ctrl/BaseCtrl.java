package com.taobao.pamirs.schedule.web.ctrl;

import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by tianyi on 2016/12/5.
 */
public abstract class BaseCtrl {
  protected static final String KEY_SESSION_USER = "_USER";
  @Autowired
  protected HttpServletRequest request;
  @Autowired
  protected HttpSession session;
}
