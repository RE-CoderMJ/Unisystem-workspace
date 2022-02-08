<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<link href="resources/css/appointment/stuDetail.css" rel="stylesheet">
</head>
<body>

	<jsp:include page="../common/links.jsp" />
	<jsp:include page="../common/header.jsp" />	
	
	<div id="wrapper">
		<jsp:include page="../student/smySidebar.jsp" />
		<section>
			<header id="app-header">
				<div id="pageName-area">
					<div class="pageName"><p style="color:gray">마이페이지>상담>&nbsp;</p><p style="font-size:19px; font-weight:600;">상담 신청</p></div>
					<br><br>
					<div id="pageName">상담신청 내역</div>
	                <br>
	            </div>
	          	<div id="tools" align="right">
	          		<button data-toggle="modal" data-target="#editContact">목록</button>
	                <button data-toggle="modal" data-target="#addContact"><span style="color:navy">+</span>&nbsp;신청</button>
	                <button data-toggle="modal" data-target="#deleteContact"><span style="color:red">-</span>&nbsp;삭제</button>
	                <button data-toggle="modal" data-target="#editContact">수정</button>
				</div>
			</header>
			<article>
                <div id="content-area">
	                <span class="badge badge-pill title">담당교수</span>
	                <span class="contents">김땡땡 교수</span><br><br>
	                <span class="badge badge-pill title">신청날짜</span>
	                <span class="contents">2022-01-19</span><br><br>
	                <span class="badge badge-pill title">상담일시</span>
	                <span class="contents">2022-01-20 15:00</span><br><br>
	                <span class="badge badge-pill title">제목</span>
	                <span class="contents">이번학기 성적 관련 상담 신청합니다.</span><br><br>
	                <span class="badge badge-pill title" style="float:left;">내용</span>
	                <span class="contents" id="content">
	                	이것은 현저하게 일월과 같은 예가 되려니와 그와 같지 못하다 할지라도 창공에 반짝이는 뭇 별과 같이 산야에 피어나는 군영과 같이 이상은 실로 인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다
	                </span><br><br>
	                <span class="badge badge-pill title">상태</span>
	                <span class="contents pending">대기</span><br><br>
	                <span class="badge badge-pill title">반려 사유</span>
	                <span class="contents"></span>
                </div>
			</article>
		</section>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
	
	<!-- 
	<script>
		$(document).ready(function(){
			let $len = $("section").height();
			$("#webMail-sidebar").css('height', $len + 22);
		})
	</script>
	 -->
</body>
</html>