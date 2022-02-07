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
/*학생 강의페이지 왼쪽 메뉴바 작업*/
.wrap_sidebar {
	width: 180px;
	height: auto;
	background-color: white;
	border-top: 1px solid lightgray;
	margin-bottom:30px;
	padding-bottom:100px;
}

.total_menu {
	margin: 10px;
	font-weight: 900;
	color: rgb(15, 43, 80);
	font-size: 20px;
	margin-top:15px;
	margin-left:15px;
}

.hr_style{
	background-color: lightgray;
	border:0;
	height: 2px;
}

.side_title {
	margin-top: 38px;
	margin-bottom: 4px;
	margin-left: 10px;
}

.classpage_title {
	margin-top: 10px;
	margin-bottom: 4px;
	margin-left: 10px;
}
.sidebar a {
	text-decoration: none;
	color: black;
	margin: 10px;
	line-height: 20px;
	font-size: 14px;
}

.sidebar b{
	font-size:15px;
	margin-left:10px;
}

a:hover {
	color: rgb(26, 86, 162);
	font-weight:bolder;
}
</style>

<body>

	<!-- 학생 강의페이지 메뉴바  -->
	<div class="wrap_sidebar">

		<!-- 왼쪽 메뉴바-->
		<div class="sidebar">
			<div class="total_menu">강의실 홈</div>

			<hr class="hr_style">

			<div class="classpage_title">
				 <b>강의정보</b> 
			</div>
			<div style="margin-left: 3px;">
				<a href="lecturePlan.stu">- 강의 계획표</a>
			</div>


			<div class="side_title">
				 <b>성적/출석관리</b> 
			</div>
			<div style="margin-left: 3px;">
				<a href="lectureAtt.stu">- 온라인 출석부</a>
			</div>
			<div style="margin-left: 3px;">
				<a href="lectureGrade.stu">- 성적 조회</a>
			</div>

			<div class="side_title">
				 <b>자료실</b> 
			</div>
			<div style="margin-left: 3px;">
				<a href="lectureMat.stu">- 수업자료실</a>
			</div>
			<div style="margin-left: 3px;">
				<a href="lectureVideoMat.stu">- 영상자료실</a>
			</div>
			<div style="margin-left: 3px;">
				<a href="lectureHomework.stu">- 과제 업로드</a>
			</div>


		</div>
	</div>
</body>
</html>