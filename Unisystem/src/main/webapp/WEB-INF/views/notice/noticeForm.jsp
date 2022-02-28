<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

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
	margin-left: 207px;
}

.search_wrap {
	width: 110px;
	display: inline-block;
	height: 30px;
}

.custom-select {
	height: 30px;
	box-sizing: border-box;
	font-size: 13px;
}

.custom-select .ctg {
	font-size: 13px;
	margin-left: 10px;
}

.grayWrap {
	width: 850px;
	height: 120px;
	background-color: rgb(224, 224, 224);
	margin: auto;
}

.grayWrap input {
	border: 1px solid lightgray;
	background-color: rgb(224, 224, 224);
	color: black;
	margin-top: 20px;
	margin-left: 20px;
	width: 420px;
	height: 42px;
}

.grayWrap span {
	font-weight: 700;
	color: rgb(52, 152, 219);
	margin-left: 20px;
	margin-top: 10px;
}

.grayWrap select {
	float: left;
	margin-left: 10px;
	position: relative;
	top: 5px;
}

.custom-select {
	border: 1px solid lightgray;
	height: 25px;
	border-radius: 3px;
}

.ctg-area {
	font-size: 16px;
	display: inline-block;
	margin-top: -58px;
}

.bo_content {
	position: relative;
	top: 0px;
}

.b_write {
	border: none;
	float: right;
	margin-right: 209px;
    margin-top: -30px;
    background-color: rgb(15, 43, 80);
	color: white;
	height: 35px;
	width: 90px;
	border-radius: 3px;
	font-size: 14px;
	cursor: pointer;
	position: relative;
	right: 0px;
}
.board-content textarea{
	resize: none;
    width: 850px;
    margin: auto;
    height: 650px;
    margin-left: 212px;
    margin-top:20px;
}
.b-count{
	font-size:16px;
	display:inline-block;
	float: right;
    position: relative;
    left: 490px;
}

#upfile{
	margin-left: 212px;
	margin-top: 10px;
}

.checkBox{
	margin-left: 212px;
	margin-top: 10px;
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
			<div class="page_title">공지사항 글작성</div>
			 
			<form id="boardInsert" action="insert.nbo" method="post" enctype="multipart/form-data">
			<jsp:useBean id="now" class="java.util.Date" />
			<c:set var="today"><fmt:formatDate value="${now}" pattern="yyyy.MM.dd" /></c:set>
			
				<!--제목,날짜,조회수 등록영역-->
				<div class="grayWrap">
					<input type="text" name="boardTitle" placeholder="제목을 입력하세요"/><br>
					<input type="hidden" value="${loginUser.userNo}" name="userNo" />
					
					
						<div class="ctg-area">
							<span>날짜</span> <c:out value="${today}" />
							<span>작성자</span> 관리자
							
							<div class="b-count"><b style="color:rgb(231, 76, 60);font-size:16px;">조회수</b> 0</div>
						</div>

		</div>
	

		<!-- 글작성 영역-->
		<div class="board-content">
			<textarea name="boardContent" required></textarea>
		</div>

		<!-- 첨부파일 영역 -->
		<input id="upfile" name="upfile" type="file"><br>
		<input id="bcheckbox" class="checkBox" type="checkbox"> 공지로 등록
		<input type="hidden" name="noticeYN" id="YN"/>
		
		<button type="submit" class="b_write">등록하기</button>
	</form>

	<script>
		 $("#bcheckbox").change(
				  function() {

				   // 체크박스 값에 따라 히든 값 변경

				   if ( $("#bcheckbox").is(":checked") ){

				       $("#YN").val('Y');

				   } else {

				       $("#YN").val('N');

				   }

				  }

				 );
		</script>
	</div>

	<br clear="both">

	<!-- footer.jsp-->
	<jsp:include page="../common/footer.jsp" />
 </div>

</body>
</html>