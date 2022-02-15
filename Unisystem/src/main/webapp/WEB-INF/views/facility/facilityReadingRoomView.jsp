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
	.topBar{
		margin-top:30px;
		clear:both;
		width:100%;
		height:70px;
		border-top:3px solid rgb(26, 86, 162);
		border-bottom:3px solid rgb(26, 86, 162);
		text-align:center;
	}
	.topBar>span{
		margin:25px;
		font-size:20px;
		line-height:70px;
		color:gray;
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
			<div class="pageName"><p style="color:gray">마이페이지>시설물 예약>&nbsp;</p><p style="font-size:19px; font-weight:600;">열람실 예약</p></div>
			<div class="topBar">
				<span id="readingRoom"><a>열람실 예약</a></span><span id="studyRoom"><a>스터디룸 예약</a></span>
			</div>
			
			<form>
			<div class="srvdBox">
				<div class="container" style="margin:0">
					<div class="row">
						<div class="col" style="padding:0">
							<div class="btn-group btn-group-toggle" data-toggle="buttons" style="display:block">
							
								
								
								<c:forEach var="j" begin="0" end="6" step="1">
									
									<c:forEach var="i" begin="1" end="8" step="1">
									
										<label class="btn btn-primary">
											<input type="radio" name="jb-radio" id="jb-radio-1">${j}${i}
										</label>
									
									</c:forEach>
								</c:forEach>
							
								<!-- 
								
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-1"> 1
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-2"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-1"> 1
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-2"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
								</label>
								
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-1"> 1
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-2"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
								</label>
								<hr class="lineBox">	
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-1"> 1
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-2"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-1"> 1
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-2"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-1"> 1
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-2"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
								</label>

								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-1"> 1
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-2"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="jb-radio" id="jb-radio-3"> &nbsp;
								</label>
								 -->
								
								
							</div>
						</div>
					</div>
				</div>
				</div>	

		
				<div class="guide">
					<i class="fas fa-exclamation-triangle"></i>&nbsp;
					<label>1시간 이상 자리를 비우면 적발 시 강제 퇴실</label>
				</div>
				
				<div class="btnBox">
					<button type="submit" class="submitBtn">
						자리예약
					</button>
				</div>
		
		</form>
							
				
		</div>
	
	
	</div>
	<jsp:include page="../common/footer.jsp" />
	
	<script>

	$(function(){
		sidebar();
		
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
	</script>
</body>
</html>