package com.weightMarket.entity;

public class SystemInfo {

	private String grxxsq;//个人信息授权
	public String getGrxxsq() {
		return grxxsq;
	}
	public void setGrxxsq(String grxxsq) {
		this.grxxsq = grxxsq;
	}
	public String getYszc() {
		return yszc;
	}
	public void setYszc(String yszc) {
		this.yszc = yszc;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getContactTel() {
		return contactTel;
	}
	public void setContactTel(String contactTel) {
		this.contactTel = contactTel;
	}
	public String getContactAddress() {
		return contactAddress;
	}
	public void setContactAddress(String contactAddress) {
		this.contactAddress = contactAddress;
	}
	private String yszc;//隐私政策
	private String companyName;
	private String contactTel;
	private String contactAddress;
}
