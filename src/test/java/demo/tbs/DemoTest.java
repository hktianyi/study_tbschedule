package demo.tbs;

import com.taobao.pamirs.schedule.strategy.ScheduleStrategy;
import com.taobao.pamirs.schedule.strategy.TBScheduleManagerFactory;
import com.taobao.pamirs.schedule.taskmanager.ScheduleTaskType;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.unitils.UnitilsJUnit4;
import org.unitils.spring.annotation.SpringApplicationContext;
import org.unitils.spring.annotation.SpringBeanByName;

/**
 * Created by tianyi on 2016/11/8.
 */
@SpringApplicationContext({"schedule.xml"})
public class DemoTest extends UnitilsJUnit4 {
  protected static transient Logger log = LoggerFactory.getLogger(DemoTest.class);
  @SpringBeanByName
  TBScheduleManagerFactory scheduleManagerFactory;

  public void setScheduleManagerFactory(
      TBScheduleManagerFactory tbScheduleManagerFactory) {
    this.scheduleManagerFactory = tbScheduleManagerFactory;
  }

  @Test
  public void delTask() throws Exception {
    String baseTaskTypeName = "DemoTask";
    while (this.scheduleManagerFactory.isZookeeperInitialSucess() == false) {
      Thread.sleep(1000);
    }
    scheduleManagerFactory.stopServer(null);
    Thread.sleep(1000);
    try {
      this.scheduleManagerFactory.getScheduleDataManager().deleteTaskType(baseTaskTypeName);
      log.info("删除调度任务成功:" + baseTaskTypeName);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  @Test
  public void addTask() throws Exception {
    String baseTaskTypeName = "demo0TaskType";
    while (this.scheduleManagerFactory.isZookeeperInitialSucess() == false) {
      Thread.sleep(1000);
    }
    scheduleManagerFactory.stopServer(null);
    Thread.sleep(1000);
    try {
      this.scheduleManagerFactory.getScheduleDataManager().deleteTaskType(baseTaskTypeName);
    } catch (Exception e) {
      e.printStackTrace();
    }

    // 创建任务调度DemoTask的基本信息
    ScheduleTaskType baseTaskType = new ScheduleTaskType();
    baseTaskType.setBaseTaskType(baseTaskTypeName);
    baseTaskType.setDealBeanName("demo0TaskSingle");
    baseTaskType.setHeartBeatRate(2000);
    baseTaskType.setJudgeDeadInterval(10000);
    baseTaskType.setPermitRunStartTime("0 * * * * ?");
//    baseTaskType.setPermitRunEndTime("7 * * * * ?");
    baseTaskType.setTaskParameter("TaskParameter");
    baseTaskType.setTaskItems(new String[]{"item_aaa", "item_bbb", "item_ccc"});
    this.scheduleManagerFactory.getScheduleDataManager().createBaseTaskType(baseTaskType);
    log.info("创建调度任务成功:" + baseTaskType.toString());

    // 创建任务DemoTask的调度策略
    String taskName = baseTaskTypeName + "$TEST";
    String strategyName = baseTaskTypeName + "-Strategy";
    try {
      this.scheduleManagerFactory.getScheduleStrategyManager().deleteMachineStrategy(strategyName, true);
    } catch (Exception e) {
      e.printStackTrace();
    }
    ScheduleStrategy strategy = new ScheduleStrategy();
    strategy.setStrategyName(strategyName);
    strategy.setKind(ScheduleStrategy.Kind.Schedule);
    strategy.setTaskName(taskName);
    strategy.setTaskParameter("Strategy - TaskParameter");

    strategy.setNumOfSingleServer(1);
    strategy.setAssignNum(10);
    strategy.setIPList("127.0.0.1".split(","));
    this.scheduleManagerFactory.getScheduleStrategyManager().createScheduleStrategy(strategy);
    log.info("创建调度策略成功:" + strategy.toString());
  }


  @Test
  public void testRunData() throws Exception {
    Thread.sleep(120000000L);
  }
}
