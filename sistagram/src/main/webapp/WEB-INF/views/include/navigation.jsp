<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ include file="/WEB-INF/views/include/taglib.jsp" %> <style>
.nav_button
{
	width: 100%;
	height: 50px;
	background-color: #ffffff;
	color: #000000;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font: inherit;
	font-size: 14px;
	cursor: pointer;
	border: none;
	border-radius: 5px;
	transition: background-color 0.3s ease;
	display: flex;
	flex-direction: column;
	justify-content: center;
	position: relative;
}

.nav_button:hover
{
	background-color: #dddddd;
	color: #000000;
}

.ectMenue
{
	display: none;
	bottom: 10vh;
	left: 10px;
	width: 180px;
	background-color: #ffffff;
	border: 1px solid #dddddd;
	border-radius: 5px;
	padding: 10px;
	position: absolute;
	z-index: 1;
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
	font-size: 5px;
	color: #d1d1d1;
}

.ectMenue a
{
	display: block;
	padding: 10px;
	text-decoration: none;
	color: #333;
}

.modal
{
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	justify-content: center;
	align-items: center;
	z-index: 1;
}

.modal-content
{
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	position: fixed;
	top: 50%;
	left: 50%;
	width: 60%;
	height: relative;
	transform: translate(-50%, -50%);
	background-color: white;
	padding: 20px;
	z-index: 2;
	overflow-y: scroll;
	max-height: 80vh;
}

.custom-file-input-wrapper
{
	position: relative;
	overflow: hidden;
	display: inline-block;
}

.custom-file-input
{
	position: absolute;
	top: 0;
	right: 0;
	margin: 0;
	padding: 0;
	font-size: 20px;
	cursor: pointer;
	opacity: 0;
}

.custom-file-button
{
	padding: 10px 20px;
	display: inline-block;
	cursor: pointer;
	border-radius: 10px;
	background-color: #5299f7;
	color: #fff;
}

.custom-file-button:hover
{
	background-color: #b7d3f7;
}

.containerPost
{
	max-width: 600px;
	margin: 50px auto;
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	overflow: hidden;
}

.post-header
{
	display: flex;
	align-items: center;
	padding: 15px;
	border-bottom: 1px solid #ddd;
}

.user-avatar
{
	width: 40px;
	height: 40px;
	border-radius: 50%;
	margin-right: 10px;
}

.post-input
{
	width: 100%;
	border: none;
	padding: 15px;
	font-size: 13px;
	outline: none;
}

.post-actions
{
	display: flex;
	justify-content: space-between;
	padding: 15px;
}

.post-actions button
{
	background-color: #3897f0;
	color: #fff;
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	cursor: pointer;
	font-weight: bold;
}

.hibutton
{
	background-color: #5299f7;
	color: #fff;
	padding: 10px 15px;
	border: none;
	border-radius: 10px;
	cursor: pointer;
	font-weight: bold;
	position: absolute;
	width: 28%;
}

.hibutton:hover
{
	background-color: #b7d3f7;
}

.modal-mail
{
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	justify-content: center;
	align-items: center;
	z-index: 1;
}

.modal-mail-content
{
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	position: fixed;
	top: 50%;
	left: 50%;
	width: 40%;
	height: 33%;
	transform: translate(-50%, -50%);
	background-color: white;
	padding: 20px;
	z-index: 2;
	overflow-y: scroll;
	max-height: 80vh;
}

.submit-btn
{
	background-color: #c7c7c7;
	border: none;
	color: #fff;
	padding: 10px 20px;
	border-radius: 5px;
	cursor: pointer;
	font-size: 16px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	transition-duration: 0.4s;
}

