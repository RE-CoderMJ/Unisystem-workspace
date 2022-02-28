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
	#apply-btn{
		color:white;
		font-weight:700;
		background:gray;
		border-radius:3px;
		border:none;
		width:70px;
		height:30px;
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
							<button type="submit" id="apply-btn">목록</button>
						</div>
             	</div>
			</article>
		</section>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
	

</body>
</html>