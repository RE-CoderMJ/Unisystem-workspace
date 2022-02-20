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
	font-size:15px;
}
.container1 h4{font-weight:700;font-size:20px;}
.container2 h4{font-weight:700;font-size:20px;}
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
	font-size:15px;
}

.class {
	grid-area: class;
	border-top: 2px solid #153e73;
	border-bottom: 1px solid #153e73;
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
.notice li{
	list-style-type:none;
	font:15px;
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

/*웹메일*/
.mail {
	grid-area: mail;
	border-top:2px solid #fcaf17;
	border-bottom:1px solid #fcaf17;
	position:relative;
}
.mail>h4{
	position:absolute;
	top:15px;
	left:17px;
}
#inbox{
	width:105px;
	height:105px;
	background-color:RGB(235,242,252);
	border-radius:200px;
	position:absolute;
	left:23px;
	top:52px;
	cursor:pointer;
}
#inbox-title{
	position:absolute;
	left:10px;
	top:115px;
	font-size:16px;
}
#inbox>img{
	object-fit: contain;
    width:65%;
    height:65%;
    position:absolute;
    left:20px;
	top:20px;
}
#line{
	width:0.1px;
	height:95px;
	border: 1px solid lightgray;
	position:absolute;
	left:142px;
	top:60px;
}
#unread{
	width:105px;
	height:105px;
	background-color:RGB(235,242,252);
	border-radius:200px;
	position:absolute;
	left:160px;
	top:52px;
	cursor:pointer;
}
#unread-title{
	position:absolute;
	left:0px;
	top:115px;
	font-size:16px;
}
#unread>img{
	object-fit: contain;
    width:65%;
    height:65%;
    position:absolute;
    left:20px;
	top:20px;
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
		<div class="class">
		<h4>수강중인 과목</h4>
		어쩌구 저쩌구
		</div>
		
		<!-- 메일 -->
		<div class="mail">
		<h4>웹메일</h4>
			<div id="inbox" onclick="location.href='webMail.inbox'">
				<img src="resources/images/inbox.png" alt="">
				<div id="inbox-title">받은메일<span style="color:blue; font-weight:900;">&nbsp;0</span>건</div>
			</div>
			
			<div id="line"></div>
			
			<div id="unread" onclick="location.href='webMail.unread'">
				<img src="resources/images/unread.png" alt="">
				<div id="unread-title">미확인메일<span style="color:blue; font-weight:900;">&nbsp;0</span>건</div>
			</div>
			
		</div>
		
		<!-- 시설예약 -->
		<div class="room">
		<h4>시설예약</h4>
		
		</div>
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
		<div class="baro">
		<h4>바로가기 서비스</h4>
		
		</div>
		
		<!-- 나의일정 -->
		<div class="calendar">
		<h4>나의 일정</h4>
		
		</div>
		
		<!-- 날씨 -->
		<div class="weather">
		<h4>WEATHER</h4>
		
		</div>
		
		<!-- 공지사항 -->
		<div class="notice">
		<h4>공지사항</h4>
		<ul>
			<li><a></a></li>
			<li><a></a></li>
			<li><a></a></li>	 
		</ul>
		
		
		</div>
		
		<!-- 미세먼지 -->
		<div class="dust">
		<h4>미세먼지</h4>
		
		</div>
		
		<!-- 학사일정 -->
		<div class="unischedule">
		<h4>학사일정</h4>
		
		</div>
		
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