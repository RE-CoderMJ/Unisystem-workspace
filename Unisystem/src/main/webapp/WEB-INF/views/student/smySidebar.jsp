<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<style>
/*학생 마이페이지 왼쪽 메뉴바 작업*/
.wrap_sidebar {
	width: 200px;
	height: auto;
	min-height:700px;
	background-color: white;
	border-top: 1px solid lightgray;
	margin-bottom:30px;
	float:left;
}

.total_menu {
	font-weight: 900;
	color: rgb(15, 43, 80);
	font-size:18px;
	margin-top:15px;
	margin-left:15px;
}

.hr_style{
	background-color: lightgray;
	border:0;
	height: 2px;
}

.side_title {
	margin-bottom: 4px;
	margin-left: 10px; 
	cursor:pointer;
	height:30px;
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
	display:block;
	margin-left:30px;
	height: 20px;
}

p{
	display:none;
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
</head>


<body>
	<jsp:include page="../common/links.jsp"/>
	
	<!-- 학생 마이페이지 메뉴바  -->
	<div class="wrap_sidebar">

		<!-- 왼쪽 메뉴바-->
		<div class="sidebar">
			<div class="total_menu">마이페이지</div>

			<hr class="hr_style">

			<div class="side_title">
				<b>학적</b>
			</div>
			<p>
				<a href="list.st">- 내 정보조회</a>
			</p>

			<div class="side_title">
				<b>수업</b>
			</div>
			<p>
				<a href="">- 수강 시간표</a>
				<a href="studentClassList.me">- 내가 수강중인 강의</a>
			</p>

			<div class="side_title">
				<b>학적변동</b>
			</div>
			<p>
				<a href="">- 휴/복학 신청</a>
			</p>

			<div class="side_title">
				<b>상담</b>
			</div>
			<p>
				<a href="">- 상담신청</a>
			</p>
			
			<div class="side_title">
				<b>성적조회</b>
			</div>
			<p>
				<a href="">- 전체 성적 조회</a>
				<a href="">- 금학기 성적 조회</a>
			</p>
			
			<div class="side_title">
				<b>My 캘린더</b>
			</div>
			<p>
				<a href="">- 나의 일정</a>
				<a href="">- TO-DO LIST</a>
			</p>
			<div class="side_title">
				<b>시설물 예약</b>
			</div>
			<p>
				<a href="rsvdReading">- 열람실 예약</a>
				<a href="rsvdStudy">- 스터디실 예약</a>
			</p>
			
			<div class="side_title">
				<b>증명서</b>
			</div>
			<p>
				<a href="">- 증명서 발급</a>
				<a href="">- 증명서 보관함</a>
			</p>
			
			<div class="side_title">
				<b>쪽지</b>
			</div>
			<p>
				<a href="">- 받은 메시지</a>
				<a href="">- 보낸 메시지</a>
				<a href="">- 중요 메시지</a>
				<a href="">- 스팸 보관함</a>
			</p>
		</div>
	</div>
	
	<script>
		$(function(){
			$(".side_title").click(function(){
				
				const $p = $(this).next();
				
				if($p.css("display") == "none"){
					
					$(this).siblings("p").slideUp();
					
					$p.slideDown();
				}else{
					$p.slideUp();
				}
			})
		})
	</script>
</body>
</html>