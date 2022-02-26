<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
	.submitBtn{
		background:rgb(21, 62, 115);
	    width:300px;
	    height:90px;
	    margin:auto;
	    border-radius:7px;
	    
	}
	.submitBtn>p{
  		width:100%;
		color:white;
		font-size:30px;
		font-weight:700;
		text-align:center;
  		line-height:90px;	
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
			<div class="pageName"><p>마이페이지&nbsp;>&nbsp;담당 교수 관리&nbsp;>&nbsp;</p><p style="color:black; font-size:24px; font-weight:900;">&nbsp;담당 교수 변경</p></div>
			</div>
			
			
				<div class="searchList">
				<div class="searchBox">
					<span class="nameTag">교수 목록</span>
					<select id="univListP" required>
						<option value="" style="display: none;" selected>대학별 조회</option>
						<option>문과대학</option>
						<option>공과대학</option>
						<option>경영대학</option>
						<option>사범대학</option>
						<option>의과대학</option>
						<option>예술체육대학</option>
						<option>자연과학대학</option>
					</select>
					<select id="departListP" required>
						<option value="" style="display: none;" selected>학부별 조회</option>
					</select>
					<input type="text" id="keywordP" placeholder="이름으로 조회">
					<button type='submit' onclick='pagination("1");'>검색</button>
				</div>
				
					<div class="appList profTable">
					<table class="table table-hover">
						<thead>
							<tr>
								<th width="150">교수번호</th>
								<th width="220">소속</th>
								<th width="220">학부</th>
								<th width="220">전공</th>
								<th width="220">연락처</th>
								<th width="220">이메일</th>
								<th width="220">이름</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="prof" items="${ list }">
								<tr>
									<td><input type="checkbox" class="choose" name="profNo" value="${prof.profNo}" style="opacity:0">
										${ prof.profNo }</td>
									<td>${ prof.profUniv }</td>
									<td>${ prof.profDepartment }</td>
									<td>${ prof.profMajor }</td>
									<td>${ prof.phone }</td>
									<td>${ prof.email }</td>
									<td>${ prof.korName }</td>
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
		                    	<li class="page-item"><a class="page-link" href="join.ad?cpage=${pi.currentPage-1}">&lt;</a></li>
		                    </c:otherwise>
		                   </c:choose>
                    
                    	<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
                   		  <c:choose>
                    		<c:when test="${ pi.currentPage == p }">
                    			<li class="page-item active"><a class="page-link" href="join.ad?cpage=${p}">${p}</a></li>
                    		</c:when>		    			
		                    <c:otherwise>
		                   		<li class="page-item"><a class="page-link" href="join.ad?cpage=${p}">${p}</a></li>
		                    </c:otherwise>
		                   </c:choose>
                    	</c:forEach>
                    
                    		<c:choose>
						<c:when test="${ pi.currentPage eq pi.maxPage }">
		                    <li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="join.ad?cpage=${ pi.currentPage+1 }">&gt;</a></li>
						</c:otherwise>						
						</c:choose>	
                    </ul>
                 </div>
						
				</div> <!-- appList -->
			</div> <!-- searchList -->
			
			
			
				<div class="searchList">
				<div class="searchBox">
					<span class="nameTag">학생 목록</span>
					<select id="univListS" required>
						<option value="" style="display: none;" selected>대학별 조회</option>
						<option>문과대학</option>
						<option>공과대학</option>
						<option>경영대학</option>
						<option>사범대학</option>
						<option>의과대학</option>
						<option>예술체육대학</option>
						<option>자연과학대학</option>
					</select>
					<select id="departListS" required>
						<option value="" style="display: none;" selected>학부별 조회</option>
					</select>
					<input type="text" id="keywordS" placeholder="이름으로 조회">
					<button type='submit' onclick='studentSelect();'>검색</button>
				</div>
				
					<div class="appList studTable">
					<table class="table table-hover">
						<thead>
							<tr>
								<th width="30"><input type="checkbox" id="allCheck"></th>
								<th width="150">학번</th>
								<th width="220">학년</th>
								<th width="220">이름</th>
								<th width="220">전공</th>
								<th width="220">연락처</th>
								<th width="220">이메일</th>
								<th width="220">담당교수</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
						
						<div class="container">
	                   	 <ul class="page pagination justify-content-center">
			              
                    	
                    	
 	                   </ul>
   	              </div>
   	              
   	              
		             <br><br> 
					<button type="submit" class="submitBtn" style="margin-left:430px;">
						<p>담당 교수 변경</p>
					</button>
					
					
						
				</div> <!-- appList -->
			</div> <!-- searchList -->
			
			
			
			
			
			
		</div> <!-- content -->
	</div> <!-- wrap -->
			<jsp:include page="../common/footer.jsp" />
			
			
	<script>
	
		$(function(){
			sidebar();
			studentSelect();
			clickTr();
			
		})
		
		// 교수 한명만 클릭 가능
		function clickTr(){
			$(".appList.profTable tr").on("click", function(){
				
				$(this).siblings().css("background", "white");
				$("tr .chooseP").prop("checked", false);
				$(this).children().children(".chooseP").prop("checked", true);
				
				$(this).css("background", "RGB(235,242,252)");
			})
		}
		
		// tr 클릭해서 학생 여러명 선택
		function clickStud(){
			$(".appList.studTable tr").on("click", function(){
			
				var checkBox = $(this).children().children(".chooseS");
				
				if(checkBox.is(":checked")){
					checkBox.prop("checked", false);
				}else{
					checkBox.prop("checked", true);
				}
			})
		}
			
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
			
		}
						
		function clickCheck(target) {
		    document.querySelectorAll('input[type=checkbox]')
		        .forEach(el => el.checked = false);
		
		    target.checked = true;
		    
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
		// checkBox 전체 선택
		$("#allCheck").click(function(){
	        if($(this).is(":checked")){
	            $(":checkbox", $("table")).prop("checked", true);
	        }else {
	            $(":checkbox", $("table")).prop("checked", false);
	        }
	    })	
	    
		// 학생 대학별 학부 조회
		$(document).ready(function(){
			
			$("#univListS").on("change", function(){
			let list = "";
				$.ajax({
					url:"department",
					data:{studUniv:$(this).val()},
					success:data => {
						list += "<option value='' style='display: none;' selected>학부별 조회</option>";
						
						$(data).each(function(index, value){
							list += "<option>" + value.studDepartment + "</option>";
						})
							$("#departListS").html(list);
						
					}, error:() => {
						console.log("대학별 학과 조회 실패");
					}
				})
			})
		
		})
		
			// 교수 대학별 학부 조회
		$(document).ready(function(){
			$("#univListP").on("change", function(){
				
			let list = "";
				$.ajax({
					url:"department.pr",
					data:{profUniv:$(this).val()},
					success:data => {
						
						list += "<option value='' style='display: none;' selected>학부별 조회</option>";
						
						$(data).each(function(index, value){
							list += "<option>" + value.profDepartment + "</option>";
						})
							$("#departListP").html(list);
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
			url:"search.pr",
			data:{
				cpage:cpage,
				univ:$("#univListP").val(),
				depart:$("#departListP").val(),
				keyword:$("#keywordP").val()
					}, 
				success:data => {
					
					// 검색 결과 리스트
					$(data.searchList).each(function(index, obj){
			
		 						list += "<tr>" 
		 									+ "<td><input type='checkbox' class='choose' name='profNo' value='" + obj.profNo + "' style='opacity:0'>"
		 									+ obj.profNo + "</td>"
		 									+ "<td>" + obj.profUniv + "</td>"
		 									+ "<td>" + obj.profDepartment + "</td>"
		 									+ "<td>" + obj.profMajor + "</td>"
		 									+ "<td>" + obj.phone + "</td>"
		 									+ "<td>" + obj.email + "</td>"
		 									+ "<td>" + obj.korName + "</td>"
									 + "</tr>";
						})
								
								$(".appList.profTable tbody").html(list);
								clickTr();
					// 페이징	
	                 if(data.pi.currentPage != 1){
	                	 var i = Number(data.pi.currentPage) - 1;
	                		page += "<li class='page-item'><a class='page-link' onclick='pagination(" + i + ");'>&lt;</a></li>";
	                 }
					
					for(let i=data.pi.startPage; i<=data.pi.endPage; i++){
						
						if(data.pi.currentPage == i){
							page += "<li class='page-item active'><a class='page-link' onclick='pagination(" + i + ");' >" + i + "</a></li>";
						}else{
							page += "<li class='page-item'><a class='page-link' onclick='pagination(" + i + ");' >" + i + "</a></li>";
						}
					}
					
					if(data.pi.currentPage != data.pi.maxPage){
						var i = Number(data.pi.currentPage) + 1;
                		page += "<li class='page-item'><a class='page-link' onclick='pagination(" + i + ");'>&gt;</a></li>";
                 	}
					
					$(".pagination").html(page);
					
					sidebar();
					
				}, error:() => {
					console.log("검색 페이징 통신 실패");
				}
				
			})
		}
		
		// 학생 조회
		function studentSelect(i){
			
			let page = "";
			let cpage = i;
			
			$.ajax({
				
				url:"join.st",
				data:{
					cpage:cpage,
					univ:$("#univListS").val(),
					depart:$("#departListS").val(),
					keyword:$("#keywordS").val()
				},
				success:data => {
					let list = "";
					let page = "";
					
					// 검색 결과 리스트
					$(data.searchList).each(function(index, obj){
			
		 						list += "<tr>" 
		 							        + "<td width='30'><input type='checkbox' class='chooseS' value='" + obj.studNo + "'></td>"
		 									+ "<td>" + obj.studNo + "</td>"
		 									+ "<td>" + obj.studUniv + "</td>"
		 									+ "<td>" + obj.studDepartment + "</td>"
		 									+ "<td>" + obj.studMajor + "</td>"
		 									+ "<td>" + obj.phone + "</td>"
		 									+ "<td>" + obj.email + "</td>"
		 									+ "<td>" + obj.korName + "</td>"
									 + "</tr>";
						})
								
								$(".appList.studTable tbody").html(list);
								clickStud();
					
					// 페이징
					 if(data.pi.currentPage != 1){
 	              	 	var i = data.pi.currentPage;
						 	i--;
						 	
	                		page += "<li class='page-item'><a class='page-link' onclick='studentSelect(" + i + ");'>&lt;</a></li>";
            		}
					
					for(let i=data.pi.startPage; i<=data.pi.endPage; i++){
						
						if(data.pi.currentPage == i){
							page += "<li class='page-item active'><a class='page-link' onclick='studentSelect(" + i + ");' >" + i + "</a></li>";
						}else{
							page += "<li class='page-item'><a class='page-link' onclick='studentSelect(" + i + ");' >" + i + "</a></li>";
						}
					}
					
					if(data.pi.currentPage != data.pi.maxPage){
 	              	 	var i = data.pi.currentPage;
						i++;
						
						page += "<li class='page-item'><a class='page-link' onclick='studentSelect(" + i + ");'>&gt;</a></li>";
                 	}
					
					$(".page").html(page);
					
					sidebar();
					
				},error:() => {
					
					console.log("학생 조회 실패");
				}
				
			})
		}
		
	</script>
</body>
</html>