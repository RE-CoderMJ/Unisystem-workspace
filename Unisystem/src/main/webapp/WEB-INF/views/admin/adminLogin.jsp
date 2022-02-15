<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
</head>
<style>
/*관리자 로그인화면 (adenview)*/

/*바디영역 따로 설정함*/
body {
	width: 1500px;
	height: 800px;
	background-color: rgb(235, 242, 252);
	padding-top: 100px;
	 
}

.ad_login_form {
	width: 885px;
	height: auto;
	background-color: white;
	margin: auto;
	border-top: 2px solid rgb(15, 43, 80);
	border-bottom: 2px solid rgb(15, 43, 80);
	margin-bottom:50px;
}

.alog_title {
	font-size: 40px;
	font-weight: 700;
	color: rgb(15, 43, 80);
	text-align: center;
	margin-left:10px;
	margin-top: 100px;
	margin-bottom: 20px;
}

.img-area img {
	width: 345px;
	height: auto;
	margin: auto;
	margin-left: 280px;
	margin-top: 10px;
	margin-bottom: 30px;
}

#log-input input {
	height: 30px;
	width: 250px;
	border: none;
	border-bottom: solid 1px lightgray;
	position: relative;
	left: 280px;
}

.ad_pwd {
	vertical-align: 20px;
}

#log-input button {
	display: inline-block;
	width: 92px;
	height: 92px;
	margin-left: 16px;
	border-radius: 100px;
	-moz-border-radius: 100px;
	-webkit-border-radius: 100px;
	background-color: rgb(26, 86, 162);
	font-size: 20px;
	font-weight: 400;
	color: #fff;
	line-height: 92px;
	text-align: center;
	text-decoration: none;
	position: relative;
	left: 280px;
	top: -40px;
	border: none;
	cursor: pointer;
}

input:focus {
	outline: none;
}
</style>

<body>
	<div class="outer">

		<div class="admin_login">
			<div class="ad_login_form">
				<div class="alog_title">관리자 로그인</div>

				<div class="img-area">
					<img src="resources/images/LOGO_HEIGHT.png" alt="로고영역">
				</div>

				<div class="admin_log_input">
					<form action="login.me" method="post" id="log-input">
						<input type="hidden" name="userDiv" value="3"/>
						<input type="text" name="userNo" placeholder="  아이디"> <br>
						<input type="password" class="ad_pwd" name="userPwd" placeholder=" 비밀번호">
	
						<button type="submit">로그인</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	
</body>
</html>