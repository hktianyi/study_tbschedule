package demo.tbs;

import com.sun.org.apache.xpath.internal.operations.String;
import com.taobao.pamirs.schedule.IScheduleTaskDealSingle;
import com.taobao.pamirs.schedule.TaskItemDefine;

import java.util.Comparator;
import java.util.List;

/**
 * Created by tianyi on 2016/11/7.
 */
public class Demo0TaskSingle implements IScheduleTaskDealSingle<String> {
  @Override
  public boolean execute(String task, java.lang.String ownSign) throws Exception {
    System.out.println("222222222222222222");
    return true;
  }

  @Override
  public List<String> selectTasks(java.lang.String taskParameter, java.lang.String ownSign, int taskItemNum, List<TaskItemDefine> taskItemList, int eachFetchDataNum) throws Exception {
    System.out.println("111111111111111111");
    System.out.println(taskParameter + "————" + ownSign + "————" + taskItemNum + "————" + eachFetchDataNum + "————" + taskItemList);
    return null;
  }

  @Override
  public Comparator<String> getComparator() {
    System.out.println("333333333333");
    return null;
  }
}
