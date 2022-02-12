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


	<!-- header.jsp 영역 -->
	<jsp:include page="../common/header.jsp" />

	<!-- sidebar.jsp 영역 
		  교수가 로그인하면 pmySidebar
		  학생이 로그인하면 smySidebar -->


	<div style="background-color: rgb(235, 242, 252); width: 1500px; margin:auto; margin-top:30px;">
		<div class="sidewrap">
			<jsp:include page="../student/smySidebar.jsp" />
		</div>

		<div class="bo_content">
			<!-- title -->


			<div class="page_title">공지사항</div>

			<div class="head_count">
				총 <b style="color: rgb(231, 76, 60);">XXX</b> 건
			</div>


			<br>

			<!--검색 영역 -->
			<div class="search_wrap">
				<form id="searchForm" action="" method="get">
					<div class="select">
						<select name="condition" class="custom-select">
							<option class=" " value="">검색</option>
							<option class=" " value="">제목</option>
							<option class=" " value="">내용</option>
						</select>
					</div>

					<div id="bo_search">
						<input type="text" placeholder=" ">
					</div>
					<button class="btn" type="submit">검색</button>
				</form>
			</div>


			<br clear="both"> <br> <br>



			<!-- list 영역-->
			<table class="table" style="width: 900px; text-align: center;">


				<tr>
					<th width="100px">번호</th>
					<th width="60px"></th>
					<th width="100px">카테고리</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>첨부</th>
					<th>조회</th>
				</tr>

				<tr>
					<td>1</td>
					<td><img src="resources/images/notice_icon.png"/></td>
					<td>자유</td>
					<td>제목입니다</td>
					<td>김민수</td>
					<td>2019.03.23</td>
					<td></td>
					<td>1004</td>
				</tr>

				<tr>
					<td>1</td>
					<td><img src="resources/images/notice_icon.png"/></td>
					<td>자유</td>
					<td>제목입니다</td>
					<td>김민수</td>
					<td>2019.03.23</td>
					<td></td>
					<td>1004</td>
				</tr>
				
				<tr>
					<td>1</td>
					<td></td>
					<td>자유</td>
					<td>제목입니다</td>
					<td>김민수</td>
					<td>2019.03.23</td>
					<td></td>
					<td>1004</td>
				</tr>

				<tr>
					<td>1</td>
					<td></td>
					<td>자유</td>
					<td>제목입니다</td>
					<td>김민수</td>
					<td>2019.03.23</td>
					<td></td>
					<td>1004</td>
				</tr>
				
					<tr>
					<td>1</td>
					<td></td>
					<td>자유</td>
					<td>제목입니다</td>
					<td>김민수</td>
					<td>2019.03.23</td>
					<td></td>
					<td>1004</td>
				</tr>
				
					<tr>
					<td>1</td>
					<td></td>
					<td>자유</td>
					<td>제목입니다</td>
					<td>김민수</td>
					<td>2019.03.23</td>
					<td></td>
					<td>1004</td>
				</tr>
				
					<tr>
					<td>1</td>
					<td></td>
					<td>자유</td>
					<td>제목입니다</td>
					<td>김민수</td>
					<td>2019.03.23</td>
					<td></td>
					<td>1004</td>
				</tr>
			</table>

			<!--관리자에게만 보여지도록 조건처리-->
			
			<button class="b_write btn-sm btn-danger">선택삭제</button>
			<button class="b_write btn-sm btn-dark" style="position:relative; right:-85px;">글쓰기</button>
			
			<!-- 버튼 부분 여기까지   -->
			


			<!-- paging bar 영역-->
			<div id="pagingArea">

				<ul class="pagination">
					<li class="page-item ltgt"><a href="">&lt;</a></li>
					<li class="page-item"><a href="">1</a></li>
					<li class="page-item"><a href="">2</a></li>
					<li class="page-item"><a href="">3</a></li>
					<li class="page-item"><a href="">4</a></li>
					<li class="page-item"><a href="">5</a></li>
					<li class="page-item ltgt"><a href="">&gt;</a></li>
				</ul>
			</div>

		</div>
		<!-- side바 div영역 끝 -->

		<br clear="both">

		<script>

    </script>

		<!-- footer.jsp-->
		<jsp:include page="../common/footer.jsp" />

	</div>

	</div>

</body>
</html>