package com.sist.study.model;

import java.io.Serializable;

public class User implements Serializable 
{
	private static final long serialVersionUID = 1L;
	
	private String userId;
	private String userPwd;
	private String userName;
	private String userEmail;
	private String userTel;
	private long userPoint;
	private String userAddress;
	private String userBirth;
	private String status;
	private String regDate;
	
	public User()
	{
		userId = "";
		userPwd = "";
		userName = "";
		userEmail="";
		userTel="";
		userPoint=0;
		userAddress="";
		userBirth="";
		status = "N";
		regDate = "";
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserTel() {
		return userTel;
	}

	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}

	public long getUserPoint() {
		return userPoint;
	}

	public void setUserPoint(long userPoint) {
		this.userPoint = userPoint;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}


}	