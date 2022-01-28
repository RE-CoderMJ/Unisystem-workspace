<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
</head>

<style>
/*교수 마이페이지 왼쪽 메뉴바 작업*/
.wrap_sidebar {
	width: 180px;
	height: auto;
	background-color: white;
	border-top: 1px solid lightgray;
	margin-bottom: 30px;
}

.total_menu {
	margin: 10px;
	font-weight: 900;
	color: rgb(15, 43, 80);
	font-size: 18px;
	margin-top:15px;
	margin-left:10px;
}

.hr_style {
	background-color: lightgray;
	border: 0;
	height: 2px;
}

.side_title {
	margin-top: 38px;
	margin-bottom: 4px;
}

.mypage_title {
	margin-top: 10px;
	margin-bottom: 4px;
}

.sidebar a {
	text-decoration: none;
	color: black;
	margin: 10px;
	line-height: 20px;
	font-size: 14px;
}

.sidebar b {
	font-size: 15px;
	margin-left: 10px;
}

a:hover {
	color: rgb(26, 86, 162);
	font-weight: bolder;
}
</style>

<body>

	<!-- 교수 마이페이지 메뉴바  -->
	<div class="wrap_sidebar">

		<!-- 왼쪽 메뉴바-->
		<div class="sidebar">
			<div class="total_menu">마이페이지</div>

			<hr class="hr_style">

			<div class="mypage_title">
				 <b>기본정보</b> 
			</div>
			<div>
				<a href="">- 내 정보조회</a>
			</div>


			<div class="side_title">
				 <b>담당 학생 관리</b> 
			</div>
			<div>
				<a href="">- 담당 학생 조회</a>
			</div>
			<div>
				<a href="">- 학적변동 신청내역</a>
			</div>

			<div class="side_title">
				 <b>강의</b> 
			</div>
			<div>
				<a href="">- 강의시간표 조회</a>
			</div>
			<div>
				<a href="">- 진행강의 조회</a>
			</div>
			<div>
				<a href="">- 강의 관리</a>
			</div>

            <div class="side_title">
				 <b>상담</b> 
			</div>
			<div>
				<a href="">- 상담관리</a>
			</div>

			<div class="side_title">
				 <b>My 캘린더</b> 
			</div>
			<div>
				<a href="">- 나의 일정</a>
			</div>
			<div>
				<a href="">- TO-DO LIST</a>
			</div>
	  

			<div class="side_title">
				 <b>쪽지</b> 
			</div>
			<div>
				<a href="">- 받은 메시지</a>
			</div>
			<div>
				<a href="">- 보낸 메시지</a>
			</div>
			<div>
				<a href="">- 중요 메시지</a>
			</div>
			<div>
				<a href="">- 스팸 보관함</a>
			</div>

		</div>
	</div>
</body>
</html>