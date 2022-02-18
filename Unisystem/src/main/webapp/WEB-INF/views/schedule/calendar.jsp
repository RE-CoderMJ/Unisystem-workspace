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
.page_title {
	color: rgb(15, 43, 80);
	font-size: 40px;
	font-weight: 800;
	margin-top: 50px;
	margin-bottom: 10px;
	margin-left: 31px;
}

.updel {
	font-size: 15px;
    position: relative;
    top: -49px;
    right: 44px;
    float: right;
}

.updel a {
	text-decoration: none;
	color: black;
	float: right;
}

.bo_content {
	width: 1270px;
	float: left;
	background-color: white;
	margin-left: 30px;
	padding-bottom: 50px;
	float:right;
}
.bo_content p{
	margin-left: 31px;
}
#calendar {
    max-width: 1100px;
    margin: 0 auto;
}

#external-events{
	float:left;
	width:15%;
	padding-right:10px;
	padding-left:20px;
}
#MyeventWrap{
	margin:auto;
	padding-left:40px;
	padding-right:40px;
	width:1100px;
}
.savebtn{
	float:right;
	margin-right:33px;
	padding-bottom:10px;
}
 
.moBtn{
	background-color: rgb(15, 43, 80);
	color: white;
	height: 40px;
	width: 80px;
	border-radius: 3px;
	font-size: 14px;
	cursor: pointer;
	border:none;
}

</style>

<body>

	<div id="outer">

		<!-- header.jsp 영역 -->
		<jsp:include page="../common/header.jsp" />

		<!-- sidebar.jsp 영역 
		  교수가 로그인하면 pmySidebar
		  학생이 로그인하면 smySidebar -->


		<div style="background-color: rgb(235, 242, 252); width: 1500px; margin:auto; margin-top:30px;">


			<div class="sidewrap">
				<jsp:include page="../student/smySidebar.jsp" />
			</div>


			<div class="bo_content" >
			<div id="result1"></div>
				<!-- title -->
				<div class="page_title">캘린더</div>
				<p>캘린더를 이용하여 <b style="color:rgb(231, 76, 60);">일정을</b> 등록해보세요</p>
				

				<div class="updel">
					<button class="btn btn-secondary .savebtn" data-toggle="modal" onclick="click_add();">일정등록</button>
				</div>
				<hr>
			  <div id="MyeventWrap">
    			<div id= 'calendar'></div>  
			  </div>
	
			</div>
			<!-- bo_content 끝 -->
	 
	    </div>
	  </div>
		</div>
		</div>

 <!-- jquery CDN -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- fullcalendar CDN -->
  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
  <!-- fullcalendar 언어 CDN -->
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
  	
	<script>
		function click_add() {
	    	var url = "schedulePopup";
	    	var name = "schedulePopup";
	    	var option = "width = 500, height = 600 left = 100, top=50,location=no";
	    	window.open(url,name,option);
	    }
		

		
		
		$(function(){
			
			$.ajax({
				   url:'getevent',
			       data:{euserNo : '${loginUser.userNo}'},
			       type:'POST',
			       dataType:'json',
			       success:function(data){
		    	       console.log(data);
		    	      
		    	       let eventArr = []; // [{title:xxx, start:xxxx, end:xxx}, {}]
		    	       for(let i in data){
		    	    	   let obj = {
		    	    			  	 groupId:data[i].eventNo,
		    	    			   	 title:data[i].eventTitle,
		    	    			   	  start:data[i].startDate,
		    	    			   	  end:data[i].endDate
		    	    			   	  };
		    	    	   eventArr.push(obj);
		    	       }
		    	       
			    	    // calendar element 취득
			  		     var calendarEl = $('#calendar')[0];
			  		     // full-calendar 생성하기
			  		     var calendar = new FullCalendar.Calendar(calendarEl, {
			  		        height: '700px', // calendar 높이 설정
			  		        expandRows: true, // 화면에 맞게 높이 재설정
			  		        slotMinTime: '08:00', // Day 캘린더에서 시작 시간
			  		        slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
			  		        // 해더에 표시할 툴바
			  		        headerToolbar: {
			  		          left: 'prev,next today',
			  		          center: 'title',
			  		          right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
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
			  		        eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
			  		          console.log(obj);
			  		        },
			  		        eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
			  		          console.log(obj);
			  		        },
			  		        select:
			  		          function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
			  		          var title = prompt('Event Title:');
			  		          if (title) {
			  		            calendar.addEvent({
			  		              title: title,
			  		              start: arg.start,
			  		              end: arg.end,
			  		              allDay: arg.allDay
			  		            })
			  		          }
			  		          calendar.unselect()
			  		        }, 
			  		       events: eventArr,
			  		       eventClick: function(data, jsEvent, view) {
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
			}) // ajax 끝 
			
		     
		});
		
	  
	</script>

	<br clear="both">
		<!-- footer.jsp-->
		<jsp:include page="../common/footer.jsp" />


	<!-- outer 끝 -->
  
  
 
 	

</body>
</html>


ajax