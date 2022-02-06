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
	margin-top: 51px;
	width: 1100px;
	float: left;
	background-color: white;
	margin-left: 150px;
	padding-bottom: 50px;
}

.page_title {
	color: rgb(15, 43, 80);
	font-size: 40px;
	font-weight: 800;
	margin-top: 50px;
	margin-bottom: 10px;
	margin-left: 92px;
}

.msg_division {
	font-size: 20px;
	margin-left: 100px;
	font-weight: 700;
	margin-top: 35px;
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

.search_wrap {
	margin-left: 654px;
	margin-top: 0px;
	margin-bottom: 15px
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

.head_count {
	margin-left: 100px;
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
	margin-left: 96px;
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

.btn-area{
	float: right;
    margin-right: 100px;
}
 
.b_write {
	border: none;
	float: right;
	margin-right: 98px
}

.ltgt {
	display: inline-block;
	width: 25px;
	height: 25px;
	margin-left: 10px;
	border-radius: 100px;
	-moz-border-radius: 100px;
	-webkit-border-radius: 100px;
	background-color: lightgray;
	color: #fff;
	text-align: center;
	text-decoration: none;
	cursor: pointer;
}
.modal-title{
	margin: auto;
    font-size: 30px;
    font-weight: 600;
    margin-right: -10px;
}
.modal-body{margin:auto;}
.modalText{
	width: 383px;
    resize: none;
    height: 400px;
}
#sendModal{
	margin:auto;
}
.moBtn{
	background-color: rgb(15, 43, 80);
	color: white;
	height: 40px;
	width: 80px;
	border-radius: 3px;
	font-size: 14px;
	cursor: pointer;
	position: relative;
	right: 0px;
	border:none;
}
#close{
	position: relative;
    top: 10px;
    right: 20px;
}
</style>
<body>


	<!-- header.jsp 영역 -->
	<jsp:include page="../common/header.jsp" />

	<!-- sidebar.jsp 영역 
		  교수가 로그인하면 pmySidebar
		  학생이 로그인하면 smySidebar -->


	<div style="background-color: rgb(235, 242, 252); width: 1500px;">
		<div class="sidewrap">
			<jsp:include page="../student/smySidebar.jsp" />
		</div>

		<div class="bo_content">
			<!-- title -->


			<div class="page_title">보낸 메시지</div>
			
			<hr width="1000px;">

			<div class="head_count msg_division">보낸 메시지 목록</div>

			<br>

			<div class="btn-search">
			<div class="btn-area">
				<a class="btn btn-sm btn-danger" href="">선택삭제</a> 
				<a class="btn btn-sm" href="" data-toggle="modal" data-target="#msgModal" style="background-color:rgb(44, 62, 80); color:white;">쪽지보내기</a>
			</div>
		 
			
</div>
			<br clear="both"> <br> <br>

			<br clear="both">

			<!-- list 영역-->
			<table class="table" style="width: 900px; text-align: center;">

				<tr>
					<th width="20px"></th>
					<th width="70px">번호</th>
					<th width="100px">받는사람</th>
					<th width="200px">내용</th>
					<th width="100px">상태</th>
				</tr>

				<tr>
					<td><input type="checkbox"></td>
					<td>1</td>
					<td>이망고</td>
					<td>망고는 맛있어</td>
					<td>읽음</td>
				</tr>

				<tr>
					<td><input type="checkbox"></td>
					<td>1</td>
					<td>이망고</td>
					<td>망고는 맛있어</td>
					<td>읽음</td>
				</tr>
				
				<tr>
					<td><input type="checkbox"></td>
					<td>1</td>
					<td>이망고</td>
					<td>망고는 맛있어</td>
					<td>읽음</td>
				</tr>

				<tr>
					<td><input type="checkbox"></td>
					<td>1</td>
					<td>이망고</td>
					<td>망고는 맛있어</td>
					<td>읽음</td>
				</tr>

				<tr>
					<td><input type="checkbox"></td>
					<td>1</td>
					<td>이망고</td>
					<td>망고는 맛있어</td>
					<td>읽음</td>
				</tr>


			</table>

		


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

	
	<!-- msg 모달 영역  -->

	<div class="modal" id="msgModal">
	  <div class="modal-dialog">
	    <div class="modal-content" style="border-radius: 80px;">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">메시지 보내기</h4>
	        <button type="button" class="close" id="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	      	<p><b>받는이:</b> 곰돌이(201901234) </p>
	      	<textarea class="modalText"></textarea>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="moBtn" id="sendModal" data-dismiss="modal">보내기</button>
	      </div>
	
	    </div>
	  </div>
	</div>
	
	<!-- msg 모달 영역  -->

	<div class="modal" id="msgModal">
	  <div class="modal-dialog">
	    <div class="modal-content" style="border-radius: 80px;">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">메시지 보내기</h4>
	        <button type="button" class="close" id="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	      	<p><b>받는이:</b> 곰돌이(201901234) </p>
	      	<textarea class="modalText"></textarea>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="moBtn" id="sendModal" data-dismiss="modal">보내기</button>
	      </div>
	
	    </div>
	  </div>
	</div>
	
	</div>

</body>
</html>