.submit-btn:hover
{
	background-color: #999999;
}
</style>
<nav>
	<div style="width: 15%; height: 100vh; padding: 8px 12px 20px; display: flex; flex-direction: column; position: fixed; border-right: 1px solid #dbdbdb;">
		<div style="width: 100%; height: 90px;">
			<div class="logo" style="padding: 25px 10px 0px; margin-bottom: 20px;">
				<a href="/board/mainBoard"><img style="max-width: 85%;" src="/resources/images/Sistagram.png" alt="Instagram" class="brand_logo" style="width: 10rem;"></a>
			</div>
		</div>
		<div style="width: 100%; flex-grow: 1;">
			<div>
				<button class="nav_button" onclick="window.location.href='/board/mainBoard'">
					<span>
						<div style="width: 100%; padding: 10px; display: inline-flex; align-items: center; vertical-align: middle; ">
							<div style="vertical-align: middle; margin-bottom: -5px;">
								<img src="/resources/images/home.png" alt="home">
							</div>
							<div style="width: 90%; height: 24px; display: flex; align-items: center; padding-left: 10px;"> 홈 </div>
						</div>
					</span>
				</button>
			</div>
			<div>
				<button class="nav_button" onclick="window.location.href='/board/search'">
					<span>
						<a>
							<div style="width: 100%; padding: 10px; margin-bottom: 5px; display: inline-flex; align-items: center;">
								<div style="vertical-align: middle; margin-bottom: -5px;">
									<img src="/resources/images/search.png" alt="search">
								</div>
								<div style="width: 100%; height: 24px; display: flex; align-items: center; padding-left: 10px;">
									<span>검색</span>
								</div>
							</div>
						</a>
					</span>
				</button>
			</div>
			<div>
				<button class="nav_button" onclick="window.location.href='/board/mainBoard'">
					<span>
						<a>
							<div style="width: 100%; padding: 10px; margin-bottom: 5px; display: inline-flex; align-items: center;">
								<div style="vertical-align: middle; margin-bottom: -5px;">
									<img src="/resources/images/msg.png" alt="msg">
								</div>
								<div style="width: 100%; height: 24px; display: flex; align-items: center; padding-left: 10px;">
									<span>메세지</span>
								</div>
							</div>
						</a>
					</span>
				</button>
			</div>
			<div>
				<button class="nav_button" id="alarmBtn" onclick="window.location.href='/board/mainBoard'">
					<span>
						<a>
							<div style="width: 100%; padding: 10px; margin-bottom: 5px; display: inline-flex; align-items: center;">
								<div style="vertical-align: middle; margin-bottom: -5px; margin-left:-6px;">
									<img src="/resources/images/heart.png" alt="heart" style="width:70%;">
								</div>
								<div style="width: 100%; height: 24px; display: flex; align-items: center; padding-left: 10px;">
									<span>알림</span>
								</div>
							</div>
						</a>
					</span>
				</button>
			</div>
			<div>
				<button class="nav_button" id="writeBtn" onclick="openModal()">
					<span>
						<a>
							<div style="width: 100%; padding: 10px; margin-bottom: 5px; display: inline-flex; align-items: center;">
								<div style="vertical-align: middle; margin-bottom: -5px;">
									<img src="/resources/images/add.png" alt="add">
								</div>
								<div style="width: 100%; height: 24px; display: flex; align-items: center; padding-left: 10px;">
									<span>만들기</span>
								</div>
							</div>
						</a>
					</span>
				</button>
			</div>
			<div>
				<button class="nav_button" onclick="window.location.href='/user/profile'">
					<span>
						<a>
							<div style="width: 100%; padding: 10px; margin-bottom: 5px; display: inline-flex; align-items: center;">
								<div style="vertical-align: middle; margin-bottom: -5px;">
									<img src="/resources/images/account.png" alt="account">
								</div>
								<div style="width: 100%; height: 24px; display: flex; align-items: center; padding-left: 10px;">
									<span>프로필</span>
								</div>
							</div>
						</a>
					</span>
				</button>
			</div>
		</div>
		<div>
			<button class="nav_button" id="ectBtn">
				<span>
					<a>
						<div style="width: 100%; padding: 10px; margin-bottom: 5px; display: inline-flex; align-items: center;">
							<div style="vertical-align: middle; margin-bottom: -5px;">
								<img src="/resources/images/menu.png" alt="home">
							</div>
							<div style="width: 100%; height: 24px; display: flex; align-items: center; padding-left: 10px;">
								<span>더보기</span>
							</div>
						</div>
					</a>
				</span>
			</button>
		</div>
	</div>
	<div id="modalMakeing" class="modal">
		<div class="modal-content">
			<!-- 모달 내용 -->
			<div class="post-actions" style="text-align: right;">
				<img id="closeImgBtn" src="/resources/images/cross.png" alt="Image Button" onclick="closeModal()" style="width:20x; height:20px;">
			</div>
			<div class="containerPost">
				<div class="post-header">
					<hr />
				</div>
				<div id="imagePreview" style="text-align: center;"> </div>
				<form id="boardUpload" name="boardUpload">
					<textarea class="post-input" name="boardContent" id="boardContent" placeholder="내용을 작성해 주세요."></textarea>
			</div>
			<input type="button" onclick="document.getElementById('fileInput').click()" id="uploadPhotoBtn" value="사진 업로드" class="hibutton">
			<input type="file" id="fileInput" name="BoardFile" onchange="previewImage(event)" style="display: none;">
			<input type="button" onclick="fileUpload()" id="submitBtn" value="제출" class="hibutton" style="right:14px;">
			</form>
			<!-- 모달 내용 끝 -->
			<br /><br /><br />
		</div>
	</div>
	<div id="probModal" class="modal-mail" style="display: none;">
		<div class="modal-mail-content">
			<img src="/resources/images/cross.png" alt="닫기" id="datgiBtn" style="width:18px;">
			<section>
				<div style="text-align:center;">
					<p>어떤 문제가 있으신가요?</p>
					<br />
					<p style="font-size:10px; font-color:lightgrey;">남겨주신 문의는 관리자에게 전달됩니다!</p>
				</div>
			</section>
			<section>
				<input type="text" id="mailContent" name="mailContent" value="" placeholder="불편사항을 알려주세요 ㅠㅠ">
				<input type="button" id="mailSendBtn" value="제출" class="submit-btn">
			</section>
		</div>
	</div>
	<div id="ectMenue" class="ectMenue" style="display: none;">
		<button class="nav_button" id="resetUserInfoBtn">프로필 수정</button>
		<button class="nav_button" id="probReportBtn" name="probReportBtn">문제 신고</button>
		<button class="nav_button" id="logOutBtn">로그아웃</button>
	</div>
	<script type="text/javascript">
	$(document).ready(function()
	{
		//메일 신고하기
		$("#probReportBtn").on("click", function()
		{
			closeModal(); //더보기 모달창 닫고.
			document.getElementById('probModal').style.display = 'flex';
		});
		$("#datgiBtn").on("click", function()
		{
			document.getElementById('probModal').style.display = 'none';
		});
		$("#mailSendBtn").on("click", function()
		{
			$.ajax(
			{
				type: "POST",
				url: "/user/reportError",
				data:
				{
					mailContent: $("#mailContent").val()
				},
				beforeSend: function(xhr)
				{
					xhr.setRequestHeader("AJAX", "TRUE");
				},
				success: function(response)
				{
					if(response.code == 0)
					{
						alert("전송되었습니다!");
						document.getElementById('probModal').style.display = 'none';
					}
					else if(response.code == 400)
					{
						alert("파라미터 오류");
					}
					else
					{
						alert("실패");
					}
				},
				error: function(xhr, status, error)
				{
					icia.common.error(error);
					alert("서버 에러");
				}
			});
		});
		//더보기 보여주기
		$("#ectBtn").on("click", function()
		{
			var ectMenue = document.getElementById('ectMenue');
			ectMenue.style.display = (ectMenue.style.display === 'block') ? 'none' : 'block';
		});
	});
	$(document).ready(function()
	{
		$("#resetUserInfoBtn").on("click", function()
		{
			window.location.href = "/user/update";
		});
		$("#logOutBtn").on("click", function()
		{
			if(confirm("로그아웃할까요?"))
			{
				window.location.href = "/user/logOut";
			}
		});
	});

	function previewImage(event)
	{
		var selectedFile = event.target.files[0];
		if(selectedFile)
		{
			var reader = new FileReader();
			reader.onload = function(e)
			{
				var imagePreview = document.getElementById('imagePreview');
				imagePreview.innerHTML = '<img src="' + e.target.result + '" alt="미리보기" style="max-width: 88%; height: 30%;">';
			};
			reader.readAsDataURL(selectedFile);
		}
	}

	function fileUpload()
	{
		if($("#fileInput")[0].files.length < 0)
		{
			alert("업로드할 사진을 선택해 주세요!");
			return;
		}
		var data = $("#boardUpload")[0];
		var formData = new FormData(data);
		$("#submitBtn").prop("disabled", true);
		$.ajax(
		{
			type: "POST",
			url: "/board/upload",
			data: formData,
			processData: false,
			contentType: false,
			cache: false,
			timeout: 600000,
			beforeSend: function(xhr)
			{
				xhr.setRequestHeader("AJAX", "TRUE");
			},
			success: function(response)
			{
				if(response.code == 0)
				{
					alert("등록완료");
					closeModal();
					location.reload();
				}
				else if(response.code == 400)
				{
					alert("파라미터 오류");
				}
				else
				{
					alert("서버 오류로 업로드에 실패했습니다.");
				}
			},
			error: function(xhr, status, error)
			{
				icia.common.error(error);
				alert("서버 에러");
			}
		});
	}

	function openModal()
	{
		// 모달 창 열기
		document.getElementById('modalMakeing').style.display = 'flex';
	}

	function closeModal()
	{
		// 모달 창 닫기
		document.getElementById('modalMakeing').style.display = 'none';
	}
	</script>
</nav>