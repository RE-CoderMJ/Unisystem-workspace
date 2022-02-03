<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
</head>

<link href='resources/fullcalendar/main.min.css' rel='stylesheet' />
<script src="resources/fullcalendar/main.min.js"></script>
<script src="resources/fullcalendar/jquery.min.js"></script>
<script src="resources/fullcalendar/ko.js"></script>


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
	margin-top: 51px;
	width: 1100px;
	float: left;
	background-color: white;
	margin-left: 150px;
	padding-bottom: 50px;
	position: relative;
	top: -1120px;
	left: 100px;
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
	float:left;
	width:1100px;
}
.savebtn{
	float:right;
	margin-right:33px;
	padding-bottom:10px;
}


</style>

<body>

	<div id="outer">


		<!-- header.jsp 영역 -->
		<jsp:include page="../common/header.jsp" />

		<!-- sidebar.jsp 영역 
		  교수가 로그인하면 pmySidebar
		  학생이 로그인하면 smySidebar -->


		<div style="background-color: rgb(235, 242, 252); width: 1500px;">


			<div class="sidewrap">
				<jsp:include page="../student/smySidebar.jsp" />
			</div>


			<div class="bo_content">

				<!-- title -->
				<div class="page_title">캘린더</div>
				<p>캘린더를 이용하여 <b style="color:rgb(231, 76, 60);">일정을</b> 등록해보세요</p>
				

				<div class="updel">
					<button class="btn btn-secondary .savebtn" data-toggle="modal" onclick="click_add();" data-target="#eventModal">일정등록</button>
				</div>
				<hr>
			  <div id="MyeventWrap">
    			<div id= 'calendar'></div>  
			  </div>
	
			</div>
			<!-- bo_content 끝 -->


		</div>
		<!-- background-color -->
	<script>
	  document.addEventListener('DOMContentLoaded', function() {
	    var Calendar = FullCalendar.Calendar;
	    var Draggable = FullCalendar.Draggable;

	    var containerEl = document.getElementById('external-events');
	    var calendarEl = document.getElementById('calendar');
	    var checkbox = document.getElementById('drop-remove');

	    // initialize the external events

	    new Draggable(containerEl, {
	      itemSelector: '.fc-event',
	      eventData: function(eventEl) {
	        return {
	          title: eventEl.innerText
	        };
	      }
	    });

	    // initialize the calendar

	    var calendar = new Calendar(calendarEl, {
	      headerToolbar: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'dayGridMonth,timeGridWeek,timeGridDay'
	      },
	      editable: true,
	      droppable: true, // this allows things to be dropped onto the calendar
	      drop: function(info) {
	        // is the "remove after drop" checkbox checked?
	        if (checkbox.checked) {
	          // if so, remove the element from the "Draggable Events" list
	          info.draggedEl.parentNode.removeChild(info.draggedEl);
	        }
	      }
	    });

	    calendar.render();
	  });
	  
	  // 초기설정값
    document.addEventListener('DOMContentLoaded', function() {
      var calendarEl = document.getElementById('calendar');
      var calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        locale:'ko'
      });
      calendar.render();
    });
	  
	  //url처리후 적용하기
	  function click_add(){
		  	var url = "schedulePopup";
			var name = "schedulePopup";
			var option = "width = 300, height = 400,location=no";
			window.open(url,name,option)
	  };
	  
	 
</script>

	<br clear="both">
		<!-- footer.jsp-->
		<jsp:include page="../common/footer.jsp" />


	</div>
	<!-- outer 끝 -->
 
 
 	

</body>
</html>