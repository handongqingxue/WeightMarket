package com.weightMarket.entity;

public class GetPriceUser {

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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public Integer getPnId() {
		return pnId;
	}
	public void setPnId(Integer pnId) {
		this.pnId = pnId;
	}
	public Boolean getDeal() {
		return deal;
	}
	public void setDeal(Boolean deal) {
		this.deal = deal;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	private String userName;
	private String phone;
	private String createTime;
	private Integer pnId;
	private Boolean deal;
	private String memo;
}
