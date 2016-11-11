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
public class Demo1TaskBean implements IScheduleTaskDealSingle<String> {

  private static int count = 0;
  @Override
  public boolean execute(String task, String ownSign) throws Exception {
    System.out.println("执行任务：" + task + "____" + ownSign);
    return false;
  }

  @Override
  public List<String> selectTasks(String taskParameter, String ownSign, int taskItemNum, List<TaskItemDefine> taskItemList, int eachFetchDataNum) throws Exception {
    System.out.println("获取任务：" + Calendar.getInstance().getTime());
    System.out.println(taskParameter + "————" + ownSign + "————" + taskItemNum + "————" + eachFetchDataNum + "————" + taskItemList);
    List<String> list = new ArrayList<String>();
    if (count<1) {
      list.add("模拟任务数据---oooooooo");
      list.add("模拟任务数据---tttttttt");
    } else if (count<2) {
      list.add("模拟任务数据---uuuuuuuu");
    }
    count++;
    return list;
  }

  @Override
  public Comparator<String> getComparator() {
    System.out.println("调用getComparator");
    return null;
  }
}
