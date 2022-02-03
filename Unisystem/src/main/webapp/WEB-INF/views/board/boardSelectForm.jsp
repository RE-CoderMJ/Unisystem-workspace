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
	height:auto;
}

.page_title {
	color: rgb(15, 43, 80);
	font-size: 40px;
	font-weight: 800;
	margin-top: 50px;
	margin-bottom: 10px;
	margin-left: 120px;
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
}

.bo_content {
	position: relative;
	top: 0px;
}
.b_write {
	border: none;
	float: right;
	margin-right: 120px;
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
    margin-left: 126px;
    margin-top:20px;
}
.b-count{
	font-size:16px;
	display:inline-block;
	float: right;
    position: relative;
    left: 372px;
    top: -27px;
}

#bfile{
	margin-left: 126px;
	margin-top: 10px;
}
.updel{
	height: 24px;
    margin-right: 125px;
    font-size: 15px;
}
.updel a{
	text-decoration: none;
	color: black;
	float: right;
}
.bdel{
	margin-right:10px;
}
.replyDiv{
	width: 870px;
    align: center;
    margin-left: 113px;
    margin-top: 40px;
}

#replyArea button{
	height: 40px;
    width: 80px;
    font-size: 13px;
    }
#rcount{
	color:rgb(231, 76, 60);
	font-weight:600;
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
			<div class="page_title">커뮤니티 글조회</div>
			
			<!-- 글 작성자만 수정할 수 있도록 -->
			<div class="updel">
			<a href="">수정</a> <a class="bdel" href="">삭제</a>
			</div>
			
			<form id="boardInsert" action="" method="post">
				<div class="grayWrap">
					<input type="text" placeholder="제목을 입력하세요"/><br>

						<div class="ctg-area">
							<span>날짜</span> 2021.01.21 
							<span>작성자</span> 김말똥 
							<span>카테고리</span>
						</div>
						<!--제목,날짜,조회수 등록영역-->
						<div class="search_wrap">
							<select name="condition" class="custom-select">
								<option class="ctg" value="4">카테고리</option>
								<option class="ctg" value="5">자유</option>
								<option class="ctg" value="6">취업</option>
								<option class="ctg" value="7">정보</option>
							</select>
							
							<div class="b-count"><b style="color:rgb(231, 76, 60);font-size:16px;">조회수</b> 1024</div>
						</div>

		</div>
	

		<!-- 글작성 영역-->
		<div class="board-content">
			<textarea></textarea>
		</div>

		<input id="bfile" type="file">
	</form>
		<!--로그인한 회원에게만 보여지도록 조건처리-->
		<button class="b_write">등록하기</button>
		
	<!-- ajax 댓글구현 -->
	<div class="replyDiv">
	<table id="replyArea" class="table">
                <thead>
                    <tr>
                        <th colspan="2">
                            <textarea class="InsertReply" name="" id="" cols="1" rows="2" style="resize:none; width:100%"></textarea>
                        </th>
                        <th style="vertical-align: middle"><button class="btn btn-secondary">댓글등록</button></th>
                    </tr>
                    <tr>
                       <td colspan="3">댓글 (<span id="rcount">3</span>) </td> 
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>김망고</th>
                        <td width="400px;">댓글입니다</td>
                        <td width="110px;">2020-04-10</td>
                    </tr>
                    <tr>
                        <th>박티슈</th>
                        <td>댓글입니다</td>
                        <td>2020-04-08</td>
                    </tr>
                    <tr>
                        <th>옴뇸뇸</th>
                        <td>댓글입니다</td>
                        <td>2020-04-02</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <br><br>
    </div>
</div>	
	

	 
	
	
	<br clear="both">
	
	<!-- footer.jsp-->
	<jsp:include page="../common/footer.jsp" />
 	
 
 

</body>
</html>