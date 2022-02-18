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
    text-align: center;
    margin-bottom: 17px;
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
 
}
.domain{
margin:auto;
resize:none;
 
}
</style>
<body>

<!-- eventModal 영역 -->
 
	<form id="scheduleData" action="insertSchedule" method="post">
	<div style="margin:auto; width:400px;">
	
		<div class="modal" id="eventModal">
	  	<div class="modal-dialog" id="modal-log">
	    <div class="modal-content" style="border-radius: 80px; text-align: center;">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">일정 등록</h4>
	      </div>
	
	      <!-- Modal body -->
	     	
	      <div class="modal-body">
	      
	     	 <input type="hidden" id="euserNo" name="euserNo" value="${loginUser.userNo}" required/>
	     	 
	      	<input class="modalText zTree-h1" type="text" id="eventTitle" name="eventTitle" placeholder="일정 제목을 입력하세요">
	      	
	      	<div>
	      		<h4>시작</h4>
	      	</div>
	      	<div>
	      		<input class = "zTree-h3 modalText date" id="startDate" type="text" name="startDate" id = "startDate" required/>
	      	</div>
	      	
	      	<div>
	      		<h4>종료</h4>
	      	</div>
	      	
	      	<div class = "domain">
				<input class ="modalText date" id = "endDate" type ="text" name="endDate" id = "endDate" required/>
			</div>
			
			<h4 class = "zTree-h3"> 메모 </h4>
			</div>
			<div class = "domain">
				<textarea class ="memo" id ="eventContent" name="eventContent" style="width: 298px;height:150px; resize:none;">
				</textarea> 
				<input type="hidden" name="alldayYN" value="N" />
				<input type="hidden" name="deleteYN" value="N" />
	      	</div>
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="moBtn" id="sendModal" onclick="click_ok();">보내기</button>
	      </div>
	
	</div>
	    </div>
	  </div>
	</div>
</form>
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



$.fn.serializeObject = function(){
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
    	var name = $.trim(this.name),
    		value = $.trim(this.value);
    	
        if (o[name]) {
            if (!o[name].push) {
                o[name] = [o[name]];
            }
            o[name].push(value || '');
        } else {
            o[name] = value || '';
        }
    });
    return o;
};

function saveSchedule()
{
	var eventTitle = $("#eventTitle").val();
	var startDate = $("#startDate").val();
	var endDate = $("#endDate").val();

	if(calendarTitle="")
	{
		alert("일정 명칭을 입력해 주세요.");
		return false;
	}
	if(startDate="")
	{
		alert("시작 날짜를 입력해 주세요.");
		return false;
	}
	if(endDate="")
	{
		alert("마침 날짜를 입력해 주세요.");
		return false;
	}

	 
}

function click_ok(){

	var scheduleData = JSON.stringify($('form #scheduleData').serializeObject());
	
	$.ajax({
	  data: {
		  euserNo:'${loginUser.userNo}',
		  eventTitle:$("#eventTitle").val(),
		  eventContent:$("#eventContent").val(),
		  startDate:$("#startDate").val(),
		  endDate:$("#endDate").val()
		  },
	  url: "insertSchedule",
	  type:"POST",
	  dataType:"JSON",
	  success:function(map){
		  	 alert('등록이 완료되었습니다!');
			  	opener.parent.location.reload();
			  	window.close();
		  },
	  error:function(data){
		  opener.parent.location.reload();
		  window.close();
	  }
	});
};

</script>
</body>
</html>