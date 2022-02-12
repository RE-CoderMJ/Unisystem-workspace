<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<link href="resources/css/grade/gradeAll.css" rel="stylesheet">
</head>
<body>

	<jsp:include page="../common/links.jsp" />
	<jsp:include page="../common/header.jsp" />	
	
	<div id="wrapper">
		<jsp:include page="../student/smySidebar.jsp" />
		<section>
			<header class="gradeAll-header">
				<div>
					<div class="pageName"><p style="color:gray">마이페이지>성적>&nbsp;</p><p style="font-size:19px; font-weight:600;">전체성적조회</p></div>
					<br><br>
					<div class="nameStyle" style="flaot:left;"><i class="fas fa-chevron-circle-right fa-lg"></i>&nbsp;&nbsp;전체 성적</div>
	                <br>
	            </div>
			</header>
			<article>
				<div class="table-wrapper">
					<table class="table table-hover" id="list">
	                    <tbody>
	                    	<tr style="background:rgb(232, 232, 232);">
	                    		<th>No.</th>
	                    		<th>학년도</th>
	                    		<th>학기</th>
	                    		<th>교과목코드</th>
	                    		<th>교과목명</th>
	                    		<th>이수구분</th>
	                    		<th>성적</th>
	                    	</tr>
	                        <tr>
	                            <td>1</td>
	                            <td>2018학년도</td>
	                            <td>1학기</td> 
	                            <td>R12345</td>
	                            <td>컴퓨터 과학</td>
	                            <td>전공</td>
	                            <td>A+</td>
	                        </tr>
	                        <tr>
	                            <td>1</td>
	                            <td>2018학년도</td>
	                            <td>1학기</td> 
	                            <td>R12345</td>
	                            <td>컴퓨터 과학</td>
	                            <td>전공</td>
	                            <td>A+</td>
	                        </tr>
	                        <tr>
	                            <td>1</td>
	                            <td>2018학년도</td>
	                            <td>1학기</td> 
	                            <td>R12345</td>
	                            <td>컴퓨터 과학</td>
	                            <td>전공</td>
	                            <td>A+</td>
	                        </tr>
	                        <tr>
	                            <td>1</td>
	                            <td>2018학년도</td>
	                            <td>1학기</td> 
	                            <td>R12345</td>
	                            <td>컴퓨터 과학</td>
	                            <td>전공</td>
	                            <td>A+</td>
	                        </tr>
	                        <tr>
	                            <td>1</td>
	                            <td>2018학년도</td>
	                            <td>1학기</td> 
	                            <td>R12345</td>
	                            <td>컴퓨터 과학</td>
	                            <td>전공</td>
	                            <td>A+</td>
	                        </tr>
	                        <tr>
	                            <td>1</td>
	                            <td>2018학년도</td>
	                            <td>1학기</td> 
	                            <td>R12345</td>
	                            <td>컴퓨터 과학</td>
	                            <td>전공</td>
	                            <td>A+</td>
	                        </tr>
	                        <tr>
	                            <td>1</td>
	                            <td>2018학년도</td>
	                            <td>1학기</td> 
	                            <td>R12345</td>
	                            <td>컴퓨터 과학</td>
	                            <td>전공</td>
	                            <td>A+</td>
	                        </tr>
	                        <tr>
	                            <td>1</td>
	                            <td>2018학년도</td>
	                            <td>1학기</td> 
	                            <td>R12345</td>
	                            <td>컴퓨터 과학</td>
	                            <td>전공</td>
	                            <td>A+</td>
	                        </tr>
	                    </tbody>
	                </table>
                </div>
                
                <header class="gradeAll-header">
					<div>
						<div class="nameStyle" style="flaot:left;"><i class="fas fa-chevron-circle-right fa-lg"></i>&nbsp;&nbsp;학년도, 학기별 집계 성적</div>
		                <br>
		            </div>
				</header>
                <div class="table-wrapper">
					<table class="table table-hover" id="list">
	                    <tbody>
	                    	<tr style="background:rgb(232, 232, 232);">
	                    		<th>No.</th>
	                    		<th>학년도</th>
	                    		<th>학기</th>
	                    		<th>신청학점</th>
	                    		<th>취득학점</th>
	                    		<th>평점계</th>
	                    		<th>평점평균</th>
	                    	</tr>
	                        <tr>
	                            <td>1</td>
	                            <td>2018학년도</td>
	                            <td>1학기</td> 
	                            <td>23</td>
	                            <td>23</td>
	                            <td>50</td>
	                            <td>4.2</td>
	                        </tr>
	                        <tr>
	                            <td>1</td>
	                            <td>2018학년도</td>
	                            <td>1학기</td> 
	                            <td>23</td>
	                            <td>23</td>
	                            <td>50</td>
	                            <td>4.2</td>
	                        </tr>
	                        <tr>
	                            <td>1</td>
	                            <td>2018학년도</td>
	                            <td>1학기</td> 
	                            <td>23</td>
	                            <td>23</td>
	                            <td>50</td>
	                            <td>4.2</td>
	                        </tr>
	                        <tr>
	                            <td>1</td>
	                            <td>2018학년도</td>
	                            <td>1학기</td> 
	                            <td>23</td>
	                            <td>23</td>
	                            <td>50</td>
	                            <td>4.2</td>
	                        </tr>
	                        <tr>
	                            <td>1</td>
	                            <td>2018학년도</td>
	                            <td>1학기</td> 
	                            <td>23</td>
	                            <td>23</td>
	                            <td>50</td>
	                            <td>4.2</td>
	                        </tr>
	                        <tr>
	                            <td>1</td>
	                            <td>2018학년도</td>
	                            <td>1학기</td> 
	                            <td>23</td>
	                            <td>23</td>
	                            <td>50</td>
	                            <td>4.2</td>
	                        </tr>
	                        <tr>
	                            <td>1</td>
	                            <td>2018학년도</td>
	                            <td>1학기</td> 
	                            <td>23</td>
	                            <td>23</td>
	                            <td>50</td>
	                            <td>4.2</td>
	                        </tr>
	                        <tr>
	                            <td>1</td>
	                            <td>2018학년도</td>
	                            <td>1학기</td> 
	                            <td>23</td>
	                            <td>23</td>
	                            <td>50</td>
	                            <td>4.2</td>
	                        </tr>
	                    </tbody>
	                </table>
                </div>
                
                <header class="gradeAll-header">
					<div>
						<div class="nameStyle" style="flaot:left;"><i class="fas fa-chevron-circle-right fa-lg"></i>&nbsp;&nbsp;학년별 집계 성적</div>
		                <br>
		            </div>
				</header>
				<table class="table table-hover" id="gradeByGrade">
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
	
	<script>
		$(document).ready(function(){
			let $len = $("section").height();
			$(".wrap_sidebar").css('height', $len + 22);
		})
	</script>

</body>
</html>