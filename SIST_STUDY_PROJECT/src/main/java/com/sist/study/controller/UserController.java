package com.sist.study.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sist.common.util.CookieUtil;
import com.sist.common.util.HttpUtil;
import com.sist.common.util.JsonUtil;
import com.sist.common.util.StringUtil;
import com.sist.study.model.Response;
import com.sist.study.model.User;
import com.sist.study.service.UserService;

@Controller("UserController")
public class UserController 
{
	@Value("#{env['auth.cookie.user']}")
	private String AUTH_COOKIE_USER;
	
	@Value("#{env['auth.cookie.manager']}")
	private String AUTH_COOKIE_MANAGER;
	
	@Autowired
	private UserService userService;
	
	private static Logger logger = LoggerFactory.getLogger(UserController.class);
	
	//회원 로그인 페이지
	@RequestMapping(value="/userLogin")
	public String index(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse)
	{
		return "/user/userSignIn";
	}
	
	//비밀번호 찾기 페이지
	@RequestMapping(value="/user/findPwd")
	public String findPwdPage(HttpServletRequest request, HttpServletResponse response)
	{
		return "/user/findPwd";
	}
	//비밀번호 찾기 로직
	 @RequestMapping (value="/user/findPwdProc")
	 @ResponseBody
	 public Response<Object> findPwdProc (HttpServletRequest request, HttpServletResponse response){
		 Response<Object> ajaxRes = new Response<Object>();
		 String userEmail = HttpUtil.get(request, "userEmail","");
		 if(!StringUtil.isEmpty(userEmail)) {
			User user = userService.userEmailSelect(userEmail);
			if(user!=null) {
				try {
					if(userService.sendNewPwd(user)>0) {
						ajaxRes.setResponse(0, "success");
					}
					else {
						ajaxRes.setResponse(-100, "");
					}
				}
				catch(Exception e) {
					ajaxRes.setResponse(-100, "");
					logger.debug("[UserController] findPwdProc Exception",e);
				}
			}
			else {
				ajaxRes.setResponse(300, "not in our dataBase");
			}
		 }
		 else {
			 ajaxRes.setResponse(400, "badRequest");
		 }
		 return ajaxRes;
	 }
	 
	//회원 로그인 로직
	@RequestMapping(value="/user/userLoginProc", method=RequestMethod.POST)
	@ResponseBody
	public Response<Object> userLoginProc(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse)
	{
		Response<Object> resUser = new Response<Object>();
		
		String userId = HttpUtil.get(httpServletRequest, "userId");
		String userPwd = HttpUtil.get(httpServletRequest, "userPwd");

		User user = userService.userSelect(userId);
		
		if(user != null){
			if(StringUtil.equals(user.getUserPwd(), userPwd)) {
				resUser.setResponse(0, "success");
				CookieUtil.addCookie(httpServletResponse, "/", -1, AUTH_COOKIE_USER, CookieUtil.stringToHex(userId));
			}
			else {
				resUser.setResponse(-1, "pwd not matched");
			}
		}
		else{
			resUser.setResponse(404, "fail");
		}
		
		if(logger.isDebugEnabled()){
			logger.debug("\n" + JsonUtil.toJsonPretty(resUser));
		}
		return resUser;
	}
	//아이디 중복체크
	@RequestMapping (value="/user/userIdCheck")
	@ResponseBody
	public Response<Object> IdDuplicateCheck (HttpServletRequest request, HttpServletResponse response){
		Response<Object> ajaxRes = new Response<Object>();
		String userId = HttpUtil.get(request, "userId","");
		if (!StringUtil.isEmpty(userId)) {
			if(userService.userSelect(userId)==null) {
				ajaxRes.setResponse(0, "success");
			}
			else {
				ajaxRes.setResponse(100, "already used Id");
			}
		}
		else {
			ajaxRes.setResponse(400, "bad Request");
		}
		return ajaxRes;
	}
	
	@RequestMapping (value="/user/userSignIn")
	public String userSingIn (HttpServletRequest request, HttpServletResponse response) {
		return "/user/userSignIn";
	}
	
	@RequestMapping (value="/user/userInsertProc")
	@ResponseBody
	public Response<Object> userInsert (HttpServletRequest request, HttpServletResponse response){
		Response<Object> ajaxRes = new Response<Object>();
		String userId = HttpUtil.get(request, "userId","");
		String userPwd = HttpUtil.get(request, "userPwd","");
		String userEmail = HttpUtil.get(request, "userEmail","");
		
		if(!StringUtil.isEmpty(userId) && !StringUtil.isEmpty(userPwd) && !StringUtil.isEmpty(userEmail)) {
			User user = new User();
			user.setUserId(userId);
			user.setUserPwd(userPwd);
			user.setUserEmail(userEmail);
			
			if(userService.nomalUserInsert(user)>0) {
				ajaxRes.setResponse(0, "success");
			}
			else {
				ajaxRes.setResponse(300, "fail");
			}
		}
		else {
			ajaxRes.setResponse(400, "bad parameter");
		}
		return ajaxRes;
	}
	
	
	@RequestMapping (value="/user/userInfo")
	public String modifiyUserInfo (Model model, HttpServletRequest request, HttpServletResponse response) {
		String cookieId = CookieUtil.getHexValue(request, AUTH_COOKIE_USER);
		if (!StringUtil.isEmpty(cookieId)) {
			User user = userService.userSelect(cookieId);
			if (user!=null) {
				model.addAttribute("user",user);
			}
			model.addAttribute("userId", cookieId);
		}
		
		
		return "/user/userInfo";
	}
}
