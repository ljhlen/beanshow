package com.ljh.adminUser.bean;


public class Adminuser {

  private long id;
  private String username;
  private long phone;
  private String email;
  private String password;
  private String userflag;

  public Adminuser(){

  }

  public Adminuser(long id, String username, long phone, String email, String password, String userflag) {
    this.id = id;
    this.username = username;
    this.phone = phone;
    this.email = email;
    this.password = password;
    this.userflag = userflag;
  }

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }


  public long getPhone() {
    return phone;
  }

  public void setPhone(long phone) {
    this.phone = phone;
  }


  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }


  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }


  public String getUserflag() {
    return userflag;
  }

  public void setUserflag(String userflag) {
    this.userflag = userflag;
  }

}
