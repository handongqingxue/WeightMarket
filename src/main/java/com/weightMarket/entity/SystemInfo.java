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
	public String getContactTel1() {
		return contactTel1;
	}
	public void setContactTel1(String contactTel1) {
		this.contactTel1 = contactTel1;
	}
	public String getContactTel2() {
		return contactTel2;
	}
	public void setContactTel2(String contactTel2) {
		this.contactTel2 = contactTel2;
	}
	public String getContactAddress() {
		return contactAddress;
	}
	public void setContactAddress(String contactAddress) {
		this.contactAddress = contactAddress;
	}
	private String yszc;//隐私政策
	private String companyName;
	private String contactTel1;
	private String contactTel2;
	private String contactAddress;
}
