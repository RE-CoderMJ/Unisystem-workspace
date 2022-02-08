<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<script> $( function() { $( ".datepicker" ).datepicker(); } ); </script>
<style>	
	div{box-sizing:border-box;}
	#wrap{
		margin:auto;
		width:1500px;
	}
	#sidebar{
		width:230px;
		height:1100px;
	}
	#content{
		width:1270px;
		height:auto;
		margin-top:50px;
		margin-bottom:50px;
		background-color:white;
		border:1px solid lightgray;
	}
	.pageName{
		padding:7px;
		height:50px;
		}
	
	.pageName>p{
		margin:0px;
		float:left;
		line-height:30px;
	}
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
	#rsvdInfo>.table{
		width:340px;
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
	.datepicker{
		width:180px;
		height:40px;
		margin-bottom:20px;
		border:1px solid lightgray;
	}
	#reset{
		position:absolute;
		right:-79px;
	}
	.log{
		width:590px;
		height:auto;
		float:left;
		margin:12px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
		
	<div id="wrap">
		<div id="sidebar" style="float:left;"><jsp:include page="../common/adminSidebar.jsp" /></div>
		<div id="content" style="float:left;">
			<div class="pageName"><p style="color:gray">마이페이지>시설물 예약>&nbsp;</p><p style="font-size:19px; font-weight:600;">스터디룸 예약</p></div>
			<div class="topBar">
				<span id="readingRoom"><a>열람실 예약</a></span><span id="studyRoom"><a>스터디룸 예약</a></span>
			</div>
			
	<!-- modal
				<form>
					<div id="rsvdInfo">			
						<div class="blueLabel"></div>	
						<table class="table table-bordered">
							<tr>
								<th width="100">사용인원</th>
								<td width="150">
										<select name="pno" class="select">
											<option value="1">1명</option>
											<option value="2">2명</option>
											<option value="3">3명</option>
											<option value="4">4명</option>
										</select>
								</td>
							</tr>
							<tr>
								<th>사용일자</th>
								<td>2022-02-22</td>
							</tr>
							<tr>
								<th>사용공간</th>
								<td>
										<select name="rno" class="select">
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
								
										</select>
								</td>
							</tr>
							<tr>
								<td>
									<input id="1" type="radio" name="time"><label for="1">&nbsp;1시간</label>
									&nbsp;&nbsp;
									<input id="2" type="radio" name="time"><label for="2">&nbsp;2시간</label>
								
								</td>
							</tr>
						</table>
					</div>
					
					<div class="submitBtn" onclick="">
					<p>스터디룸 예약</p>
					</div>
				</form>
				</div>
				
	-->
				
			<div class="timetableBox">
				<div class="timetable">
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
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th>7:00</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th>8:00</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th>9:00</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th>10:00</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th>11:00</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th>12:00</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th>13:00</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th>14:00</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th>15:00</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th>16:00</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th>17:00</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th>18:00</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th>19:00</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th>20:00</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th>21:00</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th>22:00</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
				
				<div class="log">
					<div class="logTop">
						<input type="text" class="datepicker" placeholder="시작날짜">
						<input type="text" class="datepicker" placeholder="마지막날짜">
						
						<button id="reset" class="btn btn-outline-secondary">전체 퇴실</button>
					</div>
						
						
						<div class="logList">
							<table class="table">
								<thead>
									<tr>
										<th width="30">No.</th>
										<th width="100">사용인원</th>
										<th width="100">사용일자</th>
										<th width="100">사용공간</th>
										<th width="100">사용시간</th>
										<th width="100">사용자</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>3</td>
										<td>22.02.08</td>
										<td>9:00</td>
										<td>2시간</td>
										<td>김길동</td>
									</tr>
									
									<!--  -->
									<tr>
										<td>1</td>
										<td>3</td>
										<td>22.02.08</td>
										<td>9:00</td>
										<td>2시간</td>
										<td>김길동</td>
									</tr>
									<tr>
										<td>1</td>
										<td>3</td>
										<td>22.02.08</td>
										<td>9:00</td>
										<td>2시간</td>
										<td>김길동</td>
									</tr>
									<tr>
										<td>1</td>
										<td>3</td>
										<td>22.02.08</td>
										<td>9:00</td>
										<td>2시간</td>
										<td>김길동</td>
									</tr>
									<tr>
										<td>1</td>
										<td>3</td>
										<td>22.02.08</td>
										<td>9:00</td>
										<td>2시간</td>
										<td>김길동</td>
									</tr>
									<tr>
										<td>1</td>
										<td>3</td>
										<td>22.02.08</td>
										<td>9:00</td>
										<td>2시간</td>
										<td>김길동</td>
									</tr>
									<tr>
										<td>1</td>
										<td>3</td>
										<td>22.02.08</td>
										<td>9:00</td>
										<td>2시간</td>
										<td>김길동</td>
									</tr>
									<tr>
										<td>1</td>
										<td>3</td>
										<td>22.02.08</td>
										<td>9:00</td>
										<td>2시간</td>
										<td>김길동</td>
									</tr>
									<tr>
										<td>1</td>
										<td>3</td>
										<td>2022.02.08</td>
										<td>9:00</td>
										<td>2시간</td>
										<td>김길동</td>
									</tr>
									<tr>
										<td>1</td>
										<td>3</td>
										<td>22.02.08</td>
										<td>9:00</td>
										<td>2시간</td>
										<td>김길동</td>
									</tr>
									<tr>
										<td>1</td>
										<td>3</td>
										<td>22.02.08</td>
										<td>9:00</td>
										<td>2시간</td>
										<td>김길동</td>
									</tr>
									<tr>
										<td>1</td>
										<td>3</td>
										<td>22.02.08</td>
										<td>9:00</td>
										<td>2시간</td>
										<td>김길동</td>
									</tr>
									<tr>
										<td>1</td>
										<td>3</td>
										<td>22.02.08</td>
										<td>9:00</td>
										<td>2시간</td>
										<td>김길동</td>
									</tr>
									<tr>
										<td>1</td>
										<td>3</td>
										<td>22.02.08</td>
										<td>9:00</td>
										<td>2시간</td>
										<td>김길동</td>
									</tr>
									<tr>
										<td>1</td>
										<td>3</td>
										<td>22.02.08</td>
										<td>9:00</td>
										<td>2시간</td>
										<td>김길동</td>
									</tr>
									<tr>
										<td>1</td>
										<td>3</td>
										<td>22.02.08</td>
										<td>9:00</td>
										<td>2시간</td>
										<td>김길동</td>
									</tr>
									<tr>
										<td>1</td>
										<td>3</td>
										<td>22.02.08</td>
										<td>9:00</td>
										<td>2시간</td>
										<td>김길동</td>
									</tr>
									<tr>
										<td>1</td>
										<td>3</td>
										<td>2022.02.08</td>
										<td>9:00</td>
										<td>2시간</td>
										<td>김길동</td>
									</tr>
									<tr>
										<td>1</td>
										<td>3</td>
										<td>22.02.08</td>
										<td>9:00</td>
										<td>2시간</td>
										<td>김길동</td>
									</tr>
									
								</tbody>
							</table>
						</div>
					</div>
				
				
				
			
		</div> <!-- content -->
	</div> <!-- wrap -->
	<jsp:include page="../common/footer.jsp" />
	

</body>
</html>