<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<link href="resources/css/appointment/profList.css" rel="stylesheet">
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
	                <button class="pending" onclick="changeStatus(1)">대기</button>
	                <button class="accepted" onclick="changeStatus(2)">승인</button>
	                <button class="completed" onclick="changeStatus(3)">완료</button>
	                <button class="rejected" onclick="changeStatus(4)">반려</button>
				</div>
			</header>
			<article>
				<table class="table table-hover" id="list">
					<thead>
                    	<tr style="background:rgb(232, 232, 232);">
                    		<th><input type="checkbox" id="checkAll"></th>
                    		<th>No.</th>
                    		<th>신청학생</th>
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
	                    <input type="hidden" name="appNo" value="">
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
		$(document).on("click", "#availableTime", function(){
			let appDay = '${day}'.split(",");
			let appTime = '${time}'.split(",");
			
			for(let t in appTime){
				$("input[name=profAppTime]").each(function(){
					if($(this).val() == appTime[t]){
						$(this).attr("checked", true);
					}
				})	
			}
			
			for(let d in appDay){
				$("input[name=profAppDay]").each(function(){
					if($(this).val() == appDay[d]){
						$(this).attr("checked", true);
					}
				})
			}
			
		})
	</script>
	
	<script>
		$(function(){
			selectProfAppList(1);
		});
		
		function selectProfAppList(cPageNo){
			$.ajax({
				url:"myProf.selectProfAppList",
				data:{currentPage:cPageNo, userNo:'${loginUser.userNo}'},
				success:function(result){
					
					let value = "";
					
					if(result.list.length === 0){
						value = "<tr><td colspan='7' style='text-align:center;'>상담 신청내역이 없습니다.</td></tr>"
					}else{
						
						for(let i in result.list){
							value += "<tr><td><input type='checkbox' class='checkbox'></td>"
								   + "<td class='click app-no'>" + result.list[i].appNo + "</td>"
	                        	   + "<td class='click'>" + result.list[i].studName + "</td>"
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
							piValue += "<li class='page-item'><a class='page-link' onclick='selectProfAppList(" + (result.pi.currentPage-1) + ")'>&lt;</a></li>";
						}
	                    
						for(let p = result.pi.startPage; p<=result.pi.endPage; p++){
							
							if(p == result.pi.currentPage){
								piValue += "<li class='page-item disabled active'><a class='page-link' onclick='selectProfAppList(" + p + ")'>" + p + "</a></li>";
							}else{
								piValue += "<li class='page-item'><a class='page-link' onclick='selectProfAppList(" + p + ")'>" + p + "</a></li>";
							}
							
						}
		            	
						if(result.pi.currentPage == result.pi.maxPage){
							piValue += "<li class='page-item disabled'><a class='page-link' href='#'>&gt;</a></li>";
						}else{
							piValue += "<li class='page-item'><a class='page-link' onclick='selectProfAppList(" + (result.pi.currentPage + 1) + ")'>&gt;</a></li>"
						}
						
						$(".pagination").html(piValue);
						
						$("#cPage").val(result.pi.currentPage);
					}
					
					$("#list>tbody").html(value);
					
					// 사이드바와 컨텐츠영역 길이 맞춤
					let $len = $("section").height();
					$(".wrap_sidebar").css('height', $len + 22);
					
					
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
				location.href="myProf.appProfDetail?appNo=" + $(this).siblings(".app-no").text();
			});		
		})
	</script>
	
	<!-- 전체 선택/해제 -->
	<script>
		$(document).on("click", "#checkAll", function(){
			if($("#checkAll").is(":checked")){
				$(".checkbox").prop("checked", true);
			}else{
				$(".checkbox").prop("checked", false);
			}
		});		
	</script>
	
	<!-- 상태 변경 -->
	<script>
		function changeStatus(appStatus){
			
			let count = 0;
			let appNo;
			
			$(".checkbox:checked").each(function(){
				count++;
			});
			
			if(count == 0){
				alert("항목을 선택해주세요.");
			}else{
				if(appStatus == 4){
					if(count > 1){
						alert("반려는 1개의 항목만 선택이 가능합니다.");
					}else{
						$("#reason").modal("show");
						$("input[name=appNo]").val($(".checkbox:checked").parent().siblings(".app-no").text());
					}
				}else{
					$(".checkbox:checked").each(function(){
						appNo = $(this).parent().siblings(".app-no").text();
						ajaxChangeStatus(appNo, appStatus);
					});
				}
			}
		}
		
		function ajaxChangeStatus(appNo, appStatus){
			$.ajax({
				url:"myProf.changeAppStatus",
				data:{appNo:appNo, appStatus:appStatus},
				success:function(result){
					if(result > 0){
						location.href="myProf.appList";							
					}
				},error:function(){
					console.log("상태변경 ajax 통신 실패");
				}
			})			
		}
	</script>
	
	<script>
		$(function(){
			$("#appointment").slideDown();
		})
	</script>
	
</body>
</html>