<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="resources/css/pages/wrapperStyle.css" rel="stylesheet">
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<style>	
	.topBar{
		margin-top:30px;
		clear:both;
		width:100%;
		height:70px;
		border-top:3px solid rgb(26, 86, 162);
		border-bottom:3px solid rgb(26, 86, 162);
		text-align:center;
	}
	.topBar>span{
		margin:25px;
		font-size:20px;
		line-height:70px;
		color:gray;
	}
	#studyRoom{
		font-weight:700;
		color:rgb(26, 86, 162);
	}
	.timetableBox{
		width:1100px;
		height:auto;
		margin:auto;
	}
	.timetableBox>div{
		margin-top:50px;
		margin-bottom:30px;
	}
	.inputBox{
		margin-right:40px;
		width:380px;
		padding:0px 20px;
	}
	.table th{
		background:red;
		background:rgb(235, 235, 235);
		text-align:center;
	}
	.table td{
		text-align:center;
	}
	.timetable{
		width:650px;
	    padding-left:15px;
	}
	.blueLabel{
		width:340px;
		height:8px;
		background:rgb(15, 43, 80);
	}
	#map{
		width:340px;
		border:1px solid lightgray;
		margin-bottom: 40px;
	}
	#map>img{
		width:100%;
	    transition: all 0.2s linear;
	}
	#map:hover img {
  	transform: scale(1.4);
	}
	.timetableBox th, td{
		border:1px solid lightgray !important;
	}
	.submitBtn{
		background:rgb(21, 62, 115);
	    width:300px;
	    height:90px;
	    margin:auto;
	    margin-top:50px;
	    border-radius:7px;
	}
	.submitBtn>p{
		color:white;
		font-size:30px;
		font-weight:700;
		text-align:center;
  		line-height:90px;	
	}
	.select{
		width:100%;
		border:none;
	}
	*:focus {
    outline: none;
	}
	.timetableBox{
		width:650px;
		height:auto;
		float:left;
	}
	#box{
		width:1060px;
		height:auto;
		margin:auto;
	}
	.logTop{
		margin-top:23px;
		width:510px;
		height:70px;
		padding:15px 15px 15px 0px;
		position:relative;
	}
	.logList{
		width:100%;
		height:840px;
		overflow:auto;
		overflow-x:hidden;
		margin-bottom:30px;
	}
	#reset{
		position:absolute;
		right:-36px;
	}
	#rsvd{
		position:absolute;
		right:60px;
	}
	.log{
		width:590px;
		height:auto;
		float:left;
		margin:12px;
		padding:20px;
	}
	#search{
		border:1px solid lightgray;
	}
	.timetable{
		margin-top:40px;
		padding:30px 10px 30px 30px;
	}
	#rsvdInfo input{
		border:none;
	}
