package com.taobao.pamirs.schedule.web.config;

import com.taobao.pamirs.schedule.ConsoleManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;

/**
 * Created by tianyi on 2016/12/2.
 */
public class InitBean implements InitializingBean {
  private static Logger log = LoggerFactory.getLogger(InitBean.class);

  @Override
  public void afterPropertiesSet() throws Exception {
    ConsoleManager.initial();
  }
}
