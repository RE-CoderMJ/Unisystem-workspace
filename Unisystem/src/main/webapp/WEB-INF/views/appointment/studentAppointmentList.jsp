<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<link href="resources/css/appointment/stuList.css" rel="stylesheet">
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
					<div id="pageName" style="flaot:left;">상담신청 내역</div>
	                <br>
	            </div>
	          	<div id="tools">
	                <button onclick="location.href='myStu.appEnrollForm'"><span style="color:navy">+</span>&nbsp;신청</button>
	                <button><span style="color:red">-</span>&nbsp;삭제</button>
	                <button>수정</button>
				</div>
			</header>
			<article>
				<table class="table table-hover" id="list">
                    <tbody>
                    	<tr style="background:rgb(232, 232, 232);">
                    		<th><input type="checkbox" class="checkbox"></th>
                    		<th>No.</th>
                    		<th>담당교수</th>
                    		<th>신청날짜</th>
                    		<th>상담일시</th>
                    		<th>내용</th>
                    		<th>상태</th>
                    	</tr>
                        <tr>
                            <td><input type="checkbox" class="checkbox"></td>
                            <td>5</td>
                            <td>김땡땡 교수</td> 
                            <td>2022-01-19</td>
                            <td>2022-01-20 15:00 </td>
                            <td>이번학기 성적 관련 상담 신청합니다.</td>
                            <td class="pending">대기</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" class="checkbox"></td>
                            <td>4</td>
                            <td>김땡땡 교수</td> 
                            <td>2022-01-19</td>
                            <td>2022-01-20 15:00 </td>
                            <td>이번학기 성적 관련 상담 신청합니다.</td>
                            <td class="completed">완료</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" class="checkbox"></td>
                            <td>3</td>
                            <td>김땡땡 교수</td> 
                            <td>2022-01-19</td>
                            <td>2022-01-20 15:00 </td>
                            <td>이번학기 성적 관련 상담 신청합니다.</td>
                            <td class="completed">완료</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" class="checkbox"></td>
                            <td>2</td>
                            <td>김땡땡 교수</td> 
                            <td>2022-01-19</td>
                            <td>2022-01-20 15:00 </td>
                            <td>이번학기 성적 관련 상담 신청합니다.</td>
                            <td class="completed">완료</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" class="checkbox"></td>
                            <td>1</td>
                            <td>김땡땡 교수</td> 
                            <td>2022-01-19</td>
                            <td>2022-01-20 15:00 </td>
                            <td>이번학기 성적 관련 상담 신청합니다.</td>
                            <td class="rejected">반려</td>
                        </tr>
                    </tbody>
                </table>
                
                <div class="container">
                    <ul class="pagination justify-content-center">
                      <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
                      <li class="page-item"><a class="page-link" href="#">1</a></li>
                      <li class="page-item active"><a class="page-link" href="#">2</a></li>
                      <li class="page-item"><a class="page-link" href="#">3</a></li>
                      <li class="page-item"><a class="page-link" href="#">4</a></li>
                      <li class="page-item"><a class="page-link" href="#">5</a></li>
                      <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
                    </ul>
                  </div>
			</article>
		</section>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
	
	
	
	
	<script>
		$(function(){
			$("#appointment").slideDown();
		})
	</script>
</body>
</html>