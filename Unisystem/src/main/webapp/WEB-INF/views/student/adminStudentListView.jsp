<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<style>
	#wrap{
		margin:auto;
		width:1500px;
		height:auto;
	}
	#sidebar{
		width:230px;
		height:700px;
		margin-top:30px;
	}
	#content{
		width:1270px;
		height:auto;
		margin-top:30px;
		margin-bottom:50px;
		background-color:white;
	}
	.pageName{padding:7px;}
	.pageName>p{
		margin:0px;
		float:left;
	}
	.topBox{
		width:100%;
		height:50px;
	}
	.searchBox{
		margin:20px;
		width:1230px;
		height:70px;
		line-height:35px;
		padding-left:40px;
		background:rgb(21, 62, 115);
	}
	.searchBox>input, select{
		margin-top:15px;
		padding-left:10px;
		width:200px;
   		border-radius:8px;
   		border:0;
   		height:40px;
	}
	.searchBox>button{
		background:none;
		color:white;
		font-weight:600;
		border:0;
	}
	.appList{
		margin:20px;
		border:1px solid lightgray;
		position:relative;
		padding:20px;
	}
	.table{
		border-top:2px solid lightgray;
		border-bottom:3px solid lightgray;
	}
	.table th{
		border-bottom:2px solid gray;
		background:rgb(235, 235, 235);
		line-height:20px;
		padding:0;
		text-align:center;
	}
	.table td{
		padding:0;
		text-align:center;
	}
	.table input[type="checkbox"]{
		width:16px;
		height:16px;
	}
	
	/*페이징*/
	.pagebar{
		width:100%;
		height:35px;
		margin-top:15px;
	}
	.pagebar>.btn-light{
		border-radius:100px;
		color:black;
		background-color:rgb(240, 240, 240);
	}
	.pagebar>.btn-basic{
		color:white;
		background-color:rgb(21, 62, 115);
	}
	.container{
	    margin-top: 30px;
	}
	.page-link{
	    color:rgb(33, 33, 33)!important;
	    border: none!important;
	    border-radius: 200px!important;
	}
	.page-item.active .page-link {
	    color: #fff !important;
	    background: rgb(21, 62, 115)!important;
	}
	.nameTag{
		font-size:20px;
		font-weight:700;
		color:white;
		margin-right:430px;
	}
	*:focus {
    outline: none;
	}
	#selectG{
		width:200px;
		border:none;
		border-radius:10px;
		height:38px;
	}

	/* The switch - the box around the slider */
	.switch {
	position: relative;
	display: inline-block;
	width: 60px;
	height: 34px;
	vertical-align:middle;
	}

	/* Hide default HTML checkbox */
	.switch input {display:none;}

	/* The slider */
	.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
	}

	.slider:before {
	position: absolute;
	content: "";
	height: 26px;
	width: 26px;
	left: 4px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
	}

	input:checked + .slider {
	background-color: #2196F3;
	}

	input:focus + .slider {
	box-shadow: 0 0 1px #2196F3;
	}

	input:checked + .slider:before {
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(26px);
	}

	/* Rounded sliders */
	.slider.round {
	border-radius: 34px;
	}

	.slider.round:before {
	border-radius: 50%;
	}
	p{
		margin:0px;
		display:inline-block;
		font-size:15px;
		font-weight:bold;
	}
	.btnBox{
		width:100%;
		height:30px;
		margin-left:20px;
		position:relative;
	}
	.btnBox>div{
		width:auto;
		height:30px;
		float:left;
	}
	.switchBox>div{
		padding-left:30px;
		width:200px;
		height:30px;
		float:left;
	}
	.btnDiv{
		position:absolute;
		right:45px;
	}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/links.jsp" />
		
	<div id="wrap">
		<div id="sidebar" style="float:left;"><jsp:include page="../common/adminSidebar.jsp" /></div>
		<div id="content" style="float:left;">
			<div class="topBox">
				<div class="pageName"><p style="color:gray">마이페이지>기본정보>&nbsp;</p><p style="font-size:19px; font-weight:600;">학생 관리</p></div>
			</div>
			
			
			<div class="searchList">
				<div class="searchBox">
					<span class="nameTag">학생 목록</span>
					<select id="univList" required>
						<option value="" style="display: none;" selected>대학별 조회</option>
						<option>문과대학</option>
						<option>공과대학</option>
						<option>경영대학</option>
						<option>사범대학</option>
						<option>의과대학</option>
						<option>예술체육대학</option>
						<option>자연과학대학</option>
					</select>
					<select id="departList" required>
						<option value="" style="display: none;" selected>학부별 조회</option>
					</select>
					<input type="text" id="keyword" placeholder="이름으로 조회">
					<button type='submit' onclick='pagination("1");'>검색</button>
				</div>
				
				<div class="btnBox">
					<div class="switchBox">
						<label class="switch">
							<input type="checkbox">
							<span class="slider round"></span>
						</label>
						<p >&nbsp;모두 보기</p><p style="display:none;">&nbsp;재학생만 보기</p>
					</div>

					<div class="btnDiv">
						<button class="btn btn-sm btn-outline-secondary">새로 등록</button>
						<button class="btn btn-sm btn-outline-secondary">삭제</button>
					</div>
				</div>



					<div class="appList">
					<table class="table table-hover">
						<thead>
							<tr>
								<th width="30"><input type="checkbox"></th>
								<th width="150">학번</th>
								<th width="220">이름</th>
								<th width="220">대학</th>
								<th width="220">학부</th>
								<th width="220">전공</th>
								<th width="220">학적</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="std" items="${ list }">
								<tr>
									<td><input type="checkbox"></td>
									<td>${ std.studNo }</td>
									<td>${ std.korName }</td>
									<td>${ std.studUniv }</td>
									<td>${ std.studDepartment }</td>
									<td>${ std.studMajor }</td>
									<td>
										<c:choose>
											<c:when test="${ std.studStatus == 1}">
												재학
											</c:when>
											<c:when test="${ std.studStatus == 2}">
												휴학
											</c:when>
											<c:when test="${ std.studStatus == 3}">
												졸업
											</c:when>
											<c:otherwise>
												자퇴
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<!-- $(".page-link).val(""); -->
					<div class="container">
                    <ul class="pagination justify-content-center">
                    
		                   <c:choose>
		    				<c:when test="${ pi.currentPage eq 1 }">            
			                    <li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
		                    </c:when>
		                    <c:otherwise>
		                    	<li class="page-item"><a class="page-link" href="student.ad?cpage=${pi.currentPage-1}">&lt;</a></li>
		                    </c:otherwise>
		                   </c:choose>
                    
                    	<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
                   		  <c:choose>
                    		<c:when test="${ pi.currentPage == p }">
                    			<li class="page-item active"><a class="page-link" href="student.ad?cpage=${p}">${p}</a></li>
            			        <!-- $(".pagination a").text() 와 ${ pi.currentPage } 가 일치할 경우 a의 부모요소 li에 active 부여   -->
                    		</c:when>		    			
		                    <c:otherwise>
		                   		<li class="page-item"><a class="page-link" href="student.ad?cpage=${p}">${p}</a></li>
		                    </c:otherwise>
		                   </c:choose>
                    	</c:forEach>
                    
                    		<c:choose>
						<c:when test="${ pi.currentPage eq pi.maxPage }">
		                    <li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="student.ad?cpage=${ pi.currentPage+1 }">&gt;</a></li>
						</c:otherwise>						
						</c:choose>	
                 
                    </ul>
                 </div>
						
				</div> <!-- appList -->
			</div> <!-- searchList -->
			
			
		</div> <!-- content -->
	</div> <!-- wrap -->
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
							console.log("true");
							$(".wrap_sidebar").css('height', $len);
						}else{
							$(".wrap_sidebar").css('height', 270);
							document.getElementById("content").style.marginBottom = "280px";
						}
				}
				
				// switch 관련
				var check = $("input[type='checkbox']");
					check.click(function(){
						$(".switchBox p").toggle();
					});
	
					
				// 대학별 학부 조회
    			$(document).ready(function(){
	    			$("#univList").on("change", function(){
					let list = "";
	    				$.ajax({
	    					url:"department",
	    					data:{studUniv:$(this).val()},
	    					success:data => {
	    						list += "<option value='' style='display: none;' selected>학부별 조회</option>";
	    						
	    						$(data).each(function(index, value){
	    							list += "<option>" + value.studDepartment + "</option>";
	    						})
	    							$("#departList").html(list);
	    						
	    					}, error:() => {
	    						console.log("대학별 학과 조회 실패");
	    					}
	    				})
	    			})
    			
    			})
	    						
    			
    			// search 기능
				function pagination(i){
    				
					if (!$("#univList").val().length==0 && $("#departList").val().length==0) {
					  alert("학부를 선택해 주세요!");
					  return;
					}
					
					let list = "";
					let status = "";
					let page = "";
					let cpage = i;
					
					
					$.ajax({
					url:"search.st",
					data:{
						cpage:cpage,
						univ:$("#univList").val(),
						depart:$("#departList").val(),
						keyword:$("#keyword").val()
							}, 
						success:data => {
							
							
							
							// 검색 결과 리스트
							$(data.searchList).each(function(index, value){
	   						
							if(value.studStatus == 1){
								status = "재학";
							}else if(value.studStatus == 2){
								status = "휴학"
							}else if(value.studStatus == 3){
								status = "졸업";
							}else{
								status = "자퇴";
							}
								
	    						list += "<tr>" 
			    							+ "<td><input type='checkbox'></td>"
	    									+ "<td>" + value.studNo + "</td>"
	    									+ "<td>" + value.korName + "</td>"
	    									+ "<td>" + value.studUniv + "</td>"
	    									+ "<td>" + value.studDepartment + "</td>"
	    									+ "<td>" + value.studMajor + "</td>"
	    									+ "<td>" + status + "</td>"
	  								 + "</tr>";
								})
	  							
	  							$(".appList tbody").html(list);
							
							// 페이징	
							for(let i=data.pi.startPage; i<=data.pi.endPage; i++){
								
								if(data.pi.currentPage == i){
									page += "<li class='page-item active'><a class='page-link' onclick='pagination("+ i +");' >" + i + "</a></li>";
								}else{
									page += "<li class='page-item'><a class='page-link' onclick='pagination("+ i +");' >" + i + "</a></li>";
								}
							}
							
							$(".pagination").html(page);
							
							sidebar();
							
						}, error:() => {
							console.log("검색 페이징 통신 실패");
						}
						
					})
				}
			</script>
			
</body>
</html>