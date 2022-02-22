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
	          		<button onclick="location.href='myStu.appList'" type="button" >목록</button>
	                <button onclick="location.href='myStu.appEnrollForm'"><span style="color:navy">+</span>&nbsp;신청</button>
	                <c:if test="${a.appStatus eq 1 }">
		                <button onclick="location.href='myStu.deleteApp?appNo=${a.appNo }'"><span style="color:red">-</span>&nbsp;삭제</button>
	                	<button onclick="location.href='myStu.editFormApp?appNo=${a.appNo}'">수정</button>
	                </c:if>
				</div>
			</header>
			<article>
                <div id="content-area">
	                <span class="badge badge-pill title">담당교수</span>
	                <span class="contents">${ a.profName }</span><br><br>
	                <span class="badge badge-pill title">신청날짜</span>
	                <span class="contents">${ a.enrollDate }</span><br><br>
	                <span class="badge badge-pill title">상담일시</span>
	                <span class="contents">${ a.appDate }</span><br><br>
	                <span class="badge badge-pill title">제목</span>
	                <span class="contents">${ a.title }</span><br><br>
	                <span class="badge badge-pill title" style="float:left;">내용</span>
	                <span class="contents" id="content">
	                	${ a.content }
	                </span><br><br>
	                <span class="badge badge-pill title">상태</span>
	                <c:choose>
	                	<c:when test="${ a.appStatus eq 1}">
			                <span class="contents pending">대기</span><br><br>
	                	</c:when>
	                	<c:when test="${ a.appStatus eq 2}">
			                <span class="contents approved">승인</span><br><br>
	                	</c:when>
	                	<c:when test="${ a.appStatus eq 3}">
			                <span class="contents completed">완료</span><br><br>
	                	</c:when>
	                	<c:otherwise>
	                		<span class="contents rejected">반려</span><br><br>
	          			</c:otherwise>
	               	</c:choose>
	                <span class="badge badge-pill title">반려 사유</span>
	                <span class="contents">${ a.profName == null ? "": a.reason }</span>
                </div>
			</article>
		</section>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
	
	<script>
		$(document).ready(function(){
			let $len = $("section").height();
			$("#webMail-sidebar").css('height', $len + 22);
		})
	</script>
	
</body>
</html>