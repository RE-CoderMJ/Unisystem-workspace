<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<link href="resources/css/appointment/profList.css" rel="stylesheet">
</head>
<body>

	<jsp:include page="../common/links.jsp" />
	<jsp:include page="../common/header.jsp" />	
	
	<div id="wrapper">
		<jsp:include page="../professor/pmySidebar.jsp" />
		<section>
			<header id="app-header">
				<div id="pageName-area">
					<div class="pageName"><p style="color:gray">마이페이지>상담>&nbsp;</p><p style="font-size:19px; font-weight:600;">상담 신청</p></div>
					<br><br>
					<div id="pageName" style="flaot:left;">상담신청 내역</div><br>
					<a class="badge badge-pill" id="availableTime" data-toggle="modal" href="#setTime">상담 가능 시간 설정</a>
					<c:if test="${ day != null }">
						<span>매주 ${ day }요일&nbsp;&nbsp;</span>
					</c:if>
					<c:if test="${ time != null }">
						<span>${ time }&nbsp;시</span>
						<span>(한시간 단위로 신청 가능)</span>
					</c:if>
	                <br>
	            </div>
	          	<div id="tools" align="right">
	                <button class="pending">대기</button>
	                <button class="accepted">승인</button>
	                <button class="completed">완료</button>
	                <button class="rejected">반려</button>
				</div>
			</header>
			<article>
				<table class="table table-hover" id="list">
                    <tbody>
                    	<tr style="background:rgb(232, 232, 232);">
                    		<th><input type="checkbox" class="checkbox"></th>
                    		<th>No.</th>
                    		<th>신청학생</th>
                    		<th>신청날짜</th>
                    		<th>상담일시</th>
                    		<th>내용</th>
                    		<th>상태</th>
                    	</tr>
                        <tr>
                            <td><input type="checkbox" class="checkbox"></td>
                            <td>5</td>
                            <td>김나다</td> 
                            <td>2022-01-19</td>
                            <td>2022-01-20 15:00 </td>
                            <td>이번학기 성적 관련 상담 신청합니다.</td>
                            <td class="pending">대기</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" class="checkbox"></td>
                            <td>4</td>
                            <td>이별나</td> 
                            <td>2022-01-19</td>
                            <td>2022-01-20 15:00 </td>
                            <td>이번학기 성적 관련 상담 신청합니다.</td>
                            <td class="completed">완료</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" class="checkbox"></td>
                            <td>3</td>
                            <td>박성적</td> 
                            <td>2022-01-19</td>
                            <td>2022-01-20 15:00 </td>
                            <td>이번학기 성적 관련 상담 신청합니다.</td>
                            <td class="completed">완료</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" class="checkbox"></td>
                            <td>2</td>
                            <td>최룰루</td> 
                            <td>2022-01-19</td>
                            <td>2022-01-20 15:00 </td>
                            <td>이번학기 성적 관련 상담 신청합니다.</td>
                            <td class="completed">완료</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" class="checkbox"></td>
                            <td>1</td>
                            <td>강만점</td> 
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
	
	<!-- 상담 가능 시간 설정 Modal -->
    <div class="modal" id="setTime">
		<form id="" action="myProf.updateAvailableTime" method="post">
	        <div class="modal-dialog modal-sm modal-dialog-centered">
	            <div class="modal-content">
	                <!-- Modal body -->
	                <div class="modal-body" style="text-align:center; font-weight:900;">
	                                    상담 가능 시간을 선택해주세요.
	                    <div class="md-box"  style="margin-top:20px;">
	                        <p style="text-align:left;">* 요일</p>
	                        <input type="hidden" name="profNo" value="${loginUser.userNo }">
	                        <input type="checkbox" id="mon" name="profAppDay" value="월">
	    						  <label for="mon">월</label>
	    						  <input type="checkbox" id="tue" name="profAppDay" value="화">
	    						  <label for="tue">화</label>
	    						  <input type="checkbox" id="wed" name="profAppDay" value="수">
	    						  <label for="wed">수</label>
	    						  <input type="checkbox" id="thu" name="profAppDay" value="목">
	    						  <label for="thu">목</label>
	    						  <input type="checkbox" id="fri" name="profAppDay" value="금">
	    						  <label for="fri">금</label>
	                    </div>
	                    <div class="md-box">
	                        <p style="text-align:left;">* 시간(한 시간 단위)</p>
	                        <input type="checkbox" id="nine" name="profAppTime" value="9">
	    						  <label for="nine">9</label>
	    						  <input type="checkbox" id="ten" name="profAppTime" value="10">
	    						  <label for="ten">10</label>
	    						  <input type="checkbox" id="ele" name="profAppTime" value="11">
	    						  <label for="ele">11</label>
	    						  <input type="checkbox" id="twe" name="profAppTime" value="12">
	    						  <label for="twe">12</label>
	    						  <input type="checkbox" id="thir" name="profAppTime" value="13">
	    						  <label for="thir">13</label><br>
	    						  <input type="checkbox" id="four" name="profAppTime" value="14">
	    						  <label for="four">14</label>
	    						  <input type="checkbox" id="fif" name="profAppTime" value="15">
	    						  <label for="fif">15</label>
	    						  <input type="checkbox" id="sixt" name="profAppTime" value="16">
	    						  <label for="sixt">16</label>
	    						  <input type="checkbox" id="sevent" name="profAppTime" value="17">
	    						  <label for="sevent">17</label>
	                    </div>
	                </div>
	            
		            <!-- Modal footer -->
		             <div id="timeSet-btnArea">
		                 <button type="button" id="timeSetClose-btn" class="btn" data-dismiss="modal">취소</button>
		                 <button type="submit" id="timeSet-btn" class="btn" data-toggle="modal">등록하기</button>
		             </div>
		         </div>
		     </div>
		</form>
	</div>
	
	<script>
		$(function(){
			let appDay = ${day};
			let appTime = ${time};
			console.log(day);
			console.log(time);
		})
	</script>
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