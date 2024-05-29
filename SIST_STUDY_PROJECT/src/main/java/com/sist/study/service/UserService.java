package com.sist.study.service;

import java.security.SecureRandom;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sist.study.dao.UserDao;
import com.sist.study.model.User;

@Service("UserService")
public class UserService 
{
	
	private static Logger logger = LoggerFactory.getLogger(UserService.class);
	
	@Autowired
	private UserDao userDao;
	
	@Value("#{env['smtp.host']}")
	private String SMTP_HOST;
	@Value("#{env['smtp.user']}")
	private String SMTP_USER;
	@Value("#{env['smtp.pwd']}")
	private String SMTP_PWD;
	
	public User userSelect(String userId)
	{
		User user = null;
		
		try 
		{
			user = userDao.userSelect(userId);
		} 
		catch (Exception e) 
		{
			logger.error("[UserService] userSelect Exception Error" + e);
		}
		
		return user;
	}
	
	public int nomalUserInsert (User user) {
		int cnt = 0;
		try {
			cnt = userDao.nomalUserInsert(user);
		}
		catch(Exception e) {
			logger.error("[UserService] userInsert Exception Error" + e);
		}
		return cnt;
	}
	
	//메일->객체
	public User userEmailSelect (String userEmail) {
		User user = null;
		try {
			user = userDao.userEmailSelect(userEmail);
		}
		catch(Exception e) {
			logger.error("[UserService] userSelect Exception Error", e);
		}
		return user;
	}
	
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	public int sendNewPwd (User user) {
		int cnt = 0;
		//임시 비밀번호 생성
		String tmpPwd = makeTmpPwd();
		//임시 비밀번호 업데이트
		user.setUserPwd(tmpPwd);
		cnt = userDao.userpwdUpdate(user);
		if (cnt>0) {
			//메일 보내기
			cnt = naverMailSend(user);
		}
		return cnt;
	}
	
	public String makeTmpPwd () {
		logger.debug("=========================makeTmpPwd 시작");
		char[] charSet = new char[] {
				'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '!', '@', '#', '$', '%', '^', '&',
				'A','B','C','D','E','F','G','H','I','J','K','L','M','N'	,'O','P','Q','R','S','T','U',
				'V','W','X','Y','Z'};
		StringBuffer sb = new StringBuffer();
		SecureRandom sr = new SecureRandom();
		
		int index = 0;
		int len = charSet.length;
		for(int i=0; i<10; i++) {
			index = sr.nextInt(len);
			sb.append(charSet[index]);
		}
		
		return sb.toString();
	}
	public int naverMailSend(User user) {
		logger.debug("=========================naverMailSend 시작");
		int cnt =0;
		Properties props = new Properties();
		props.setProperty("mail.debug", "true");
		props.put("mail.smtp.host", SMTP_HOST);
		props.put("mail.smtp.port", 465);
		props.put("mail.smtp.auth", "true");
		props.setProperty("mail.smtp.ssl.enable", "true");
		props.put("mail.transport.protocol", "smtps");
		props.put("mail.smtps.ssl.protocol","TLSv1.2");
		
		 Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(SMTP_USER, SMTP_PWD);
	            }
	        });
		 
		 try {
			 MimeMessage message = new MimeMessage(session);
			 message.setFrom(new InternetAddress(SMTP_USER));
			 message.addRecipient(Message.RecipientType.TO, new InternetAddress(user.getUserEmail()));
			 
			 
			 //메일 제목
			 message.setSubject("‎moskino 임시 비밀번호");
			 //메일 내용
			 message.setText("임시 비밀번호는 [" + user.getUserPwd() +"] 입니다. "
			 		+ "\n 로그인한 후 비밀번호를 변경해 주세요 ");
			 
			 //보내기
			 Transport.send(message);
			 
			 cnt = 1;
		 }
		 catch(Exception e) { 
			 
			 logger.error("[UserController] naverMailSend",e);
		 }
		
		return cnt;
	}
}