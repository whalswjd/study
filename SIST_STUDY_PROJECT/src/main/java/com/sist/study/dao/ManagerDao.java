package com.sist.study.dao;

import org.springframework.stereotype.Repository;

import com.sist.study.model.Manager;

@Repository("ManagerDao")
public interface ManagerDao 
{
	public Manager managerSelect(String managerId);
}
