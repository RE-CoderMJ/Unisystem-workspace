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
		<jsp:include page="../common/adminSidebar.jsp" />
		<section>
			<header id="academic-header">
				<div id="pageName-area">
					<div class="pageName"><p style="color:gray">학적변동>&nbsp;</p><p style="font-size:19px; font-weight:600;">학적변동 신청내역</p></div>
					<br><br>
					<div id="pageName">학생 정보</div>
					<button type="submit" id="list-btn">목록</button>
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
                	<div class="titles">휴복학 신청 내용</div>
	                	<div id="offYearSelect">
		                	<table class="table table-bordered" style="width:1134px;">
								<tbody>
									<tr>
										<th>학적상태</th>
										<td style="width:140px;">재학</td>
										<th>신청일자</th>
										<td>2021-07-01</td>
										<th>복학희망년도</th>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<th>휴학뷴류</th>
										<td>
											
										</td>
										<th>신청년도</th>
										<td></td>
										<th>복학 희망 학기</th>
										<td>
											
										</td>
										<td></td>
									</tr>
									<tr>
										<th>휴학사유</th>
										<td>
											
										</td>
										<th>신청학기</th>
										<td>
											
										</td>
										<th>첨부파일</th>
										<td colspan="2" style="height:30px;"></td>
									</tr>
									<tr>
										<th rowspan="3">휴학사유상세</th>
										<td colspan="6"></td>
									</tr>
								</tbody>
							</table>
						</div>
						
						<div id="backYearSelect" style="display:none;">
							<table class="table table-bordered" style="width:1134px;">
								<tbody>
									<tr>
										<th>학적상태</th>
										<td style="width:140px;">휴학</td>
										<th>신청일자</th>
										<td>2021-07-01</td>
										<th>복학신청년도</th>
										<td></td>
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