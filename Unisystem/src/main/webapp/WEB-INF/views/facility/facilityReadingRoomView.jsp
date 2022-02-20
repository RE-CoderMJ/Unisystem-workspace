<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link href="resources/css/pages/wrapperStyle.css" rel="stylesheet">
<style>
	.lineBar{
		margin-top:30px;
		clear:both;
		width:100%;
		height:70px;
		border-top:3px solid rgb(26, 86, 162);
		border-bottom:3px solid rgb(26, 86, 162);
		text-align:center;
	}
	.lineBar>span{
		margin:25px;
		line-height:65px;
		
	}
	.lineBar a{
		font-size:20px;
		color:gray;	
	}
	.lineBar a:hover{
		text-decoration:none;
		color:#0275d8;
	}
	#readingRoom{
		font-weight:700;
		color:rgb(26, 86, 162);
	}
	.srvdBox{
		width:480px;
		height:auto;
		margin:auto;
		margin-top:150px;
		border:1px solid lightgray;
		padding:8px;
	}
	.btn.btn-primary{
		color:#9b9fa3;
		background-color:rgb(235,242,252);
		border:none;
		width:38px;
		height:38px;
		margin:8px !important;
		border-radius:7px !important;
		font-size:13px;
		padding-left:2px;
		/* 아래 항목으로 인해 색깔이 다르게 보여짐*/
		background-image: none;
	}
	.container, .row, .col{
		width:480px;
		height:auto;
	}
	.guide{
		margin:auto;
		margin-top:15px;
		width:380px;
	}
	.guide>*{
		color:gray;
		font-size:18px;
	}
	.btnBox{
		width:100%;
		height:250px;
	}
	.submitBtn{
		background:rgb(21, 62, 115);
	    width:300px;
	    height:90px;
	    margin-top:70px;
	    margin-left:475px;
	    border-radius:7px;
		border:none;	
	}
	.submitBtn>p{
		color:white;
		font-size:30px;
		font-weight:700;
		text-align:center;
  		line-height:90px;	
	}
	.lineBox{
	    margin-left: -9px;
	    width: 480px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/links.jsp"/>
	<jsp:include page="../common/header.jsp" />
	
	<div id="wrap">
		<div id="sidebar" style="float:left"><jsp:include page="../student/smySidebar.jsp" /></div>
		<div id="content" style="float:left">
			<div class="topBox">
				<div class="pageName"><p>마이페이지&nbsp;>&nbsp;시설물 예약&nbsp;>&nbsp;</p><p style="color:black; font-size:24px; font-weight:900;">&nbsp;열람실 예약</p></div>
			</div>
		
			<div class="lineBar">
				<span id="readingRoom"><a>열람실 예약</a></span><span id="studyRoom"><a href="rsvdStudy">스터디룸 예약</a></span>
			</div>
			
			<form id="readingForm" action="insert.rr">
			<div class="srvdBox">
				<div class="container" style="margin:0">
					<div class="row">
						<div class="col" style="padding:0">
							<div class="btn-group btn-group-toggle" data-toggle="buttons" style="display:block">
							
								<c:forEach var="j" begin="0" end="6" step="1">
									<c:forEach var="i" begin="1" end="8" step="1">
										<label class="btn btn-primary">
											<input type="radio" id="space" name="rsvdSpace" value="${j}${i}">${j}${i}
										</label>
									
									</c:forEach>
								</c:forEach>
						
							</div>
						</div>
					</div>
				</div>
				</div>	

		
				<div class="guide">
					<i class="fas fa-exclamation-triangle"></i>&nbsp;
					<label>1시간 이상 자리를 비우면 적발 시 강제 퇴실</label>
				</div>
				
				<input type="hidden" name="rsvdNo" value="0">
				<input type="hidden" name="studNo" value="${ loginUser.studNo }">
				<div class="btnBox">
					<button type="submit" class="submitBtn" onclick="return no();">
						<p>자리 예약</p>
					</button>
				</div>
			</form>
		</div>
							
				
	
	
	</div>
	<jsp:include page="../common/footer.jsp" />
	
	<script>
	
	function no(){
		let space = $("input[name=rsvdSpace]:checked").val();
		
		if($(".submitBtn>p").text() == "자리 예약")
				if(space == undefined){
					
					alert("좌석을 선택해주세요!");
				
				return false;
				
			}else{
				console.log("선택됨");
			}
				
				return true;
	}

	$(function(){

		var readingForm = document.getElementById('readingForm');
		
		sidebar();
		reserved();
		
		$(".submitBtn").on("click", function(){
			cancel();
		})
		
		
		
	})
		
		
		// 사이드바 길이 조절
		function sidebar(){
			document.getElementById("content").style.marginBottom = "50px";
			let $len = $("#content").height();
				
				if($len > 750){
					$(".wrap_sidebar").css('height', $len);
				}else{
					$(".wrap_sidebar").css('height', 270);
					document.getElementById("content").style.marginBottom = "280px";
				}
	
			}
	
		
		// 예약된 좌석 불러오기
		function reserved(){
			// 로그인한 학생의 학번
			const login = $("input[name=studNo]").val();
			
			$.ajax({
				url:"selectReading",
				success:data => {
					
					$(data).each(function(i, rsvd){
						// 예약한 학생의 학번 
						 let sno = data[i].studNo;
						 // 예약된 자리
						 let space = data[i].rsvdSpace;
						 
						if(login == sno) {
						 // 예약번호 hidden => 퇴실을 위해 예약번호를 넘기기 위해 가져온 값 (로그인한 회원의 예약번호)
						 $("input[name=rsvdNo]").val(data[i].rsvdNo);
						// 예약자 본인의 좌석은 노란색으로 표시됨	
						$("input[value='"+space+"']").closest('label').css("background", "#fc6").css("color", "white");
						$("input[value='"+space+"']").attr("disabled", true);
							
						$(".submitBtn>p").text("퇴 실");
						
						}else{
						// 다른 사용자가 예약한 좌석
						$("input[value='"+space+"']").closest('label').css("background", "RGB(21,62,115)").css("color", "white");
						$("input[value='"+space+"']").attr("disabled", true);
							
						}
						 
					})			
						
				},error: () => {
					console.log("좌석 실패");
				}
				
			})
			
		}
		
		
		function cancel(){
			
			let status = $(".submitBtn>p").text();
			
			if(status == "퇴 실"){
				
				readingForm.action = "cancel.rr";
				
			}
			
		}
			
					
				
		

	</script>
		
</body>
</html>