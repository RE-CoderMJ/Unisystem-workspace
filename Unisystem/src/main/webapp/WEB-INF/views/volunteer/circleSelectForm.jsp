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
	margin-top: 50px;
	margin-bottom: 10px;
	margin-left: 207px;
}

#condition {
	width: 110px;
	display: inline-block;
	height: 30px;
}

#condition {
	width: 110px;
    display: inline-block;
    position: relative;
    left: 329px;
    top: -26px;
}

#condition .ctg {
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
	width:800px;
	margin-top: 11px;
}

.bo_content {
	position: relative;
	top: 0px;
}
.b_write {
	border: none;
    float: right;
    margin-right: 212px;
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
    margin-left: 210px;
    margin-top:20px;
}
.b-count{
	font-size: 16px;
    display: inline-block;
    float: right;
    position: relative;
    left: 34px;
    top: -10px;
}

#bfile{
	margin-left: 126px;
	margin-top: 10px;
}
.upload-area{
margin:auto;
margin-left: 210px;
margin-top: 10px;
}
.updel{
	height: 24px;
    margin-right: 212px;
    font-size: 15px;
}
.updel a{
	text-decoration: none;
	color: black;
	float: right;
}
.bdel{
	margin-right:4px;
}
</style>

<body>
	
	
	
	<jsp:include page="../common/links.jsp"/>
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
			<div class="page_title">동아리</div>
			
			
				<c:if test="${ loginUser != null || loginUser.userNo == 9999 }">
	          	<div class="updel">
				<a onclick="postFormSubmit(1);">수정</a> 
				<a class="bdel" onclick="postFormSubmit(2);">삭제</a>
				</div>
				</c:if>
				 
				
				<div class="grayWrap">
					<input type="text" name="boardTitle" value="${ b.boardTitle }" readonly/><br>
					<input type="hidden" value="${loginUser.userNo}" name="userNo" />
					
						<div class="ctg-area">
							<span>날짜</span> ${ b.createDate }
							<span>작성자</span> ${loginUser.korName}
							<span>카테고리</span> ${ b.subCategory }
					
							
							<div class="b-count"><b style="color:rgb(231, 76, 60);font-size:16px;">조회수</b> ${ b.boCount } </div>
						</div>
						</div>
		
	

		<div class="board-content">
			<textarea name="boardContent" readonly>${ b.boardContent }</textarea>
		</div>
		
		 <form id="postForm" action="" method="post">
	            	<input type="hidden" name="bno" value="${ b.boardNo }">
	            	<input type="hidden" name="filePath" value="${at.path}${at.changeName}">
	            </form>
		 
	            <script>
	            	function postFormSubmit(num){
	            		if(num == 1){ // 수정하기 클릭시
	            			$("#postForm").attr("action", "updateForm.cbo").submit();
	            		}else{ // 삭제하기 클릭시
	            			$("#postForm").attr("action", "delete.cbo").submit();
	            		}
	            	}
	            </script>
	            
				<button onclick="javascript:history.go(-1);" class="b_write">목록으로</button>
		</div>
			</div>
		</div>
		<!--로그인한 회원에게만 보여지도록 조건처리-->
	</div>

	<br clear="both">

	<!-- footer.jsp-->
	<jsp:include page="../common/footer.jsp" />
 </div>

</body>
</html>