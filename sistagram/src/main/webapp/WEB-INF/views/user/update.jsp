<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>update your profile</title>
	<link rel="stylesheet" href="/resources/css/reset.css">
	<script src="/resources/js/jquery-3.5.1.min.js"></script> <%@ include file="/WEB-INF/views/include/head2.jsp" %>
	<link rel="stylesheet" type="text/css" href="/resources/css/update.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/modal.css">
	<script>
	$(document).ready(function() {
		window.onclick = function(event) {
			var modal = document.getElementById('viewModal');
			if(event.target === modal) {
				modal.style.display = 'none';
			}
		};
		$("#saveBtn").on("click", function() {
			if(!isEmpty($("#userPwd").val())) {
				alert("비밀번호를 입력해 주세요.");
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
			if(!isEmail($("#userEmail").val())) {
				alert("이메일이 형식에 맞지 않습니다.");
				$("#userEmail").focus();
				return;
			}
			if(!confirm("이대로 회원님의 정보를 수정할까요?")) {
				return;
			}
			var data = $("#profileForm")[0];
			var formData = new FormData(data);
			$("#saveBtn").prop("disabled", true);
			$.ajax({
				type: "POST",
				url: "/user/updateProc",
				data: formData,
				processData: false,
				contentType: false,
				cache: false,
				timeout: 600000,
				beforeSend: function(xhr) {
					xhr.setRequestHeader("AJAX", "TRUE");
				},
				success: function(response) {
					if(response.code == 0) {
						alert("회원정보가 수정되었습니다.");
						//location.href="/index";
						$("#saveBtn").prop("disabled", false);
						location.reload();
					} else if(response.code == 300) {
						alert("자신의 정보만 수정이 가능합니다.");
						$("#saveBtn").prop("disabled", false);
					} else if(response.code == 400) {
						alert("파라미터 오류");
						$("#saveBtn").prop("disabled", false);
					} else {
						alert("네트워크 오류");
						$("#userId").focus();
					}
				},
				error: function(xhr, status, error) {
					icia.common.error(error);
					alert("서버 에러");
				}
			});
		});

		function deleteFile() {
			if(confrim("사진을 삭제할까요?")) {
				location.href = "/user/deletPhoto";
			}
		};
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
		<div>
			<div>
				<div> <%@ include file="/WEB-INF/views/include/navigation.jsp"%> <div class="main">
						<div class="container">
							<div>
								<div>
									<section>
										<section class="section-mini" style="display: flex; align-items: center;">
											<div id="imagePreview"> </div>
											<img src="${userPhoto}" alt="profile.jpg" class="profile-image" onerror="this.src='/resources/images/pf3.jpg';" id="orgProfile" />
											<div>
												<b style="font-weight: bold; font-size: 25px; margin-left: 30px;">${user.userId}</b>
												<br />
												<h5 style="margin-left: 35px; margin-top:10px;">${user.userName}</h5>
											</div>
											<button style="right: 45px;" id="openModalBtn" class="button-nomal">사진 변경</button>
										</section>
										<div id="modal-background">
											<div id="myModal" class="modal">
												<div class="modal-content"> &nbsp; &nbsp;<p style="text-align:center; margin-bottom:30px;">프로필 사진 바꾸기</p>
													<label for="userPhoto" class="custom-file-input">사진 변경 <form id="profileForm" enctype="multipart/form-data">
															<input type="file" id="userPhoto" name="userPhoto" class="custom-file-input" onchange="previewImage(event)"></label>
													<hr />
													<button class="button-modal" style=" text-align: center;" onclick="deleteFile()">사진 삭제</button>
													<hr />
													<button class="button-modal-exit" onclick="closeModal()">취소</button>
												</div>
											</div>
										</div>
										<script>
										function openModal() {
											document.getElementById('myModal').style.display = 'flex';
										}

										function closeModal() {
											document.getElementById('myModal').style.display = 'none';
											$("#saveBtn").prop("disabled", false);
										}
										$("#openModalBtn").click(function(event) {
											event.preventDefault();
											$("#myModal").show();
											$("#saveBtn").prop("disabled", true);
										});
										$("#closeModalBtn").click(function() {
											$("#myModal").hide();
											$("#saveBtn").prop("disabled", false);
										});

										function setPreview(event) {
											const fileInput = event.target;
											const selectedFile = fileInput.files;
										}

										function previewImage(event) {
											closeModal();
											var selectedFile = event.target.files[0];
											if(selectedFile) {
												var reader = new FileReader();
												reader.onload = function(e) {
													var imagePreview = document.getElementById('imagePreview');
													imagePreview.innerHTML = '<img src="' + e.target.result + '" alt="미리보기" style="max-width: 88%; height: 30%;">';
												};
												reader.readAsDataURL(selectedFile);
											}
										}
										</script>
										<label for="userName">사용자 이름:</label>
										<input type="text" id="userName" name="userName" value="${user.userName}" required>
										<label for="userPwd">비밀번호:</label>
										<input type="text" id="userPwd" name="userPwd" value="${user.userPwd}" required>
										<label for="userEmail">이메일:</label>
										<input type="email" id="userEmail" name="userEmail" value="${user.userEmail}" required>
										<label for="tel">번호:</label>
										<input type="text" id="tel" name="userTel" value="${user.userTel}" required>
										<label for="userIntro">소개:</label>
										<div class="input-container">
											<input type="text" name="userIntro" id="userIntro" value="${user.userIntro}" style="height: 60px; width=100%" required>
											<div id="charCount"><b id=nowCnt></b>/150</div>
										</div>
										<script type="text/javascript">
										$('#userIntro').keyup(function(e) {
											var content = $(this).val();
											$('#nowCnt').text(content.length);
										});
										</script>
										<input type="hidden" id="userId" name="userId" value="${user.userId}" />
										<p><button type="button" id="saveBtn" name="saveBtn" style="width: 38%; right: 30px;" class="button-nomal">제출</button></p>
										</form>
										<br /><br />
									</section>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>

</html>