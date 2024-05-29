package com.sist.study.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sist.common.util.CookieUtil;
import com.sist.common.util.HttpUtil;
import com.sist.common.util.JsonUtil;
import com.sist.study.model.Manager;
import com.sist.study.model.Response;

import com.sist.study.service.ManagerService;

@Controller("ManagerController")
public class ManagerController 
{
	@Value("#{env['auth.cookie.manager']}")
	private String AUTH_COOKIE_MANAGER;
	
	@Value("#{env['auth.cookie.user']}")
	private String AUTH_COOKIE_USER;
	
	@Autowired
	private ManagerService managerService;
		
	private static Logger logger = LoggerFactory.getLogger(ManagerController.class);
	
	@RequestMapping(value="/managerLogin")
	public String managerLogin(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse)
	{
		return "/managerLogin";
	}
	
	@RequestMapping(value="/managerLoginProc", method=RequestMethod.POST)
	@ResponseBody
	public Response<Object> managerLoginProc(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse)
	{
		Response<Object> resManager = new Response<Object>();
		
		String managerId = HttpUtil.get(httpServletRequest, "managerId");
		String managerPwd = HttpUtil.get(httpServletRequest, "managerPwd");

		Manager manager = managerService.managerSelect(managerId);
		
		if(manager != null)
		{
			CookieUtil.addCookie(httpServletResponse, "/", -1, AUTH_COOKIE_MANAGER, CookieUtil.stringToHex(managerId));
			resManager.setResponse(0, "success");
		}
		else
		{
			resManager.setResponse(404, "fail");
		}
		if(logger.isDebugEnabled())
		{
			logger.debug("\n" + JsonUtil.toJsonPretty(resManager));
		}
		return resManager;
	}
}
