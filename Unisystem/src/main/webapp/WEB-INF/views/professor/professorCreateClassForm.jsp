<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<style>
	#wrap{
		margin:auto;
		width:1500px;
		
		/*--------*/
		height:830px;
		/*--------*/
	}
	#sidebar{
		width:20%;
		height:700px;
	}
	#content{
		width:80%;
		height:1780px;
		margin-top:50px;
		margin-bottom:50px;
		background-color:white;
	}
	.pageName{padding:7px;}
	.pageName>p{
		margin:0px;
		float:left;
	}
	.topBox{
		width:100%;
		height:50px;
	}
	.searchBox{
		margin:20px;
		width:1160px;
		height:70px;
		line-height:35px;
		padding-left:40px;
		background:rgb(15, 43, 80);
	}
	.searchBox>input{
		margin-top:15px;
		padding-left:10px;
		width:260px;
   		border-radius:8px;
   		border:0;
	}
	.searchBox>button{
		background:none;
		color:white;
		font-weight:600;
		border:0;
	}
	.appList{
		margin:20px;
		border:1px solid lightgray;
		position:relative;
		padding:20px;
	}
	.appList>label{
		font-size:23px;
		padding-left:20px;
		font-weight:600;
	}
	.btnBox{
		display:inline-block;
		position:absolute;
		right:30px;
	}
	.btnBox>.btn-outline-primary{
		color:rgb(26, 86, 162);
		border-color:rgb(26, 86, 162);
	}
	.btnBox>.btn-outline-primary:hover{
		background:rgb(26, 86, 162);
		border-color:rgb(26, 86, 162);
	}
	.table{
		margin-top:20px;
		border-top:2px solid gray;
		border-bottom:2px solid gray;
	}
	.table th{
		border-bottom:2px solid gray;
		background:rgb(235, 235, 235);
		line-height:40px;
	}
	.table.table-bordered th,
	.table.table-bordered td{
		text-align:center;
		line-height:40px;
		border:1px solid #b8bbbe;
		padding:0;
		height:40px;
		padding:0px 10px;
	}
	.table input[type="checkbox"]{
		width:16px;
		height:16px;
	}
	.pagebar{
		width:100%;
		height:35px;
		margin-top:15px;
	}
	.pagebar>.btn-light{
		border-radius:100px;
		color:black;
		background-color:rgb(240, 240, 240);
	}
	.pagebar>.btn-basic{
		color:white;
		background-color:rgb(21, 62, 115);
	}
	
	/* ajax - 개설 신청 */
	.secBox{
		 padding-left:20px;
	}
	.secBox>div{
		float:left;
		height:200px;
		margin-top:50px;
	}
	.secBox p{
		font-size:18px;
		font-weight:600;
		padding:0px; 
		margin:0px;
	}
	.plan{
		width:290px;
		height:140px;
	}
	.plan>p{
		width:100px;
		margin:0;
	}
	.plan-top{
	    padding-left:40px;
	}
	.plan-top>button{
		border:0;
	}
	
	.plan-top>*{
		float:left;
	}
	.pdfBox{
		width:230px;
		height:86px;
		border:1px solid lightgray;
		margin-top:16px;
	}
	.timetable{
		width:230px;
		margin:0px;
		padding-left:10px;
	}
	.table2{
		width:480px;
		float:left;
		height:80px;
		padding-left:60px;
	}
	.submitBtn{
		background:rgb(21, 62, 115);
	    width:300px;
	    height:90px;
	    margin:auto;
	    border-radius:10px;
	}
	.submitBtn>p{
		color:white;
		font-size:30px;
		font-weight:700;
		text-align:center;
  		line-height:90px;	
	}
	.appList>table{
		width:1090px;
		margin:auto;
	}
	.form .table.table-bordered td{
		text-align:left;
		line-height:30px;
	}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
		
	<div id="wrap">
		<div id="sidebar" style="margin-top:50px; float:left;"><jsp:include page="pclassSidebar.jsp" /></div>
		<div id="content" style="float:left;">
			<div class="topBox">
				<div class="pageName"><p style="color:gray">마이페이지>담당 학생 관리>&nbsp;</p><p style="font-size:19px; font-weight:600;">담당 학생 조회</p></div>
			</div>
			
			
			<div class="searchList">
				<div class="searchBox">
					<input type="text" placeholder="년도별 조회">
					<button type="button">검색</button>
				</div>
				
					<div class="appList">
						<label>* 교과목 신청 목록</label>
					<div class="btnBox">
						<button class="btn btn-sm btn-outline-secondary">취소</button>
						<button class="btn btn-sm btn-outline-primary">강의 개설</button>
					</div>
					
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<th><input type="checkbox"></th>
								<th>순번</th>
								<th>신청번호</th>
								<th>신청일자</th>
								<th>과목명</th>
								<th>신청상태</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="checkbox"></td>
								<td>1</td>
								<td>2012-12345</td>
								<td>2021-01-10</td>
								<td>미생물 유전체 해동 및 정보 분석</td>
								<td>대기</td>
							</tr>
							<!-- 시작 -->
							<tr>
								<td><input type="checkbox"></td>
								<td>1</td>
								<td>2012-12345</td>
								<td>2021-01-10</td>
								<td>미생물 유전체 해동 및 정보 분석</td>
								<td>대기</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>1</td>
								<td>2012-12345</td>
								<td>2021-01-10</td>
								<td>미생물 유전체 해동 및 정보 분석</td>
								<td>대기</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>1</td>
								<td>2012-12345</td>
								<td>2021-01-10</td>
								<td>미생물 유전체 해동 및 정보 분석</td>
								<td>대기</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>1</td>
								<td>2012-12345</td>
								<td>2021-01-10</td>
								<td>미생물 유전체 해동 및 정보 분석</td>
								<td>대기</td>
							</tr>
							
							<!-- 끝 -->
						</tbody>
					</table>
					
					<div class="pagebar" align="center">
							<button type="button" class="btn btn-light">&lt;</button>
							<button type="button" class="btn btn-light"></button>
							<button type="button" class="btn btn-basic"></button>
							<button type="button" class="btn btn-light"></button>
							<button type="button" class="btn btn-light"></button>
							<button type="button" class="btn btn-light"></button>
							<button type="button" class="btn btn-light">&gt;</button>
						</div>
						
				</div> <!-- appList -->
			</div> <!-- searchList -->
					
			<div>
				<div class="appList" style="height:auto; padding-top:50px;">
					<label>* 교과목 개설 신청</label>
					
					<div class="form">
						<div align="center">
							<table class="table1 table table-bordered" style="width:1090px">
								<tr>
									<th width="200px">개설년도</th>
									<td width="200px"></td>
									<th width="200px">학기</th>
									<td width="200px"></td>
									<th width="200px">수업유형</th>
									<td width="200px"></td>
								</tr>
								<tr>
									<th colspan="2">교과목</th>
									<td colspan="4"></td>
								</tr>
								<tr>
									<th colspan="2">과목명(한글)</th>
									<td colspan="4"></td>
								</tr>	
								<tr>
									<th colspan="2">과목명(영문)</th>
									<td colspan="4"></td>
								</tr>
								<tr>
									<th colspan="2">개요(한글)</th>
									<td colspan="4">공학입문 설계 교과목의 목표는 공학문제를 설계문제로 정의하고 이를 해결하는 설계과정을 계획하고 문제의 해를 도출할 수 있는 문제해결 능력을 제공하는 데 있다. 또한 팀웍과 다양한 공학문제 해결 도구에 익숙하도록 하는데 교과목의 목표가 있다. 공학문제 해결 과정을 이해하고, 이에 대한 최선의 해를 도출하기 위한 체계적인 문제해결방법의 원리 및 이론을 공부한다. 설계문제의 정식화를 공부하며 정식화된 설계문제를 체계적으로 해결하기 위한 방법을 공부한다.</td>
								</tr>
								<tr>
									<th colspan="2">개요(영문)</th>
									<td colspan="4">To provide students with the use of problem-solving skills for solving realistic engineering problems using problem-based learning techniques, including definition of problem, creative problem solving, design of experiments, and optimization. To familiarize students with experience working as a member of an engineering work team, with experience using several modern tools and techniques to solve engineering problems. This course will help you develop the skills necessary to solve the real engineering problems facing engineers today. You will learn underlying principles an master techniques to solve engineering problems.</td>
								</tr>
								<tr>
									<th colspan="2">수업목표</th>
									<td colspan="4"></td>
								</tr>
								<tr>
									<th>학위과정</th>
									<td></td>
									<th>전공</th>
									<td></td>
									<th>정원</th>
									<td></td>
								</tr>
								<tr>
									<th>이수구분</th>
									<td></td>
									<th>학점</th>
									<td></td>
									<th>강의실</th>
									<td></td>
								</tr>
								<tr>
									<th>주관교수</th>
									<td></td>
									<th>연락처</th>
									<td></td>
									<th>교수실</th>
									<td></td>
								</tr>
							</table>
						</div>
						
						
						
						<div class="secBox">
							<div style="width:550px;">
								<p>* 항목별 점수비율(100%)</p>
							<table class="table2 table table-bordered">
									<tr>
										<th>출석</th>
										<th>과제</th>
										<th>중간</th>
										<th>기말</th>
									</tr>
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</table>
							</div>
							
							
							<div class="plan">
								<div class="plan-top">
									<p>* 강의계획서</p>
									<button class="button btn-sm btn-basic" style="margin-left:30px">파일첨부</button>
								<div class="pdfBox"></div>
								</div>
							</div>
							
							<div class="timetable" style="margin:0;">
								<table class="table table-bordered">
									<tr>
										<th colspan="2">시간표</th>
									</tr>
									<tr>
										<th width="80">요일</th>
										<td width="100"></td>
									</tr>
									<tr>
										<th>교시</th>
										<td></td>
									</tr>
									<tr>
										<th>시간</th>
										<td></td>
									</tr>
								</table>
							</div>
						</div>
						
							<br clear="both">
							<div class="submitBtn">
								<p>강의 개설 신청</p>
							</div>
							
							
						
					</div> <!-- form --> 
				</div>
			</div>		
					
					
					
					
					
					
					
					
					
					
					
			
		</div>	
		
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>