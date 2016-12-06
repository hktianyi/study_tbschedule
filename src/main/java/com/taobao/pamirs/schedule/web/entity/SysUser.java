package com.taobao.pamirs.schedule.web.entity;

import java.io.Serializable;

/**
 * 系统管理员
 * Created by Tianyi on 2016/12/5.
 */
public class SysUser implements Serializable {

  protected Long id;

  private String username;// 登录名，唯一，不可修改
  private String nickname;// 昵称
  private String password;// 登录密码
  private String mobile;  // 手机号
  private String email;   // 邮箱
  private String avatarUrl;  // 头像

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public String getNickname() {
    return nickname;
  }

  public void setNickname(String nickname) {
    this.nickname = nickname;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getMobile() {
    return mobile;
  }

  public void setMobile(String mobile) {
    this.mobile = mobile;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getAvatarUrl() {
    return avatarUrl;
  }

  public void setAvatarUrl(String avatarUrl) {
    this.avatarUrl = avatarUrl;
  }
}
