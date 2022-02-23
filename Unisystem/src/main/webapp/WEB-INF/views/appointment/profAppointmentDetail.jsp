<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<link href="resources/css/appointment/profDetail.css" rel="stylesheet">
<link href="resources/css/webMail/modals.css" rel="stylesheet">
<style>
	#reason-area{
		width:255px;
		height:150px;
		resize:none;
	}
	.modalMsg-area{
		font-weight:800;
		font-size:18px;
	}
</style>
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
					<div id="pageName">상담신청 내역</div>
	                <br>
	            </div>
	          	<div id="tools" align="right">
	          		<button onclick="location.href='myProf.appList'">목록</button>
	                <button class="pending" onclick="changeStatus(1)">대기</button>
	                <button class="accepted" onclick="changeStatus(2)">승인</button>
	                <button class="completed" onclick="changeStatus(3)">완료</button>
	                <button class="rejected" onclick="changeStatus(4)">반려</button>
				</div>
			</header>
			<article>
                <div id="content-area">
	                <span class="badge badge-pill title">신청학생</span>
	                <span class="contents">${ a.studName }</span><br><br>
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
	                <c:if test="${ a.reason != null }">
	                	<span class="badge badge-pill title">반려 사유</span>
	                	<span class="contents">${a.reason }</span>
	                </c:if>
                </div>
			</article>
		</section>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
	
	<!-- 반려 사유 Modal -->
    <div class="modal" id="reason">
        <div class="modal-dialog modal-sm modal-dialog-centered">
            <div class="modal-content">
				<form action="myProf.changeAppReasonStatus" method="post">
	                <!-- Modal body -->
	                <div class="modal-body" align="center">
	                    <div class="modalMsg-area">
	                    	반려 사유를 입력해주세요.
	                    </div>
	                    <textarea name="reason" id="reason-area"></textarea>
	                    <input type="hidden" name="appNo" value="${a.appNo }">
	                    <input type="hidden" name="appStatus" value="4">
	                    <div id="deleteContact-area">
	                      <button type="submit" class="btn" id="contact-delete-confirm-btn">확인</a>
	                      <button type="button" class="btn" data-dismiss="modal" id="contact-delete-closebtn">닫기</button>
	                    </div>              
	                </div>
        		</form>
            </div>
        </div>
    </div>

	<script>
		$(document).ready(function(){
			let $len = $("section").height();
			$(".wrap_sidebar").css('height', $len + 22);
		})
	</script>
	
	<script>
		function changeStatus(appStatus){
			if(appStatus == 4){
				$("#reason").modal("show");
			}else{
				$.ajax({
					url:"myProf.changeAppStatus",
					data:{appNo:'${a.appNo}', appStatus:appStatus},
					success:function(result){
						if(result > 0){
							location.href="myProf.appList";							
						}
					},error:function(){
						console.log("상태변경 ajax 통신 실패");
					}
				})
			}
		}
	</script>
	
	<script>
		$(function(){
			$("#appointment").slideDown();
		})
	</script>
</body>
</html>