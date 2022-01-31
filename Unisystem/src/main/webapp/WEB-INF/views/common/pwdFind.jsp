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

/*pwd찾기(pwdfind)*/

.back-color {
	width: 1500px;
	height: 1300px;
	background-color: rgb(235, 242, 252);
	background-size: 1500px 1300px;
}

.logo {
	height: 150px;
}

/*로그인 영역*/
.login-area {
	margin-left: 297px;
}

.login-box {
	width: 465px;
	height: 480px;
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

#log-input {
	text-align: center;
}

#log-input td {
	text-align: center;
	font-size: 19px;
	font-weight: 600;
	padding-bottom: 12px;
}

#log-input input {
	height: 35px;
	width: 220px;
	margin-bottom: 15px;
	border: none;
	border-bottom: solid 1px lightgray;
	margin-left: 30px;
	width: 230px;
	font-size: 14px;
	margin-top:30px;
}

#log-input label{
	position:relative;
	top:16px;
}
#log-input button {
	width: 200px;
	height: 50px;
	margin-left: 10px;
	border-radius: 10px;
	background-color: rgb(44, 62, 80);
	font-size: 18px;
	font-weight: 400;
	color: #fff;
	text-align: center;
	text-decoration: none;
	margin-top: 50px;
	position: relative;
	border: none;
	cursor: pointer;
}

input:focus {
	outline: none;
}

.login-title2 {
	font-size: 35px;
	margin-top: 10px;
	font-weight: 900;
	color: rgb(41, 128, 185);
	margin-bottom: 40px;
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

</style>
<body>
	<div class="back-color">
		<!--가로 로고 자리 -->
		<div class="logo">
			<img src="" alt="">
		</div>

		<div class="login-area">
			<div class="login-box">

				 <div class="login-title2">비밀번호 찾기</div>

                    <form id="log-input" action="" method="post">
                            <table>

                                <tr>
                                    <td> <label for="">이메일</label></td>
                                    <th> <input type="text" name="" placeholder="이메일을 입력하세요" >  </th>
                                </tr>

                                <tr>
                                    <td><label for="">연락처</label></td>
                                    <th><input type="text" name="" placeholder="연락처를 입력하세요 ( - 포함)" > </th>
                                </tr>


                            </table>   
                    <button type="submit">비밀번호 재설정</button>  
                    </form>


				<br>

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


			<!-- 아이디찾기 비밀번호 찾기 시작!-->
			
			<table id="svs-table">
				<tbody style="border: 1px solid white;">

					<th style="padding-bottom: 30px;"><img class="img-search"
						src="resources/images/login_icon1.png" alt=""></th>
					<th style="width: 20px;"></th>
					<th class="search-title"><a href=""><span> 아이디 찾기 <br></span></a>
						아이디를 잊어버리셨나요?</th>


					<tr></tr>
					<th style="padding-bottom: 30px;"><img class="img-search"
						src="resources/images/login_icon2.png" alt="아이콘"></th>
					<th style="width: 20px;"></th>
					<th class="search-title"><a href=""><span>비밀번호 찾기 <br></span></a>
						비밀번호를 잊어버리셨나요?</th>

					<tr></tr>
					<th style="padding-bottom: 30px;"><img class="img-search"
						src="resources/images/login_icon3.png" alt=""></th>
					<th style="width: 20px;"></th>
					<th class="search-title"><a href=""><span> 비회원 이용 <br></span></a>
						게시글 조회만 가능합니다.</th>

				</tbody>
			</table>

		</div>


	</div>
	</div>


	</div>
</body>
</html>