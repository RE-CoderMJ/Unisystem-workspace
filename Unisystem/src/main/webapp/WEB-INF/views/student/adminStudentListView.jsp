<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="resources/css/pages/wrapperStyle.css" rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<style>
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
	
	.switchBox>div{
		padding-left:30px;
		width:200px;
		height:30px;
		float:left;
	}
	.btnBox{
		position:relative;
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
				<div class="pageName"><p>마이페이지&nbsp;>&nbsp;기본정보&nbsp;>&nbsp;</p><p style="color:black; font-size:24px; font-weight:900;">&nbsp;학생 관리</p></div>
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
				
				
			  <form id="studDelete" method="post">
				<div class="btnBox">
			  	<!--
					<div class="switchBox">
						<label class="switch">
							<input type="checkbox">
							<span class="slider round"></span>
						</label>
					  
						<p >&nbsp;모두 보기</p><p style="display:none;">&nbsp;재학생만 보기</p>
						
					</div>
-->
					
					<div class="btnDiv">
						<a class="btn btn-sm btn-outline-secondary" href="enrollForm.st">새로 등록</a>
						<button type="button" class="btn btn-sm btn-outline-secondary" data-toggle="modal" data-target="#delete">삭제</button>
					</div>
				</div>



		
			  <!-- The Modal -->
			  <div class="modal" id="delete">
			    <div class="modal-dialog">
			      <div class="modal-content">
s					
			        <!-- Modal Header -->
			        <div class="modal-header">
			          <h4 class="modal-title">삭제하시겠습니까?</h4>
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			        </div>
			        <!-- Modal body -->
			        <div class="modal-body">
					        삭제 시 다시 복구하실 수 없습니다.<br>
			          	관리자의 승인이 필요합니다. <br><br>
			          	* 비밀번호 : 
			          	<input type="password" name="userPwd">
			        </div>
			        <!-- Modal footer -->
			        <div class="modal-footer">
			          <button type="button" onclick="return studentDelete();" class="btn btn-danger">삭제</button>
			        </div>
		       
			      
			        
			      </div>
			    </div>
			  </div>



					<div class="appList">
					<table class="table table-hover">
						<thead>
							<tr>
								<th width="30"><input type="checkbox" id="allCheck"></th>
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
									<td><input type="checkbox" class="deleteNo" name="dno" value="${std.studNo}"></td>
									<td>${ std.studNo }</td>
									<td><a href="detail.st?studNo=${std.studNo}">${ std.korName }</a></td>
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
				</form> <!-- delete용 form -->
			</div> <!-- searchList -->
			
			
		</div> <!-- content -->
	</div> <!-- wrap -->
	<jsp:include page="../common/footer.jsp" />
			
			  
			
			<script>
			
				$(function(){
					sidebar();
					
					// checkBox 전체 선택
					$("#allCheck").click(function(){
			            if($(this).is(":checked")){
			                $(":checkbox", $("table")).prop("checked", true);
			            }else {
			                $(":checkbox", $("table")).prop("checked", false);
			            }
			        })	
					
				})
				
				
				// 선택 회원 삭제
				function studentDelete(){
					const checkboxes = document.getElementsByClassName('deleteNo');
					var checkNum = 0;
					var delForm = document.getElementById('studDelete');
					
					for(var i=0; i<checkboxes.length; i++) {
						if(checkboxes[i].checked == true) {
						// 단순 체크된 박스의 개수를 세는 작업
						// checkBox name="dno"으로 form태그 안에서 넘기고 있기 때문에 콘솔로 출력하지 않아도 controller에서는 값을 전달받음! 
							checkNum += 1;
						}
					}

					if(checkNum == 0) {
						alertify.alert("삭제할 학생을 선택해주세요.");
						return false;
					}else{
						delForm.action = "delete.st";
						delForm.submit();
					} 
				}
				
				
				// 사이드바 길이 조절
				function sidebar(){
					document.getElementById("content").style.marginBottom = "50px";
					let $len = $("#content").height();
					
						if($len > 750){
							$(".wrap_sidebar").css('height', $len);
						}else{
							$(".wrap_sidebar").css('height', 270);
							document.getElementById("content").style.marginBottom = "300px";
						}
				}
				
				// switch 관련
				var check = $(".switchBox input[type='checkbox']");
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
							$(data.searchList).each(function(index, obj){
	   						
							if(obj.studStatus == 1){
								status = "재학";
							}else if(obj.studStatus == 2){
								status = "휴학"
							}else if(obj.studStatus == 3){
								status = "졸업";
							}else{
								status = "자퇴";
							}
								
	    						list += "<tr>" 
			    							+ "<td><input type='checkbox'></td>"
	    									+ "<td>" + obj.studNo + "</td>"
	    									+ "<td><a href='detail.st?studNo=" + obj.studNo + "'>" + obj.korName + "</a></td>"
	    									+ "<td>" + obj.studUniv + "</td>"
	    									+ "<td>" + obj.studDepartment + "</td>"
	    									+ "<td>" + obj.studMajor + "</td>"
	    									+ "<td>" + status + "</td>"
	  								 + "</tr>";
								})
	  							
	  							$(".appList tbody").html(list);
							
							// 페이징	
							for(let i=data.pi.startPage; i<=data.pi.endPage; i++){
								
								if(data.pi.currentPage == i){
									page += "<li class='page-item active'><a class='page-link' onclick='pagination(" + i + ");' >" + i + "</a></li>";
								}else{
									page += "<li class='page-item'><a class='page-link' onclick='pagination(" + i + ");' >" + i + "</a></li>";
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