<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/taglib.jsp" %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/views/include/head.jsp" %>

<style>
body {
  /* padding-top: 40px; */
  padding-bottom: 40px;
  /* background-color: #eee; */
}

.form-signin {
  max-width: 330px;
  padding: 15px;
  margin: 0 auto;
}
.form-signin .form-signin-heading,
.form-signin .checkbox {
  margin-bottom: 10px;
}
.form-signin .checkbox {
  font-weight: 400;
}
.form-signin .form-control {
  position: relative;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  height: auto;
  padding: 10px;
  font-size: 16px;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin input[type="text"] {
  margin-bottom: 5px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}
.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}
</style>
<script type="text/javascript">
$(document).ready(function() 
{
	$("#btnUser").on("click", function()
	{
		location.href = "/userLogin";
	});
	
	$("#btnManager").on("click", function()
	{
		location.href = "/managerLogin";
	});
});

</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/navigation.jsp" %> 

<div class="container">

	<form class="form-signin">
	    <h2 class="form-signin-heading m-b3">userLogin</h2>
		<button type="button" id="btnUser" class="btn btn-lg btn-primary btn-block">회원 로그인</button>
    	<button type="button" id="btnManager" class="btn btn-lg btn-primary btn-block">관리자 로그인</button>
	</form>
</div>
</body>
</html>