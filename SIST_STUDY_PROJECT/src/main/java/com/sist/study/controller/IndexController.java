package com.sist.study.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("IndexController")
public class IndexController 
{
	@RequestMapping(value="/main")
	public String mainIndex(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse)
	{
		return "/main";
	}
}
