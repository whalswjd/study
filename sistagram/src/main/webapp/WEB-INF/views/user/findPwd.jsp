<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <%@ include file="/WEB-INF/views/include/head.jsp" %>
<!DOCTYPE html>
<html lang="ko">

	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="/resources/css/reset.css">
		<link rel="stylesheet" type="text/css" href="/resources/css/index.css">
		<title>findPwd</title>
	</head>

	<body>
		<div class="main">
			<div class="container">
				<div class="logo">
					<img src="/resources/images/Sistagram.png" alt="Instagram" class="brand_logo">
				</div>
				<div class="centent">
					<form name="findpw_form" action="" method="POST">
						<div class="content_text">
							<span style="font-weight: bold;">로그인에 문제가 있나요?</span>
						</div>
						<div class="content_text">
							<span style="font-size: 13px;">이메일 주소, 전화번호 또는 아이디를 입력하시면 계정에 다시 액세스할 수 있는 링크를 보내드립니다</span>
						</div>
						<div class="input_value">
							<input type="text" id="userEmail" name="userEmail" placeholder="이메일, 전화번호, 아이디">
						</div>
						<div class="btn_submit">
							<button id="btnResetPwd">비밀번호 재설정</button>
						</div>
					</form>
					<div class="or_line">
						<div class="line"></div>
						<div class="text">또는</div>
						<div class="line"></div>
					</div>
					<ul class="find_pw">
						<li><a href="/user/signUp">새 계정 만들기</a></li>
					</ul>
				</div>
			</div>
			<div class="container">
				<span><a href="/index">로그인으로 돌아가기</a></span>
			</div>
		</div>
		</div>
		</div>
		<script>
		$(document).ready(function() {
			var gubun = 0;
			$("#btnResetPwd").on("click", function() {
				$("#btn_submit").on("disable", true);
				if(isEmail($("#userEmail").val())) {
					gubun = 2;
				} else if(isTel($("#userEmail").val())) {
					gubun = 3;
				} else {
					gubun = 1;
				}
				//alert("ajax시작");
				$.ajax({
					type: "POST",
					url: "/user/verification",
					data: {
						userEmail: $("#userEmail").val(),
						gubun: gubun
					},
					datatype: "JSON",
					beforeSend: function(xhr) {
						xhr.setRequestHeader("AJAX", "true");
					},
					success: function(response) {
						if(response.code == 0) {
							location.href = "/";
						} else if(response.code == 300) {
							alert("회원정보가 존재하지 않습니다.");
							$("#userEmail").val("");
							$("#userEmail").focus();
							$("#btn_submit").on("disable", false);
						} else {
							alert("오류가 발생하였습니다.")
							$("#btn_submit").on("disable", false);
						}
					},
					error: function(xhr, status, error) {
						alert("오류 발생");
						icia.common.error(error);
						$("#btn_submit").on("disable", false);
					}
				}); //ajax
			}); //btn
		}); //document
		function isTel(str) {
			var Corretreg = /^[0-9]*$/;
			return Corretreg.test(str);
		}

		function isCorrect(str) {
			var Corretreg = /^[a-zA-Z0-9_]{3,20}$/;
			return Corretreg.test(str);
		}

		function isEmail(str) {
			var Emailreg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
			return Emailreg.test(str);
		}
		</script>
	</body>

</html>