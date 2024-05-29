<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//default get,get방식으로 /index
	javax.servlet.RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index");

	requestDispatcher.forward(request, response);
%>