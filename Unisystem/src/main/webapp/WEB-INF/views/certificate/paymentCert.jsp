<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<link href="resources/css/certificate/paymentCert.css" rel="stylesheet">
</head>
<body>

	<jsp:include page="../common/links.jsp" />
	<jsp:include page="../common/header.jsp" />	
	
	<div id="wrapper">
		<jsp:include page="../student/smySidebar.jsp" />
		<section>
			<header id="cert-header">
				<div id="pageName-area">
					<div class="pageName"><p style="color:gray">마이페이지>&nbsp;</p><p style="font-size:19px; font-weight:600;">증명서 발급</p></div>
					<br><br>
					<div id="pageName">증명서 발급 신청</div>
					<br><br>
	                <hr id="cert-line">
	            </div>
			</header>
			<article>
				<div id="contents">
            		<div style="font-size:17px; font-weight:600; margin-bottom:30px;"><i class="fas fa-check-circle fa-lg"></i>&nbsp;&nbsp;신청내역 및 결제</div>
            		<table class="table table-bordered" id="list" style="width:900px;">
            			<tbody>
            				<tr>
            					<th>신청증명서</th>
            					<th>용도</th>
            					<th>제출처</th>
            					<th>증명수수료</th>
            				</tr>
            				<tr>
            					<td>(국)졸업증명서</td>
            					<td>취업 제출용</td>
            					<td>유니컴퍼니</td>
            					<td>1,000원</td>
            				</tr>
            			</tbody>
            		</table>
            		<div id="sum-area">
            			<div>
	            			<span style="margin-left:180px">총계 1건</span>
	            			<span style="margin-left:60px">1,000원 x </span>
	            			<span>1</span>
	            			<span style="margin-left:10px">= 최종 결제액</span>
	            			<span style="margin-left:10px; color:yellow;">1,000</span>
	            			<span>원</span>
            			</div>
            		</div>
            		<div id="btn-area">
	            		<button class="btns" style="background:gray">뒤로가기</button>
	            		<button class="btns">결제</button>
            		</div>
            	</div>
			</article>
		</section>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
	
	<!-- 
	<script>
		$(document).ready(function(){
			let $len = $("section").height();
			$(".wrap_sidebar").css('height', $len + 22);
		})
	</script>
	 -->
</body>
</html>