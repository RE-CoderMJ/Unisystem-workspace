<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="resources/css/pages/wrapperStyle.css" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<style>
	.TopBox{
		width:100%;
		height:50px;
		position:relative;
	}
	.nameBox{
		margin-left:20px;
		margin-bottom:10px;
	}
	.nameBox>button{
	 	width:45px; 
	 	height:45px;
	 	border:1px solid lightgray;
   		border-radius:0px 8px 8px 0px;
	}
	.nameBox>input{
		padding-left:10px;
		height:45px;
	 	border:1px solid lightgray;
   		border-radius:8px 0px 0px 8px;
	}
	.nameBox>label{
		padding:20px;
		font-size:38px;
		font-weight:800;
	}
	.studBox{
		width:100%;
	}

	.sort{
		position:absolute;
		top:325px;
		right:126px;
		cursor:pointer;
	}
</style>

</head>
<body>

	<jsp:include page="../common/links.jsp" />
	<jsp:include page="../common/header.jsp" />
	
		
	<div id="wrap">
		<div id="sidebar" style="float:left;"><jsp:include page="pmySidebar.jsp" /></div>
		<div id="content" style="float:left;">
					<div class="topBox">
				<div class="pageName"><p>마이페이지&nbsp;>&nbsp;담당학생 관리&nbsp;>&nbsp;</p><p style="color:black; font-size:24px; font-weight:900;">&nbsp;담당 학생 조회</p></div>
					<div class="sort">
							<a>전공</a> | <a>학년</a>
						</div>
					</div>
					
						<div class="listBox">
							<div class="nameBox">
								<label>담당 학생</label>
								<input type="text" placeholder="이름"><button type="button"><i class="fas fa-search"></i></button>
							</div>
							<div class="studBox">
							<table class="table table-hover" align="center" style="width:1150px;">
								<tbody>
									<tr>
										<th>학번</th>
										<th>학년</th>
										<th>이름</th>
										<th>전공</th>
										<th>연락처</th>
										<th>이메일</th>
									</tr>
									<c:forEach var="stud" items="${ stud }">
									<tr>
										<td>${ stud.studNo }</td>
										 <c:choose>
											<c:when test="${ stud.studSemester < 2 }">
												<td>1학년</td>
											</c:when>
											<c:when test="${ stud.studSemester < 4 }">
												<td>2학년</td>
											</c:when>
											<c:when test="${ stud.studSemester < 6 }">
												<td>3학년</td>
											</c:when>
											<c:otherwise>
												<td>4학년</td>
											</c:otherwise>
										</c:choose>
										<td>${ stud.korName }</td>
										<td>${ stud.studUniv }</td>
										<td>${ stud.phone }</td>
										<td>${ stud.email }</td>
									</tr>
									</c:forEach>
									
								</tbody>
							</table>
						</div>
						<div class="container">
                    <ul class="pagination justify-content-center">
		                   <c:choose>
		    				<c:when test="${ pi.currentPage eq 1 }">            
			                    <li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
		                    </c:when>
		                    <c:otherwise>
		                    	<li class="page-item"><a class="page-link" href="stlist.pr?cpage=${pi.currentPage-1}">&lt;</a></li>
		                    </c:otherwise>
		                   </c:choose>
                    
                    	<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
                   		  <c:choose>
                    		<c:when test="${ pi.currentPage == p }">
                    			<li class="page-item active"><a class="page-link" href="stlist.pr?cpage=${p}">${p}</a></li>
            			        <!-- $(".pagination a").text() 와 ${ pi.currentPage } 가 일치할 경우 a의 부모요소 li에 active 부여   -->
                    		</c:when>		    			
		                    <c:otherwise>
		                   		<li class="page-item"><a class="page-link" href="stlist.pr?cpage=${p}">${p}</a></li>
		                    </c:otherwise>
		                   </c:choose>
                    	</c:forEach>
                    
                    		<c:choose>
						<c:when test="${ pi.currentPage eq pi.maxPage }">
		                    <li class="page-item "><a class="page-link" href="#">&gt;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="stlist.pr?cpage=${ pi.currentPage+1 }">&gt;</a></li>
						</c:otherwise>						
						</c:choose>	
                    </ul>
                 </div>
				</div>
			
		
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
		let side = $(".wrap_sidebar").height();
			if($len > 750){
				$(".wrap_sidebar").css('height', $len);
			}else{
				$(".wrap_sidebar").css('height', 270);
				$("#content").css('height', side);
			}
	}
	</script>
</body>
</html>