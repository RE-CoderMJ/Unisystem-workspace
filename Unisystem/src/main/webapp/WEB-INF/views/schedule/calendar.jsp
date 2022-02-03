<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
</head>
<style>
.page_title {
	color: rgb(15, 43, 80);
	font-size: 40px;
	font-weight: 800;
	margin-top: 50px;
	margin-bottom: 10px;
	margin-left: 66px;
}

.updel {
	height: 24px;
	margin-right: 125px;
	font-size: 15px;
	position: relative;
	top: 45px;
	left: 20px;
}

.updel a {
	text-decoration: none;
	color: black;
	float: right;
}

.bo_content {
	margin-top: 51px;
	width: 1100px;
	float: left;
	background-color: white;
	margin-left: 150px;
	padding-bottom: 50px;
	position: relative;
	top: -1120px;
	left: 100px;
}
</style>
<body>

	<div id="outer">


		<!-- header.jsp 영역 -->
		<jsp:include page="../common/header.jsp" />

		<!-- sidebar.jsp 영역 
		  교수가 로그인하면 pmySidebar
		  학생이 로그인하면 smySidebar -->


		<div style="background-color: rgb(235, 242, 252); width: 1500px;">


			<div class="sidewrap">
				<jsp:include page="../student/smySidebar.jsp" />
			</div>


			<div class="bo_content" style="width: 1000px;">

				<!-- title -->
				<div class="page_title">캘린더</div>
				
				<hr width="850px;" align="center;">
				
				<div class="updel">
					<a href="">To do List</a>
				</div>
				
				



			</div>
			<!-- bo_content 끝 -->


		</div>
		<!-- background-color -->


		<!-- footer.jsp-->
		<jsp:include page="../common/footer.jsp" />


	</div>
	<!-- outer 끝 -->



</body>
</html>