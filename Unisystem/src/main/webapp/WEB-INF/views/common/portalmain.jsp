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
	height:460px;
	grid-template-columns: 292px 592px 292px;
	grid-template-rows: 256px 170px 130px;
	grid-template-areas: 
	'inform baro calendar' 
	'weather notice calendar'
	'weather unischedule resite' ;
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

.class a{
	color : black;
}

.class ul{
	margin:0;
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

.calendar a{
text-decoration:none;
color:black;
}

.calendar a:hover{
text-decoration:none;
color:black;
font-weight:600;
}

.notice {
	grid-area: notice;
}
.notice li{
	font:15px;
}
.notice a{
text-decoration:none;
color:black;
 }

.notice a:hover{
text-decoration:none;
color:black;
font-weight:700;
}

#group{
background-color:rgb(41, 128, 185);
border:none;
height:50px;
color:white;
font-size:16px;
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


#calendar{
width:260px;
font-size:10px;
}

/* 시설 예약 */
.room {
	grid-area: room;
	border-top:2px solid #fcaf17;
	border-bottom:1px solid #fcaf17;
	position:relative;
}
.room>h4{
	position:absolute;
	top:15px;
	left:17px;
}
#reading{
	width:105px;
	height:105px;
	background-color:RGB(235,242,252);
	border-radius:200px;
	position:absolute;
	left:23px;
	top:52px;
	cursor:pointer;
}
#reading-title{
	position:absolute;
	left:10px;
	top:115px;
	font-size:16px;
}
#reading>img{
	object-fit: contain;
    width:65%;
    height:65%;
    position:absolute;
    left:20px;
	top:20px;
}
#study{
	width:105px;
	height:105px;
	background-color:RGB(235,242,252);
	border-radius:200px;
	position:absolute;
	left:160px;
	top:52px;
	cursor:pointer;
}
#study-title{
	position:absolute;
	left:0px;
	top:115px;
	font-size:16px;
}
#study>img{
	object-fit: contain;
    width:65%;
    height:65%;
    position:absolute;
    left:20px;
	top:20px;
}
/* 날씨 */
#weather{
	padding:0px;
	width:100%;
	height:100%;
	display:block;
	border:2px solid #BDE0FE;
}

