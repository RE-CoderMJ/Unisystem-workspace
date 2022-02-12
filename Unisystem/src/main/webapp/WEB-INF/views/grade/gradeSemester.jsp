<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<link href="resources/css/grade/gradeSemester.css" rel="stylesheet">
</head>
<body>

	<jsp:include page="../common/links.jsp" />
	<jsp:include page="../common/header.jsp" />	
	
	<div id="wrapper">
		<jsp:include page="../student/smySidebar.jsp" />
		<section>
			<header class="gradeAll-header">
				<div>
					<div class="pageName"><p style="color:gray">마이페이지>성적>&nbsp;</p><p style="font-size:19px; font-weight:600;">금학기 성적조회</p></div>
					<br><br>
					<div class="nameStyle" style="flaot:left;"><i class="fas fa-chevron-circle-right fa-lg"></i>&nbsp;&nbsp;2022학년도 1학기 성적조회</div>
	                <br>
	            </div>
			</header>
			<article>
				<table class="table table-hover" id="semester">
                    <tbody>
                    	<tr style="background:rgb(232, 232, 232);">
                    		<th>학년</th>
                    		<th>신청학점</th>
                    		<th>취득학점</th>
                    		<th>평점계</th>
                    		<th>평점평균</th>
                    	</tr>
                        <tr>
                            <td>1</td>
                            <td>23</td>
                            <td>23</td>
                            <td>50</td>
                            <td>4.2</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>23</td>
                            <td>23</td>
                            <td>50</td>
                            <td>4.2</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>23</td>
                            <td>23</td>
                            <td>50</td>
                            <td>4.2</td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>23</td>
                            <td>23</td>
                            <td>50</td>
                            <td>4.2</td>
                        </tr>
                    </tbody>
                </table>
                
                <table class="table table-hover" id="average">
                	<tr>
                		<th style="background:rgb(232, 232, 232);" width="160px;">전체 취득학점</th>
                		<td><td>
                	</tr>
                	<tr>
                		<th style="background:rgb(232, 232, 232);">전체 평균학점</th>
                		<td><td>
                	</tr>
                </table>
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