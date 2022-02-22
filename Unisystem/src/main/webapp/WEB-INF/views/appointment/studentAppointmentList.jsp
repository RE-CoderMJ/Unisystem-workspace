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
	                <button id="edit">수정</button>
				</div>
			</header>
			<article>
				<table class="table table-hover" id="list">
					<thead>
                    	<tr style="background:rgb(232, 232, 232);">
                    		<th></th>
                    		<th>No.</th>
                    		<th>담당교수</th>
                    		<th>신청날짜</th>
                    		<th>상담일시</th>
                    		<th>내용</th>
                    		<th>상태</th>
                    	</tr>						
					</thead>
                    <tbody>
                        
                    </tbody>
                </table>
                
                <div class="container">
                    <ul class="pagination justify-content-center">
                      
                    </ul>
                  </div>
                <input type="hidden" id="cPage">
			</article>
		</section>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
	
	<script>
		$(function(){
			selectAppList(1);
		});
		
		function selectAppList(cPageNo){
			$.ajax({
				url:"myStu.selectAppList",
				data:{currentPage:cPageNo, userNo:'${loginUser.userNo}'},
				success:function(result){
					
					let value = "";
					
					if(result.list.length === 0){
						value = "<tr><td colspan='7' style='text-align:center;'>상담 신청내역이 없습니다.</td></tr>"
					}else{
						
						for(let i in result.list){
							value += "<tr><td><input type='checkbox' class='checkbox'></td>"
								   + "<td class='click app-no'>" + result.list[i].appNo + "</td>"
	                        	   + "<td class='click'>" + result.list[i].profName + "</td>"
	                        	   + "<td class='click'>" + result.list[i].enrollDate + "</td>"
	                        	   + "<td class='click'>" + result.list[i].appDate + "</td>"
	                        	   + "<td class='click'>" + result.list[i].title + "</td>";
	                       if(result.list[i].appStatus == 1){
	                       		value += "<td class='pending'>대기</td>";	                    	   
	                       }else if(result.list[i].appStatus == 2){
	                    	   value += "<td class='accepted'>승인</td>";
	                       }else if(result.list[i].appStatus == 3){
	                    	   value += "<td class='completed'>완료</td>";
	                       }else{
	                    	   value += "<td class='rejected'>반려</td>";
	                       }
	                        value += "</tr>";
						}
						
						let piValue = "";
						
						if(result.pi.currentPage == 1){
							piValue += "<li class='page-item disabled'><a class='page-link' href='#'>&lt;</a></li>";
						}else{
							piValue += "<li class='page-item'><a class='page-link' onclick='selectAppList(" + (result.pi.currentPage-1) + ")'>&lt;</a></li>";
						}
	                    
						for(let p = result.pi.startPage; p<=result.pi.endPage; p++){
							
							if(p == result.pi.currentPage){
								piValue += "<li class='page-item disabled active'><a class='page-link' onclick='selectAppList(" + p + ")'>" + p + "</a></li>";
							}else{
								piValue += "<li class='page-item'><a class='page-link' onclick='selectAppList(" + p + ")'>" + p + "</a></li>";
							}
							
						}
		            	
						if(result.pi.currentPage == result.pi.maxPage){
							piValue += "<li class='page-item disabled'><a class='page-link' href='#'>&gt;</a></li>";
						}else{
							piValue += "<li class='page-item'><a class='page-link' onclick='selectAppList(" + (result.pi.currentPage + 1) + ")'>&gt;</a></li>"
						}
						
						$(".pagination").html(piValue);
						
						// 사이드바와 컨텐츠영역 길이 맞춤
						let $len = $("section").height();
						$(".wrap_sidebar").css('height', $len + 22);
						
						$("#cPage").val(result.pi.currentPage);
					}
					
					$("#list>tbody").html(value);
					
				},error:function(){
					console.log("상담신청내역 목록 조회용 ajax 통신 실패");
				}
				
			});
		}
	</script>
	
	<!-- 상세조회 -->
	<script>
		$(function(){
			$(document).on("click", ".click", function(){
				location.href="myStu.appDetail?appNo=" + $(this).siblings(".app-no").text();
			});		
		})
	</script>
	
	<script>
		$(document).on("click", "#edit", function(){
			
			let count = 0;
			let appNo;
			
			$(".checkbox:checked").each(function(){
				count++;
			});
			
			if(count > 1){
				alert("수정은 1개의 항목만 선택이 가능합니다.");
			}else if(count == 0){
				alert("수정하실 항목을 선택해주세요.");
			}else{
				appNo = $(".checkbox:checked").parent().siblings(".app-no").text();
				location.href="myStu.editFormApp?appNo=" + appNo;
			}
			
		})
	</script>
	
	<script>
		$(function(){
			$("#appointment").slideDown();
		})
	</script>
</body>
</html>