package com.sist.study.dao;

import org.springframework.stereotype.Repository;

import com.sist.study.model.User;

@Repository("UserDao")
public interface UserDao 
{
	public User userSelect(String userId);
	
	public User userEmailSelect (String userEmail);
	
	public int userpwdUpdate (User user);
	
	public int nomalUserInsert (User user);
}