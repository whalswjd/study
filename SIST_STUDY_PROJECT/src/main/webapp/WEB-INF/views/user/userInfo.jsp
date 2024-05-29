<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #fff;
    color: #000;
}

.container {
    width: 50%;
    margin: 50px auto;
    padding: 20px;
    background-color: #eee;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
    text-align: center;
}

.form-group {
    margin-bottom: 20px;
    margin-right: 15px;
    margin-left: 15px;
}

label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
}

input[type="text"],
input[type="password"],
input[type="email"],
input[type="tel"],
input[type="number"],
textarea,
button {
    width: 100%;
    padding: 10px;
    border: 1px solid #000;
    border-radius: 5px;
}

button {
    background-color: #000;
    color: #fff;
    cursor: pointer;
    transition: background-color 0.3s;
}

button:hover {
    background-color: #333;
}
</style>
<meta charset="UTF-8">
<title>modify userInfo</title>
</head>
<body>
    <div class="container">
        <h2>회원정보 수정</h2>
        <form name="modiForm" id="modiForm" method="POST">
            <div class="form-group" style="display: flex; ">
                <label for="username" style="width:199px;">아이디:</label>
                <input type="text" id="userId" name="userId" value="${userId}" style="border-color: darkgrey;"  disabled>
                <label for="points" style="width:199px; margin-left:33px;">포인트:</label>
                <input type="number" id="userPoint" name="userPoint" value="${user.userPoint}"  style="border-color: darkgrey;"  disabled>
            </div>
            <div class="form-group">
                <label for="name">이름:</label>
                <input type="text" id="userName" name="userName" value="${user.userName}" required>
            </div>
            <div class="form-group">
                <label for="password">비밀번호:</label>
                <input type="password" id="userPwd" name="userPwd" value="${user.userPwd}" required>
            </div>
            <div class="form-group">
                <label for="dob">생년월일:</label>
                <input type="date" id="userBirth" name="userBirth" value="${user.userBirth}" required>
            </div>
            <div class="form-group">
                <label for="email">이메일:</label>
                <input type="email" id="userEmail" name="userEmail" value="${user.userEmail}" required>
            </div>
            <div class="form-group">
                <label for="phone">번호:</label>
                <input type="tel" id="userTel" name="userTel" value="${user.userTel}" required>
            </div>
            <div class="form-group">
                <label for="address">주소:</label>
                <input type="text" id="userAddress" name="userAddress" value="${user.userAddress}" required>
            </div>
            <div class="form-group">
                <button type="submit">저장</button>
            </div>
        </form>
    </div>
    <div style="font-color:grey;">탈퇴하기</div>
	
</body>
</html>