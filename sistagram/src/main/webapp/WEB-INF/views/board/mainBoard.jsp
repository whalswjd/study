<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

	<head>
		<meta charset="UTF-8">
		<title>main</title>
		<link rel="stylesheet" href="/resources/css/reset.css">
		<link rel="stylesheet" href="/resources/css/mainBoard.css">
		<script src="/resources/js/jquery-3.5.1.min.js"></script> <%@ include file="/WEB-INF/views/include/head2.jsp" %>
	</head>

	<body>
		<div>
			<div>
				<div>
					<div class="main">
						<div class="container">
							<div>
								<div> <%@ include file="/WEB-INF/views/include/navigation.jsp"%> <div style="width: 85%; margin-left: auto;">
										<div style="height: 100vh; display: flex; flex-direction: column;">
											<div style="display: flex; flex-direction: column; flex-grow: 1;">
												<div style="display: flex; flex-direction: row; justify-content: center;">
													<div style="max-width: 600px; width: 100%;">
														<div style="margin-top: 20px;">
															<!-- top -->
															<div style="margin-bottom: 30px;">
																<div style="padding: 0 10px;">
																	<div style="width: 100%; height: 100%; display: flex; flex-direction: row;">
																		<ul style="display: flex; flex-direction: row; flex-grow: 1;">
																			<li>
																				<div style="padding: 0 5px;">
																					<button style="background-color: transparent; border-style: none; cursor: pointer;">
																						<div>
																							<c:choose>
																								<c:when test="${! empty cookieProfile}">
																									<img src="/resources/upload/${cookieProfile}" alt="img" style="width: 50px; height: 50px; border-radius: 50%;">
																								</c:when>
																								<c:otherwise>
																									<img src="/resources/images/default_profile.png" alt="img" style="width: 50px; height: 50px; border-radius: 50%;">
																								</c:otherwise>
																							</c:choose>
																						</div>
																						<div>
																							<span>${cookieId}</span>
																						</div>
																						<c:if test="${user.blueId eq 'B'}">
																							<img src="/resources/images/check.png" alt="구매!" style="width:13px; float: right; margin-right:40px;">
																						</c:if>
																					</button>
																				</div>
																			</li>
																		</ul>
																	</div>
																</div>
															</div>
															<c:if test="${! empty list}">
																<c:forEach var="board" items="${list}" varStatus="i">
																	<!-- list -->
																	<div style="width: 100%;">
																		<div style="display: flex; flex-direction: column;">
																			<div>
																				<div style="width: 100%; height: 100%; display: flex; flex-direction: column; padding-bottom: 10px; margin-bottom: 20px; border-bottom-width: 1px; border-bottom-style: solid;">
																					<div style="padding-bottom: 10px;">
																						<div style="width: 100%; display: flex; flex-direction: row;">
																							<div style="margin-right: 10px;">
																								<div style="cursor: pointer;">
																									<c:choose>
																										<c:when test="${! empty board.userFileName}">
																											<img src="/resources/upload/${board.userFileName}" alt="img" style="width: 32px; height: 32px; border-radius: 50%;">
																										</c:when>
																										<c:otherwise>
																											<img src="/resources/images/default_profile.png" alt="img" style="width: 32px; height: 32px; border-radius: 50%;">
																										</c:otherwise>
																									</c:choose>
																								</div>
																							</div>
																							<div style="width: 100%; display: flex; align-items: center;">
																								<div style="display: flex; flex-direction: row;">
																									<div style="cursor: pointer;" class="non-link">
																										<a href="/user/profile?userId=${board.userId}">
																											<span style="font-weight: bold; font-color:black;">${board.userId}</span>
																										</a>
																									</div>
																									<div style="display: flex; flex-direction: row;">
																										<div>
																											<span style="margin: 0px 4px;">•</span>
																										</div>
																										<c:choose>
																											<c:when test="${board.regDate gt 0}">
																												<div>
																													<span class="day"><b>${board.regDate}</b>일 전</span>
																												</div>
																											</c:when>
																											<c:otherwise>
																												<span class="day">오늘</span>
																											</c:otherwise>
																										</c:choose>
																									</div>
																								</div>
																							</div>
																							<c:if test="${cookieId eq board.userId}">
																								<div style="display: flex; align-items: center;">
																									<img src="/resources/images/more.png" alt="img" id="moreBtn">
																								</div>
																							</c:if>
																						</div>
																					</div>
																					<div style="cursor: pointer;">
																						<a><img src="/resources/upload2/${board.boardFileName}" alt="img" style="width: 100%; height: 100;" onclick="openViewModal(${board.boardNum})"></a>
																					</div>
																					<div>
																						<div style="display: flex; flex-direction: column;">
																							<div style="display: grid; margin: 0px 5px; align-items: center; grid-template-columns: 1fr 1fr;">
																								<div style="display: flex; margin-left: -10px;">
																									<c:choose>
																										<c:when test="${board.isLike eq 0}">
																											<div style="padding: 8px; cursor: pointer;">
																												<a><img src="/resources/images/heart.png" alt="img" style="width:30px;" id="disLikeImg" onclick="likeProc(${board.isLike},${board.boardNum})"></a>
																											</div>
																										</c:when>
																										<c:otherwise>
																											<div style="padding: 8px; cursor: pointer;">
																												<a><img src="/resources/images/filledHeart.png" alt="img" style="width:30px;" id="likeImg" onclick="likeProc(${board.isLike},${board.boardNum})"></a>
																											</div>
																										</c:otherwise>
																									</c:choose>
																									<input type="hidden" id="disLike" value="" />
																									<input type="hidden" id="likeBoardNum" value="${board.boardNum}">
																									<div style="padding: 8px; cursor: pointer;">
																										<a><img src="/resources/images/reply.png" alt="img" style="width:30px;"></a>
																									</div>
																								</div>
																								<div style="margin-left: auto; cursor: pointer;">
																									<a><img src="/resources/images/mark.png" alt="img"></a>
																								</div>
																							</div>
																							<div style="margin-top: 10px;">
																								<div style="display: inline-block; margin-right: 5px;">
																									<a>
																										<span style="font-weight: bold;">${board.userId}</span>
																									</a>
																								</div>
																								<span>
																									<span>${board.boardContent}</span>
																								</span>
																							</div>
																							<c:if test="${board.commentCnt gt 0}">
																								<div style="margin-top: 10px;">
																									<a>
																										<span style="font-size: 13px; cursor: pointer;" id="commentCntBtn" onclick="openViewModal(${board.boardNum})">댓글 ${board.commentCnt}개 보기</span>
																									</a>
																								</div>
																							</c:if>
																							<div style="margin-top: 10px;">
																								<form class="comment-form" name="commentForm" id="commentForm" style="display: flex; flex-direction: row;">
																									<div style="display: flex; flex-direction: row; flex-grow: 1; align-items: center;">
																										<input type="text" class="comment-area" name="commentContent" id="commentContent" placeholder="댓글달기" value="" />
																										<input type="hidden" name="commentGroup" id="commentGroup" value="${board.boardNum}" />
																										<input type="hidden" name="boardNum" id="boardNum" value="${board.boardNum}" />
																										<input type="hidden" name="commentParent" id="commentParent" value="0" />
																										<div>
																											<input type="button" id="submitBtn" value="게시" onclick="commentInsert()">
																										</div>
																									</div>
																								</form>
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																	<form name="delForm" id="delForm">
																		<input type="hidden" name="boardNum" id="boardNum" value="${board.boardNum}" />
																		<input type="hidden" name="userId" id="userId" value="${board.userId}" />
																		<input type="hidden" name="fileName" id="fileName" value="${board.boardFileName}" />
																		<input type="hidden" name="fileExt" id="fileExt" value="${board.boardFileExt}" />
																	</form>
																	<!-- list -->
																</c:forEach>
															</c:if>
														</div>
													</div>
													<!-- right -->
													<div style="width: 25%; height: 100vh; padding-left: 60px;">
														<div style="margin-top: 40px; display: flex; flex-direction: column;">
															<div style="padding: 0 10px;">
																<div style="display: flex; flex-direction: row; justify-content: space-between;">
																	<div style="margin-right: 10px;">
																		<div style="cursor: pointer;">
																			<c:choose>
																				<c:when test="${! empty cookieProfile}">
																					<img src="/resources/upload/${cookieProfile}" alt="img" style="width: 50px; height: 50px; border-radius: 50%;">
																				</c:when>
																				<c:otherwise>
																					<img src="/resources/images/default_profile.png" alt="img" style="width: 50px; height: 50px; border-radius: 50%;">
																				</c:otherwise>
																			</c:choose>
																		</div>
																	</div>
																	<div style="width: 100%; display: flex;">
																		<div style="display: flex; flex-direction: column; justify-content: center; flex-grow: 1;">
																			<div>
																				<div>
																					<span style="font-weight: bold;">${cookieId}</span>
																				</div>
																			</div>
																		</div>
																	</div>
																	<div style="display: flex;">
																		<div style="display: flex; align-items: center; flex-shrink: 0;">
																			<span style="font-size: 12px; color: #4cb5f9;">전환</span>
																		</div>
																	</div>
																</div>
															</div>
															<div style="margin-top: 25px; margin-bottom: 10px;">
																<div style="display: flex; flex-direction: column;">
																	<c:if test="${! empty userList}">
																		<div style="display: flex; flex-direction: row;">
																			<div style="display: flex; flex-grow: 1;">
																				<span style="font-size: 14px;">회원님을 위한 추천</span>
																			</div>
																		</div>
																	</c:if>
																	<c:if test="${! empty userList}">
																		<c:forEach var="user" items="${userList}" varStatus="i">
																			<div style="width: 100%;">
																				<div style="padding: 10px;">
																					<div style="display: flex; flex-direction: row; justify-content: space-between;">
																						<div style="margin-right: 10px;">
																							<div style="cursor: pointer;">
																								<c:choose>
																									<c:when test="${user.userFileName eq ''}">
																										<img src="/resources/images/default_profile.png" alt="img" style="width: 44px; height: 44px; border-radius: 50%;">
																									</c:when>
																									<c:otherwise>
																										<img src="/resources/upload/${user.userFileName}" alt="img" style="width: 44px; height: 44px; border-radius: 50%;">
																									</c:otherwise>
																								</c:choose>
																							</div>
																						</div>
																						<div style="width: 100%; display: flex;">
																							<div style="display: flex; flex-direction: column; justify-content: center; flex-grow: 1;">
																								<div>
																									<div>
																										<a href="/user/profile?userId=${user.userId}"><span style="font-weight: bold;">${user.userId}</span></a>
																										<c:if test="${user.blueId eq 'B'}">
																											<img src="/resources/images/check.png" alt="구매!" style="width:13px; float: right; margin-right:30px;">
																										</c:if>
																									</div>
																								</div>
																								<div>
																									<span style="font-size:12px; font-color:grey;">${user.userName}</span>
																								</div>
																							</div>
																						</div>
																						<div style="display: flex;">
																							<div style="display: flex; align-items: center; flex-shrink: 0;">
																								<input type="button" value="팔로우" id="followBtn" onclick="followProc('${user.userId}')" style="font-size: 12px; color: #4cb5f9; margin-right: 10px;" class="followBtn">
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
																</div>
																</c:forEach>
																</c:if>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="viewModal" class="viewModal">
			<div class="viewModal-content">
				<iframe src="#" id="modalContent" style="display:none; width: 100%; height: 100%; border: none;"></iframe>
			</div>
		</div>
		<script>
		function openViewModal(boardNum) {
			document.getElementById('viewModal').style.display = 'flex';
			document.getElementById("modalContent").src = "/board/selectView?boardNum=" + boardNum;
			document.getElementById("modalContent").style.display = "block"
		}

		function closeViewModal() {
			document.getElementById('viewModal').style.display = 'none';
		}

		function commentInsert() {
			if($.trim($("#commentContent").val()).length <= 0) {
				alert($("#commentContent").val());
				alert("댓글 내용을 입력하세요!");
				$("#commentContent").focus();
				return;
			}
			var data = $("#commentForm")[0];
			var formData = new FormData(data);
			$("#submitBtn").prop("disabled", true);
			$.ajax({
				type: "POST",
				url: "/board/commentUpload",
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
						alert("등록완료");
						$("#submitBtn").prop("disabled", false);
						location.reload();
					}
					else if(response.code == 400) {
						$("#submitBtn").prop("disabled", false);
						alert("파라미터 오류");
					}
					else {
						alert("서버 오류로 업로드에 실패했습니다.");
					}
				},
				error: function(xhr, status, error) {
					icia.common.error(error);
					alert("서버 에러");
				}
			});
		}

		function likeProc(isLike, boardNum) {
			var disLike;
			if(isLike == 0) {
				$("#diLikeImg").attr("src", "/resources/images/filledHeart.png");
				disLike = 0;
			}
			else {
				$("#likeImg").attr("src", "/resources/images/greyHeart.png");
				disLike = 1;
			}
			$.ajax({
				type: "POST",
				data: {
					boardNum: boardNum,
					disLike: disLike
				},
				datatype: "JSON",
				url: "/board/likeUpdate",
				beforeSend: function(xhr) {
					xhr.setRequestHeader("AJAX", "true");
				},
				success: function(response) {
					if(response.code == 0) {
						alert("좋아요 반영 완료");
						loactaion.reload();
					}
					else {
						alert("오류 발생");
						nowLike.src = "/resources/images/greyHeart.png";
					}
				},
				error: function(xhr, status, error) {
					icia.commoSn.error(error);
				}
			});
		}

		function followProc(userTo) {
			$.ajax({
				type: "POST",
				url: "/board/followUpdate",
				data: {
					userTo: userTo
				},
				datatype: "JSON",
				beforeSend: function(xhr) {
					xhr.setRequestHeader("AJAX", "true");
				},
				success: function(response) {
					if(response.code == 0) {
						alert("팔로우되었습니다!");
						window.location.reload();
					}
					else if(response.code == 10) {
						alert("이미 팔로우 되었습니다!")
					}
					else {
						alert("오류 발생");
					}
				},
				error: function(xhr, status, error) {
					icia.common.error(error);
				}
			});
		}
		$(document).ready(function() {
			window.onclick = function(event) { //닫기
				var modal = document.getElementById('viewModal');
				if(event.target === modal) {
					modal.style.display = 'none';
				}
			};
			$("#seeAlluserList").on("click", function() {
				alert("보여주기");
				$("#switchVisible").css("display", "visible");
			});
			$("#moreBtn").on("click", function() {
				//삭제 로직
				if(!confirm("이 게시물을 삭제할까요?")) {
					return;
				}
				var data = $("#delForm")[0];
				var formData = new FormData(data);
				$.ajax({
					type: "POST",
					url: "/board/delBoard",
					data: formData,
					processData: false,
					contentType: false,
					cache: false,
					timeout: 600000,
					beforeSend: function(xhr) {
						xhr.setRequestHeader("AJAX", "true");
					},
					success: function(response) {
						if(response.code == 0) {
							alert("삭제 성공");
							location.reload();
						}
						else {
							alert(response.code);
							alert("오류 발생");
						}
					},
					error: function(xhr, status, error) {
						icia.common.error(error);
					}
				});
			});
		}); //document 
		</script>
		</div>
	</body>

</html>