#one{
	width:100%;
	height:70%;
}
#two{
	width:100%;
	height:30%;
	background:#BDE0FE; 
	padding:10px;
	font-size:17px;
	padding:12px;
	align:center;
	padding-left:35px;
}
#two>p{
	display:inline;
	padding:5px;
}
#weatherIcon{
	margin-left:40px;
	font-size:70px;
}
#city{
	padding:20px;
}
</style>
 <!-- jquery CDN -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- fullcalendar CDN -->
  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
  <script class="cssdesk" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.0/moment.min.js" type="text/javascript"></script>
  <!-- weather -->  	
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/weather-icons/2.0.12/css/weather-icons.min.css" integrity="sha512-r/Gan7PMSRovDus++vDS2Ayutc/cSdl268u047n4z+k7GYuR7Hiw71FsT3QQxdKJBVHYttOJ6IGLnlM9IoMToQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<body>
	<jsp:include page="../common/links.jsp" />
	<div>
		<jsp:include page="header.jsp" />

	</div>

	<div class="gridWrap">
	<div class="container1">
	
		<!-- 수강중인 과목 -->
		<div class="class" style="overflow:auto; width:auto; height:auto;">
			<!-- 학생일경우 -->
			<c:if test="${ loginUser.userDiv eq  1}">
				<h4 style="margin-bottom:20px;">수강중인 과목</h4>
				<c:forEach var="l" items="${ list }" >
		            <ul class="trs">
		            	<li id='classKorName' style="padding:none;"><a href="lectureMain.stu?lno=${l.classCode}" > ${ l.classKorName}</a></td> 	       
		            </ul>
				</c:forEach>
			</c:if>
			<c:if test="${ loginUser.userDiv eq  2}">
				<h4>진행중인 과목</h4>
				<c:forEach var="l" items="${ list }" >
		            <ul class="trs">
		            	<li id='classKorName' style="padding:none;"><a href="lectureProMain.stu?lno=${l.classCode}" > ${ l.classKorName}</a></td> 	       
		            </ul>
				</c:forEach>
			</c:if>
			
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
			<div id="reading" onclick="location.href='rsvdReading'">
				<img src="resources/images/reading_icon.png" alt="">
				<div id="reading-title">열람실 예약</div>
			</div>
			
			<div id="line"></div>
			
			<div id="study" onclick="location.href='rsvdStudy'">
				<img src="resources/images/study_icon.png" alt="">
				<div id="study-title">스터디룸 예약</div>
			</div>
		</div>
	</div>

	<div class="container2">

		<!-- 개인정보 -->
		<div class="inform">
		 <h2><b>${loginUser.korName}</b></h2>
		 <c:choose>
		<c:when test="${loginUser.userDiv eq 1}">
		 ${loginUser.studUniv} <br>
		 ${loginUser.studDepartment} 
		 	
		 	<c:if test="${loginUser.studStatus eq 1}">
		 		(재학)
		 	</c:if>
		 	<c:if test="${loginUser.studStatus eq 2}">
		 		(휴학)
		 	</c:if>
		 	<c:if test="${loginUser.studStatus eq 3}">
		 		(졸업)
		 	</c:if>
		 	<c:if test="${loginUser.studStatus eq 4}">
		 		(자퇴)
		 	</c:if>
		 	
		 </c:when>
		<c:when test="${loginUser.userDiv eq 2}">
		 ${loginUser.profUniv} <br>
		 ${loginUser.profDepartment} (재직)
		</c:when>
		
		<c:when test="${loginUser.userDiv eq 3}">
		 관리자전용 <br>
		 관리페이지입니다.
		</c:when>
		 <c:otherwise>
		 비회원페이지<br>
		로그인 후 이용해주세요
		 </c:otherwise>
		 
		 </c:choose>
		 
		  <span id="group" style="line-height: 38px;" class="badge badge-pill badge-primary">UNI SYSTEM 학사그룹</span>
		 
		  
		   <!--<button id="group" style="">UNI SYSTEM 학사그룹 </button>  -->
		 
		 <div style="text-align:center;">
		 <a href="">비밀번호 변경</a>&nbsp;|&nbsp;<a href="logout.me">로그아웃</a>
		 
		
		 </div>
		</div>
		
		<!-- 바로가기 -->
		<div class="baro">
		<h4>바로가기 서비스</h4>
		
		</div>
		
		<!-- 나의일정 -->
		<div class="calendar">
		<h4><a href="calendar">나의 일정</a></h4>
		<div id='calendar'></div>  
		</div>
		
		<!-- 날씨 -->
		<div id="weather">
		<!-- <h4>WEATHER</h4> -->
				<div id="one">
					<div id="weatherIcon" style="float:left; width:40%;">
					</div>
					<div id="city" style="text-align:right">
						 <h2 style="font-weight:800"></h2>
						<p>유니대학교, 서울<p>
					</div>
				</div>
				<div id="two">
					습도 : <p id="humidity"></p><i class="wi wi-humidity"></i> &nbsp;&nbsp;&nbsp;&nbsp; 바람 : <p id="wind"></p><i class="wi wi-windy"></i>
				</div>
		</div>
		
		<!-- 공지사항 -->
		<div class="notice">
		<h4>공지사항</h4>
		<ul>
			<li><a href="http://localhost:8009/uni/detail.nbo?bno=932">Microsoft 365 Education 이용 안내</a></li>
			<li><a href="http://localhost:8009/uni/detail.nbo?bno=929">스마트메시지 앱알림 설정 방법 안내</a></li>
			<li><a href="http://localhost:8009/uni/detail.nbo?bno=931">학내 무선랜 와이파이(Wi-Fi)접속방법 안내</a></li>
			<li><a href="http://localhost:8009/uni/detail.nbo?bno=930">교육용 소프트웨어 교외 사용 안내(200422 수정)</a></li>	 
		</ul>
		
		</div>
		
	
	</div>
	</div> <!-- gridWrap -->

