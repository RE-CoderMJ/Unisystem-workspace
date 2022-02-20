<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<link href="resources/css/pages/wrapperStyle.css" rel="stylesheet">
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<style>
	#selectG{
		width:200px;
		border:none;
		border-radius:10px;
		height:38px;
	}

	.btnBox{
		width:1230px;
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
		right:9px;
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
				<div class="pageName"><p>마이페이지&nbsp;>&nbsp;기본정보&nbsp;>&nbsp;</p><p style="color:black; font-size:24px; font-weight:900;">&nbsp;교수 관리</p></div>
			</div>
			
			
			<div class="searchList">
				<div class="searchBox">
					<span class="nameTag">교수 목록</span>
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
				



			<form id="profDelete">
				<div class="btnBox">
					<div class="btnDiv">
						<a class="btn btn-sm btn-outline-secondary" href="enrollForm.pr">새로 등록</a>
						<button type="button" class="btn btn-sm btn-outline-secondary" data-toggle="modal" data-target="#delete">삭제</button>
					</div>
				</div>

 			 <!-- The Modal -->
			  <div class="modal" id="delete">
			    <div class="modal-dialog">
			      <div class="modal-content">
			      
			        <!-- Modal Header -->
			        <div class="modal-header">
			          <h4 class="modal-title">삭제하시겠습니까?</h4>
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			        </div>
			      	
			        <!-- Modal body -->
			        <div class="modal-body">
					 	<input type="hidden" id="adminPwd" value="${loginUser.userPwd}"> 
					        삭제 시 다시 복구하실 수 없습니다.<br>
			          	관리자의 승인이 필요합니다. <br><br>
			          	* 비밀번호 : 
			          	<input type="password" name="userPwd">
			        </div>
			        
			        <!-- Modal footer -->
			        <div class="modal-footer">
			          <button type="submit" onclick="professorDelete();" class="btn btn-danger" data-dismiss="modal">삭제</button>
			        </div>
			      
			        
			      </div>
			    </div>
			  </div>


					<div class="appList">
					<table class="table table-hover">
						<thead>
							<tr>
								<th width="30"><input type="checkbox" id="allCheck"></th>
								<th width="150">교번</th>
								<th width="220">이름</th>
								<th width="220">소속</th>
								<th width="220">학부</th>
								<th width="220">전공</th>
								<th width="220">직급</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="prof" items="${ list }">
								<tr>
									<td><input type="checkbox" class="deleteNo" name="dno" value="${prof.profNo}"></td>
									<td>${ prof.profNo }</td>
									<td>${ prof.korName }</td>
									<td>${ prof.profUniv }</td>
									<td>${ prof.profDepartment }</td>
									<td>${ prof.profMajor }</td>
									<td>
										<c:choose>
											<c:when test="${ prof.profRank == 1}">
												조교수
											</c:when>
											<c:when test="${ prof.profRank == 2}">
												부교수
											</c:when>
											<c:when test="${ prof.profRank == 3}">
												정교수
											</c:when>
											<c:otherwise>
												객원교수
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
		                    	<li class="page-item"><a class="page-link" href="professor.ad?cpage=${pi.currentPage-1}">&lt;</a></li>
		                    </c:otherwise>
		                   </c:choose>
                    
                    	<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
                   		  <c:choose>
                    		<c:when test="${ pi.currentPage == p }">
                    			<li class="page-item active"><a class="page-link" href="professor.ad?cpage=${p}">${p}</a></li>
            			        <!-- $(".pagination a").text() 와 ${ pi.currentPage } 가 일치할 경우 a의 부모요소 li에 active 부여   -->
                    		</c:when>		    			
		                    <c:otherwise>
		                   		<li class="page-item"><a class="page-link" href="professor.ad?cpage=${p}">${p}</a></li>
		                    </c:otherwise>
		                   </c:choose>
                    	</c:forEach>
                    
                    		<c:choose>
						<c:when test="${ pi.currentPage eq pi.maxPage }">
		                    <li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="professor.ad?cpage=${ pi.currentPage+1 }">&gt;</a></li>
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
			sidebar();
			
			// checkBox 전체 선택
			$("#allCheck").click(function(){
	            if($(this).is(":checked")){
	                $(":checkbox", $("table")).prop("checked", true);
	            }else {
	                $(":checkbox", $("table")).prop("checked", false);
	            }
	        })	
	        
		        // 선택 교수 삭제
				function professorDelete(){
					const checkboxes = document.getElementsByClassName('deleteNo');
					var checkNum = 0;
					var delForm = document.getElementById('profDelete');
					let checkPwd = $("input[name=userPwd]").val();
					let adminPwd = $("#adminPwd").val();
					
					for(var i=0; i<checkboxes.length; i++) {
						if(checkboxes[i].checked == true) {
						// 단순 체크된 박스의 개수를 세는 작업
						// checkBox name="dno"으로 form태그 안에서 넘기고 있기 때문에 콘솔로 출력하지 않아도 controller에서는 값을 전달받음! 
							checkNum += 1;
						}
					}
	
					if(checkNum == 0) {
						alertify.alert("삭제할 학생을 선택해주세요.");
					} else if(checkNum > 0) {
						if(checkPwd == adminPwd){
							// 삭제 요청
							delForm.action = "delete.pr";
							delForm.submit();
						}else{
							alertify.alert("비밀번호를 잘못 입력하셨습니다.");
							return false;
						}
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
				
				// 대학별 학부 조회
    			$(document).ready(function(){
	    			$("#univList").on("change", function(){
					let list = "";
	    				$.ajax({
	    					url:"department.pr",
	    					data:{profUniv:$(this).val()},
	    					success:data => {
	    						list += "<option value='' style='display: none;' selected>학부별 조회</option>";
	    						
	    						$(data).each(function(index, value){
	    							list += "<option>" + value.profDepartment + "</option>";
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
    				/*
					if (!$("#univList").val().length==0 && $("#departList").val().length==0) {
					  alert("학부를 선택해 주세요!");
					  return;
					}
					*/
					let list = "";
					let status = "";
					let page = "";
					let cpage = i;
					
					
					$.ajax({
					url:"search.pr",
					data:{
						cpage:cpage,
						univ:$("#univList").val(),
						depart:$("#departList").val(),
						keyword:$("#keyword").val()
							}, 
						success:data => {
							
							// 검색 결과 리스트
							$(data.searchList).each(function(index, obj){
	   						
							if(obj.profRank == 1){
								status = "조교수";
							}else if(obj.profRank == 2){
								status = "부교수"
							}else if(obj.profRank == 3){
								status = "정교수";
							}else{
								status = "객원교수";
							}
								
	    						list += "<tr>" 
			    							+ "<td><input type='checkbox'></td>"
	    									+ "<td>" + obj.profNo + "</td>"
	    									+ "<td>" + obj.korName + "</td>"
	    									+ "<td>" + obj.profUniv + "</td>"
	    									+ "<td>" + obj.profDepartment + "</td>"
	    									+ "<td>" + obj.profMajor + "</td>"
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