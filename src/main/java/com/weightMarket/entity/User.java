package com.weightMarket.entity;

public class User {

	public User(String userName, String password) {
		this.userName = userName;
		this.password = password;
	}
	
	public User() {
		super();
	}
	
	private Integer id;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	private String userName;
	private String password;
}
