<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <%@ include file="/WEB-INF/views/include/head2.jsp" %> <%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<link rel="stylesheet" href="/resources/css/reset.css">
		<meta charset="UTF-8">
		<style>
		body
		{
			font-family: Arial, sans-serif;
		}

		/* 전체 컨테이너 스타일 */
		.container
		{
			display: flex;
			justify-content: space-between;
			align-items: flex-start;
			padding: 2px;
		}

		/* 이미지 스타일 */
		.main-image
		{
			width: 100%;
			height: auto;
			/* 가로 비율 유지 */
			border-radius: 10px;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
			/* 그림자 효과 */
		}

		section
		{
			margin: 5px auto;
			position: relative;
		}

		.profile-image
		{
			width: 60px;
			height: 60px;
			object-fit: cover;
			border-radius: 50%;
			margin-right: 20px;
		}

		.profile-image-comment
		{
			width: 30px;
			height: 30px;
			object-fit: cover;
			border-radius: 50%;
			margin-right: 11px;
		}

		hr
		{
			border-color: lightgray;
		}

		.making-comment-box
		{
			position: fixed;
			/* 화면에 고정되도록 설정합니다. */
			bottom: 0;
			/* 화면의 가장 하단에 위치하도록 설정합니다. */
			right: 0;
			/* 화면의 왼쪽에 위치하도록 설정합니다. */
			width: 38%;
			/* 전체 화면 너비를 채우도록 설정합니다. */
			padding: 10px;
			/* 내용과 가장자리 간의 여백을 설정합니다. */
			box-sizing: border-box;
			/* 패딩과 테두리를 포함하여 요소의 전체 너비를 설정합니다. */
			margin-top: 50px;
		}

		.comment-form input[type="text"]
		{
			width: calc(100% - 70px);
			/* 버튼을 제외한 남은 영역에 너비 지정 */
			padding: 5px;
			border-radius: 5px;
			/* 모서리 둥글게 */
			border: 1px solid #ccc;
			/* 테두리 */
			margin-right: 10px;
			/* 입력 필드와 버튼 사이 간격 */
		}

		.comment-form-button
		{
			padding: 5px 10px;
			background-color: #3897f0;
			/* 인스타그램 블루 */
			color: #ffffff;
			/* 흰색 텍스트 */
			border: none;
			border-radius: 5px;
			/* 모서리 둥글게 */
			cursor: pointer;
			left-margin: -5px;
		}

		.comment-form-button:hover
		{
			background-color: #19489e;
			/* 인스타그램 블루 */
		}

		.heart-image
		{
			margin-top: 40px;
			margin-left: 2px;
			width: 23px;
			transition: transform 0.2s ease;
		}

		.likementtion
		{
			font-size: 10px;
			font-color: grey;
		}

		.delBtn
		{
			cursor: pointer;
		}
		</style>
	</head>

	<body>
		<div class="container">
			<section style=" width: 60%; padding: 5px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);">
				<img class="main-image" src="/resources/upload2/${imgsrc}" alt="상세 이미지">
			</section>
			<section style="width:35%">
				<!-- 왼쪽 정보 영역 -->
				<section style="border-color: #ededed;">
					<div style="display: flex; margin-bottom: 0;  align-items: center;">
						<c:choose>
							<c:when test="${! empty profileImg}">
								<img src="/resources/upload/${profileImg}" class="profile-image">
							</c:when>
							<c:otherwise>
								<img src="/resources/images/default_profile.png" class="profile-image">
							</c:otherwise>
						</c:choose>
						<h1 style="margin-left:-10px;">${boardUserId}</h1>
						<h2 style="margin-left:20px;">${boardContent}</h2> <br />
						<c:if test="${cookieId == boardUserId}">
							<div style="display: flex; justify-content: flex-end; flex-grow: 1;">
								<img src="/resources/images/cross.png" style="width:20px; margin-right:10px;" id="delBtn" class="delBtn">
							</div>
						</c:if>
					</div>
					<p style="color: gray; font-size: 10px; margin-left:60px;">&nbsp;&nbsp;&nbsp; ${boardRegDate}</p>
				</section>
				<hr />
				<c:if test="${not empty list and not empty list[0].commentUserId}">
					<c:forEach var="list" items="${list}" varStatus="i">
						<br />
						<c:if test="${not empty list.commentUserFileName}">
							<div style="display: flex; align-items: center;">
								<c:if test="${list.commentParent eq 1}">
									<div style="margin-left:10px;">&nbsp;&nbsp;&nbsp;&nbsp;</div>
								</c:if>
								<img src="/resources/upload/${list.commentUserFileName}" class="profile-image-comment">
								<h3 onclick="moveSomeOneProfile('${list.commentUserId}')" style="cursor: pointer;">${list.commentUserId}</h3> &nbsp; &nbsp; ${list.commentContent}
							</div>
							<div style="display: flex; align-items: center;">
								<c:if test="${list.commentParent eq 1}">
									<div style="margin-left:10px;">&nbsp;&nbsp;&nbsp;&nbsp;</div>
								</c:if>
								<p style="color: gray; font-size: 10px;">${list.commentRegDate} &nbsp; 좋아요 1 &nbsp; <c:if test="${list.commentParent eq 0}">
										<b onclick="replyOn('${list.commentUserId}','${list.commentNum}')">답글달기</b></p>
						</c:if>
		</div>
		</c:if>
		<c:if test="${empty list.commentUserFileName}">
			<div style="display: flex; align-items: center;">
				<c:if test="${list.commentParent eq 1}">
					<div style="margin-left:10px;">&nbsp;&nbsp;&nbsp;&nbsp;</div>
				</c:if>
				<img src="/resources/images/default_profile.png" class="profile-image-comment">
				<h3 onclick="moveSomeOneProfile('${list.commentUserId}')" style="cursor: pointer;">${list.commentUserId}</h3> &nbsp; &nbsp; ${list.commentContent}
			</div>
			<div style="display: flex; align-items: center;">
				<c:if test="${list.commentParent eq 1}">
					<div style="margin-left:10px;">&nbsp;&nbsp;&nbsp;&nbsp;</div>
				</c:if>
				<p style="color: gray; font-size: 10px;">${list.commentRegDate} &nbsp; 좋아요 1 &nbsp; <c:if test="${list.commentParent eq 0}">
						<b onclick="replyOn('${list.commentUserId}', '${list.commentNum}')">답글달기</b></p>
		</c:if>
		</div>
		</c:if>
		</c:forEach>
		</c:if>
		</div>
		</section>
		<br /><br /><br />
		<div class="making-comment-box">
			<div id="likeContainer">
				<img src="/resources/images/greyHeart.png" alt="하트" class="heart-image" id="likeImg" />
			</div>
			<c:if test="${likeCnt gt 0}">
				<h5 class="likementtion"><b>${likeCnt}</b>명의 사람이 이 게시글을 좋아합니다.</h5>
			</c:if>
			<input type="hidden" name="disLike" id="disLike" value=0 />
			<br />
			<form class="comment-form" name="commentForm" id="commentForm">
				<input type="text" name="commentContent" id="commentContent" placeholder="댓글 달기..." value="" />
				<input type="hidden" name="commentGroup" id="commentGroup" value="" />
				<input type="hidden" name="boardNum" id="boardNum" value="${boardNum}" />
				<input type="hidden" name="commentParent" id="commentParent" value="0" />
				<input type="button" value="게시" id="submitBtn" class="comment-form-button">
			</form>
		</div>
		<form name="delForm" id="delForm">
			<input type="hidden" name="boardNum" id="boardNum" value="${boardNum}" />
			<input type="hidden" name="userId" id="userId" value="${boardUserId}" />
			<input type="hidden" name="fileName" id="fileName" value="${fileName}" />
			<input type="hidden" name="fileExt" id="fileExt" value="${fileExt}" />
		</form>
		<script>
		var isLike = $
		{
			isLike
		};
		if(isLike != 0)
		{
			document.getElementById("likeImg").src = "/resources/images/filledHeart.png";
		}
		//아이디 누르면 프로필페이지로 이동 
		function moveSomeOneProfile(targetUserId)
		{
			window.parent.location.href = "/user/profile?userId=" + targetUserId;
			window.close();
		}
		//답글
		function replyOn(targetUserId, commentNum)
		{
			$("#commentGroup").val(commentNum);
			$("#commentParent").val(1);
			$("#commentContent").val("@" + targetUserId);
		}
		//답글 취소
		function clearReplyContent()
		{
			$("#commentContent").val("");
			$("#commentParent").val(0);
		}
		$(document).ready(function()
		{
			//댓글창에 아무것도 없으면 답글 취소
			$("#commentContent").on("keyup", function()
			{
				if($(this).val() === "")
				{
					clearReplyContent();
				}
			});
			$("#likeImg").on("click", function()
			{
				var nowLike = document.getElementById("likeImg");
				var currentSrc = nowLike.getAttribute("src");
				if(currentSrc.endsWith("greyHeart.png"))
				{
					nowLike.src = "/resources/images/filledHeart.png";
					$("#disLike").val(0);
				}
				else
				{
					nowLike.src = "/resources/images/greyHeart.png";
					$("#disLike").val(1);
				}
				$.ajax(
				{
					type: "POST",
					data:
					{
						boardNum: $
						{
							boardNum
						},
						disLike: $("#disLike").val()
					},
					datatype: "JSON",
					url: "/board/likeUpdate",
					beforeSend: function(xhr)
					{
						xhr.setRequestHeader("AJAX", "true");
					},
					success: function(response)
					{
						if(response.code == 0)
						{
							alert("좋아요 반영 완료");
							window.location.reload();
						}
						else
						{
							alert("오류 발생");
							nowLike.src = "/resources/images/greyHeart.png";
						}
					},
					error: function(xhr, status, error)
					{
						icia.common.error(error);
					}
				});
			});
			//보드 삭제!
			$("#delBtn").on("click", function()
			{
				if(!confirm("이 게시물을 삭제할까요?"))
				{
					return;
				}
				var data = $("#delForm")[0];
				var formData = new FormData(data);
				$.ajax(
				{
					type: "POST",
					url: "/board/delBoard",
					data: formData,
					processData: false,
					contentType: false,
					cache: false,
					timeout: 600000,
					beforeSend: function(xhr)
					{
						xhr.setRequestHeader("AJAX", "true");
					},
					success: function(response)
					{
						if(response.code == 0)
						{
							alert("삭제 성공");
							window.close();
							window.opener.location.reload();
						}
						else
						{
							alert(response.code);
							alert("오류 발생");
						}
					},
					error: function(xhr, status, error)
					{
						icia.common.error(error);
					}
				});
			});
			$("#submitBtn").on("click", function()
			{
				if($.trim($("#commentContent").val()).length <= 0)
				{
					alert("댓글 내용을 입력하세요!");
					$("#commentContent").focus();
					return;
				}
				var data = $("#commentForm")[0];
				var formData = new FormData(data);
				$("#submitBtn").prop("disabled", true);
				$.ajax(
				{
					type: "POST",
					url: "/board/commentUpload",
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
							$("#submitBtn").prop("disabled", false);
							location.reload();
						}
						else if(response.code == 400)
						{
							$("#submitBtn").prop("disabled", false);
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
			});
		});
		</script>
	</body>

</html>