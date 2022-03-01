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
		width:230px;
		height:1100px;
	}
	#content{
		width:1270px;
		height:1050px;
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
	#readingRoom{
		font-weight:700;
		color:rgb(26, 86, 162);
	}
	.srvdBox{
		width:480px;
		height:auto;
		border:1px solid lightgray;
		padding:8px;
		float:left;
		margin:-10px 0px 0px 60px;
	}
	.btn.btn-primary{
		color:gray;
		background-color:rgb(235,242,252);
		border:none;
		width:38px;
		margin:8px !important;
		border-radius:7px !important;
	}
	.container, .row, .col{
		width:480px;
		height:auto;
	}
	.lineBox{
	    margin-left: -9px;
	    width: 480px;
	}
	.logBox{
		margin-top:100px;
		width:1100px;
		height:70px;
		padding:15px;
	}
	.logList{
		width:500px;
		height:420px;
		float:left;
		overflow:auto;
	}
	.datepicker{
		width:130px;
		height:40px;
		margin-bottom:20px;
		border:1px solid lightgray;
	}
	#box{
		width:1060px;
		height:auto;
		margin:auto;
	}
	#reset{
		margin-left:660px;
	}
	form{
		float:left;
		margin-top:10px;
	}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
	<div id="wrap">
		<div id="sidebar"><jsp:include page="../common/adminSidebar.jsp" /></div>
		<div id="content">
			<div class="pageName"><p style="color:gray">마이페이지>시설물 예약>&nbsp;</p><p style="font-size:19px; font-weight:600;">열람실 예약</p></div>
			<div class="topBar">
				<span id="readingRoom"><a>열람실 예약</a></span><span id="studyRoom"><a>스터디룸 예약</a></span>
			</div>
			
				<div id="box">
					<div class="logBox">
						<input type="text" class="datepicker" placeholder="시작날짜">
						<input type="text" class="datepicker" placeholder="마지막날짜">
						
						<button id="reset" class="btn btn-outline-secondary">전체 퇴실</button>
					</div>
						
						<div class="logList">
							<table class="table">
								<thead>
									<tr>
										<th>No.</th>
										<th>예약좌석</th>
										<th>예약자</th>
										<th>예약일자</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>20</td>
										<td>김길동</td>
										<td>22.02.08 01:30</td>
									</tr>
									
									<!--  -->
										<tr>
										<td>1</td>
										<td>20</td>
										<td>김길동</td>
										<td>22.02.08 01:30</td>
									</tr>
										<tr>
										<td>1</td>
										<td>20</td>
										<td>김길동</td>
										<td>22.02.08 01:30</td>
									</tr>
										<tr>
										<td>1</td>
										<td>20</td>
										<td>김길동</td>
										<td>22.02.08 01:30</td>
									</tr>
										<tr>
										<td>1</td>
										<td>20</td>
										<td>김길동</td>
										<td>22.02.08 01:30</td>
									</tr>
										<tr>
										<td>1</td>
										<td>20</td>
										<td>김길동</td>
										<td>22.02.08 01:30</td>
									</tr>
										<tr>
										<td>1</td>
										<td>20</td>
										<td>김길동</td>
										<td>22.02.08 01:30</td>
									</tr>
										<tr>
										<td>1</td>
										<td>20</td>
										<td>김길동</td>
										<td>22.02.08 01:30</td>
									</tr>
										<tr>
										<td>1</td>
										<td>20</td>
										<td>김길동</td>
										<td>22.02.08 01:30</td>
									</tr>
										<tr>
										<td>1</td>
										<td>20</td>
										<td>김길동</td>
										<td>22.02.08 01:30</td>
									</tr>
										<tr>
										<td>1</td>
										<td>20</td>
										<td>김길동</td>
										<td>22.02.08 01:30</td>
									</tr>
										<tr>
										<td>1</td>
										<td>20</td>
										<td>김길동</td>
										<td>22.02.08 01:30</td>
									</tr>
										<tr>
										<td>1</td>
										<td>20</td>
										<td>김길동</td>
										<td>22.02.08 01:30</td>
									</tr>
									
								</tbody>
							</table>
						</div>
						
						
					</div>
		
		
					<form style="float:left">
					<div class="srvdBox">
						<div class="container">
							<div class="row">
								<div class="col" style="padding:0">
									<div class="btn-group btn-group-toggle" data-toggle="buttons" style="display:block">
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-1"> 1
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-2"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-1"> 1
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-2"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
										</label>
										
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-1"> 1
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-2"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
										</label>
										<hr class="lineBox">	
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-1"> 1
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-2"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-1"> 1
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-2"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-1"> 1
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-2"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
										</label>
		
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-1"> 1
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-2"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
										</label>
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
										</label>
										
										
									</div>
								</div>
							</div>
						</div>
						</div>	
					</form>
							
				
		
	
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>