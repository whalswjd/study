<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>find password</title>
 <link rel="stylesheet" href="/resources/css/userSignIn.css">
 <style>
 .modal {
  display: none;
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0,0,0,0.5); /* 모달 창 배경색 및 투명도 */
}

.modal-content {
  background-color: #fefefe;
  margin: 15% auto;
  padding: 20px;
  border: 1px solid #888;
  width: 80%;
  max-width: 400px;
}

.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}
 </style>
</head>

<body>
<div id="myModal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <p>메일이 전송되었습니다!</p>
  </div>
</div>
<div class="container right-panel-active">
   <form action="#" class="form" id="signUpForm" name="signUpForm">
      <h2 class="form__title">가입하신 이메일을 작성해 주세요.</h2>
      <input type="email" id="userEmail" name="userEmail" placeholder="Email" class="input" />
      <input type="button" class="btn" id="submitBtn" value="제출">
    </form>

</div>
<script>
$(document).ready(function(){
	$("#submitBtn").on("click",function(){
		emailCheck();
	});
	$("#userEmail").on("keypress", function(e){
		if(e.which == 13){	
			emailCheck();	
		}
	});
});
function emailCheck(){
	var regCheck = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
	if($.trim($("#userEmail").val()).length<=0){
		 alert("메일 주소를 입력하세요.");
		 $("#userEmail").focus();
		 return;
	 }
	if(!regCheck.test($("#userEmail").val())){
		alert("메일 형식이 올바르지 않습니다.");
		$("#userEmail").focus();
		 return;
	}
	$.ajax({
		type:"POST",
		url:"/user/findPwdProc",
		data:
		{
			userEmail:$("#userEmail").val()
		},
		datatype:"JSON",
		befoerSend:function(xhr)
		{
			xhr.setRequestHeader("AJAX", "true");	
		},
		success:function(response){
			if(response.code==0){
				alert("메일이 발송되었습니다.");
				location.href="/userLogin";
			}
			else if(response.code==-100){
				alert("과정 중 오류 발생");
			}
			else if(response.code==300){
				alert("회원정보가 존재하지 않습니다.");
			}
			else{
				alert("오류 발생!");
			}
		},
		error:function(xhr, status, error){
			icia.common.error(error);
		}
	});
	
}
function showModal() {
	  var modal = document.getElementById("myModal");
	  modal.style.display = "block";
}
</script>
</body>
</html>