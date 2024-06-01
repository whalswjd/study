<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> <%@ include file="/WEB-INF/views/include/head.jsp" %> <html>

	<head>
		<meta charset="UTF-8">
		<title>signUp</title>
		<link rel="stylesheet" type="text/css" href="/resources/css/reset.css">
		<link rel="stylesheet" type="text/css" href="/resources/css/index.css">
		<script>
		$(document).ready(function() {
			$("#userId").focus();
			$('#userPwd').on('input', function() {
				if($('#userPwd').val() == '') {
					$('#showPw').css('visibility', 'hidden');
				} else {
					$('#showPw').css('visibility', 'visible');
				}
			});
			$('#showPw').on('click', function() {
				var pw = $("#userPwd");
				var pwType = pw.attr('type');
				if(pwType == 'password') {
					pw.attr('type', 'text');
					$('#showPw').attr('src', './resources/images/visibility_off.png');
				} else {
					pw.attr('type', 'password');
					$('#showPw').attr('src', './resources/images/visibility.png');
				}
			});
			$("#btn_signup").on("click", function() {
				if(!isEmpty($("#userId").val())) {
					alert("아이디는 필수 입력 사항입니다.");
					$("#userId").focus();
					return;
				}
				if(!isCorrect($("#userId").val())) {
					alert("아이디는 영문 대소문자, 숫자, '_'로만 작성이 가능합니다.")
					$("#userId").val("");
					$("#userId").focus();
					return;
				}
				var numCheck = /^\d+$/;
				if(numCheck.test($("#userId").val())) {
					alert("아이디는 숫자만 포함할 수는 없습니다.");
					$("#userId").val("");
					$("#userId").focus();
					return;
				}
				if(isEmail($("#userId").val())) {
					alert("아이디는 이메일의 형식을 사용할 수 없습니다.");
					$("#userId").val("");
					$("#userId").focus();
					return;
				}
				if(!isEmpty($("#userPwd").val())) {
					alert("비밀번호는 필수 입력 사항입니다.");
					$("#userPwd").focus();
					return;
				}
				if(!isCorrect($("#userPwd").val())) {
					alert("비밀번호가 형식에 맞지 않습니다.");
					$("#userPwd").focus();
					return;
				}
				if(!isEmpty($("#userName").val())) {
					alert("이름을 입력해 주세요.");
					$("#userName").focus();
					return;
				}
				if(!isEmpty($("#userEmail").val())) {
					alert("이메일을 입력해 주세요.");
					$("#userEmail").focus();
					return;
				}
				if(!isEmail($("#userEmail").val())) {
					alert("이메일이 형식에 맞지 않습니다.");
					$("#userEmail").focus();
					return;
				}
				//회원가입 (id 중복 포함)
				$.ajax({
					type: "POST",
					url: "/user/regProc",
					data: {
						userId: $("#userId").val(),
						userPwd: $("#userPwd").val(),
						userName: $("#userName").val(),
						userEmail: $("#userEmail").val()
					},
					datatype: "JSON",
					beforeSend: function(xhr) {
						xhr.setRequestHeader("AJAX", "TRUE");
					},
					success: function(response) {
						if(response.code == 0) {
							alert("가입 완료");
							location.href = "/index";
						} else if(response.code == 100) {
							alert("네트워크 오류로 가입에 실패하였습니다.");
							$("#userId").focus();
						} else if(response.code == 300) {
							alert("이미 존재하는 아이디입니다.");
							$("#userId").val("");
							$("#userId").focus();
						} else {
							alert("파라미터 오류 발생");
							$("#userId").focus();
						}
					},
					error: function(xhr, status, error) {
						icia.common.error(error);
						alert("서버 에러");
					}
				}); //$.ajax({
			});
		});

		function isEmpty(str) {
			return str.trim().length > 0;
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
	</head>

	<body>
		<div class="main">
			<div class="container">
				<div class="logo">
					<img src="/resources/images/Sistagram.png" alt="Instagram" class="brand_logo">
				</div>
				<div class="centent">
					<form name="signup_form" id="signup_form" action="" method="POST">
						<div class="content_text">
							<span style="font-weight: bold;">친구들의 사진과 동영상을 보려면 <br /> 가입하세요</span>
						</div>
						<div class="input_value">
							<input type="text" id="userId" name="userId" placeholder="아이디">
						</div>
						<div class="input_value">
							<input type="password" id="userPwd" name="userPwd" placeholder="비밀번호를 입력하세요">
							<img class="showPw" id="showPw" name="showPw" src="/resources/images/visibility.png" style="visibility: hidden;">
						</div>
						<div class="input_value">
							<input type="text" id="userName" name="userName" placeholder="이름">
						</div>
						<div class="input_value">
							<input type="text" id="userEmail" name="userEmail" placeholder="이메일">
						</div>
						<div class="btn_submit">
							<button type="button" id="btn_signup">가입</button>
						</div>
					</form>
					<form name="hiddenForm" id="hiddenForm" method="post">
						<input type="hidden" id="userId1" name="userId1" value="" />
						<input type="hidden" id="userPwd1" name="userPwd1" value="" />
						<input type="hidden" id="userName1" name="userName1" value="" />
						<input type="hidden" id="userEmail1" name="userEamil1" value="" />
					</form>
				</div>
			</div>
			<div class="container">
				<span>
					<p style="margin: 15px;">계정이 있으신가요? <a href="/index"><span style="color: #4cb5f9;">로그인</span></a></p>
				</span>
			</div>
		</div>
	</body>

</html>