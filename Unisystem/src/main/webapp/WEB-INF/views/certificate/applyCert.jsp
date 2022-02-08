<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<link href="resources/css/certificate/applyCert.css" rel="stylesheet">
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
            		<div style="font-size:17px; font-weight:600; margin-bottom:30px;"><i class="fas fa-check-circle fa-lg"></i>&nbsp;&nbsp;증명서를 선택해주세요</div>
            		<div id="cert-select-area">
            			<div class="titles" style="margin-left:135px !important;"><i class="far fa-file-alt fa-lg"></i>&nbsp;&nbsp;<b>국문</b></div>
            			<div class="titles" style="margin-left:160px !important;"><i class="fas fa-file-alt fa-lg"></i>&nbsp;&nbsp;<b>영문</b></div>
            			<div class="cert-type">졸업증명서</div>
            			<div class="cert-type">재적증명서</div>
            			<div class="cert-type">성적증명서</div>
            			<div class="cert-type">졸업증명서</div>
            			<div class="cert-type">재적증명서</div>
            			<div class="cert-type">성적증명서</div>
            		</div>
            		<table class="table table-bordered" id="useFor" style="width:800px;">
            			<tbody>
            				<tr>
            					<th>용도</th>
            					<td>
            						<select name="offSemester" style="height:30px; width:150px;">
										<option value="1">취업 제출용</option>
										<option value="2">자격증 발급용</option>
										<option value="3">신분 확인용</option>
										<option value="4">기타 증명서류 제출용</option>
									</select>
            					</td>
            					<th>제출처</th>
            					<td>
            						<select name="offSemester" style="height:30px; width:80px;">
										<option value="1">기업</option>
										<option value="2">기관</option>
										<option value="3">기타</option>
									</select>
            						<input type="text">
            					</td>
            				</tr>
            			</tbody>
            		</table>
            		<button id="save-btn">저장</button>
            		
            		<div style="font-size:17px; font-weight:600; margin-bottom:30px;"><i class="fas fa-check-circle fa-lg"></i>&nbsp;&nbsp;증명서 신청내역</div>
            		<table class="table table-bordered" id="list" style="width:900px;">
            			<tbody>
            				<tr>
            					<th>선택증명서</th>
            					<th>용도</th>
            					<th>제출처</th>
            					<th>삭제</th>
            				</tr>
            				<tr>
            					<td>(국)졸업증명서</td>
            					<td>취업 제출용</td>
            					<td>유니컴퍼니</td>
            					<td><button class="delete-btn">삭제</button></td>
            				</tr>
            			</tbody>
            		</table>
            		<button id="next-btn">다음</button>
            	</div>
			</article>
		</section>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
	
	<script>
		$(".cert-type").click(function(){
			$(".cert-type").css("border", "1px solid gray");
			$(".cert-type").css("color", "black");
			$(".cert-type").removeClass("selected");
			$(this).css("border", "2px solid rgb(26, 86, 162)");
			$(this).css("color", "rgb(26, 86, 162)");
			$(this).addClass("selected");
		})
	</script>
	
	<script>
		$(document).ready(function(){
			let $len = $("section").height();
			$(".wrap_sidebar").css('height', $len + 22);
		})
	</script>
</body>
</html>