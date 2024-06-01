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
		<style>
		.search-container
		{
			position: relative;
			align-items: center;
			width: 88%;
		}

		.searchInput
		{
			width: 100%;
			padding: 10px;
			font-size: 16px;
			border: 1px solid #ddd;
			border-radius: 7px;
			outline: none;
			transition: border-color 0.3s;
		}

		.searchInput:focus
		{
			border-color: #575757;
		}

		.search-icon
		{
			position: absolute;
			top: 50%;
			right: 10px;
			transform: translateY(-50%);
			cursor: pointer;
		}

		.search-icon img
		{
			width: 20px;
			height: auto;
		}

		.search-container
		{
			position: relative;
			align-items: center;
			width: 88%;
		}

		.search-results
		{
			position: absolute;
			top: 100%;
			left: 0;
			width: 100%;
			background-color: #fff;
			box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
			max-height: 200px;
			overflow-y: auto;
			transition: opacity 0.5s ease-in-out, height 0.5s ease-in-out;
			text-align: center;
		}

		.search-results-item
		{
			padding: 8px;
			border-bottom: 1px solid #ddd;
			cursor: pointer;
		}
		</style>
	</head>

	<body>
		<div>
			<div>
				<div> <%@ include file="/WEB-INF/views/include/navigation.jsp"%> <div class="main">
						<div class="container">
							<div>
								<div>
									<section>
										<section>
											<div class="search-container">
												<div class="search-container">
													<form name="searchForm" id="searchForm" action="/board/searchProc">
														<input type="text" class="searchInput" placeholder="검색어를 입력하세요" id="searchContent" name="searchContent">
													</form>
													<div class="search-icon">
														<img src="/resources/images/search-icon.png" alt="Search Icon" id="enter">
													</div>
													<div class="search-results" id="searchResults">
														<c:if test="${! empty list}">
															<c:forEach var="user" items="${list}" varStatus="i">
																<div style="width: 100%; padding: 10px; border-bottom: 1px solid #ccc;">
																	<div style="display: flex; align-items: center;">
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
																		<div style="flex-grow: 1;">
																			<div>
																				<a href="/user/profile?userId=${user.userId}" style="font-weight: bold;">${user.userId}</a>
																				<c:if test="${user.blueId eq 'B'}">
																					<img src="/resources/images/check.png" alt="구매!" style="width:13px; margin-left: 10px;">
																				</c:if>
																			</div>
																			<div>
																				<span style="font-size:12px; color: grey;">${user.userName}</span>
																			</div>
																		</div>
																		<div>
																			<input type="button" value="팔로우" id="followBtn${i.index}" onclick="followProc('${user.userId}')" style="font-size: 12px; color: #4cb5f9; border:none;" class="followBtn">
																		</div>
																	</div>
																</div>
															</c:forEach>
														</c:if>
													</div>
												</div>
											</div>
										</section>
									</section>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script>
		$(document).ready(function()
		{
			$("#searchSelect").on("keyUp", function()
			{
				if($.trim($("#searchContent").val()).length <= 0)
				{
					alert("내용을 입력하세요!");
					return;
				}
				document.searchForm.submit();
			});

			function followProc(userTo)
			{
				$.ajax(
				{
					type: "POST",
					url: "/board/followUpdate",
					data:
					{
						userTo: userTo
					},
					datatype: "JSON",
					beforeSend: function(xhr)
					{
						xhr.setRequestHeader("AJAX", "true");
					},
					success: function(response)
					{
						if(response.code == 0)
						{
							alert("팔로우되었습니다!");
							window.location.reload();
						}
						else if(response.code == 10)
						{
							alert("이미 팔로우 되었습니다!")
						}
						else
						{
							alert("오류 발생");
						}
					},
					error: function(xhr, status, error)
					{
						icia.common.error(error);
					}
				});
			}
		});
		</script>
	</body>

</html>