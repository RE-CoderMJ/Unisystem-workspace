<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<link href="resources/css/pages/wrapperStyle.css" rel="stylesheet">
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<style>
	#selectG{
		width:200px;
		border:none;
		border-radius:10px;
		height:38px;
	}

	.btnBox{
		width:100%;
		height:30px;
		position:relative;
		margin:10px;
	}
	.btnBox>div{
		width:auto;
		height:30px;
		float:left;
	}
	.switchBox>div{
		width:200px;
		height:30px;
		float:left;
	}
	.btnDiv{
		position:absolute;
		right:10px;
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
	.createClass>table{
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
		<div id="sidebar" style="float:left;"><jsp:include page="../common/adminSidebar.jsp" /></div>
		<div id="content" style="float:left;">
			<div class="topBox">
				<div class="pageName"><p>관리자페이지&nbsp;>&nbsp;강의&nbsp;>&nbsp;</p><p style="color:black; font-size:24px; font-weight:900;">&nbsp;강의 신청내역</p></div>
			</div>
			
						
			
			  <!-- The Modal -->
			  <div class="modal fade" id="class">
			    <div class="modal-dialog modal-lg">
			      <div class="modal-content">
			      
			        <!-- Modal Header -->
			        <div class="modal-header">
			          <h4 class="modal-title">Modal Heading</h4>
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			        </div>
			        
			        <!-- Modal body -->
			        <div class="modal-body">
			          Modal body..
			        </div>
			        
			        <!-- Modal footer -->
			        <div class="modal-footer">
			          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			        </div>
			        
			      </div>
			    </div>
			  </div>
			  
						
			
			<div class="searchList">
				<div class="searchBox" style="padding:18px">
					<span class="nameTag">강의 개설 신청 현황</span>
				</div>
			</div>	

				<div class="appList">
				<div class="btnBox">
					<div class="btnDiv">
						<button class="btn btn-sm btn-outline-secondary" onclick="createClass();">강의 생성</button>
						<button class="btn btn-sm btn-outline-secondary">삭제</button>
					</div>
				</div>
					<table class="table table-hover">
						<thead>
							<tr>
								<th width="30"><input type="checkbox"></th>
								<th width="100">순번</th>
								<th width="220">신청번호</th>
								<th width="150">신청일자</th>
								<th width="400">강의명</th>
								<th width="100">교수자</th>
								<th width="250">상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="c" items="${ list }">
							<tr>
								<td><input type="checkbox"></td>
								<td>${ c.rownum }</td>
								<td>${ c.classNo }</td>
								<td>${ c.appdate }</td>
								<td>${ c.classKorName }</td>
								<td>${ c.korName }</td>
								<c:choose>
									<c:when test="${ empty c.classStatus }">
										<td><button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#class" style="background:#0466C8;color:white;border:white;" >대기</button></td>
									</c:when>
									<c:when test="${ c.classStatus eq 'Y' }">
										<td><button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#class" style="background:#F8F7FF;color:black;border:white;">승인</button></td>
									</c:when>
									<c:otherwise>
										<td><button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#class" style="background:#E2EAFC;color:black;border:white;">반려</button></td>
									</c:otherwise>
								</c:choose>
							</tr>
							</c:forEach>
							
						</tbody>
					</table>
					
					<div class="container">
                    <ul class="pagination justify-content-center">
		                   <c:choose>
		    				<c:when test="${ pi.currentPage eq 1 }">            
			                    <li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
		                    </c:when>
		                    <c:otherwise>
		                    	<li class="page-item"><a class="page-link" href="clist.ad?cpage=${pi.currentPage-1}">&lt;</a></li>
		                    </c:otherwise>
		                   </c:choose>
                    
                    	<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
                   		  <c:choose>
                    		<c:when test="${ pi.currentPage == p }">
                    			<li class="page-item active"><a class="page-link" href="clist.ad?cpage=${p}">${p}</a></li>
            			        <!-- $(".pagination a").text() 와 ${ pi.currentPage } 가 일치할 경우 a의 부모요소 li에 active 부여   -->
                    		</c:when>		    			
		                    <c:otherwise>
		                   		<li class="page-item"><a class="page-link" href="clist.ad?cpage=${p}">${p}</a></li>
		                    </c:otherwise>
		                   </c:choose>
                    	</c:forEach>
                    
                    		<c:choose>
						<c:when test="${ pi.currentPage eq pi.maxPage }">
		                    <li class="page-item "><a class="page-link" href="#">&gt;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="clist.ad?cpage=${ pi.currentPage+1 }">&gt;</a></li>
						</c:otherwise>						
						</c:choose>	
                    </ul>
                 </div>
				</div>
						
						
				<!-- 강의 개설 -->
			<div id="createClass" style="display:none">
				<br>
				<div class="createClass">
					<label>* 교과목 개설 신청</label>
					
					<form action="insertClass.ad" method="post" enctype="multipart/form-data">
						<div align="center">
							<table class="table1 table table-bordered" style="width:1090px">
								<tr>
									<th width="200px">개설년도</th>
									<td width="200px"><input class="input" id="year" name="classYear" value="0"></td>
									<th width="200px">학기</th>
									<td width="200px" style="padding:5px 10px;">
									<select name="classSemester">
										<option value="1">1학기</option>
										<option value="2">2학기</option>
									</select>
									</td>
									<th width="200px">수업유형</th>
									<td width="200px" style="padding:5px 10px;">
									<select name="classCategory">
										<option value="1">대면</option>
										<option value="2">비대면</option>
									</select>
									</td>
								</tr>
								<tr>
									<th colspan="2">과목명(한글)</th>
									<td colspan="4"><input class="input" name="classKorName" required></td>
								</tr>	
								<tr>
									<th colspan="2">과목명(영문)</th>
									<td colspan="4"><input class="input" name="classEngName"></td>
								</tr>
								<tr>
									<th colspan="2">개요(한글)</th>
									<td colspan="4">
									<textarea class="textarea" name="classKorOutline" onkeydown="resize(this)" onkeyup="resize(this)"></textarea></td>
									<!-- 공학입문 설계 교과목의 목표는 공학문제를 설계문제로 정의하고 이를 해결하는 설계과정을 계획하고 문제의 해를 도출할 수 있는 문제해결 능력을 제공하는 데 있다. 또한 팀웍과 다양한 공학문제 해결 도구에 익숙하도록 하는데 교과목의 목표가 있다. 공학문제 해결 과정을 이해하고, 이에 대한 최선의 해를 도출하기 위한 체계적인 문제해결방법의 원리 및 이론을 공부한다. 설계문제의 정식화를 공부하며 정식화된 설계문제를 체계적으로 해결하기 위한 방법을 공부한다. -->
								</tr>
								<tr>
									<th colspan="2">개요(영문)</th>
									<td colspan="4">
									<textarea class="textarea" name="classEngOutline" onkeydown="resize(this)" onkeyup="resize(this)"></textarea></td>
									<!-- To provide students with the use of problem-solving skills for solving realistic engineering problems using problem-based learning techniques, including definition of problem, creative problem solving, design of experiments, and optimization. To familiarize students with experience working as a member of an engineering work team, with experience using several modern tools and techniques to solve engineering problems. This course will help you develop the skills necessary to solve the real engineering problems facing engineers today. You will learn underlying principles an master techniques to solve engineering problems. --></td>
								</tr>
								<tr>
									<th colspan="2">수업목표</th>
									<td colspan="4">
									<textarea class="textarea" name="classGoal" onkeydown="resize(this)" onkeyup="resize(this)"></textarea></td>
								</tr>
								<tr>
									<th>과목코드</th>
									<td><input class="input" placeholder="입력 제외" disabled></td>
									<th>전공</th>
									<td><input class="input" name="profMajor" value="${ loginUser.profMajor }"></td>
									<th>정원</th>
									<td><input type="number" class="input" name="maxStud"></td>
								</tr>
								<tr>
									<th>이수구분</th>
									<td style="padding:5px 5px 0px 0px;">
										<select name="classDivision" style="margin-right:90px">
											<option value="1">전공필수</option>
											<option value="2">전공선택</option>
											<option value="3">교양</option>
										</select>
									</td>
									<th>학점</th>
									<td><input type="number" class="input" name="classCredit"></td>
									<th>강의실</th>
									<td><input type="text" class="input" name="classLocation"></td>
								</tr>
								<tr>
									<th>주관교수 교번</th>
									<td>
									<input class="input" name="profNo"">
									</td>
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
								<div class="pdfBox" style="padding:10px;"></div>
								<input type="file" name="upfile" id="planPDF">
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
											<option value="1">1시간</option>
											<option value="2">2시간</option>
											<option value="3">3시간</option>
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
						
				</div> <!-- appList -->
			</div> <!-- searchList -->
			
			
		</div> <!-- content -->
	</div> <!-- wrap -->
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
			
				var check = $("input[type='checkbox']");
					check.click(function(){
						$(".switchBox p").toggle();
					});
					
				
				// 사이드바 길이 조절
				function sidebar(){
					document.getElementById("content").style.marginBottom = "50px";
					let $len = $("#content").height();
					let side = $(".wrap_sidebar").height();
						if($len > 750){
							$(".wrap_sidebar").css('height', $len);
						}else{
							$(".wrap_sidebar").css('height', 270);
							$("#content").css('height', side);
						}
				}
				
			
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