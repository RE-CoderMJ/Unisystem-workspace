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
	width: 200px;
	height: auto;
	min-height: 750px;
	background-color: white;
	border-top: 1px solid lightgray;
	margin-bottom: 30px;
	float:left;
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
			<div class="total_menu">관리자 페이지</div>

			<hr class="hr_style">

			<div class="mypage_title">
				 <b>기본정보</b> 
			</div>
			<div>
				<a href="student.ad">- 학생 관리</a>
			</div>
			<div>
				<a href="professor.ad">- 교수 관리</a>
			</div>


			<div class="side_title">
				 <b>담당 교수 관리</b> 
			</div>
			<div>
				<a href="join.ad">- 담당 교수 변경</a>
			</div>
			
			<div class="side_title">
				 <b>학적변동</b> 
			</div>
			<div>
				<a href="">- 학적변동 신청내역</a>
			</div>

			<div class="side_title">
				 <b>강의</b> 
			</div>
			<div>
				<a href="clist.ad">- 강의 신청내역</a>
			</div>

            <div class="side_title">
				 <b>시설물 관리</b> 
			</div>
			<div>
				<a href="rsvdReading.ad">- 열람실 관리</a>
			</div>
			<div>
				<a href="rsvdStudy.ad">- 스터디룸 관리</a>
			</div>

			<div class="side_title">
				 <b>공지사항</b> 
			</div>
			<div>
				<a href="">- 공지사항 관리</a>
			</div>
		

			<div class="side_title">
				 <b>학사일정</b> 
			</div>
			<div>
				<a href="">- 학사일정 관리</a>
			</div>

		</div>
	</div>
</body>
</html>