package demo.tbs;

import com.sun.org.apache.xpath.internal.operations.String;
import com.taobao.pamirs.schedule.IScheduleTaskDealSingle;
import com.taobao.pamirs.schedule.TaskItemDefine;

import java.util.Comparator;
import java.util.List;

/**
 * Created by tianyi on 2016/11/7.
 */
public class Demo0Task implements IScheduleTaskDealSingle<String> {
  @Override
  public boolean execute(String task, java.lang.String ownSign) throws Exception {
    return false;
  }

  @Override
  public List<String> selectTasks(java.lang.String taskParameter, java.lang.String ownSign, int taskItemNum, List<TaskItemDefine> taskItemList, int eachFetchDataNum) throws Exception {
    return null;
  }

  @Override
  public Comparator<String> getComparator() {
    return null;
  }
}
