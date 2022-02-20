<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<style>
body {
	width: 1500px;
	height: 900;
	background-color: rgb(235, 242, 252);
	background-size: 1500px 900px;
}

.logo img {
	padding-bottom: 30px;
	width: 300px;
	position: relative;
	left: 240px;
	top: 60px
}

/*로그인 영역*/
.login-area {
	margin-left: 297px;
}

.login-box {
	width: 465px;
	height: 530px;
	background-color: #fff;
	border-bottom: 3px solid #dfe6ef;
	margin-top: 50px;
	padding: 40px;
	box-sizing: border-box;
	float: left;
}

.service-zone {
	display: inline-block;
	width: 445px;
	height: 600px;
	background-color: #094b9f;
	box-sizing: border-box;
	float: left;
}

.login-title {
	display: inline-block;
	font-size: 60px;
	margin-right: 5px;
	font-weight: 900;
	color: rgb(15, 43, 80);
}

#text {
	display: inline-block;
	font-size: 18x;
	font-weight: 600;
}

#text b {
	font-size: 18px;
	color: rgb(41, 128, 185);
	font-weight: 500;
}

#log-input #log-form{
	height: 35px;
	width: 220px;
	margin-bottom: 15px;
	border: none;
	border-bottom: solid 1px lightgray;
}

#log-input button {
	display: inline-block;
	width: 110px;
	height: 110px;
	margin-left: 10px;
	border-radius: 100px;
	-moz-border-radius: 100px;
	-webkit-border-radius: 100px;
	background-color: #094a9a;
	font-size: 20px;
	font-weight: 400;
	color: #fff;
	line-height: 92px;
	text-align: center;
	text-decoration: none;
	float: right;
	position: relative;
	left: -20px;
	top: -112px;
	border: none;
	cursor: pointer;
}

input:focus {
	outline: none;
}

.login-title2 {
	font-size: 40px;
	margin-top: 20px;
	font-weight: 600;
	color: black;
}

ul {
	margin-top: 17px;
}

li {
	color: rgb(127, 127, 127);
}

.service-zone {
	padding: 50px;
}

.service-zone div {
	color: white;
}

.service-zone .svs-large {
	font-weight: 400;
	font-size: 30px;
}

.service-zone .svs-small {
	font-weight: 400;
	font-size: 49px;
	position: relative;
	top: -13px;
}

.img-search {
	display: inline-block;
	width: 100px;
	height: 100px;
	margin-left: 10px;
	border-radius: 100px;
	-moz-border-radius: 100px;
	-webkit-border-radius: 100px;
	background-color: rgb(58, 144, 200);
	color: #fff;
	line-height: 92px;
	text-align: center;
	text-decoration: none;
	float: left;
	cursor: pointer;
}

#svs-table * {
	color: white;
	text-align: left;
	font-size: 15px;
	font-weight: 400;
}

#svs-table span {
	font-size: 27px;
	font-weight: 700;
}

.search-title {
	width: 200px;
	padding-bottom: 30px;
}

.search-title a {
	text-decoration: none;
}

.search-title a:hover {
	text-decoration: underline;
}
#radioSt{
width:none;
height:none;

}
</style>
</head>
<body>
	<c:if test="${ not empty alertMsg }">
		<script>
			alert("${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>
	
	
	<div class="back-color">
		<!--가로 로고 자리 -->
		<div class="logo">
			<img src="resources/images/LOGO_WIDTH.png" alt="">
		</div>

		<div class="login-area">
			<div class="login-box">
			
				<div>
					<div class="login-title">LOGIN</div>
					<div id="text" style="font-size: 16px;">
						UNI&nbsp;<b>PORTAL&nbsp;SYSTEM</b>에 <br> 오신 것을 환영합니다
					</div>
				</div>
				<br>
				<br>
				
				<form action="login.me" id="log-input" method="post">
				
				<div id="divCheck" style="font-size:14px; margin-bottom:10px; margin-top:-25px;">
			<input id="radioSt1"  name="userDiv" type="radio" value="1" required>학생 
			<input id="radioSt2"  name="userDiv" type="radio" value="2">교수
				</div>
				
					
				
				 
			<script>
						$(function(){
							$('input[name=userDiv]:checked').val();
						})
					
						
			</script>
		 
			
				
					<input id="log-form" type="text" name="userNo" id="userNo" placeholder="  아이디"> 	<br>
					<input id="log-form" type="password" name="userPwd" id="userPwd" placeholder=" 비밀번호">
					<br>
					<button id="log-input" type="submit">로그인</button>
					
				</form>

				<br>
				<div class="login-title2">이용방법</div>

				<!--이용방법 설명이 나와있는 게시글 번호 링크쓰기-->
				<ul>
					<li>포털시스템 비밀번호 변경 안내</li>
					<li>포털 이용 안내</li>
					<li>학내 무선랜 와이파이 이용안내</li>
					<li>전자결재 이용안내</li>
					<li>비밀번호 찾기 이용방법</li>
				</ul>
			</div>
		</div>
		<!-- login area 끝 -->


		<div class="service-zone">
			<div>
				<div class="svs-large">UNI PORTAL SYSTEM</div>
				<div class="svs-small">
					<b>SERVICE</b> ZONE
				</div>
			</div>



			<table id="svs-table">
				<tbody style="border: 1px solid white;">
					<tr>
					<th style="padding-bottom: 30px;"><img class="img-search"
						src="resources/images/login_icon1.png" alt=""></th>
					<th style="width: 20px;"></th>
					<th class="search-title"><a href="findid"><span> 아이디 찾기 <br></span></a>
						아이디를 잊어버리셨나요?</th>
					</tr>

					<tr>
					<th style="padding-bottom: 30px;"><img class="img-search"
						src="resources/images/login_icon2.png" alt="아이콘"></th>
					<th style="width: 20px;"></th>
					<th class="search-title"><a href="findpwd"><span>비밀번호 찾기 <br></span></a>
						비밀번호를 잊어버리셨나요?</th>
					</tr>
					
					<tr>
					<th style="padding-bottom: 30px;"><img class="img-search"
						src="resources/images/login_icon3.png" alt=""></th>
					<th style="width: 20px;"></th>
					<th class="search-title"><a href=""><span> 비회원 이용 <br></span></a>
						게시글 조회만 가능합니다.</th>
					</tr>
					
				</tbody>
			</table>


		</div>


	</div>
	</div>


	</div>
</body>
</html>