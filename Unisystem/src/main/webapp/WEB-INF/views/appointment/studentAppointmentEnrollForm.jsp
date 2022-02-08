<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<link href="resources/css/appointment/stuEnrollForm.css" rel="stylesheet">
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
			</header>
			<article>
                <div id="content-area">
	                <span class="badge badge-pill title">담당교수</span>
	                <span class="contents">김땡땡 교수</span><br><br>
	                <span class="badge badge-pill title">신청날짜</span>
	                <span class="contents">2022-01-19</span><br><br>
	                <span class="badge badge-pill title">상담 가능 시간</span>
	                <span class="contents">매주 월, 수, 금(15:00 ~ 18:00) | 한 시간 단위</span><br>
	                <span id="warn">** 상담 가능 시간 외 신청 시 반려될 수 있습니다.</span><br><br>
	                <form action="">
		                <span class="badge badge-pill title">상담일자</span>
		                <input type="date" class="contents">
		                <select style="height:30px;">
	                    	<option value="">15:00~16:00</option>
	                        <option value="">16:00~17:00</option>
	                        <option value="">17:00~18:00</option>	                
		                </select> <br><br>
		                <span class="badge badge-pill title">제목</span>
		                <input type="text" class="contents" placeholder="제목을 입력해주세요" style="width:900px;"><br><br>
		                <span class="badge badge-pill title">내용</span><br>
		                <textarea class="contents" placeholder="내용을 입력해주세요" id="input-content"></textarea>
		                <div id="btn-area" align="right">
			                <button id="goToList">목록으로</button>
			                <button id="submit-btn" type="submit">신청하기</button>
		                </div>
	                </form>
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