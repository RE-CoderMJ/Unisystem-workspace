<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<style>
	#wrap{
		margin:auto;
		width:1500px;
		height:830px;
	}
	#sidebar{
		width:230px;
		height:700px;
	}
	#content{
		width:1270px;
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
		margin:20px 20px 0px 20px;
		width:1230px;
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
		margin:0px 20px 20px 20px;
		border:1px solid lightgray;
		position:relative;
		padding:0px 20px 20px 20px;
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
		line-height:70px;
		font-size:25px;
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

	.btnBox{
		width:100%;
		height:30px;
		position:relative;
		margin:10px;
	}
	.btnBox>div{
		width:auto;
		height:30px;
		float:left;
	}
	.switchBox>div{
		width:200px;
		height:30px;
		float:left;
	}
	.btnDiv{
		position:absolute;
		right:10px;
	}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
	
		
	<div id="wrap">
		<div id="sidebar" style="float:left;"><jsp:include page="../common/adminSidebar.jsp" /></div>
		<div id="content" style="float:left;">
			<div class="topBox">
				<div class="pageName"><p style="color:gray">마이페이지>강의>&nbsp;</p><p style="font-size:19px; font-weight:600;">강의 신청내역</p></div>
			</div>
			
			
			<div class="searchList">
				<div class="searchBox">
					<span class="nameTag">강의 개설 신청 현황</span>
				</div>
				
				
			</div>	


					<div class="appList">

				<div class="btnBox">
					<div class="btnDiv">
						<button class="btn btn-sm btn-outline-secondary">강의 생성</button>
						<button class="btn btn-sm btn-outline-secondary">삭제</button>
					</div>
				</div>
					<table class="table table-hover">
						<thead>
							<tr>
								<th width="30"><input type="checkbox"></th>
								<th width="100">순번</th>
								<th width="220">신청번호</th>
								<th width="150">신청일자</th>
								<th width="400">강의명</th>
								<th width="100">교수자</th>
								<th width="250">상태</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="checkbox"></td>
								<td>1</td>
								<td>2012-12345</td>
								<td>2012-02-10</td>
								<td>미생물 유전체</td>
								<td>홍길동</td>
								<td><button class="btn btn-sm btn-primary" >승인</button></td>
							</tr>
							<!-- 시작 -->
							<tr>
								<td><input type="checkbox"></td>
								<td>1</td>
								<td>2012-12345</td>
								<td>2012-02-10</td>
								<td>미생물 유전체</td>
								<td>홍길동</td>
								<td><button class="btn btn-sm btn-primary" >승인</button></td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>1</td>
								<td>2012-12345</td>
								<td>2012-02-10</td>
								<td>미생물 유전체</td>
								<td>홍길동</td>
								<td><button class="btn btn-sm btn-primary" >승인</button></td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>1</td>
								<td>2012-12345</td>
								<td>2012-02-10</td>
								<td>미생물 유전체</td>
								<td>홍길동</td>
								<td><button class="btn btn-sm btn-primary" >승인</button></td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>1</td>
								<td>2012-12345</td>
								<td>2012-02-10</td>
								<td>미생물 유전체</td>
								<td>홍길동</td>
								<td><button class="btn btn-sm btn-primary" >승인</button></td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>1</td>
								<td>2012-12345</td>
								<td>2012-02-10</td>
								<td>미생물 유전체</td>
								<td>홍길동</td>
								<td><button class="btn btn-sm btn-primary" >승인</button></td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>1</td>
								<td>2012-12345</td>
								<td>2012-02-10</td>
								<td>미생물 유전체</td>
								<td>홍길동</td>
								<td><button class="btn btn-sm btn-primary" >승인</button></td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>1</td>
								<td>2012-12345</td>
								<td>2012-02-10</td>
								<td>미생물 유전체</td>
								<td>홍길동</td>
								<td><button class="btn btn-sm btn-primary" >승인</button></td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>1</td>
								<td>2012-12345</td>
								<td>2012-02-10</td>
								<td>미생물 유전체</td>
								<td>홍길동</td>
								<td><button class="btn btn-sm btn-primary" >승인</button></td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>1</td>
								<td>2012-12345</td>
								<td>2012-02-10</td>
								<td>미생물 유전체</td>
								<td>홍길동</td>
								<td><button class="btn btn-sm btn-primary" >승인</button></td>
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
			
			
			<script>
				var check = $("input[type='checkbox']");
					check.click(function(){
						$(".switchBox p").toggle();
					});
			</script>
</body>
</html>