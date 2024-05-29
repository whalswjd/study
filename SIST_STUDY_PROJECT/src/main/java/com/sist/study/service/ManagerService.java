package com.sist.study.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.study.dao.ManagerDao;
import com.sist.study.model.Manager;

@Service("ManagerService")
public class ManagerService 
{
	@Autowired
	private ManagerDao managerDao;
	
	private static Logger logger = LoggerFactory.getLogger(ManagerService.class);
	
	public Manager managerSelect(String managerId)
	{
		Manager manager = null;
		
		try 
		{
			manager = managerDao.managerSelect(managerId);
		}
		catch (Exception e)
		{
			logger.error("[ManagerService] managerSelect Exception Error" + e);
		}
		
		return manager;
	}
}
