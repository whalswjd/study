package com.sist.study.model;

import java.io.Serializable;

public class Manager implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private String managerId;
	private String managerPwd;
	private String managerName;
	private String managerNickname;
	private String status;
	private String managerDate;
	
	public Manager()
	{
		managerId = "";
		managerPwd = "";
		managerName = "";
		managerNickname = "";
		status = "";
		managerDate = "";
	}

	public String getManagerId() 
	{
		return managerId;
	}

	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}

	public String getManagerPwd() {
		return managerPwd;
	}

	public void setManagerPwd(String managerPwd) {
		this.managerPwd = managerPwd;
	}

	public String getManagerName() {
		return managerName;
	}

	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}

	public String getManagerNickname() {
		return managerNickname;
	}

	public void setManagerNickname(String managerNickname) {
		this.managerNickname = managerNickname;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getManagerDate() {
		return managerDate;
	}

	public void setManagerDate(String managerDate) {
		this.managerDate = managerDate;
	}
}
