<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<link rel="stylesheet" href="/resources/css/progress-bar.css" type="text/css">
<script type="text/javascript">
$(document).ready(function() {
	$("#btnClose").on("click",function(){
		opener.movePage();
		window.close();
	});
}
</script>
</head>
<body>
<div class="container">
<c:choose>
	<c:when test="${!empty approve}">
	<h2>결제가 정상적으로 완료되었습니다.</h2>
	결제 일시: ${approve.approved_at}
	<br/>
	주문 번호: ${approve.partner_order_id}
	<br/>
	상품명: ${approve.item_name}
	<br/>
	상품 수량: ${approve.quantity}
	<br/>
	결제 금액: ${approve.amount.total}
	<br/>
	결제 방법: ${approve.payment_method_type}<br/>
	</c:when>
	<c:otherwise>
	<h2>카카오페이 결제 중 오류가 발생하였습니다.</h2>
	</c:otherwise>
</c:choose>
</div>
<button id="btnClose" name="btnClose" type="button">닫기</button>
</body>
</html>