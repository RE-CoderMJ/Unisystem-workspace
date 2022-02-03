<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
</head>

<!-- datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
.modal-title{
	margin: auto;
    font-size: 30px;
    font-weight: 600;
    margin-right: -10px;
}
.modal-body{
margin:auto;
}
#modal-log{max-width: 400px;}
.modalText{
	width: 300px;
    resize: none;
    height: 30px;
}
#sendModal{
	margin:auto;
}
.moBtn{
	background-color: rgb(15, 43, 80);
	color: white;
	height: 40px;
	width: 80px;
	border-radius: 3px;
	font-size: 14px;
	cursor: pointer;
	position: relative;
	right: 0px;
	border:none;
}
#close{
	position: relative;
    top: 10px;
    right: 20px;
}
#memo{
	width: 300px;
    margin: auto;
    resize: none;
    margin-left: 50px;
}
</style>
<body>

<!-- eventModal 영역 -->
		<div class="modal" id="eventModal">
	  	<div class="modal-dialog" id="modal-log">
	    <div class="modal-content" style="border-radius: 80px;">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">일정 등록</h4>
	        <button type="button" class="close" id="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	      <form>
	      	<input class="modalText zTree-h1" type="text" placeholder="일정 제목을 입력하세요">
	      	
	      	<div>
	      		<h6>시작</h6>
	      	</div>
	      	<div>
	      		<input class = "zTree-h3 modalText date" id = "startDate" type = "text" name = "startDate" id = "startDate">
	      	</div>
	      	
	      	<div>
	      		<h6>종료</h6>
	      	</div>
	      	
	      	<div class = "domain">
				<input class = "modalText date" id = "endDate" type = "text" name = "endDate" id = "endDate">
			</div>
			
			<h6 class = "zTree-h3"> 메모 </h6>
			</div>
			<div class = "domain">
				<textarea class = "memo" id = "memo" name = "memo" rows = "7" cols = "20" placeholder="100글자까지 입력 가능합니다"></textarea> 
	      	</div>
	</form>
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="moBtn" id="sendModal" data-dismiss="modal">보내기</button>
	      </div>
	
	    </div>
	  </div>
	</div>

<script>
//datepicker
$(function() {
	$.datepicker.setDefaults({
		dateFormat : 'yy-mm-dd',
		showOtherMonths : true,
		showMonthAfterYear : true,
		changeYear : true,
		changeMonth : true,          
       yearSuffix: "년",
      	monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
      	monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
       dayNamesMin: ['일','월','화','수','목','금','토'],
       dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일']	
	});
	$("#startDate").datepicker();
	$("#endDate").datepicker();
	
	$("#startDate").datepicker('setDate', 'today');
	$("#endDate").datepicker('setDate', 'today');
});

</script>
</body>
</html>