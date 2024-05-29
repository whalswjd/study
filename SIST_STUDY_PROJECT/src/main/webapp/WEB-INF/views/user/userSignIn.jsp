<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="/resources/css/userSignIn.css">
<meta charset="UTF-8">
<title>sign in</title>
<%@ include file="/WEB-INF/views/include/head.jsp" %>

<script type="text/javascript">
$(document).ready(function(){
	const signInBtn = document.getElementById("signIn");
	const signUpBtn = document.getElementById("signUp");
	const signUpForm = document.getElementById("signUpForm");
	const signInForm = document.getElementById("signInForm");
	const container = document.querySelector(".container");

	signInBtn.addEventListener("click", () => {
	  container.classList.remove("right-panel-active");
	});

	signUpBtn.addEventListener("click", () => {
	  container.classList.add("right-panel-active");
	});
	$("#userId").on("keypress", function(e){
			
			if(e.which == 13)
			{	
				loginCheck();
			}
			
	});
	$("#userPwd").on("keypress", function(e){
		
		if(e.which == 13)
		{	
			loginCheck();
		}
		
});
	signInForm.addEventListener("submit", (e) =>{
		 e.preventDefault();
		 loginCheck();
		
	});
	signUpForm.addEventListener("submit", (e) => {
		e.preventDefault();
	});
	
	function loginCheck(){
		 if($.trim($("#userId").val()).length<=0){
			 alert("아이디를 입력하세요.");
			 $("#userId").focus();
			 return;
		 }
		 else if($.trim($("#userPwd").val()).length<=0){
			 alert("비밀번호를 입력하세요.");
			 $("#userPwd").focus();
			 return; 
		 }
		 
		 $.ajax({
			 type:"POST",
			 url:"/user/userLoginProc",
			 data:{
				 userId:$("#userId").val(),
				 userPwd:$("#userPwd").val()
			 },
			 datatype:"JSON",
			 beforeSend:function(xhr){
				 xhr.setRequestHeader("AJAX","ture");
			 },
			 success:function(response){
				 if(response.code==0){
					 alert("로그인 성공");
					 location.href="/";
				 }
				 else{
					 alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
					 $("#userId").focus();
				 }
				 
			 },
			 error(xhr,status,error){
				 icia.common.error(error);
				 alert("서버 에러");
			 }
		 });	 
	}
}); 

		
</script>
</head>
<body>
<div class="container right-panel-active">
  <!-- Sign Up -->
  <div class="container__form container--signup">
    <form action="#" class="form" id="signUpForm" name="signUpForm">
      <h2 class="form__title">Sign Up</h2>
      <div style="display: flex; align-items: center;">
      <input type="text" placeholder="User" name="userId2" id="userId2" class="input" />
      <input type="button" name="duplBtn" id="duplBtn" value="중복체크" class="btn">
      </div>
      <div id="idCheckResult" style="display: none; text-align:left;">
      <h5 style="font-size:14px; font-color:grey;">사용 가능한 아이디입니다.</h5>
      </div>
      <input type="email" placeholder="Email" name="userEmail2" id="userEmail2" class="input" />
      <input type="password" placeholder="Password" name="userPwd2" id="userPwd2" class="input" />
      <input type="button" class="btn" value="Sign Up" id="submitBtn">
    </form>
  </div>

  <!-- Sign In -->
  <div class="container__form container--signin">
    <form class="form" id="signInForm" name="signInForm">
      <h2 class="form__title">Sign In</h2>
      <input type="text" placeholder="id" class="input" name="userId" id="userId"/>
      <input type="password" placeholder="Password" class="input" name="userPwd" id="userPwd"/>
      <a href="/user/findPwd" class="link">Forgot your password?</a>
      <button class="btn">Sign In</button>
    </form>
  </div>

  <!-- Overlay -->
  <div class="container__overlay">
    <div class="overlay">
      <div class="overlay__panel overlay--left">
        <button class="btn" id="signIn">Sign In</button>
      </div>
      <div class="overlay__panel overlay--right">
        <button class="btn" id="signUp">Sign Up</button>
      </div>
    </div>
  </div>
</div>
<script>
$(document).ready(function(){
	$("#duplBtn").on("click",function(){
		IdDupliCheck();		
	});
	$("#submitBtn").on("click",function(){
		if($("#idCheckResult").css("display") == "none"){
			IdDupliCheck();
		}
	});
	$("#userPwd2").on("keypress", function(e){
		if(e.which == 13){
			if($("#idCheckResult").css("display") == "none"){
				IdDupliCheck();
			}
			signUpProc();
		}
	});
	$("#submitBtn").on("click",function(){
		signUpProc();
	});
});
function signUpProc(){
	var regIdCheck = /^[a-z]+[a-z0-9]{3,19}$/g;
	var regEmailCheck = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
	if($.trim($("#userPwd2").val()).length<=0){
		alert("비밀번호는 필수 입력 사항입니다.");
		$("#userPwd2").focus();
		return;
	}
	if($.trim($("#userEmail2").val()).length<=0){
		alert("이메일은 필수 입력 사항입니다.");
		$("#userEmail2").focus();
		return;
	}
	if(!regIdCheck.test($("#userPwd2").val())){
		alert("비밀번호가 형식에 맞지 않습니다.");
		$("#userPwd2").val("");
		$("#userPwd2").focus();
		return;
	}
	if(!regEmailCheck.test($("#userEmail2").val())){
		alert("이메일이 형식에 맞지 않습니다.");
		$("#userEmail2").val("");
		$("#userEmail2").focus();
		return;
	}
	$.ajax({
		 type:"POST",
		 url:"/user/userInsertProc",
		 data:{
			 userId:$("#userId2").val(),
			 userPwd:$("#userPwd2").val(),
			 userEmail:$("#userEmail2").val()
			 
		 },
		 datatype:"JSON",
		 beforeSend:function(xhr){
			 xhr.setRequestHeader("AJAX","ture");
		 },
		 success:function(response){
			 if(response.code==0){
				 alert("회원가입 성공");
				 location.href ="/user/userInfo";
			 }
			 else{
				 alert("오류");
			 }
		 },
		 error(xhr,status,error){
			 icia.common.error(error);
			 alert("서버 에러");
		 }
	 });
}
function IdDupliCheck(){
	var regCheck = /^[a-z]+[a-z0-9]{3,19}$/g;
	if($.trim($("#userId2").val()).length<=0){
		alert("아이디를 입력한 후 중복 확인이 가능합니다.");
		$("#userId2").focus();
		return;
	}
	if(!regCheck.test($("#userId2").val())){
		alert("아이디는 4글자 이상 20글자 미만 영문 대소문자, 숫자만 가능합니다.");
		$("#userId2").focus();
		return;
	}
	$.ajax({
		 type:"POST",
		 url:"/user/userIdCheck",
		 data:{
			 userId:$("#userId2").val()
		 },
		 datatype:"JSON",
		 beforeSend:function(xhr){
			 xhr.setRequestHeader("AJAX","ture");
		 },
		 success:function(response){
			 if(response.code==0){
				 $("#idCheckResult").show();
			 }
			 else if (response.code==100){
				 alert("중복 아이디입니다.");
				 $("#userId2").val("");
				 $("#userId2").focus();
			 } 
			 else{
				 alert("오류");
			 }
		 },
		 error(xhr,status,error){
			 icia.common.error(error);
			 alert("서버 에러");
		 }
	 });
}
</script>
</body>
</html>