</style>
</head>
<body>
	<jsp:include page="../common/links.jsp"/>
	<jsp:include page="../common/header.jsp" />
		
	<div id="wrap">
		<div id="sidebar" style="float:left;"><jsp:include page="../common/adminSidebar.jsp" /></div>
		<div id="content" style="float:left;">
			<div class="topBox">
				<div class="pageName"><p>마이페이지&nbsp;>&nbsp;시설물 관리&nbsp;>&nbsp;</p><p style="color:black; font-size:24px; font-weight:900;">&nbsp;스터디룸 관리</p></div>
			</div>
			<div class="topBar">
				<span id="readingRoom"><a href="rsvdReading.ad">열람실 예약</a></span><span id="studyRoom"><a>스터디룸 예약</a></span>
			</div>
	
						
			<!-- The Modal -->
			<div class="modal" id="rsvdRoom">
			  <div class="modal-dialog">
			    <div class="modal-content">
			
			      <!-- Modal Header -->
			      <div class="modal-header">
			        <h4 class="modal-title">스터디룸 차단하기</h4>
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			      </div>
			
			      <!-- Modal body -->
	        	<form id="studyForm" action="insert.sr">
			      <div class="modal-body">
					<div id="rsvdInfo">			
						<table class="table table-bordered">
							<tr>
								<th width="100">사용인원</th>
								<td width="150">
									<select name="rsvdNum" class="select">
										<option value="1">1명</option>
										<option value="2">2명</option>
										<option value="3">3명</option>
										<option value="4">4명</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>사용일자</th>
								<td style="text-align:left"><input id="today" type="text" disabled></td>
							</tr>
							<tr>
								<th>사용공간</th>
								<td> 
									<select id="room" name="rsvdSpace" class="select">
										<option value="A">A Room</option>
										<option value="B">B Room</option>
										<option value="C">C Room</option>
										<option value="D">D Room</option>
									</select>
								</td>
							</tr>
							<tr>
								<th rowspan="2">사용시간</th>
								<td>
									<input type="text" name="rsvdStart" maxlength="2" placeholder="00시 (24시간 기준 ) 시작시간">
								</td>
							</tr>
							<tr>
								<td>
									<input type="text" name="rsvdEnd" maxlength="2" placeholder="00시 (24시간 기준) 종료시간">
								</td>
							</tr>
						</table>
					</div>
			      </div>
			      <input type="hidden" name="rsvdNo" value="0">
					<input type="hidden" name="studNo" value="9999">
			      <!-- Modal footer -->
			      <div class="modal-footer">
			      	 <button type="submit" class="btn btn-primary">submit</button>
			        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			      </div>
				</form>
			
			    </div>
			  </div>
			</div>
				
			<div class="timetable" style="float:left">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th width="140"></th>
								<th width="140">A Room</th>
								<th width="140">B Room</th>
								<th width="140">C Room</th>
								<th width="140">D Room</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>6:00</th>
								<td><input type="hidden" name=cells value="A06"></td>
								<td><input type="hidden" name=cells value="B06"></td>
								<td><input type="hidden" name=cells value="C06"></td>
								<td><input type="hidden" name=cells value="D06"></td>
							</tr>
							<tr>
								<th>7:00</th>
								<td><input type="hidden" name=cells value="A07"></td>
								<td><input type="hidden" name=cells value="B07"></td>
								<td><input type="hidden" name=cells value="C07"></td>
								<td><input type="hidden" name=cells value="D07"></td>
							</tr>
							<tr>
								<th>8:00</th>
								<td><input type="hidden" name=cells value="A08"></td>
								<td><input type="hidden" name=cells value="B08"></td>
								<td><input type="hidden" name=cells value="C08"></td>
								<td><input type="hidden" name=cells value="D08"></td>
							</tr>
							<tr>
								<th>9:00</th>
								<td><input type="hidden" name=cells value="A09"></td>
								<td><input type="hidden" name=cells value="B09"></td>
								<td><input type="hidden" name=cells value="C09"></td>
								<td><input type="hidden" name=cells value="D09"></td>
							</tr>
							<tr>
								<th>10:00</th>
								<td><input type="hidden" name=cells value="A10"></td>
								<td><input type="hidden" name=cells value="B10"></td>
								<td><input type="hidden" name=cells value="C10"></td>
								<td><input type="hidden" name=cells value="D10"></td>
							</tr>
							<tr>
								<th>11:00</th>
								<td><input type="hidden" name=cells value="A11"></td>
								<td><input type="hidden" name=cells value="B11"></td>
								<td><input type="hidden" name=cells value="C11"></td>
								<td><input type="hidden" name=cells value="D11"></td>
							</tr>
							<tr>
								<th>12:00</th>
								<td><input type="hidden" name=cells value="A12"></td>
								<td><input type="hidden" name=cells value="B12"></td>
								<td><input type="hidden" name=cells value="C12"></td>
								<td><input type="hidden" name=cells value="D12"></td>
							</tr>
							<tr>
								<th>13:00</th>
								<td><input type="hidden" name=cells value="A13"></td>
								<td><input type="hidden" name=cells value="B13"></td>
								<td><input type="hidden" name=cells value="C13"></td>
								<td><input type="hidden" name=cells value="D13"></td>
							</tr>
							<tr>
								<th>14:00</th>
								<td><input type="hidden" name=cells value="A14"></td>
								<td><input type="hidden" name=cells value="B14"></td>
								<td><input type="hidden" name=cells value="C14"></td>
								<td><input type="hidden" name=cells value="D14"></td>
							</tr>
							<tr>
								<th>15:00</th>
								<td><input type="hidden" name=cells value="A15"></td>
								<td><input type="hidden" name=cells value="B15"></td>
								<td><input type="hidden" name=cells value="C15"></td>
								<td><input type="hidden" name=cells value="D15"></td>
							</tr>
							<tr>
								<th>16:00</th>
								<td><input type="hidden" name=cells value="A16"></td>
								<td><input type="hidden" name=cells value="B16"></td>
								<td><input type="hidden" name=cells value="C16"></td>
								<td><input type="hidden" name=cells value="D16"></td>
							</tr>
							<tr>
								<th>17:00</th>
								<td><input type="hidden" name=cells value="A17"></td>
								<td><input type="hidden" name=cells value="B17"></td>
								<td><input type="hidden" name=cells value="C17"></td>
								<td><input type="hidden" name=cells value="D17"></td>
							</tr>
							<tr>
								<th>18:00</th>
								<td><input type="hidden" name=cells value="A18"></td>
								<td><input type="hidden" name=cells value="B18"></td>
								<td><input type="hidden" name=cells value="C18"></td>
								<td><input type="hidden" name=cells value="D18"></td>
							</tr>
							<tr>
								<th>19:00</th>
								<td><input type="hidden" name=cells value="A19"></td>
								<td><input type="hidden" name=cells value="B19"></td>
								<td><input type="hidden" name=cells value="C19"></td>
								<td><input type="hidden" name=cells value="D19"></td>
							</tr>
							<tr>
								<th>20:00</th>
								<td><input type="hidden" name=cells value="A20"></td>
								<td><input type="hidden" name=cells value="B20"></td>
								<td><input type="hidden" name=cells value="C20"></td>
								<td><input type="hidden" name=cells value="D20"></td>
							</tr>
							<tr>
								<th>21:00</th>
								<td><input type="hidden" name=cells value="A21"></td>
								<td><input type="hidden" name=cells value="B21"></td>
								<td><input type="hidden" name=cells value="C21"></td>
								<td><input type="hidden" name=cells value="D21"></td>
							</tr>
							<tr>
								<th>22:00</th>
								<td><input type="hidden" name=cells value="A22"></td>
								<td><input type="hidden" name=cells value="B22"></td>
								<td><input type="hidden" name=cells value="C22"></td>
								<td><input type="hidden" name=cells value="D22"></td>
							</tr>
						</tbody>
					</table>
				</div>
				
				
				<div class="log">
					<div class="logTop">
						<!-- 
						<input type="date" name="startDay" placeholder="시작날짜">
						 -->
						<input type="date" name="endDay" placeholder="오늘의 날짜">
						<button id="search">검색</button>
						
						<button id="rsvd" class="btn btn-outline-secondary" style="margin-left:34px; background:#FCBF49; color:white; border:none;" onclick="rsvd();">예약</button>
						<button id="reset" class="btn btn-outline-secondary" style="background:#003049;color:white; border:none;" onclick="reset();">전체 퇴실</button>
					</div>
					
					
					<div class="logList">
						<table class="table">
							<thead>
								<tr>
									<th width="30">No.</th>
									<th width="80">사용인원</th>
									<th width="100">사용일자</th>
									<th width="100">사용공간</th>
									<th width="100">사용시간</th>
									<th width="80">사용자</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>3</td>
									<td>22.03.01</td>
									<td>A Room</td>
									<td>9:00-11:00</td>
									<td>김길동</td>
								</tr>
								<tr>
									<td>2</td>
									<td>3</td>
									<td>22.03.01</td>
									<td>C Room</td>
									<td>13:00-15:00</td>
									<td>장목단</td>
								</tr>
								<tr>
									<td>3</td>
									<td>4</td>
									<td>22.03.01</td>
									<td>B Room</td>
									<td>9:00-11:00</td>
									<td>강설아</td>
								</tr>
								<tr>
									<td>4</td>
									<td>1</td>
									<td>22.03.01</td>
									<td>D Room</td>
									<td>16:00-18:00</td>
									<td>김철수</td>
								</tr>
								<tr>
									<td>5</td>
									<td>2</td>
									<td>22.03.01</td>
									<td>A Room</td>
									<td>15:00-16:00</td>
									<td>서달래</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			
				
				
			
		</div> <!-- content -->
	</div> <!-- wrap -->
	<jsp:include page="../common/footer.jsp" />
	
	<script>
		$(function(){
			sidebar();
			reserved();
			
			// 오늘의 날짜
			var today = new Date();
			
			var year = today.getFullYear();
			var month = ('0' + (today.getMonth() + 1)).slice(-2);
			var day = ('0' + today.getDate()).slice(-2);

			var todate = year + '-' + month + '-' + day;
			// 화면에 날짜 보여주기	
			$("#today").val(todate);
			
			
			$(".timetable td").on("click", function(){
				$(this).css("background", "rgb(235, 235, 235)");
			})
		})
		
		function rsvd(){
			alertify.alert("선택된 스터디룸을 차단합니다.");
		}
		function reset(){
			alertify.confirm("예약된 스터디룸을 초기화하시겠습니까?", function(){
				$(".timetable td").css("background", "white");
				
			})
			
		}
		
		// 사이드바 길이 조절
		function sidebar(){
			document.getElementById("content").style.marginBottom = "50px";
			let $len = $("#content").height();
				
				if($len > 750){
					$(".wrap_sidebar").css('height', $len);
				}else{
					$(".wrap_sidebar").css('height', 270);
					document.getElementById("content").style.marginBottom = "280px";
				}
			}
		
		// 스터디룸 예약 현황
		function reserved(){
			// 로그인한 학생의 학번
			const login = $("input[name=studNo]").val();
			
			$.ajax({
				url:"selectStudy",
				success:(data) => {
					
					$(data).each(function(i, obj){
						
						// 예약한 학생의 학번 
						 let sno = data[i].studNo;
						 // 예약된 자리
						 let space = data[i].rsvdSpace;
						 // 시작 시간
						 let start = data[i].rsvdStart;
						 // 종료 시간
						 let end = data[i].rsvdEnd; 
						 
						 // 만약 2시간을 예약했다면 +1할 시작 시간
						 let startMore = 0;
						 
						 let time = Number(end) - Number(start);
						 // 끝난시간 - 시작시간 = 예약한 시간
						 
						 let cells = space+start;
						 
						 if(login == sno) {
							 let start = data[i].rsvdStart;
								// 예약번호 hidden => 퇴실을 위해 예약번호를 넘기기 위해 가져온 값 (로그인한 회원의 예약번호)
								$("input[name=rsvdNo]").val(data[i].rsvdNo);
							 
							 	$("input[value="+cells+"]").closest('td').css("background", "rgb(235, 235, 235)");
							 
							 	if(time == 2){
									startMore = Number(data[i].rsvdStart) + 1;
										if(startMore < 10){
											startMore = "0" + startMore;
										}
									
									cells = space + startMore;
									// 예약자 본인의 좌석은 노란색으로 표시됨	
									$("input[value="+cells+"]").closest('td').css("background", "rgb(235, 235, 235)");
								 }
							 	
								$(".submitBtn>p").text("예약 취소");
									
							 	
							 	// 내가 예약한 시간과 현재 시간이 일치하면 취소 불가로 이름이 바뀜
							 	let hours = new Date().getHours();
							 	if(hours > start){
							 		$(".submitBtn>p").text("내일 예약 가능");
							 	}
							 	
						 }else{
							 // 다른 사용자의 예약 내역 
							 $("input[value="+cells+"]").closest('td').css("background", "rgb(235, 235, 235)"); 
							 
							 if(time == 2){
								startMore = Number(data[i].rsvdStart) + 1;
									if(startMore < 10){
										startMore = "0" + startMore;
									}
								cells = space + startMore;
								$("input[value="+cells+"]").closest('td').css("background", "rgb(235, 235, 235)");
							 }
							 
						 }
						 
					})
					
				},error: () => {
					console.log("스터디룸 예약 시간표 조회 실패!");
				}
				
			})
			
		}
		
	</script>

</body>
</html>