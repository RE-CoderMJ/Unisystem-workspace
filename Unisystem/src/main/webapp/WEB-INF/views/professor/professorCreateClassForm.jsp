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
	.appList{
		margin:20px;
	}
	#content label{
		font-size:23px;
		margin-bottom:12px;
	}
	.btnBox{
		width:200px;
		margin-left:1070px;
		margin-bottom:14px;
	}
	/* 개설 신청 */
	.createClass{
		padding:10px 20px;
		border:1px solid lightgray;
		margin:20px;
		padding:20px;
	}
	.secBox{
		 padding-left:50px;
	}
	.secBox>div{
		height:200px;
		margin-top:20px;
	}
	.secBox p{
		font-size:18px;
		font-weight:600;
		padding:0px; 
		margin:0px;
		margin-bottom:10px;
	}
	.secBox input{
		width:100px;
		text-align:center;
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
	    padding-left:70px;
	}
	.plan-top>button{
		border:0;
	}
	.pdfBox{
		width:230px;
		height:86px;
		border:1px solid lightgray;
	}
	#timetable{
		width:230px;
		margin:0px;
		padding-left:10px;
		margin-left:70px;
		margin-top:20px;
		
	}
	#timetable td{
		padding:0px;
	}
	.table2{
		width:480px;
		height:80px;
		padding-left:60px;
	}
	.submitBtn{
		background:rgb(21, 62, 115);
	    width:300px;
	    height:90px;
	    margin:auto;
	    border-radius:7px;
	}
	.submitBtn>p{
  		width:100%;
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
	.textarea {
		height:20px;
		width:100%;
	    overflow-y: hidden;
	    border: none;
	}
	.input{
		width:100%;
		border:none;
	}
	.createClass select{
		width:100px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/links.jsp" />
	<jsp:include page="../common/header.jsp" />
	
		
	<div id="wrap">
		<div id="sidebar" style="float:left;"><jsp:include page="pmySidebar.jsp" /></div>
		<div id="content" style="float:left;">
			<div class="topBox">
			<div class="pageName"><p>마이페이지&nbsp;>&nbsp;강의&nbsp;>&nbsp;</p><p style="color:black; font-size:24px; font-weight:900;">&nbsp;강의 관리</p></div>
			</div>
			
			
			<div class="searchList">
				<div class="searchBox">
					<input type="text" placeholder="년도별 조회">
					<button type="button">검색</button>
				</div>
				
					<div class="appList">
						<div style="float:left">
							<label>* 교과목 신청 목록</label>
						</div>
					<div class="btnBox">
						<button class="btn btn-sm btn-outline-secondary">취소</button>
						<button class="btn btn-sm btn-outline-primary" onclick="createClass();">강의 개설</button>
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
					
					<div class="container">
                    <ul class="pagination justify-content-center">
                      <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
                      <li class="page-item"><a class="page-link" href="#">1</a></li>
                      <li class="page-item active"><a class="page-link" href="#">2</a></li>
                      <li class="page-item"><a class="page-link" href="#">3</a></li>
                      <li class="page-item"><a class="page-link" href="#">4</a></li>
                      <li class="page-item"><a class="page-link" href="#">5</a></li>
                      <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
                    </ul>
                 </div>
						
				</div> <!-- appList -->
			</div> <!-- searchList -->
			
			<!-- 강의 개설 -->
			<div id="createClass" style="display:">
				<br>
				<div class="createClass">
					<label>* 교과목 개설 신청</label>
					
					<form action="" method="post">
						<div align="center">
							<table class="table1 table table-bordered" style="width:1090px">
								<tr>
									<th width="200px">개설년도</th>
									<td width="200px"><input class="input" id="year" value="" disabled></td>
									<th width="200px">학기</th>
									<td width="200px" style="padding:5px 10px;">
									<select name="classSemester">
										<option>1학기</option>
										<option>2학기</option>
									</select>
									</td>
									<th width="200px">수업유형</th>
									<td width="200px" style="padding:5px 10px;">
									<select name="classCategory">
										<option>대면</option>
										<option>비대면</option>
									</select>
									</td>
								</tr>
								<tr>
									<th colspan="2">과목명(한글)</th>
									<td colspan="4"><input class="input" name="classKorName" required></td>
								</tr>	
								<tr>
									<th colspan="2">과목명(영문)</th>
									<td colspan="4"><input class="input" name="classEngName" required></td>
								</tr>
								<tr>
									<th colspan="2">개요(한글)</th>
									<td colspan="4">
									<textarea class="textarea" onkeydown="resize(this)" onkeyup="resize(this)"></textarea></td>
									<!-- <textarea class="textarea" name="" cols="95px" style="height:20px; border:none;"></textarea> 공학입문 설계 교과목의 목표는 공학문제를 설계문제로 정의하고 이를 해결하는 설계과정을 계획하고 문제의 해를 도출할 수 있는 문제해결 능력을 제공하는 데 있다. 또한 팀웍과 다양한 공학문제 해결 도구에 익숙하도록 하는데 교과목의 목표가 있다. 공학문제 해결 과정을 이해하고, 이에 대한 최선의 해를 도출하기 위한 체계적인 문제해결방법의 원리 및 이론을 공부한다. 설계문제의 정식화를 공부하며 정식화된 설계문제를 체계적으로 해결하기 위한 방법을 공부한다. -->
								</tr>
								<tr>
									<th colspan="2">개요(영문)</th>
									<td colspan="4">
									<textarea class="textarea" onkeydown="resize(this)" onkeyup="resize(this)"></textarea></td>
									<!-- To provide students with the use of problem-solving skills for solving realistic engineering problems using problem-based learning techniques, including definition of problem, creative problem solving, design of experiments, and optimization. To familiarize students with experience working as a member of an engineering work team, with experience using several modern tools and techniques to solve engineering problems. This course will help you develop the skills necessary to solve the real engineering problems facing engineers today. You will learn underlying principles an master techniques to solve engineering problems. --></td>
								</tr>
								<tr>
									<th colspan="2">수업목표</th>
									<td colspan="4">
									<textarea class="textarea" onkeydown="resize(this)" onkeyup="resize(this)"></textarea></td>
								</tr>
								<tr>
									<th>과목코드</th>
									<td><input class="input" name="classCode" placeholder="입력 제외" disabled></td>
									<th>전공</th>
									<td><input class="input" name="profMajor" value="${ loginUser.profMajor }"></td>
									<th>정원</th>
									<td><input type="number" class="input" name="maxStud"></td>
								</tr>
								<tr>
									<th>이수구분</th>
									<td style="padding:5px 5px 0px 0px;">
										<select name="classDivision" style="margin-right:90px">
											<option>전공필수</option>
											<option>전공선택</option>
											<option>교양</option>
										</select>
									</td>
									<th>학점</th>
									<td><input type="number" class="input" name="classCredit"></td>
									<th>강의실</th>
									<td><input class="input" name="classLocation" placeholder="입력 제외" disabled></td>
								</tr>
								<tr>
									<th>주관교수</th>
									<td><input class="input" name="profNo" value="${ loginUser.korName }"></td>
									<th>연락처</th>
									<td><input type="tel" class="input" name="classPhone"></td>
									<th>교수실</th>
									<td><input class="input" name="profLocation"></td>
								</tr>
							</table>
						</div>
						
						
						
						<div class="secBox">
							<div style="float:left;">
								<p>* 항목별 점수비율(100%)</p>
							<table class="table2 table table-bordered" style="width:300px">
									<tr>
										<th>출석</th>
										<th>과제</th>
										<th>중간</th>
										<th>기말</th>
									</tr>
									<tr>
										<td><input type="number" class="input" name="scoreAtt"></td>
										<td><input type="number" class="input" name="scoreTask"></td>
										<td><input type="number" class="input" name="scoreMid"></td>
										<td><input type="number" class="input" name="scoreFin"></td>
									</tr>
								</table>
							</div>
							
							
							<div class="plan" style="float:left">
								<div class="plan-top">
									<p>* 강의계획서</p>
									
									<label for="planPDF" class="button btn-sm btn-secondary" style="font-size:14px; margin-left:40px">파일첨부</label>
								<div class="pdfBox"><input type="file" id="planPDF" style="padding:10px"></div>
								</div>
							</div>
							
							<div id="timetable" style="float:left">
								<table class="table table-bordered">
									<tr>
										<th colspan="2">시간표</th>
									</tr>
									<tr>
										<th width="80">요일</th>
										<td width="100">
											<select name="classDay">
												<option>월</option>
												<option>화</option>
												<option>수</option>
												<option>목</option>
												<option>금</option>
											</select>
										</td>
									</tr>
									<tr>
										<th>교시</th>
										<td>
											<select name="classStart">
												<option value="1">1교시</option>
												<option value="2">2교시</option>
												<option value="3">3교시</option>
												<option value="4">4교시</option>
												<option value="5">5교시</option>
												<option value="6">6교시</option>
												<option value="7">7교시</option>
												<option value="8">8교시</option>
											</select>
										</td>	
									</tr>
									<tr>
										<th>시간</th>
										<td>
											<select name="classTime">
												<option>1시간</option>
												<option>2시간</option>
												<option>3시간</option>
											</select>
										</td>
										
									</tr>
								</table>
							</div>
						</div>
						
							<button type="submit" class="submitBtn" style="margin-left:430px;">
								<p>강의 개설 신청</p>
							</button>
							
					</form>
				</div>
			</div>		
					
			
			
			
		</div>	<!-- content -->
		
	</div>
	<jsp:include page="../common/footer.jsp" />
	
	
	<script>
	
		$(function(){
			sidebar();
			
			// 개설년도에 현재 년도 자동 불러오기
			let year = new Date().getFullYear();
			document.getElementById('year').value = year;
			
			// 강의계획서 PDF
			var pdf = document.getElementById('planPDF');
			var preview = document.getElementsByClassName('pdfBox');

			pdf.style.opacity = 0;
			// input="file"을 숨길 경우, 파일 입력을 상호작용 할 수 없는 상태로 인식하기 때문에 opacity를 사용함
			
			pdf.addEventListener('change', updateFilesDisplay);
			
		})
	
			// 첨부한 파일명 박스에 부여하기
		function updateFilesDisplay(){
			var fileValue = $("#planPDF").val().split("\\");
			var fileName = fileValue[fileValue.length-1]; 
			
			$(".pdfBox").text(fileName);
		}
		
		// 사이드바 길이 조절
		function sidebar(){
			document.getElementById("content").style.marginBottom = "50px";
			let $len = $("#content").height();
			console.log($len);
			if($len > 750){
				$(".wrap_sidebar").css('height', $len);
			}else{
				$(".wrap_sidebar").css('height', 270);
				document.getElementById("content").style.marginBottom = "250px";
			}
		}
		
		function createClass(num){
			$("#createClass").toggle();	
			sidebar();
		}
	
		function resize(obj) {
		    obj.style.height = (0 + obj.scrollHeight) + 'px';
		}
		
	</script>
		
	
	
</body>
</html>