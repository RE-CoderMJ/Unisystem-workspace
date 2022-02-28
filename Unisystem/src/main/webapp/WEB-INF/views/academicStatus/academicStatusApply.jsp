<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import = "java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<link href="resources/css/academicStatus/academicStatus.css" rel="stylesheet">
<%
	String today = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()); 
	int year = Integer.parseInt(new java.text.SimpleDateFormat("yyyy").format(new java.util.Date()));
%>
<style>
	#list>tbody tr{
		cursor:pointer;
	}
</style>
</head>
<body>

	<jsp:include page="../common/links.jsp" />
	<jsp:include page="../common/header.jsp" />	
	
	<div id="wrapper">
		<jsp:include page="../student/smySidebar.jsp" />
		<section>
			<header id="academic-header">
				<div id="pageName-area">
					<div class="pageName"><p style="color:gray">마이페이지>학적변동>&nbsp;</p><p style="font-size:19px; font-weight:600;">휴복학 신청</p></div>
					<br><br>
					<div id="pageName">학생 정보</div>
	                <br><br><br>
	                <table class="table table-bordered" style="width:1134px;">
						<tbody>
							<tr>
								<th>학번</th>
								<td>${loginUser.userNo}</td>
								<th>성명</th>
								<td>${loginUser.korName}</td>
								<th>생년월일</th>
								<td>${loginUser.birthday}</td>
								<th>성별</th>
								<td>${loginUser.gender}</td>
							</tr>
							<tr>
								<th>대학</th>
								<td>${loginUser.studUniv}</td>
								<th>학과</th>
								<td>${loginUser.studDepartment}</td>
								<th>전공</th>
								<td>${loginUser.studMajor}</td>
								<th>복수전공</th>
								<td>${loginUser.studMinor}</td>
							</tr>
							<tr>
								<th>학년</th>
								<td>${loginUser.studSemester/2}</td>
								<th>국적</th>
								<td>${loginUser.nation}</td>
								<th>입학일자</th>
								<td>${loginUser.studInto}</td>
								<th>졸업일자</th>
								<td>${loginUser.studGrad}</td>
							</tr>
							<tr>
								<th>입학구분</th>
								<c:choose>
									<c:when test="${loginUser.studDivision eq 1 }">
										<td>신입</td>
									</c:when>
									<c:when test="${loginUser.studDivision eq 2 }">
										<td>편입</td>
									</c:when>
									<c:otherwise>
										<td>재입학</td>
									</c:otherwise>
								</c:choose>
								<th>학적변동</th>
								<c:choose>
									<c:when test="${loginUser.studStatus eq 1 }">
										<td>재학</td>
									</c:when>
									<c:when test="${loginUser.studStatus eq 2 }">
										<td>휴학</td>
									</c:when>
									<c:when test="${loginUser.studStatus eq 3 }">
										<td>졸업</td>
									</c:when>
									<c:otherwise>
										<td>자퇴</td>
									</c:otherwise>
								</c:choose>
								<th>담당교수</th>
								<td>${profName}</td>
								<th>이수학점</th>
								<td>${loginUser.studSemester}</td>
							</tr>
						</tbody>
					</table>
	            </div>
			</header>
			<article>
                <div id="contents">
                	<div class="titles">휴복학 신청</div>
                	<form action="myStu.academic.applyAsOff" method="post" id="off" enctype="multipart/form-data">
                		<input type="hidden" name="studNo" value="${loginUser.userNo }">
                		<input type="hidden" name="asType" value="1">
	                	<div id="offYearSelect">
		                	<table class="table table-bordered" style="width:1134px;">
								<tbody>
									<tr>
										<th style="width:140px;">신청사항 선택</th>
										<td colspan="2">
											<input type="radio" id="offYear-off" name="formFor" value="1">
		       	 							<label for="offYear" style="margin-right:10px;">휴학</label>
											<input type="radio" id="back-off" name="formFor" value="2">
		       	 							<label for="back">복학</label>
										</td>
									</tr>
									<tr>
										<th>학적상태</th>
										<td style="width:140px;">재학</td>
										<th>신청일자</th>
										<c:set value="<%=today%>" var="today" />
										<td>${today}</td>
										<th>복학희망년도</th>
										<td><input type="number" name="offUntilYear" style="height:30px; width:140px;"></td>
										<td></td>
									</tr>
									<tr>
										<th>휴학뷴류</th>
										<td>
											<select name="offType" style="height:30px; width:140px;">
												<option value="1">일반휴학</option>
												<option value="2">군입대휴학</option>
												<option value="3">임신/출산휴학</option>
												<option value="4">육아유학</option>
											</select>
										</td>
										<c:set value="<%=year%>" var="year" />
										<th>신청년도</th>
										<td><input type="number" name="offYear" style="height:30px; width:140px;"></td>
										<th>복학 희망 학기</th>
										<td>
											<select name="offUntilSemester" style="height:30px; width:140px;">
												<option value="1">1학기</option>
												<option value="2">2학기</option>
											</select>
										</td>
										<td></td>
									</tr>
									<tr>
										<th>휴학사유</th>
										<td>
											<select name="reason" style="height:30px; width:140px;">
												<option value="" selected>선택하세요</option>
												<option value="1">개인사정</option>
												<option value="2">군입대</option>
												<option value="3">기타</option>
											</select>
										</td>
										<th>신청학기</th>
										<td>
											<select name="offSemester" style="height:30px; width:140px;">
												<option value="1">1학기</option>
												<option value="2">2학기</option>
											</select>
										</td>
										<th>첨부파일</th>
										<td colspan="2" style="height:30px;"><input type="file" id="files" name="files" multiple></td>
									</tr>
									<tr>
										<th rowspan="3">휴학사유상세<br>[200자이내]</th>
										<td colspan="6"><textarea id="reason-area" name="reasonDetail" placeholder="휴학 사유를 간단하게 입력하세요."></textarea></td>
									</tr>
								</tbody>
							</table>
						</div>
						</form>
						
						<form action="myStu.academic.applyAsBack" method="post" id="back">
						<div id="backYearSelect">
							<input type="hidden" name="studNo" value="${loginUser.userNo }">
                			<input type="hidden" name="asType" value="2">
							<table class="table table-bordered" style="width:1134px;">
								<tbody>
									<tr>
										<th style="width:140px;">신청사항 선택</th>
										<td colspan="2">
											<input type="radio" id="offYear-b" name="formFor" value="1">
		       	 							<label for="offYear" style="margin-right:10px;">휴학</label>
											<input type="radio" id="back-b" name="formFor" value="2">
		       	 							<label for="back">복학</label>
										</td>
									</tr>
									<tr>
										<th>학적상태</th>
										<td style="width:140px;">휴학</td>
										<th>신청일자</th>
										<td>${today}</td>
										<th>복학신청년도</th>
										<td><input type="number" name="backYear" style="height:30px; width:140px;"></td>
										<td></td>
									</tr>
									<tr>
										<th>휴학뷴류</th>
										<td id="offType">
											
										</td>
										<th>휴학 신청년도</th>
										<td id="offYear"></td>
										<th>복학 신청 학기</th>
										<td>
											<select name="backSemester" style="height:30px; width:140px;">
												<option value="1">1학기</option>
												<option value="2">2학기</option>
											</select>
										</td>
										<td></td>
									</tr>
									<tr>
										<th>휴학사유</th>
										<td id="reason">
											
										</td>
										<th>휴학 신청학기</th>
										<td id="offSemester">
											
										</td>
									</tr>
									<tr>
										<th rowspan="3">휴학사유상세</th>
										<td colspan="6" id="reasonDetail"></td>
									</tr>
								</tbody>
							</table>
						</div>
						</form>
						
						<div style="font-size:13px;">
							<span style="font-weight:800;">첨부파일: </span>
							<span style="color:red; font-weight:800;">&nbsp;* 증빙서류</span>
							<div>
								<ol style="color:red; margin-left:-28px;">
									<li>일반휴학 : 해당사항 없음</li>
									<li>군입대휴학 : [입영통지서]업로드</li>
									<li>임신/출산휴학 : [진단서]업로드</li>
									<li>육아휴학 : [주민등록등본 or 가족관계증명서]업로드</li>
								</ol>
							</div>
						</div>
						
						<div align="right" style="width:1130px;">
							<button type="submit" id="apply-btn">신청</button>
						</div>
                
                	<div id="progress">
	                	<span class="titles">진행 절차 안내</span><br><br><br>
	                	<div class="name" style="margin-left:80px;">신청</div>
	                	<div><i class="fas fa-angle-double-right fa-2x"></i></div>
	                	<div class="name">접수</div>
	                	<div><i class="fas fa-angle-double-right fa-2x"></i></div>
	                	<div class="name">담당교수승인</div>
	                	<div><i class="fas fa-angle-double-right fa-2x"></i></div>
	                	<div class="name" style="font-size:19px;">학사지원과진행</div>
	                	<div><i class="fas fa-angle-double-right fa-2x"></i></div>
	                	<div class="name">최종승인</div>
                	</div>
                	<div style="margin-bottom:100px;">
                		<div class="titles" style="margin-bottom:0px;">신청내역</div>
                		<br><br><br>
	                	<table class="table table-hover" id="list" style="width:1134px; text-align:center; margin-top:10px;">
		                    <thead>
		                    	<tr style="background:rgb(232, 232, 232);">
		                    		<th>No.</th>
		                    		<th>신청일자</th>
		                    		<th>신청사항</th>
		                    		<th>학사지원과진행 상태</th>
		                    	</tr>		                    
		                    </thead>
		                    <tbody style="border-top:2px solid gray; border-bottom:2px solid gray;">
		                        <c:choose>
		                        	<c:when test="${asList eq null}">
		                        		<td colspan='4'>신청내역이 없습니다.</td>
		                        	</c:when>
		                        	<c:otherwise>
				                        <c:forEach var="a" items="${asList}">
				                        <tr>
				                            <td class="as-no">${a.asNo}</td>
				                            <td>${a.asDate}</td> 
				                            <td class="as-type">${a.asTypeT}</td>
				                            <td>${a.progressT }</td>
				                        </tr>
				                        </c:forEach>
		                        	</c:otherwise>
		                        </c:choose>
		                    </tbody>
	                	</table>
               		</div>
             	</div>
			</article>
		</section>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
	
	<!-- 작성 폼 양식 학생의 상태에 따라 알맞게 뜨도록 -->
	<script>
    	$(function(){
    		if('${loginUser.studStatus}' == 1){
	    		$("#offYear-off").prop("checked", true);
	    		$("#backYearSelect").hide();
	    		$("#offYearSelect").show();
    		}else if('${loginUser.studStatus}' == 2){
    			$("#back-b").prop("checked", true);
    			$("#offYearSelect").hide();
    			$("#backYearSelect").show();
    			
    			$.ajax({
    				url:"myProf.selectOffApply",
    				data:{userNo:'${loginUser.userNo}'},
    				success:function(as){
    					$("#offType").text(as.offTypeT);
    					$("#offYear").text(as.offYear);
    					$("#reason").text(as.reasonT);
    					$("#offSemester").text(as.offSemester);
    					$("#reasonDetail").text(as.reasonDetail);
    				},error:function(){
    					console.log("복학신청내역 데이터 조회용 ajax 통신 실패");
    				}
    			})
    		}else{
    			alert("졸업한 학생은 휴복학 신청이 불가능합니다.");
    			location.href="list.st";
    		}
    		
    		$("input[name='formFor']").on("change", function(){
	    		let option = $("input[name='formFor']:checked").val();
	    		
	    		if(option == 2){
	    			if('${loginUser.studStatus}' == 1){
	    				alert("휴학중인 학생만 신청이 가능합니다.");
		    			$("#back-b").prop("checked", false);
	    				$("#offYear-off").prop("checked", true);
	    			}
	    		}else{
	    			if('${loginUser.studStatus}' == 2){
	    				alert("재학중인 학생만 신청이 가능합니다.");
		    			$("#offYear-off").prop("checked", false);
		    			$("#back-b").prop("checked", true);
	    			}
	    		}    		    			
    		})
    	})
    </script>
    
    <!-- 학적변동 신청 ajax -->
    <script>
    	$(document).on("click", "#apply-btn", function(){
    		let option = $("input[name='formFor']:checked").val();
    		
    		if(option == 1){
    			$("#off").submit();
    		}else{
    			$("#back").submit();
    		}
    	})
    </script>
    
    <!-- 상세보기 -->
    <script>
    	$(function(){
    		$("#list>tbody tr").click(function(){
    			if($(this).children(".as-type").text() == "휴학"){
	    			location.href="myStu.academic.detailOff?asNo=" + $(this).children(".as-no").text();     				
    			}else{
    				location.href="myStu.academic.detailBack?asNo=" + $(this).children(".as-no").text();
    			}
    		})
    	})
    </script>
	
	<script>
		$(document).ready(function(){
			let $len = $("section").height();
			$(".wrap_sidebar").css('height', $len + 22);
		})
	</script>
	
	<script>
		$(function(){
			$("#academic-status").slideDown();
		})
	</script>

</body>
</html>