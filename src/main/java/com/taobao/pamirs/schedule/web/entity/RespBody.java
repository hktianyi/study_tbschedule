package com.taobao.pamirs.schedule.web.entity;

import java.util.List;

public class RespBody {
  private static final RespBody OK = new RespBody("");
  private static final RespBody ERROR = new RespBody("");
  private Object data;
  private String errorInfo;
  private Number recordsTotal;
  private Number recordsFiltered;

  private RespBody(String errorInfo) {
    this.errorInfo = errorInfo;
  }

  private RespBody(Object data) {
    this.data = data;
  }

  private RespBody(Object data, Number records) {
    this.data = data;
    this.recordsTotal = records;
    this.recordsFiltered = records;
  }

  private RespBody(Object data, Number recordsTotal, Number recordsFiltered) {
    this.data = data;
    this.recordsTotal = recordsTotal;
    this.recordsFiltered = recordsFiltered;
  }

  public static RespBody ok() {
    return OK;
  }

  public static RespBody ok(Object data) {
    return ok(data, (data instanceof List) ? ((List) data).size() : 1);
  }

  public static RespBody ok(Object data, Number count) {
    return new RespBody(data, count);
  }
}
