package com.taobao.pamirs.schedule.test;


import com.taobao.pamirs.schedule.strategy.TBScheduleManagerFactory;
import org.junit.Test;
import org.unitils.UnitilsJUnit4;
import org.unitils.spring.annotation.SpringApplicationContext;
import org.unitils.spring.annotation.SpringBeanByName;

/**
 * 调度测试
 *
 * @author xuannan
 */
@SpringApplicationContext({"schedule.xml"})
public class StartDemoSchedule extends UnitilsJUnit4 {
  @SpringBeanByName
  TBScheduleManagerFactory scheduleManagerFactory;

  public void setScheduleManagerFactory(TBScheduleManagerFactory tbScheduleManagerFactory) {
    this.scheduleManagerFactory = tbScheduleManagerFactory;
  }

  @Test
  public void testRunData() throws Exception {
    Thread.sleep(10000L);
  }
}
