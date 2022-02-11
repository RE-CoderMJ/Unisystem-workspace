<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
</head>
<style>
.sidewrap {
	float: left;
}

.bo_content {
	width: 1270px;
	float: left;
	background-color: white;
	margin-left: 30px;
	padding-bottom: 50px;
	float:right;
}

.page_title {
	color: rgb(15, 43, 80);
    font-size: 40px;
    font-weight: 800;
    margin-top: 37px;
    margin-bottom: 10px;
    margin-left: 53px;
}


#searchForm>* {
	float: left;
	margin-right: 10px;
	border: none;
}

.custom-select {
	border: 1px solid lightgray;
	height: 25px;
	border-radius: 3px;
}

.search_wrap .btn {
	background-color: rgb(15, 43, 80);
	color: white;
	height: 40px;
	width: 60px;
	border-radius: 3px;
	font-size: 14px;
	cursor: pointer;
	position: relative;
	right: 0px;
}

.search_wrap input {
	height: 40px;
	border: 1px solid lightgray;
	margin-left: 0px;
}

.search_wrap {
	margin-left: 728px;
	margin-top: 10px;
	margin-bottom: 15px
}

.head_count {
	margin-left: 55px;
}

.bo_content table {
	background-color: white;
	margin: auto;
	position: relative;
	top: -40px;
}

#pagingArea {
	width: fit-content;
	margin: auto;
	margin-top: 20px;
}

#pagingArea a {
	text-decoration: none;
	color: black;
}

ul {
	list-style: none;
	margin: 0 0 10 10;
}

li {
	float: left;
	margin-left: 20px;
}

#pagingArea a:hover {
	color: rgb(231, 76, 60);
	font-weight: 700;
}

.bo_content {
	position: relative;
	top: 0px;
}

.ctg-area {
	margin-top: 10px;
	margin-bottom: 20px;
	float: left;
	margin-right: 100px;
	margin-left: 188px;
}

.ctg-area button {
	background-color: rgba(0, 0, 0, 0);
	border: none;
	cursor: pointer;
}

.ctg-area button:hover {
	color: rgb(26, 86, 162);
	font-weight: 700;
}

.b_write {
	border: none;
	float: right;
	margin-right: 98px
}

/*페이징바*/
.container{
    margin-top: 50px;
}
.page-link{
    color:rgb(21, 62, 115)!important;
    border: none!important;
    border-radius: 200px!important;
}
.page-item.active .page-link {
    color: #fff !important;
    background: black!important;
}

</style>
<body>

	<jsp:include page="../common/links.jsp" />
	<!-- header.jsp 영역 -->
	<jsp:include page="../common/header.jsp" />

	<!-- sidebar.jsp 영역 
		  교수가 로그인하면 pmySidebar
		  학생이 로그인하면 smySidebar -->


	<div style="background-color: rgb(235, 242, 252); width: 1500px; margin:auto; margin-top:30px;">
			<jsp:include page="../student/smySidebar.jsp" />

		<div class="bo_content" >
			<!-- title -->


			<div class="page_title">커뮤니티</div>

			<div class="head_count">
				총 <b style="color: rgb(231, 76, 60);">${ pi.listCount }</b> 건
			</div>


			<br>

			<!--검색 영역 -->
			<div class="search_wrap">
			
			
			<form id="searchForm" action="search.bo" method="get">
					<div class="select">
						<input type="hidden" name="cpage" value="1"/>
						<select name="condition" class="custom-select">
							<option value="writer">작성자</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
						</select>
					</div>

					<div id="bo_search">
						<input type="text" name="keyword" value="${ keyword }">
					</div>
					<button class="btn" type="submit">검색</button>
				</form>
			</div>
			
			<c:if test="${ not empty condition }">
			<script>
				$(function(){
					$("#searchForm option[value=${condition}]").attr("selected", true);
				})
			</script>
		</c:if>
			

			<div class="ctg-area">
				<input type="hidden" name="cpage" value="1"/>
				<button class="bkeyword" name="bokeyword" value="5">자유</button>
				<button class="bkeyword" name="bokeyword" value="6">취업</button>
				<button class="bkeyword" name="bokeyword" value="7">정보공유</button>
			</div>

		<script>
		
        	$(function(){
        		$(".bkeyword").click(function(){
        			location.href = 'search.bo?bokeyword=' + $(this).val();
        		})
        	})
        	
        </script>


			<br clear="both"> <br> <br>



			<!-- list 영역-->
			<table class="table" id="boardList"
				style="width: 900px; text-align: center;">

				<thead>
					<tr>
						<th width="80px">번호</th>
						<th width="95px">카테고리</th>
						<th>제목</th>
						<th width="95px">작성자</th>
						<th>작성일</th>
						<th>조회</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="b" items="${ list }">
						<tr>
							<td class="bno">${ b.boardNo }</td>
							
							     <c:choose>
			                        <c:when test="${ b.subCategory eq 5 }">
			                       	 	<td>자유</td>
			                        </c:when>
			                        <c:when test="${ b.subCategory eq 6 }">
			                        	<td>취업</td>
			                        </c:when>
			                        <c:when test="${ b.subCategory eq 7 }">
			                        	<td>정보공유</td>
			                        </c:when>
		                   		</c:choose>  
		                   		
							<td>${ b.boardTitle }</td>
							<td>${ b.boardWriter }</td>
							<td>${ b.createDate }</td>
							<td>${ b.boCount }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>


			<!--로그인한 회원에게만 보여지도록 조건처리-->
			<c:if test="${ not empty loginUser }">
				<button class="b_write btn-sm btn-secondary">글쓰기</button>
			</c:if>
			<script>
            	$(function(){
            		$("#boardList>tbody>tr").click(function(){
            			location.href = 'detail.bo?bno=' + $(this).children(".bno").text();
            		});
            	})
            </script>
            
			<!-- paging bar 영역-->
			<div class="container">
                    <ul class="pagination justify-content-center">
                    <c:choose>
						<c:when test="${ pi.currentPage eq 1 }">
                      <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
                      </c:when>
						<c:otherwise>
						<li class="page-item"><a
								href="list.bo?cpage=${ pi.currentPage-1 }">&lt;</a></li>
						</c:otherwise>
					</c:choose>
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<li class="page-item"><a class="page-link" href="list.bo?cpage=${ p }">${ p }</a></li>
					</c:forEach>
					 <c:choose>
						<c:when test="${ pi.currentPage eq pi.maxPage }">
							<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a
								href="list.bo?cpage=${ pi.currentPage+1 }">&gt;</a></li>
						</c:otherwise>
					</c:choose>
                    </ul>
                 </div>
                 
                 
                 
		<!-- side바 div영역 끝 -->
		

	 </div>
	 </div>
	 
	 <br clear="both">
		<!-- footer.jsp-->
		<jsp:include page="../common/footer.jsp" />

	


</body>
</html>