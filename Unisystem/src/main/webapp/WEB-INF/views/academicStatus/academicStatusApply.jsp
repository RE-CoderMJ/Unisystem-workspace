<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<link href="resources/css/academicStatus/academicStatus.css" rel="stylesheet">
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
	                <br>
	                <table class="table table-bordered" style="width:1134px;">
						<tbody>
							<tr>
								<th>학번</th>
								<td>201112345</td>
								<th>성명</th>
								<td>김길동</td>
								<th>생년월일</th>
								<td>1996-01-12</td>
								<th>성별</th>
								<td>남성</td>
							</tr>
							<tr>
								<th>대학</th>
								<td>자연과학대학</td>
								<th>학과</th>
								<td>물리학과</td>
								<th>전공</th>
								<td>물리학</td>
								<th>복수전공</th>
								<td></td>
							</tr>
							<tr>
								<th>학년</th>
								<td>2</td>
								<th>국적</th>
								<td>대한민국</td>
								<th>입학일자</th>
								<td>2011-02-06</td>
								<th>졸업일자</th>
								<td></td>
							</tr>
							<tr>
								<th>입학구분</th>
								<td>신입</td>
								<th>학적변동</th>
								<td>재학</td>
								<th>담당교수</th>
								<td>홍말동</td>
								<th>이수학점</th>
								<td>58</td>
							</tr>
						</tbody>
					</table>
	            </div>
			</header>
			<article>
                <div id="contents">
                	<div class="titles">휴복학 신청</div>
                	<form>
	                	<div id="offYearSelect">
		                	<table class="table table-bordered" style="width:1134px;">
								<tbody>
									<tr>
										<th style="width:140px;">신청사항 선택</th>
										<td colspan="2">
											<input type="radio" id="offYear" name="formFor" value="1" checked>
		       	 							<label for="offYear" style="margin-right:10px;">휴학</label>
											<input type="radio" id="back" name="formFor" value="2">
		       	 							<label for="back">복학</label>
										</td>
									</tr>
									<tr>
										<th>학적상태</th>
										<td style="width:140px;">재학</td>
										<th>신청일자</th>
										<td>2021-07-01</td>
										<th>복학희망년도</th>
										<td><input type="number" style="height:30px; width:140px;"></td>
										<td></td>
									</tr>
									<tr>
										<th>휴학뷴류</th>
										<td>
											<select name="offSemester" style="height:30px; width:140px;">
												<option value="1">일반휴학</option>
												<option value="2">군입대휴학</option>
												<option value="3">임신/출산휴학</option>
												<option value="4">육아유학</option>
											</select>
										</td>
										<th>신청년도</th>
										<td><input type="number" style="height:30px; width:140px;"></td>
										<th>복학 희망 학기</th>
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
										<td>
											<select name="offSemester" style="height:30px; width:140px;">
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
										<td colspan="2" style="height:30px;"><input type="file"></td>
									</tr>
									<tr>
										<th rowspan="3">휴학사유상세<br>[200자이내]</th>
										<td colspan="6"><textarea id="reason-area" placeholder="휴학 사유를 간단하게 입력하세요."></textarea></td>
									</tr>
								</tbody>
							</table>
						</div>
						
						<div id="backYearSelect" style="display:none;">
							<table class="table table-bordered" style="width:1134px;">
								<tbody>
									<tr>
										<th style="width:140px;">신청사항 선택</th>
										<td colspan="2">
											<input type="radio" id="offYear" name="formFor" value="1">
		       	 							<label for="offYear" style="margin-right:10px;">휴학</label>
											<input type="radio" id="back" name="formFor" value="2" checked>
		       	 							<label for="back">복학</label>
										</td>
									</tr>
									<tr>
										<th>학적상태</th>
										<td style="width:140px;">휴학</td>
										<th>신청일자</th>
										<td>2021-07-01</td>
										<th>복학신청년도</th>
										<td><input type="number" style="height:30px; width:140px;"></td>
										<td></td>
									</tr>
									<tr>
										<th>휴학뷴류</th>
										<td>
											일반휴학
										</td>
										<th>휴학 신청년도</th>
										<td>2021</td>
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
										<td>
											기타
										</td>
										<th>휴학 신청학기</th>
										<td>
											1학기
										</td>
									</tr>
									<tr>
										<th rowspan="3">휴학사유상세</th>
										<td colspan="6"></td>
									</tr>
								</tbody>
							</table>
						</div>
						
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
					</form>
                
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
						<div id="notice">** 접수된 후에는 신청내역 삭제 불가</div>
						<button id="delete-btn"><span style="color:red">-</span>&nbsp;삭제</button>
	                	<table class="table table-hover" id="list" style="width:1134px; text-align:center; margin-top:10px;">
		                    <tbody style="border-top:2px solid gray; border-bottom:2px solid gray;">
		                    	<tr style="background:rgb(232, 232, 232);">
		                    		<th><input type="checkbox" class="checkbox"></th>
		                    		<th>No.</th>
		                    		<th>신청일자</th>
		                    		<th>신청사항</th>
		                    		<th>담당교수승인구분</th>
		                    		<th>학사지원과진행 상태</th>
		                    	</tr>
		                        <tr>
		                            <td><input type="checkbox" class="checkbox"></td>
		                            <td>2</td>
		                            <td>2022-01-20</td> 
		                            <td>복학</td>
		                            <td></td>
		                            <td>담당교수승인대기</td>
		                        </tr>
		                        <tr>
		                            <td><input type="checkbox" class="checkbox"></td>
		                            <td>1</td>
		                            <td>2021-07-01</td> 
		                            <td>휴학</td>
		                            <td>Y</td>
		                            <td>최종승인 완료</td>
		                        </tr>
		                    </tbody>
	                	</table>
               		</div>
             	</div>
			</article>
		</section>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
	
	<script>
    	$(function(){
    		$("input[name='formFor']").on("change", function(){
	    		let option = $("input[name='formFor']:checked").val();
	    		
	    		console.log(option);
	    		if(option == 2){
	    			$("#offYearSelect").hide();
	    			$("#backYearSelect").show();
	    		}else{
	    			$("#backYearSelect").hide();
	    			$("#offYearSelect").show();
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

</body>
</html>