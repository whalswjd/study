<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>update your profile</title>
		<link rel="stylesheet" href="/resources/css/reset.css">
		<script src="/resources/js/jquery-3.5.1.min.js"></script> <%@ include file="/WEB-INF/views/include/head2.jsp" %>
		<link rel="stylesheet" type="text/css" href="/resources/css/profile.css">
		<link rel="stylesheet" type="text/css" href="/resources/css/boardModal.css">
	</head>

	<body>
		<div>
			<div> <%@ include file="/WEB-INF/views/include/navigation.jsp"%> <div class="main">
					<div>
						<div>
							<div>
								<section style="width:800px;">
									<section style="display: flex; align-items: center;">
										<img src="${userPhoto}" alt="profile.jpg" onerror="this.src='/resources/images/default_profile.png';" class="profile-image" />
										<div style="margin-left: 10%;">
											<div><b>${user.userId}</b>&nbsp;&nbsp; <c:if test="${! empty user.blueId and user.blueId eq 'B'}">
													<img src="/resources/images/check.png" alt="구매!" style="width:19px; margin-top:10px;
                	margin-left:-5px;">
												</c:if>
												<c:if test="${user.userId eq cookieId}">
													<button class="button" onclick="goProfile()">프로필 편집</button>&nbsp;&nbsp;
												</c:if>
												<c:if test="${user.userId ne cookieId}">
													<c:choose>
														<c:when test="${isFollow eq 0}">
															<button class="button" id="followBtn">팔로우</button>&nbsp;&nbsp;
														</c:when>
														<c:otherwise>
															<button class="button-followed">팔로잉</button>&nbsp;&nbsp;
														</c:otherwise>
													</c:choose>
												</c:if>
												<c:if test="${user.userId eq cookieId}">
													<c:choose>
														<c:when test="${! empty user.blueId and user.blueId eq 'B'}">
															<button class="button-2">구매 완료</button>
														</c:when>
														<c:otherwise>
															<c:if test="${user.userId eq cookieId}">
																<button class="button" id="sellingBox">판매 페이지</button>
															</c:if>
														</c:otherwise>
													</c:choose>
												</c:if>
											</div>
											<script>
											function goProfile() {
												window.location.href = '/user/update';
											}
											</script>
											<br />
											<div style="font-size: 13px;">게시물 <b>${boardTotal}</b> &nbsp; 팔로잉 <b>${insFollow.followingCnt}</b> &nbsp; 팔로워 <b>${insFollow.followedCnt}</b> </div>
											<br />
											<b style="font-size: 13px;">${user.userName}</b>
											<span class="spaced-text"></span>
											<p style="font-size: 13px; letter-spacing: -0.5px">${user.userIntro}</p>
										</div>
										<br />
									</section>
									<div style="justify-content: center;">
										<img src="/resources/images/pf3.jpg" alt="profile.jpg" class="profile-image2" /> &nbsp; <img src="/resources/images/pf3.jpg" alt="profile.jpg" class="profile-image2" /> &nbsp; <img src="/resources/images/pf3.jpg" alt="profile.jpg" class="profile-image2" />&nbsp;
									</div>
									<hr />
									<section>
										<div class="image-container">
											<c:if test="${!empty list}">
												<c:forEach var="board" items="${list}" varStatus="status">
													<c:choose>
														<c:when test="${status.index != 0 && status.index % 3 == 1}">
															<br />
															<div class="image-box" style="width:32%;">
																<div class="image-overlay" onclick="openViewModal(${board.boardNum})">
																	<img src="/resources/images/profile_heart.png" style="height:17px;">&nbsp;<p>${board.likeCnt}</p> &nbsp;&nbsp;&nbsp; <img src="/resources/images/profile_comment.png" style="height:17px;">&nbsp;<p>${board.commentCnt}</p>
																</div>
																<img class="square-image" src="/resources/upload2/${board.fileName}" alt="Square Image 1">
															</div>
														</c:when>
														<c:otherwise>
															<div class="image-box" style="width:32%;">
																<div class="image-overlay" onclick="openViewModal(${board.boardNum})">
																	<img src="/resources/images/profile_heart.png" style="height:17px;">&nbsp;<p>${board.likeCnt}</p> &nbsp;&nbsp;&nbsp; <img src="/resources/images/profile_comment.png" style="height:17px;">&nbsp;<p>${board.commentCnt}</p>
																</div>
																<img class="square-image" src="/resources/upload2/${board.fileName}" alt="Square Image 1">
															</div>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</c:if>
										</div>
										<div id="viewModal" class="viewModal">
											<div class="viewModal-content">
												<iframe src="#" id="modalContent" style="display:none; width: 100%; height: 100%; border: none;"></iframe>
											</div>
										</div>
										<div>
											<div id="nextContent"></div>
										</div>
									</section>
								</section>
								<input type="hidden" id="boardUserId" value="${user.userId}" />
							</div>
							<div id="sellModal" class="sellModal">
								<div class="sellModal-content">
									<img src="/resources/images/cross.png" style="width:13px;" onclick="closeSellModal()">
									<div style="text-align:center;">
										<section>
											<p>인증 마크를 구매하시겠어요?</p>
											<br />
											<p style="font-color:lightgrey; font-size:13px;">인증 마크를 달면 프로필 상단에 블루 마크가 고정됩니다 :)</p>
											<br />
											<img src="/resources/images/check.png" alt="블루라벨" style="width:30px;">
											<br />
											<p style="font-color:lightgrey; font-size:13px;">50000원</p>
										</section>
									</div>
									<form id="payForm" name="payForm" method="post">
										<input type="hidden" name="itemCode" id="itemCode" value="123456789" />
										<input type="hidden" name="itemName" id="itemName" value="인증마크" />
										<input type="hidden" name="quantity" id="quantity" value="1" />
										<input type="hidden" name="totalAmount" id="totalAmount" value="50000" />
										<input type="button" id="btnPay" value="결제" class="sellModal-btn">
									</form>
									<form name="kakaoForm" id="kakaoForm" method="post" target="kakaoPopUp" action="/kakao/payPopUp">
										<input type="hidden" name="orderId" id="orderId" value="${cookieId}" />
										<input type="hidden" name="tId" id="tId" value="" />
										<input type="hidden" name="pcUrl" id="pcUrl" value="" />
									</form>
								</div>
							</div><!-- 모달창 끝! -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<script>
		$(document).ready(function() {
			$("#sellingBox").on("click", function() {
				openSellModal();
			});
			$("#followBtn").on("click", function() {
				$.ajax({
					type: "POST",
					url: "/board/followUpdate",
					data: {
						userTo: $("#boardUserId").val()
					},
					datatype: "JSON",
					beforeSend: function(xhr) {
						xhr.setRequestHeader("AJAX", "true");
					},
					success: function(response) {
						if(response.code == 0) {
							alert("팔로우되었습니다!");
							window.location.reload();
						} else if(response.code == 10) {
							alert("이미 팔로우 되었습니다!")
						} else {
							alert("오류 발생");
						}
					},
					error: function(xhr, status, error) {
						icia.common.error(error);
					}
				});
			});
			window.onclick = function(event) {
				var modal = document.getElementById('viewModal');
				if(event.target === modal) {
					modal.style.display = 'none';
				}
			};
			$("#btnPay").on("click", function() {
				if(!confirm("진짜 구매하시겠습니까?!")) {}
				$("#btnPay").prop("disabled", true);
				$.ajax({
					type: "POST",
					url: "/kakao/payReady",
					data: {
						itemCode: $("#itemCode").val(),
						itemName: $("#itemName").val(),
						quantity: $("#quantity").val(),
						totalAmount: $("#totalAmount").val()
					},
					datatype: "JSON",
					beforeSend: function(xhr) {
						xhr.setRequestHeader("AJAX", "true");
					},
					success: function(response) {
						icia.common.log(response);
						if(response.code == 0) {
							var orderId = response.data.orderId;
							var tId = response.data.tId;
							var pcUrl = response.data.pcUrl;
							closeSellModal();
							$("#orderId").val(orderId);
							$("#tId").val(tId);
							$("#pcUrl").val(pcUrl);
							var win = window.open('', 'kakaoPopUp', 'toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=540,height=700,left=100,top=100');
							$("#kakaoForm").submit();
						} else {
							alert("오류가 발생하였습니다.");
							$("#btnPay").prop("disabled", false);
						}
					},
					error: function(error) {
						icia.common.error(error);
						$("#btnPay").prop("disabled", false);
					}
				});
			});
		});
		//판매 모달
		function openSellModal() {
			document.getElementById('sellModal').style.display = 'flex';
			document.getElementById("modalContent").style.display = "block"
		}

		function closeSellModal() {
			document.getElementById('sellModal').style.display = 'none';
		}
		// 뷰 모달
		function openViewModal(boardNum) {
			document.getElementById('viewModal').style.display = 'flex';
			document.getElementById("modalContent").src = "/board/selectView?boardNum=" + boardNum;
			document.getElementById("modalContent").style.display = "block"
		}

		function closeViewModal() {
			document.getElementById('viewModal').style.display = 'none';
		}
		</script>
	</body>

</html>