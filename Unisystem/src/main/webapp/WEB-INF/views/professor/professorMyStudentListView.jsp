<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<style>
	div{box-sizing:border-box;}
	#wrap{
		margin:auto;
		width:1500px;
		
		/*--------*/
		height:830px;
		margin-bottom:170px;
		/*--------*/
		
	}
	#sidebar{
		width:20%;
		height:700px;
	}
	#content{
		width:70%;
		height:780px;
		margin-top:50px;
		margin-bottom:50px;
		background-color:white;
		postion:relative;
	}
	.nameBox{
		margin-left:20px;
	}
	.nameBox>button{
	 	width:45px; 
	 	height:45px;
	 	border:1px solid lightgray;
	}
	.nameBox>input{
		padding-left:10px;
		height:45px;
	 	border:1px solid lightgray;
	}
	.pageName{padding:7px;}
	.pageName>p{
		margin:0px;
		float:left;
	}
	.TopBox{
		width:100%;
		height:50px;
		position:relative;
	}
	.nameBox>label{
		padding:20px;
		font-size:38px;
		font-weight:800;
	}
	.studBox{
		width:100%;
	}
	.table{
		border-top:2px solid lightgray;
		border-bottom:2px solid lightgray;
		
	}
	.table th{
		border-bottom:2px solid lightgray;
		background:rgb(235, 235, 235);
	}
	.table th, .table td{
		text-align:center;
		padding:0;
		padding-left:10px;
		height:20px;
		line-height:20px;
	}
	.sort{
		position:absolute;
		top:105px;
		right:80px;
	}
	.pagebar{
		margin-top:30px;
		width:100%;
		height:50px;
	}
	.pagebar>.btn-basic{
		color:white;
		background-color:rgb(21, 62, 115);
	}
	
	
</style>

</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
		
	<div id="wrap">
		<div id="sidebar" style="margin-top:50px; float:left;"><jsp:include page="pmySidebar.jsp" /></div>
		<div id="content" style="float:left;">
					<div class="TopBox">
						<div class="pageName"><p style="color:gray">마이페이지>담당 학생 관리>&nbsp;</p><p style="font-size:19px; font-weight:600;">담당 학생 조회</p></div>
						<div class="sort">
							<a>전공</a> | <a>학년</a>
						</div>
					</div>
					
						<div class="listBox">
							<div class="nameBox">
								<label>담당 학생</label>
								<input type="text" placeholder="이름"><button type="button"><i class="fas fa-search"></i></button>
							</div>
							<div class="studBox">
							<table class="table table-hover" align="center" style="width:1000px;">
								<tbody>
									<tr>
										<th>학번</th>
										<th>학년</th>
										<th>이름</th>
										<th>전공</th>
										<th>연락처</th>
										<th>이메일</th>
									</tr>
									<tr>
										<td>201610542</td>
										<td>4</td>
										<td>김길동</td>
										<td>물리학</td>
										<td>010-1234-4567</td>
										<td>gildong@mail.com</td>
									</tr>
									<!-- 반복 -->
									<tr>
										<td>201610542</td>
										<td>4</td>
										<td>김길동</td>
										<td>물리학</td>
										<td>010-1234-4567</td>
										<td>gildong@mail.com</td>
									</tr>
									<tr>
										<td>201610542</td>
										<td>4</td>
										<td>김길동</td>
										<td>물리학</td>
										<td>010-1234-4567</td>
										<td>gildong@mail.com</td>
									</tr>
									<tr>
										<td>201610542</td>
										<td>4</td>
										<td>김길동</td>
										<td>물리학</td>
										<td>010-1234-4567</td>
										<td>gildong@mail.com</td>
									</tr>
									<tr>
										<td>201610542</td>
										<td>4</td>
										<td>김길동</td>
										<td>물리학</td>
										<td>010-1234-4567</td>
										<td>gildong@mail.com</td>
									</tr>
									<tr>
										<td>201610542</td>
										<td>4</td>
										<td>김길동</td>
										<td>물리학</td>
										<td>010-1234-4567</td>
										<td>gildong@mail.com</td>
									</tr>
									<tr>
										<td>201610542</td>
										<td>4</td>
										<td>김길동</td>
										<td>물리학</td>
										<td>010-1234-4567</td>
										<td>gildong@mail.com</td>
									</tr>
									<tr>
										<td>201610542</td>
										<td>4</td>
										<td>김길동</td>
										<td>물리학</td>
										<td>010-1234-4567</td>
										<td>gildong@mail.com</td>
									</tr>
									<tr>
										<td>201610542</td>
										<td>4</td>
										<td>김길동</td>
										<td>물리학</td>
										<td>010-1234-4567</td>
										<td>gildong@mail.com</td>
									</tr>
									<tr>
										<td>201610542</td>
										<td>4</td>
										<td>김길동</td>
										<td>물리학</td>
										<td>010-1234-4567</td>
										<td>gildong@mail.com</td>
									</tr>
									<!-- 끝 -->
								</tbody>
							</table>
						</div>
						<div class="pagebar" align="center">
							<button type="button" class="btn btn-light">&lt;</button>
							<button type="button" class="btn btn-light">1</button>
							<button type="button" class="btn btn-basic">2</button>
							<button type="button" class="btn btn-light">3</button>
							<button type="button" class="btn btn-light">4</button>
							<button type="button" class="btn btn-light">5</button>
							<button type="button" class="btn btn-light">&gt;</button>
							
							
						</div>
					</div>
			
		
		</div>
		
	</div>
	<jsp:include page="../common/footer.jsp" />

</body>
</html>