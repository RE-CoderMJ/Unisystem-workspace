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
		height:770px;
	}
	.appList .table td{
		padding:7px;
	}
	#content label{
		font-size:23px;
		margin-bottom:12px;
	}
	.btnBox{
		width:200px;
		margin-left:1000px;
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
		margin:20px;
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
		padding:10px;
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
		height:22px;
		width:100%;
	    overflow-y: hidden;
	    border: none;
	}
	input{
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
				</div>
				
					<div class="appList">
					
			
			
				<form id="updateForm" action="cupdate" method="post" enctype="multipart/form-data">
					<label>* 교과목 개설 신청서</label>
					<div class="btnBox">
						<button type="button" id="rsvd" class="btn btn-outline-secondary" style="margin-left:34px; background:#FCBF49; color:white; border:none;" onclick="approve(1);">승인</button>
						<button type="button" id="reset" class="btn btn-outline-secondary" style="background:#003049;color:white; border:none;" onclick="approve(2);">반려</button>
					</div>
					
						<div align="center">
							<input type="hidden" name="classNo" value="${ lec.classNo }">
							<table class="table1 table table-bordered" style="width:1090px">
								<tr>
									<th width="200px">개설년도</th>
									<td width="200px"><input class="input" id="year" name="classYear" value="${lec.classYear}"></td>
									<th width="200px">학기</th>
									<td width="200px">
									<c:if test="${lec.classSemester eq 1}">
										<input value="1학기">
									</c:if>
									<c:if test="${lec.classSemester eq 2}">
										<input value="2학기">
									</c:if>
									</td>
									<th width="200px">수업유형</th>
									<td width="200px">
									<c:if test="${lec.classCategory eq 1}">
										<input value="대면">
									</c:if>
									<c:if test="${lec.classCategory eq 2}">
										<input value="비대면">
									</c:if>
								</tr>
								<tr>
									<th colspan="2">과목명(한글)</th>
									<td colspan="4"><input class="input" name="classKorName" value="${lec.classKorName}"></td>
								</tr>	
								<tr>
									<th colspan="2">과목명(영문)</th>
									<td colspan="4"><input class="input" name="classEngName" value="${lec.classEngName}"></td>
								</tr>
								<tr>
									<th colspan="2">개요(한글)</th>
									<td colspan="4">
									<textarea class="textarea" name="classKorOutline" onkeydown="resize(this)" onkeyup="resize(this)">${lec.classKorOutline}</textarea></td>
								</tr>
								<tr>
									<th colspan="2">개요(영문)</th>
									<td colspan="4">
									<textarea class="textarea" name="classEngOutline" onkeydown="resize(this)" onkeyup="resize(this)">${lec.classEngOutline}</textarea></td>
									<!-- To provide students with the use of problem-solving skills for solving realistic engineering problems using problem-based learning techniques, including definition of problem, creative problem solving, design of experiments, and optimization. To familiarize students with experience working as a member of an engineering work team, with experience using several modern tools and techniques to solve engineering problems. This course will help you develop the skills necessary to solve the real engineering problems facing engineers today. You will learn underlying principles an master techniques to solve engineering problems. --></td>
								</tr>
								<tr>
									<th colspan="2">수업목표</th>
									<td colspan="4">
									<textarea class="textarea" name="classGoal" onkeydown="resize(this)" onkeyup="resize(this)">${lec.classGoal}</textarea></td>
								</tr>
								<tr>
									<th>과목코드</th>
									<td><input class="input" placeholder="입력 제외" value="${lec.classCode}"></td>
									<th>전공</th>
									<td><input class="input" name="profMajor" value="${lec.profMajor}"></td>
									<th>정원</th>
									<td><input type="number" class="input" name="maxStud" value="${lec.maxStud}"></td>
								</tr>
								<tr>
									<th>이수구분</th>
									<td>
									<c:if test="${lec.classDivision eq 1}">
										<input value="전공필수">
									</c:if>
									<c:if test="${lec.classDivision eq 2}">
										<input value="전공선택">
									</c:if>
									<c:if test="${lec.classDivision eq 3}">
										<input value="교양">
									</c:if>
									</td>
									<th>학점</th>
									<td><input type="number" class="input" name="classCredit" value="${lec.classCredit}"></td>
									<th>강의실</th>
									<td style="background:#FEFAE0;"><input class="input" placeholder="관리자 입력" name="classLocation" value="${lec.classLocation}"></td>
								</tr>
								<tr>
									<th>주관교수</th>
									<td>
									<input class="input" value="${lec.korName}">
									</td>
									<th>연락처</th>
									<td><input type="tel" class="input" name="classPhone" value="${lec.classPhone}"></td>
									<th>교수실</th>
									<td><input class="input" name="profLocation" value="${lec.profLocation}"></td>
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
										<td><input type="number" class="input" name="scoreAtt" value="${lec.scoreAtt}"></td>
										<td><input type="number" class="input" name="scoreTask" value="${lec.scoreTask}"></td>
										<td><input type="number" class="input" name="scoreMid" value="${lec.scoreMid}"></td>
										<td><input type="number" class="input" name="scoreFin" value="${lec.scoreFin}"></td>
									</tr>
								</table>
							</div>
						</div>
							
							<div class="plan" style="float:left">
								<div class="plan-top">
									<p>* 강의계획서</p>
									<label for="planPDF" class="button btn-sm btn-secondary" style="font-size:14px; margin-left:40px">파일첨부</label>
								<div class="pdfBox" style="padding:10px;background:lightgray"></div>
								<input type="file" name="upfile" id="planPDF" disabled>
								</div>
							</div>
							
							<div id="timetable" style="float:left">
								<table class="table table-bordered">
									<tr>
										<th colspan="2">시간표</th>
									</tr>
									<tr>
										<th width="80">요일</th>
										<td width="100" style="background:#FEFAE0;">
											<input type="text" name="classDay" value="${lec.classDay}">
										</td>
									</tr>
									<tr>
										<th>교시</th>
										<td style="background:#FEFAE0;">
											<input type="text" name="classStart" value="${lec.classStart}">				
										</td>	
									</tr>
									<tr>
										<th>시간</th>
										<td style="background:#FEFAE0;">
											<input type="text" name="classTime" value="${lec.classTime}">		
										</td>
										
									</tr>
								</table>
							</div>
						
					</form>
		
					
			
			
			
		</div>	<!-- content -->
		
	</div>
	</div>
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
		
		function approve(app){
			
			var update = document.getElementById('updateForm');
			update.action = "cupdate?app=" + app;
			update.submit();
			
			
		}
	</script>
		
	
	
</body>
</html>