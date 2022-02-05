<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<style>
	div{box-sizing:border-box;}
	#wrap{
		margin:auto;
		width:1500px;
	}
	#wrap>div{
		float:left;
	}
	#sidebar{
		width:20%;
		height:1100px;
	}
	#content{
		width:80%;
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
		float:left;
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
	#rswdInfo th, td{
		padding:8px 12px!important; 
		font-size:18px;
	}
	.timetable{
		width:650px;
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
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
		
	<div id="wrap">
		<div id="sidebar"><jsp:include page="../student/smySidebar.jsp" /></div>
		<div id="content">
			<div class="pageName"><p style="color:gray">마이페이지>시설물 예약>&nbsp;</p><p style="font-size:19px; font-weight:600;">스터디룸 예약</p></div>
			<div class="topBar">
				<span id="readingRoom"><a>열람실 예약</a></span><span id="studyRoom"><a>스터디룸 예약</a></span>
			</div>
			
			<div class="timetableBox">
				<div class="inputBox">
					<div class="blueLabel"></div>	
					<div id="map">
						<img src="resources/images/studyRoom.png">
					</div>
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
										<select name="tno" class="select">
											<!-- 실시간으로 예약 가능한 시간을 select해와야 함-->
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
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
	

</body>
</html>