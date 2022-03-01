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
            			<div class="cert-type kor-grad">졸업증명서</div>
            			<div class="cert-type eng-grad">졸업증명서</div>
            			<div class="cert-type kor-enroll">재학증명서</div>
            			<div class="cert-type eng-enroll">재학증명서</div>
            			<!-- <div class="cert-type">성적증명서</div>
            			<div class="cert-type">성적증명서</div>-->
            		</div>
            		<table class="table table-bordered" id="input-list" style="width:800px;">
            			<tbody>
            				<tr>
            					<th>용도</th>
            					<td>
            						<select id="useFor" style="height:30px; width:150px;">
										<option value="1">취업 제출용</option>
										<option value="2">자격증 발급용</option>
										<option value="3">신분 확인용</option>
										<option value="4">기타 증명서류 제출용</option>
									</select>
            					</td>
            					<th>제출처</th>
            					<td>
            						<select id="toType" style="height:30px; width:80px;">
										<option value="1">기업</option>
										<option value="2">기관</option>
										<option value="3">기타</option>
									</select>
            						<input type="text" name="toWhom">
            					</td>
            				</tr>
            			</tbody>
            		</table>
            		<button id="save-btn" type="button" onclick="applyCert();">저장</button>
            		
            		<div style="font-size:17px; font-weight:600; margin-bottom:30px;"><i class="fas fa-check-circle fa-lg"></i>&nbsp;&nbsp;증명서 신청내역</div>
            		<table class="table table-bordered" id="list" style="width:900px;">
            			<thead>
            				<tr>
            					<th>선택증명서</th>
            					<th>용도</th>
            					<th>제출처</th>
            					<th>삭제</th>
            				</tr>            				
            			</thead>
            			<tbody>
            				
            			</tbody>
            		</table>
            		<button id="next-btn" onclick="moveToPayment();">다음</button>
            	</div>
            	<input type="hidden" id="empty">
			</article>
		</section>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
	
	<script>
		function moveToPayment(){
			if($("#empty").val() == 'e'){
				alert("증명서 발급 신청내역이 없습니다.");
			}else{
				location.href="myStu.cert.payment";
			}
			
		}
	</script>
	
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
		$(function(){
			selectCertList();
		})
		
		function selectCertList(){
			$.ajax({
				url:"myStu.cert.selectCertList",
				data:{studNo:'${loginUser.userNo}'},
				success:function(result){
					
					let value = "";
					
					if(result.length === 0){
						value = "<tr><td colspan='4' style='text-align:center;'>증명서 발급 신청내역이 없습니다.</td></tr>";
						$("#empty").val('e');
					}else{
						for(let i in result){
							value += "<tr>"
								   + "<td>" + result[i].cerTypeT + "</td>"
								   + "<td>" + result[i].useFor + "</td>"
								   + "<td>" + result[i].toWhom + "</td>" 
								   + "<input type='hidden' value='"+ result[i].cerNo + "'>"
	    					       + "<td><button class='delete-btn'>삭제</button></td>"
	    						   + "</tr>";					
						}
					}
					
					$("#list>tbody").html(value);
					
					// 사이드바와 컨텐츠영역 길이 맞춤
					let $len = $("section").height();
					$(".wrap_sidebar").css('height', $len + 22);
						
				},error:function(){
					console.log("신청 증명서 내용 리스트용 ajax 통신 오류");
				}
				
			})
		}
	</script>
	
	<script>
		function applyCert(){
			
			let cerType;
			
			let useFor = $("#useFor option:selected").val();
			let toType = $("#toType option:selected").val();
			let toWhom = $("input[name=toWhom]").val();
			
			if(!$(".cert-type").hasClass("selected")){
				alert("출력하실 증명서의 종류를 선택해주세요.");
			}else{
				if(${loginUser.studGrad == null} && ($(".selected").hasClass("kor-grad") || $(".selected").hasClass("eng-grad"))){
					alert("졸업을 한 학생만 해당 증명서 출력이 가능합니다.");
				}else if(${loginUser.studGrad != null} && ($(".selected").hasClass("kor-enroll") || $(".selected").hasClass("eng-enroll"))){
					alert("재학중인 학생만 해당 증명서 출력이 가능합니다.");
				}else{					
					if(toWhom == ''){
						alert("제출처를 입력해주세요.");
					}else{					
						if($(".selected").hasClass("kor-grad")){
							cerType = 1;
						}else if($(".selected").hasClass("eng-grad")){
							cerType = 2;
						}else if($(".selected").hasClass("kor-enroll")){
							cerType = 3;
						}else{
							cerType = 4;
						}
						
						$.ajax({
							url:"myStu.cert.applyCert",
							data:{
								studNo:'${loginUser.userNo}', 
								cerType: cerType,
								useFor: useFor,
								toType: toType,
								toWhom: toWhom
							},
							success:function(result){
								if(result > 0){
									selectCertList(1);							
								}
							},error:function(){
								console.log("상태변경 ajax 통신 실패");
							}
						});
					}
				}
			}
			
		}
	</script>
	
	<script>
		$(document).on("click", ".delete-btn", function(){
			
			let cerNo = $(this).parent().siblings("input").val(); 
				
			$.ajax({
				url:"myStu.cert.deleteCert",
				data:{
					cerNo:cerNo
				},
				success:function(result){
					if(result > 0){
						selectCertList();							
					}
				},error:function(){
					console.log("증명서 신청내역 삭제 ajax 통신 실패");
				}
			})
		})
	</script>
	
	<script>
		$(function(){
			$("#certificate").slideDown();
		})
	</script>
</body>
</html>