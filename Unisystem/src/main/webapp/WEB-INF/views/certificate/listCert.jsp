<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<link href="resources/css/certificate/listCert.css" rel="stylesheet">
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
            		<div style="font-size:17px; font-weight:600; margin-bottom:30px;"><i class="fas fa-check-circle fa-lg"></i>&nbsp;&nbsp;신청내역 및 결제</div>
            		<table class="table table-bordered" id="list" style="width:900px;">
            			<thead>
            				<tr>
            					<th>구분</th>
            					<th>증명서명</th>
            					<th>발급일</th>
            					<th>다운로드</th>
            				</tr>
            			</thead>
            			<tbody>
            				
            			</tbody>
            		</table>
            		
            		<div class="container">
                    <ul class="pagination justify-content-center">
                      
                    </ul>
                  </div>
                  
            	</div>
			</article>
		</section>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
	
	
	<script>
		$(function(){
			selectPaidCertList(1);
		})
		
		function selectPaidCertList(cPage){
			$.ajax({
				url:"myStu.cert.selectPaidCertList",
				data:{
					currentPage:cPage,
					studNo:'${loginUser.userNo}',
				},
				success:function(result){
					
					let value = "";
					
					if(result.length === 0){
						value = "<tr><td colspan='4' style='text-align:center;'>증명서 발급내역이 없습니다.</td></tr>";
						$("#empty").val('e');
					}else{
						for(let i in result.list){
							value += "<tr>"
								   + "<td>증명서</td>"
								   + "<td>" + result.list[i].cerTypeT + "</td>"
								   + "<td>" + result.list[i].issueDate + "</td>" 
								   + "<input type='hidden' value='"+ result.list[i].cerNo + "'>"
	    					       + "<td><button class='open-btn'>열기</button></td>"
	    						   + "</tr>";					
						}
					}
					
					$("#list>tbody").html(value);
					
					let piValue = "";
					
					if(result.pi.currentPage == 1){
						piValue += "<li class='page-item disabled'><a class='page-link' href='#'>&lt;</a></li>";
					}else{
						piValue += "<li class='page-item'><a class='page-link' onclick='selectPaidCertList(" + (result.pi.currentPage-1) + ")'>&lt;</a></li>";
					}
                    
					for(let p = result.pi.startPage; p<=result.pi.endPage; p++){
						
						if(p == result.pi.currentPage){
							piValue += "<li class='page-item disabled active'><a class='page-link' onclick='selectPaidCertList(" + p + ")'>" + p + "</a></li>";
						}else{
							piValue += "<li class='page-item'><a class='page-link' onclick='selectPaidCertList(" + p + ")'>" + p + "</a></li>";
						}
						
					}
	            	
					if(result.pi.currentPage == result.pi.maxPage){
						piValue += "<li class='page-item disabled'><a class='page-link' href='#'>&gt;</a></li>";
					}else{
						piValue += "<li class='page-item'><a class='page-link' onclick='selectPaidCertList(" + (result.pi.currentPage + 1) + ")'>&gt;</a></li>"
					}
					
					$(".pagination").html(piValue);
					
					// 사이드바와 컨텐츠영역 길이 맞춤
					let $len = $("section").height();
					$(".wrap_sidebar").css('height', $len + 22);
						
				},error:function(){
					console.log("신청 증명서 내용 리스트용 ajax 통신 오류");
				}
				
			})
		}
	</script>
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