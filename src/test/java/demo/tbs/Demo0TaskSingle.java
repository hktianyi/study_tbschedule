package demo.tbs;

import com.taobao.pamirs.schedule.IScheduleTaskDealSingle;
import com.taobao.pamirs.schedule.TaskItemDefine;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Comparator;
import java.util.List;

/**
 * Created by tianyi on 2016/11/7.
 */
public class Demo0TaskSingle implements IScheduleTaskDealSingle<String> {
  @Override
  public boolean execute(String task, java.lang.String ownSign) throws Exception {
    System.out.println("执行任务：" + task + "____" + ownSign);
    return true;
  }

  @Override
  public List<String> selectTasks(java.lang.String taskParameter, java.lang.String ownSign, int taskItemNum, List<TaskItemDefine> taskItemList, int eachFetchDataNum) throws Exception {
    System.out.println("获取任务：" + Calendar.getInstance().getTime());
    System.out.println(taskParameter + "————" + ownSign + "————" + taskItemNum + "————" + eachFetchDataNum + "————" + taskItemList);
    List<String> list = new ArrayList<java.lang.String>();
    list.add("模拟任务数据---oooooooo");
    list.add("模拟任务数据---tttttttt");
    return list;
  }

  @Override
  public Comparator<String> getComparator() {
    System.out.println("333333333333");
    return null;
  }
}
