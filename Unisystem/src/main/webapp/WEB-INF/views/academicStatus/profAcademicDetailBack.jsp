<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<link href="resources/css/academicStatus/academicStatus.css" rel="stylesheet">
<style>
	#approve-btn{
	color:white;
	font-weight:700;
	background:rgb(26, 86, 162);
	border-radius:3px;
	border:none;
	width:70px;
	height:30px;
	}
	#reject-btn{
	color:white;
	font-weight:700;
	background:gray;
	border-radius:3px;
	border:none;
	width:70px;
	height:30px;
	}
	#list-btn{
	color:gray;
	font-weight:700;
	background:white;
	border-radius:3px;
	border:1px gray solid;
	width:70px;
	height:30px;
	margin-left:970px;
	margin-bottom:-30px;
	}
</style>
</head>
<body>

	<jsp:include page="../common/links.jsp" />
	<jsp:include page="../common/header.jsp" />	
	
	<div id="wrapper">
		<jsp:include page="../professor/pmySidebar.jsp" />
		<section>
			<header id="academic-header">
				<div id="pageName-area">
					<div class="pageName"><p style="color:gray">마이페이지>담당학생관리>&nbsp;</p><p style="font-size:19px; font-weight:600;">학적변동 신청내역</p></div>
					<br><br>
					<div id="pageName">학생 정보</div>
					<button type="submit" id="list-btn" onclick="location.href='myProf.academic.list?currentPage=1'">목록</button>
	                <br><br><br>
	                <table class="table table-bordered" style="width:1134px;">
						<tbody>
							<tr>
								<th>학번</th>
								<td>${s.userNo}</td>
								<th>성명</th>
								<td>${s.korName}</td>
								<th>생년월일</th>
								<td>${s.birthday}</td>
								<th>성별</th>
								<td>${s.gender}</td>
							</tr>
							<tr>
								<th>대학</th>
								<td>${s.studUniv}</td>
								<th>학과</th>
								<td>${s.studDepartment}</td>
								<th>전공</th>
								<td>${s.studMajor}</td>
								<th>복수전공</th>
								<td>${s.studMinor}</td>
							</tr>
							<tr>
								<th>학년</th>
								<td>${s.studSemester}</td>
								<th>국적</th>
								<td>${s.nation}</td>
								<th>입학일자</th>
								<td>${s.studInto}</td>
								<th>졸업일자</th>
								<td>${s.studGrad}</td>
							</tr>
							<tr>
								<th>입학구분</th>
								<c:choose>
									<c:when test="${s.studDivision eq 1 }">
										<td>신입</td>
									</c:when>
									<c:when test="${s.studDivision eq 2 }">
										<td>편입</td>
									</c:when>
									<c:otherwise>
										<td>재입학</td>
									</c:otherwise>
								</c:choose>
								<th>학적변동</th>
								<c:choose>
									<c:when test="${s.studStatus eq 1 }">
										<td>재학</td>
									</c:when>
									<c:when test="${s.studStatus eq 2 }">
										<td>휴학</td>
									</c:when>
									<c:when test="${s.studStatus eq 3 }">
										<td>졸업</td>
									</c:when>
									<c:otherwise>
										<td>자퇴</td>
									</c:otherwise>
								</c:choose>
								<th>담당교수</th>
								<td>${loginUser.korName }</td>
								<th>이수학점</th>
								<td>${s.studSemester}</td>
							</tr>
						</tbody>
					</table>
	            </div>
			</header>
			<article>
                <div id="contents">
                	<div class="titles">휴복학 신청 내용</div>
						<div id="backYearSelect">
							<table class="table table-bordered" style="width:1134px;">
								<tbody>
									<tr>
										<th>학적상태</th>
										<td style="width:140px;">휴학</td>
										<th>신청일자</th>
										<td>${asBack.asDate}</td>
										<th>복학신청년도</th>
										<td>${asBack.backYear}</td>
										<td></td>
									</tr>
									<tr>
										<th>휴학뷴류</th>
										<td>
											${asOff.offTypeT}
										</td>
										<th>휴학 신청년도</th>
										<td>${asOff.offYear}</td>
										<th>복학 신청 학기</th>
										<td>
											${asBack.backSemester}
										</td>
										<td></td>
									</tr>
									<tr>
										<th>휴학사유</th>
										<td>
											${asOff.reasonT}
										</td>
										<th>휴학 신청학기</th>
										<td>
											${asOff.reasonT}
										</td>
									</tr>
									<tr>
										<th rowspan="3">휴학사유상세</th>
										<td colspan="6">${asOff.reasonDetail}</td>
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
							<button type="submit" id="reject-btn">반려</button>
							<button type="submit" id="approve-btn">승인</button>
						</div>
  	
             	</div>
			</article>
		</section>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
	
	<script>
		$(document).ready(function(){
			let $len = $("section").height();
			$(".wrap_sidebar").css('height', $len + 22);
		})
	</script>
	
</body>
</html>