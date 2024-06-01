<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="/resources/css/index.css">
    <title>index</title>
    <script>
        $(document).ready(function() {
            $("#userId").focus();

            $('#userPwd').on('input', function() {
                if ($('#userPwd').val() == '') {
                    $('#showPw').css('visibility', 'hidden');
                }

                else {
                    $('#showPw').css('visibility', 'visible');
                }
            });

            $('#showPw').on('click',function() {
                var pw = $("#userPwd");
                var pwType = pw.attr('type');

                if (pwType == 'password') {
                    pw.attr('type', 'text');
                    $('#showPw').attr('src', './resources/images/visibility_off.png');
                }

                else {
                    pw.attr('type', 'password');
                    $('#showPw').attr('src', './resources/images/visibility.png');
                }
            });
            $("#btn_login").on("click",function(){
            	if($.trim($("#userId").val()).length<=0){
            		alert("아이디를 입력하세요.");
            		$("#userId").val("");
            		$("#userId").focus();
            		return;
            	}
            	if($.trim($("#userPwd").val()).length<=0){
            		alert("비밀번호를 입력하세요.");
            		$("#userPwd").val("");
            		$("#userPwd").focus();
            		return;
            	}
            	//alert($("#userId").val()+$("#userPwd").val());
            	$.ajax({
            		type:"POST",
            		url:"/loginProc",
            		data:{
            			userId:$("#userId").val(),
            			userPwd:$("#userPwd").val()
            		},
            		datatype:"JSON",
            		
					success:function(response){
						
            			if(response.code==0){
            				alert("로그인 성공");
            				location.href="/board/mainBoard";
            			}
            			else if(response.code==-1 || response.code==300){
            				alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
            				$("#userId").focus();
            			}
            			else if(response.code==-98){
            				alert("탈퇴한 회원입니다.");
            			}
            			else if(response.code==-99){
            				alert("정지된 회원입니다.");
            			}
            			else if(response.code==-100){
            				alert("회원 상태가 올바르지 않습니다.");
            			}
            			else if(response.code==400){
            				alert("파라미터가 올바르지 않습니다.");
            			}
            			else{
            				alert("로그인에 실패하였습니다.");
            			}
            		},
            		error:function(xhr,status,error){
            			icia.common.error(error);
            			alert("서버 에러");
            		}
            	});

            });
            
        });

    </script>
</head>
<body>
    <div class="main">
        <div class="container">
            <div class="logo">
                <a href="./index.jsp"><img src="./resources/images/Sistagram.png" alt="Instagram" class="brand_logo"></a>
            </div>
            <div class="centent">
                <form name="login_form" action="./main.html" method="POST">
                    <div class="input_value">
                        <input type="text" id="userId" name="userId" placeholder="아이디">
                    </div>
                    <div class="input_value">
                        <input type="password" id="userPwd" name="userPwd" placeholder="비밀번호를 입력하세요">
                        <img class="showPw" id="showPw" name="showPw" src="./resources/images/visibility.png" style="visibility: hidden;">
                    </div>
                    <div class="btn_submit">
                        <button type="button" id="btn_login">로그인</button>
                    </div>
                </form>
                <div>
                    <span id="Check" name="Check"></span>
                </div>
                <div class="or_line">
                    <div class="line"></div>
                    <div class="text">또는</div>
                    <div class="line"></div>
                </div>
                <ul class="find_pw">
                    <li><a href="/user/findPwd">비밀번호를 잊으셨나요?</a></li>
                </ul>
            </div>
        </div>
        <div class="container">
            <span><p style="margin: 15px;"/>계정이 없으신가요? <a href="/user/signUp"><span style="color: #4cb5f9;">가입하기</span></a></p></span>
        </div>
    </div>
  </body>
</html>