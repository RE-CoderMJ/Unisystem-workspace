<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<link href="resources/css/appointment/stuEnrollForm.css" rel="stylesheet">

</head>
<body>

	<jsp:include page="../common/header.jsp" />	
	
	<div id="wrapper">
		<jsp:include page="../student/smySidebar.jsp" />
		<section>
			<header id="app-header">
				<div id="pageName-area">
					<div class="pageName"><p style="color:gray">마이페이지>상담>&nbsp;</p><p style="font-size:19px; font-weight:600;">상담 신청</p></div>
					<br><br>
					<div id="pageName">상담신청 내역</div>
	                <br>
	            </div>
			</header>
			<article>
				<form action="myStu.enrollApp" method="post">
	                <div id="content-area">
		                <span class="badge badge-pill title">담당교수</span>
		                <span class="contents">${s.profName } 교수</span><br><br>
		                <span class="badge badge-pill title">신청날짜</span>
		                <span class="contents">${s.appDate}</span><br><br>
		                <span class="badge badge-pill title">상담 가능 시간</span>
		                <c:choose>
		                	<c:when test="${ s.studAppDay != null and s.studAppTime != null }">
								<span class="contents">매주 ${ s.studAppDay }요일&nbsp;&nbsp;&nbsp;</span>
								<span>${ s.studAppTime }&nbsp;시 &nbsp;&nbsp;(한 시간 단위)</span>	                		
		                	</c:when>
		                	<c:otherwise>
		                		<span class="contents">가능한 상담 시간이 없습니다.</span>
		                	</c:otherwise>
		                </c:choose>
		                <br>
		                <span id="warn">** 상담은 최소 하루 전날 예약이 가능하며 상담 가능 시간 외 신청 시 반려될 수 있습니다.</span><br><br>
		                <span class="badge badge-pill title">상담일자</span>
		                <input type="text" id="datepicker" class="contents" name="appDate">
		                <select id="time-option" name="appTime" style="height:30px;">
	                    
		                </select> <br><br>
		                
	                    <input type="hidden" name="studNo" value="${s.studNo }">
	                    <input type="hidden" name="profNo" value="${s.profNo2 }">    
		                <span class="badge badge-pill title">제목</span>
		                <input type="text" class="contents" placeholder="제목을 입력해주세요" style="width:900px;" name="title"><br><br>
		                <span class="badge badge-pill title">내용</span><br>
		                <textarea class="contents" placeholder="내용을 입력해주세요" id="input-content" name="content"></textarea>
		                <div id="btn-area" align="right">
			                <button id="goToList" onclick="location.href='myStu.appList'">목록으로</button>
			                <button id="submit-btn" type="submit">신청하기</button>
		                </div>
	                </div>
                </form>
			</article>
		</section>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
	<!-- datepicker -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$(function() {
			
			
			
			$.datepicker.setDefaults({
				dateFormat : 'yy-mm-dd',
				showOtherMonths : true,
				showMonthAfterYear : true,
				minDate: 1,
		        yearSuffix: "년",
		      	monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
		      	monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		        dayNamesMin: ['일','월','화','수','목','금','토'],
		        dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
		        beforeShowDay: function(date){
					
					let appDay = '${s.studAppDay}'.split(",");
					let days = [0, 1, 2, 3, 4, 5, 6];
					
					
					let newDays = days.map(function(data, index){
						if(data == 0)
							return 0;
						else if(data == 1 && appDay.indexOf("월") != -1)
							return 0;
						else if(data == 2 && appDay.indexOf("화") != -1)
							return 0;
						else if(data == 3 && appDay.indexOf("수") != -1)
							return 0;
						else if(data == 4 && appDay.indexOf("목") != -1)
							return 0;
						else if(data == 5 && appDay.indexOf("금") != -1)
							return 0;
						else if(data == 6)
							return 6;
						else
							return data;
					});
					
					var day = date.getDay();
					
					
					let no = true;
					for(let i in newDays){
						no = no && day != newDays[i];
					}
					
					return [no];
				}			
			});
			$("#datepicker").datepicker();
			$("#datepicker").datepicker('setDate', 'today');
		});
	</script>

	<script>
	
		$(function(){
			let appTime = '${s.studAppTime}'.split(",");
			let value="";
			
			for(let i in appTime){
				if(appTime[i] == '9'){
					value += '<option value="9">9:00~10:00</option>';					
				}else if(appTime[i] == '10'){
					value += '<option value="10">10:00~11:00</option>';
				}else if(appTime[i] == '11'){
					value += '<option value="11">11:00~12:00</option>';
				}else if(appTime[i] == '12'){
					value += '<option value="12">12:00~13:00</option>';
				}else if(appTime[i] == '13'){
					value += '<option value="13">13:00~14:00</option>';
				}else if(appTime[i] == '14'){
					value += '<option value="14">14:00~15:00</option>';
				}else if(appTime[i] == '15'){
					value += '<option value="15">15:00~16:00</option>';
				}else if(appTime[i] == '16'){
					value += '<option value="16">16:00~17:00</option>';
				}else if(appTime[i] == '17'){
					value += '<option value="17">17:00~18:00</option>';
				}
			}
			
			$("#time-option").html(value);
		})
		
	</script>
	
	<script>
		$(document).ready(function(){
			let $len = $("section").height();
			$(".wrap_sidebar").css('height', $len + 22);
		})
	</script>
	
	<script>
		$(function(){
			$("#appointment").slideDown();
		})
	</script>
</body>
</html>