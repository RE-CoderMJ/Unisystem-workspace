<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
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
<jsp:include page="../common/links.jsp" />
<jsp:include page="../common/header.jsp" />
		
	<div id="wrap">
		<div id="sidebar" style="float:left;"><jsp:include page="../common/adminSidebar.jsp" /></div>
		<div id="content" style="float:left;">
			<div class="topBox">
				<div class="pageName"><p>관리자페이지&nbsp;>&nbsp;강의&nbsp;>&nbsp;</p><p style="color:black; font-size:24px; font-weight:900;">&nbsp;강의 신청내역</p></div>
			</div>
			
			
			<div class="searchList">
				<div class="searchBox" style="padding:18px">
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