<script>

$(function(){
	
	$.ajax({
		   url:'getevent',
	       data:{euserNo : '${loginUser.userNo}'
	    	   	 ,tuserNo : '${loginUser.userNo}'},
	       type:'POST',
	       dataType:'json',
	       success:function(data){
    	       console.log(data);
    	      
    	       let eventArr = []; // [{title:xxx, start:xxxx, end:xxx}, {}]
    	       
    	       let todoArr =[];
    	       
    	       for(let i in data.eventList){
    	    	   let obj = {
    	    			  	  groupId:data.eventList[i].eventNo,
    	    			   	  title:data.eventList[i].eventTitle,
    	    			   	  start:data.eventList[i].startDate,
    	    			   	  end:data.eventList[i].endDate
    	    			   	  };
    	    	   eventArr.push(obj);
    	       }
    	       
    	       for(let i in data.todoList){
					let obj = {
							groupId:data.todoList[i].todoNo,
							title:data.todoList[i].todoContent,
							start:data.todoList[i].todoDate,
							allDay : true 
					};
					todoArr.push(obj);
				}	
    	       
    	       let arr = eventArr.concat(todoArr);
    	       console.log(arr);
    	       
	    	    // calendar element 취득
	  		     var calendarEl = $('#calendar')[0];
	  		     // full-calendar 생성하기
	  		     var calendar = new FullCalendar.Calendar(calendarEl, {
	  		        height: '350px', // calendar 높이 설정
	  		        expandRows: true, // 화면에 맞게 높이 재설정
	  		        slotMinTime: '08:00', // Day 캘린더에서 시작 시간
	  		        slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
	  		        // 해더에 표시할 툴바
	  		        headerToolbar: {
	  		          left: 'prev,next today',
	  		          right: 'dayGridMonth'
	  		        },
	  		        initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
	  		        navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
	  		        editable: true, // 수정 가능 
	  		        selectable: true, // 달력 일자 드래그 설정가능
	  		        nowIndicator: true, // 현재 시간 마크
	  		        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
	  		        locale: 'ko', // 한국어 설정
	  		        eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
	  		          console.log(obj);
	  		        },
	  		      eventDrop: function(data, delta, revertFunc) { //이벤트 수정
	  		    	  
	  				 let updateStartDate = data.event._instance.range.start;
	  				 let updateStartStr =  (new Date(updateStartDate)).toISOString().slice(0, 10)
	  			   
	  				 let updateEndDate = data.event._instance.range.end;
	  				 let updateEndStr = (new Date(updateEndDate)).toISOString().slice(0, 10)
		  			 
	  		       	 // let updateStartStr = updateStartDate.getFullYear() + "-" + (updateStartDate.getMonth() + 1) + "-" + updateStartDate.getDate();
	  		      	 // let updateEndStr = updateEndDate.getFullYear() + "-" + (updateEndDate.getMonth() + 1) + "-" + updateEndDate.getDate();
	  		    	  
	  		    	 console.log(updateStartStr);
	  		    	 
			  			$.ajax({
			  			  type: 'POST',  
			  			  dataType:'json',
			  			  url: "updateSchedule",
			  			  data: {
			  				  eventNo:data.event._def.groupId, 
			  				  eventTitle:data.event._def.title, 
			  				  startDate:updateStartStr, 
			  				  endDate:updateEndStr
			  				  },
			  				  success:function( result ) {
			  					  console.log(result)
			  					  if(result == 1){
			  					  }
			  				  }
			  				  });
	  			  } , 
	  			 
	  			  
	  		     
	  		        eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
	  		          console.log(obj);
	  		        },
	  		        
	  		        select: function (start, end, allDay) {             
				        var startFix= moment($.fullCalendar.formatDate(start, 'YYYY-MM-DD'));               
				        newCalendar(startFix);           
	  		        }, 

	  		       
	  		       events:arr,
	  		       
	  		       eventClick: function(data, jsEvent, view) { //이벤트 삭제
	  		    	   console.log(data);
	 				if(!confirm("일정 '"+ data.event._def.title+"'을 삭제하시겠습니까?"))
	 				{
	 					return false;
	 				}else{
	 					
	 				$.ajax({
	 				  type: 'POST',  
	 				  dataType:'json',
	 				  url: "deleteSchedule",
	 				  data: {eventNo: data.event._def.groupId},
	 				  success:
	 					function(result){
	 					   if(result == 1){
	 						alert('삭제되었습니다.');
	 						location.reload();
	 						}
	 				  }
	 				});
	 				}
	 			  }
	  		        
	  		        
	  		      });
	  		      // 캘린더 랜더링
	  		      calendar.render();
    	         
	      } // success:function 끝
	})  // ajax 끝  
	
	
	$(function(){
		
		weather();
	
	})
	
	function weather(){
	
		var apiURL = "https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=00a7ff3d1d0d1e0074be2b3daed50c29";
		
		$.ajax({
			url:apiURL,
			dataType:"json",
			type:"get",
			async:"false",
			success:data => {
				var main = "";		
				var icon = data.weather[0].icon;
				var disc = data.weather[0].description;
				
				//day
				if(icon == '01d'){ //맑음
				 	main = "<i class='wi wi-day-sunny'></i>";
				}else if(icon == '02d'){ //보통
					main = "<i class='wi wi-day-cloudy'></i>";
				}else if(icon == '03d'){ //조금 흐림
					main = "<i class='wi wi-cloud'></i>";
				}else if(icon == '04d'){ //흐림
					main = "<i class='wi wi-cloudy'></i>";
				}else if(icon == '09d'){ //흐린비
					main = "<i class='wi wi-hail'></i>";
				}else if(icon == '10d'){ //맑은비
					main = "<i class='wi wi-day-rain'></i>";
				}else if(icon == '11d'){ //천둥번개
					main = "<i class='wi wi-day-thunderstorm'></i>";
				}else if(icon == '13d'){ //눈
					main = "<i class='wi wi-day-snow-wind'></i>";
				}else if(icon == '50d'){ //안개
					main = "<i class='wi wi-fog'></i>";
				}
				//night
				else if(icon == '01n'){ //맑음
					main = "<i class='wi wi-night-clear'></i>";
				}else if(icon == '02n'){ //보통
					main = "<i class='wi wi-night-alt-cloudy'></i>";
				}else if(icon == '03n'){ //조금 흐림
					main = "<i class='wi wi-cloud'></i>";
				}else if(icon == '04n'){ //흐림
					main = "<i class='wi wi-cloudy'></i>";
				}else if(icon == '09n'){ //흐린비
					main = "<i class='wi wi-hail'></i>";
				}else if(icon == '10n'){ //맑은비
					main = "<i class='wi wi-night-alt-hail'></i>";
				}else if(icon == '11n'){ //천둥번개
					main = "<i class='wi wi-day-thunderstorm'></i>";
				}else if(icon == '13n'){ //눈
					main = "<i class='wi wi-night-snow'></i>";
				}else if(icon == '50n'){ //안개
					main = "<i class='wi wi-fog'></i>";
				}
				
				$("#weatherIcon").html(main);
				$("#city>h2").text(Math.floor(data.main.temp- 273.15) + "°C");
				$("#humidity").text(data.main.humidity);
				$("#wind").text(data.wind.speed);
				
				
			},error:() => {
				console.log("날씨 통신 실패");
			}
		})
	}	
	 
}); //$function 끝

</script>
 
	<jsp:include page="footer.jsp" />
</body>
</html>