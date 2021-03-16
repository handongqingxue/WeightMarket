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
	public String getXhUserName() {
		return xhUserName;
	}
	public void setXhUserName(String xhUserName) {
		this.xhUserName = xhUserName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getXhPhone() {
		return xhPhone;
	}
	public void setXhPhone(String xhPhone) {
		this.xhPhone = xhPhone;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public Integer getSecondAgo() {
		return secondAgo;
	}
	public void setSecondAgo(Integer secondAgo) {
		this.secondAgo = secondAgo;
	}
	public String getTimeAgo() {
		return timeAgo;
	}
	public void setTimeAgo(String timeAgo) {
		this.timeAgo = timeAgo;
	}
	public Integer getPnId() {
		return pnId;
	}
	public void setPnId(Integer pnId) {
		this.pnId = pnId;
	}
	public String getPnName() {
		return pnName;
	}
	public void setPnName(String pnName) {
		this.pnName = pnName;
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
	private String xhUserName;
	private String phone;
	private String xhPhone;
	private String createTime;
	private Integer secondAgo;
	private String timeAgo;
	private Integer pnId;
	private String pnName;
	private Boolean deal;
	private String memo;
}
