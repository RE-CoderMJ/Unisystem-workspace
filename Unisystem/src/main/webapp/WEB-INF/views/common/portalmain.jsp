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

.container1 {
	display: grid;
	grid-gap: 10px;
	grid-template-columns: 590px 292px 292px;
	grid-template-rows: 210px;
	grid-template-areas: 'class mail room';
	margin-bottom: 10px;
}

.container1>div {
	background-color: white;
	padding: 20px;
	align-items: center;
	display: grid;
}

.container2 {
	display: grid;
	grid-gap: 10px;
	grid-template-columns: 292px 592px 292px;
	grid-template-rows: 256px 150px 256px;
	height: 100vh;
	grid-template-areas: 
	'inform baro calendar' 
	'weather notice calendar'
	'weather unischedule resite' 
	'dust unischedule store';
}
.gridWrap{
 	display: grid;
  	place-items: center;
	margin-top:50px;
}

.container2>div {
	background-color: white;
	padding: 20px;
	align-items: center;
	display: grid;
}

.class {
	grid-area: class;
	border-top: 2px solid #153e73;
	border-bottom: 1px solid #153e73;
}

.mail {
	grid-area: mail;
	border-top:2px solid #fcaf17;
	border-bottom:1px solid #fcaf17;
}

.room {
	grid-area: room;
	border-top:2px solid #fcaf17;
	border-bottom:1px solid #fcaf17;
}

.inform {
	grid-area: inform;
	background-color:rgb(17, 75, 148) !important;
	color:white;
	text-align:left;
}
.inform a{
color: white;
}
.inform a:hover{
color:white;
font-weight:800;
text-decoration:none;
}

.baro {
	grid-area: baro;
}

.calendar {
	grid-area: calendar;
}

.weather {
	grid-area: weather;
}

.notice {
	grid-area: notice;
}

.dust {
	grid-area: dust;
}

.unischedule {
	grid-area: unischedule;
}

.resite {
	grid-area: resite;
}

.store {
	grid-area: store;
}

#group{
background-color:rgb(41, 128, 185);
border:none;
border-radious:40px important;
height:50px;
color:white;
}

a{
text-decoration:none;
}
</style>



<body>

	<jsp:include page="../common/links.jsp" />
	<div>
		<jsp:include page="header.jsp" />

	</div>

	<div class="gridWrap">
	<div class="container1">
	
		<!-- 수강중인 과목 -->
		<div class="class">class</div>
		
		<!-- 메일 -->
		<div class="mail">mail</div>
		
		<!-- 시설예약 -->
		<div class="room">room</div>
	</div>

	<div class="container2">

		<!-- 개인정보 -->
		<div class="inform">
		 <h2><b>이망고</b>님</h2>
		 정보기술대학 <br>
		 정보통신공학과 (재학)
		 
		 <button id="group">UNI SYSTEM 학사그룹 </button>
		 
		 <div style="text-align:center;">
		 <a href="">비밀번호 변경</a>&nbsp;|&nbsp;<a href="">로그아웃</a>
		 </div>
		</div>
		
		<!-- 바로가기 -->
		<div class="baro">baro</div>
		
		<!-- 나의일정 -->
		<div class="calendar">calendar</div>
		
		<!-- 날씨 -->
		<div class="weather">weather</div>
		
		<!-- 공지사항 -->
		<div class="notice">notice</div>
		
		<!-- 미세먼지 -->
		<div class="dust">dust</div>
		
		<!-- 학사일정 -->
		<div class="unischedule">unischedule</div>
		
		<!-- 관련사이트 -->
		<div class="resite">resite</div>
		
		<!-- 스토어 -->
		<div class="store">store</div>
	</div>
	
	</div>
	<br="clear:both">
	<jsp:include page="footer.jsp" />

</body>
</html>