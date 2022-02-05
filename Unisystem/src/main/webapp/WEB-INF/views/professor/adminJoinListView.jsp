<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<style>
	#wrap{
		margin:auto;
		width:1500px;
		height:830px;
	}
	#sidebar{
		width:20%;
		height:700px;
	}
	#content{
		width:80%;
		height:auto;
		margin-top:50px;
		margin-bottom:50px;
		background-color:white;
	}
	.pageName{padding:7px;}
	.pageName>p{
		margin:0px;
		float:left;
	}
	.topBox{
		width:100%;
		height:50px;
	}
	.searchBox{
		margin:20px;
		width:1160px;
		height:70px;
		line-height:35px;
		padding-left:40px;
		background:rgb(21, 62, 115);
	}
	.searchBox>input{
		margin-top:15px;
		padding-left:10px;
		width:200px;
   		border-radius:8px;
   		border:0;
	}
	.searchBox>button{
		background:none;
		color:white;
		font-weight:600;
		border:0;
	}
	.appList{
		margin:20px;
		border:1px solid lightgray;
		position:relative;
		padding:20px;
	}
	.table{
		border-top:2px solid lightgray;
		border-bottom:3px solid lightgray;
	}
	.table th{
		border-bottom:2px solid gray;
		background:rgb(235, 235, 235);
		line-height:20px;
		padding:0;
		text-align:center;
	}
	.table td{
		padding:0;
		text-align:center;
	}
	.table input[type="checkbox"]{
		width:16px;
		height:16px;
	}
	/*
	.table.table-bordered th,
	.table.table-bordered td{
		text-align:center;
		line-height:40px;
		border:1px solid #b8bbbe;
		padding:0;
		height:40px;
		padding:0px 10px;
	}
	*/
	/*페이징*/
	.pagebar{
		width:100%;
		height:35px;
		margin-top:15px;
	}
	.pagebar>.btn-light{
		border-radius:100px;
		color:black;
		background-color:rgb(240, 240, 240);
	}
	.pagebar>.btn-basic{
		color:white;
		background-color:rgb(21, 62, 115);
	}
	.container{
	    margin-top: 30px;
	}
	.page-link{
	    color:rgb(33, 33, 33)!important;
	    border: none!important;
	    border-radius: 200px!important;
	}
	.page-item.active .page-link {
	    color: #fff !important;
	    background: rgb(21, 62, 115)!important;
	}
	.nameTag{
		font-size:20px;
		font-weight:700;
		color:white;
		margin-right:350px;
	}
	*:focus {
    outline: none;
	}
	#selectG{
		width:200px;
		border:none;
		border-radius:10px;
		height:38px;
	}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
	
		
	<div id="wrap">
		<div id="sidebar" style="float:left;"><jsp:include page="pmySidebar.jsp" /></div>
		<div id="content" style="float:left;">
			<div class="topBox">
				<div class="pageName"><p style="color:gray">마이페이지>담당교수 관리>&nbsp;</p><p style="font-size:19px; font-weight:600;">담당교수 지정</p></div>
			</div>
			
			
			<div class="searchList">
				<div class="searchBox">
					<span class="nameTag">교수 목록</span>
					<input type="text" name="univ" list="univList" placeholder="대학별 조회">
					<datalist id="univList">
						<option>자연과학대학</option>
						<option>예술대학</option>
					</datalist>
					<input type="text" name="department" list="departList" placeholder="학부별 조회">
					<datalist id="departList">
						<option>물리학과</option>
						<option>전자공학</option>
					</datalist>
					<input type="text" placeholder="이름으로 조회">
					<button type="submit">검색</button>
				</div>
				
					<div class="appList">
					<table class="table table-hover">
						<thead>
							<tr>
								<th width="30"><input type="checkbox"></th>
								<th width="150">교수번호</th>
								<th width="220">소속</th>
								<th width="220">학부</th>
								<th width="220">전공</th>
								<th width="220">이름</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="checkbox"></td>
								<td>xxxxx</td>
								<td>자연과학대학</td>
								<td>물리학과</td>
								<td>물리학</td>
								<td>김길동</td>
							</tr>
							<!-- 시작 -->
							<tr>
								<td><input type="checkbox"></td>
								<td>xxxxx</td>
								<td>자연과학대학</td>
								<td>물리학과</td>
								<td>물리학</td>
								<td>김길동</td>
							</tr>
								<tr>
								<td><input type="checkbox"></td>
								<td>xxxxx</td>
								<td>자연과학대학</td>
								<td>물리학과</td>
								<td>물리학</td>
								<td>김길동</td>
							</tr>
								<tr>
								<td><input type="checkbox"></td>
								<td>xxxxx</td>
								<td>자연과학대학</td>
								<td>물리학과</td>
								<td>물리학</td>
								<td>김길동</td>
							</tr>
								<tr>
								<td><input type="checkbox"></td>
								<td>xxxxx</td>
								<td>자연과학대학</td>
								<td>물리학과</td>
								<td>물리학</td>
								<td>김길동</td>
							</tr>
							
							
							<!-- 끝 -->
						</tbody>
					</table>
					
					<div class="container">
                    <ul class="pagination justify-content-center">
                      <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
                      <li class="page-item"><a class="page-link" href="#">1</a></li>
                      <li class="page-item active"><a class="page-link" href="#">2</a></li>
                      <li class="page-item"><a class="page-link" href="#">3</a></li>
                      <li class="page-item"><a class="page-link" href="#">4</a></li>
                      <li class="page-item"><a class="page-link" href="#">5</a></li>
                      <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
                    </ul>
                 </div>
						
				</div> <!-- appList -->
			</div> <!-- searchList -->
			
			
			
			<div class="searchList">
				<div class="searchBox">
					<span class="nameTag">학생 목록</span>
					<input type="text" name="univ" list="univList" placeholder="전공별 조회">
					<datalist id="univList">
						<option>물리학</option>
						<option>물리과학</option>
					</datalist>
					<select name="grade" id="selectG" style="color:gray">
						<option value="">학년별 조회</option>
						<option>1학년</option>
						<option>2학년</option>
						<option>3학년</option>
						<option>4학년</option>
					</select>
					<input type="text" placeholder="이름으로 조회">
					<button type="submit">검색</button>
				</div>
				
					<div class="appList">
					<table class="table table-hover">
						<thead>
							<tr>
								<th width="30"><input type="checkbox"></th>
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
							<tr>
								<td><input type="checkbox"></td>
								<td>20111593</td>
								<td>4</td>
								<td>김길동</td>
								<td>물리학</td>
								<td>010-1233-4561</td>
								<td>gildong@mail.com</td>
								<td>홍길동</td>
							</tr>
							<!-- 시작 -->
								<tr>
								<td><input type="checkbox"></td>
								<td>20111593</td>
								<td>4</td>
								<td>김길동</td>
								<td>물리학</td>
								<td>010-1233-4561</td>
								<td>gildong@mail.com</td>
								<td>홍길동</td>
							</tr>
								<tr>
								<td><input type="checkbox"></td>
								<td>20111593</td>
								<td>4</td>
								<td>김길동</td>
								<td>물리학</td>
								<td>010-1233-4561</td>
								<td>gildong@mail.com</td>
								<td>홍길동</td>
							</tr>
								<tr>
								<td><input type="checkbox"></td>
								<td>20111593</td>
								<td>4</td>
								<td>김길동</td>
								<td>물리학</td>
								<td>010-1233-4561</td>
								<td>gildong@mail.com</td>
								<td>홍길동</td>
							</tr>
								<tr>
								<td><input type="checkbox"></td>
								<td>20111593</td>
								<td>4</td>
								<td>김길동</td>
								<td>물리학</td>
								<td>010-1233-4561</td>
								<td>gildong@mail.com</td>
								<td>홍길동</td>
							</tr>
					
							<!-- 끝 -->
						</tbody>
					</table>
					
					<div class="container">
                    <ul class="pagination justify-content-center">
                      <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
                      <li class="page-item"><a class="page-link" href="#">1</a></li>
                      <li class="page-item active"><a class="page-link" href="#">2</a></li>
                      <li class="page-item"><a class="page-link" href="#">3</a></li>
                      <li class="page-item"><a class="page-link" href="#">4</a></li>
                      <li class="page-item"><a class="page-link" href="#">5</a></li>
                      <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
                    </ul>
                 </div>
						
				</div> <!-- appList -->
			</div> <!-- searchList -->
			
			
			
			
			
			
		</div> <!-- content -->
	</div> <!-- wrap -->
			<jsp:include page="../common/footer.jsp" />
</body>
</html>