<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="expires" content="-1" />
<!-- ################################################################### -->
<!--  
	 Spring Security AJAX 사용시 CSRF 헤더 전송을 위한 값 저장
-->
<!-- ################################################################### -->
<meta name="_csrf" content="<c:if test="${!empty _csrf && !empty _csrf.token}">${_csrf.token}</c:if>"/>
<meta name="_csrf_header" content="<c:if test="${!empty _csrf && !empty _csrf.headerName}">${_csrf.headerName}</c:if>"/>
<!-- ################################################################### -->
<title>관리자</title>
<link rel="shortcut icon" href="/resources/images/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="/resources/css/styles.css">
<link type="text/css" href="/resources/css/jquery.colorbox.css" rel="stylesheet" />
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script type="text/javascript" src="/resources/js/jquery.colorbox.js"></script>
<script type="text/javascript" src="/resources/js/icia.common.js"></script>
<script type="text/javascript" src="/resources/js/icia.ajax.js"></script>
<script type="text/javascript">
$(document).ready(function()
{
	
});
</script>