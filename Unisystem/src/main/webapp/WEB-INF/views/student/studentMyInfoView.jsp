<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<style>
	div{box-sizing:border-box;}
	.middle{
		margin:auto;
		width:1500px;
		height:auto;
	}
	#sidebar{
		width:20%;
		height:1100px;
	}
	#content{
		width:80%;
		height:1050px;
		margin-top:50px;
		margin-bottom:50px;
		background-color:white;
	}
	.middle>div{float:left;}
	.pageName{padding:7px;}
	.pageName>p{
		margin:0px;
		float:left;
	}
	.btnTopBox{
		width:100%;
		height:50px;
		position:relative;
	}
	.btnBox{
		width:220px;
		position: absolute;
		right:30px;
		top:25px;
	}
	.profileBox{height:300px;}
	.profileBox>div{
		height:100%;
		float:left;
	}
	.imgBox{
		padding:20px;
		width:20%;
	}
	.imgBox>div{
		width:100%;
		height:100%;
		background:lightgray;
	}
	.modifyBox{
		width:80%;
	}
	.infoBox{
		width:100%;
		height:300px;
	}
	table.table-bordered{
		margin:30px;
		width:93%;
	}
	.table th{
		background-color: rgb(235, 235, 235);
		text-align:center;
	}
	.table.table-bordered th,
	.table.table-bordered td{
		border:1px solid #b8bbbe;
		padding:0;
		padding-left:10px;
		height:40px;
		line-height:40px;
	}
</style>
</head>
<body style="background-color:#ebf2fc">

		
		
	<jsp:include page="../common/header.jsp" />
	
		
		<div class="middle">
			<div id="sidebar"><jsp:include page="smy_sidebar.jsp" /></div>
			
				<div id="content">
					<div class="btnTopBox">
						<div class="pageName"><p style="color:gray">마이페이지>학적>&nbsp;</p><p style="font-size:19px; font-weight:600;">내 정보조회</p></div>
						<div class="btnBox">
							<button type="button" class="btn btn-sm btn-outline-secondary">비밀번호 변경</button>
							<button type="button" class="btn btn-sm btn-outline-secondary">개인정보수정</button>
						</div>
						
						
					</div>
					<div class="profileBox">
						<div class="imgBox">
							<!-- <img src=""> -->
							<div>프로필사진</div>
						</div>
						<div class="modifyBox">
							<table class="pfBox table table-bordered" style="margin-top:20px">
								<tbody>
									<tr>
										<th width="300">성명</th>
										<td>김길동</td>
										<td>KIM GILDONG</td>
									</tr>
								</tbody>
							</table>
							<table class="table table-bordered">
								<tbody>
									<tr>
										<th width="300">전화번호</th>
										<td>010-1234-5678</td>
									</tr>
									<tr>
										<th>이메일</th>
										<td>hong@email.com</td>
									</tr>
									<tr>
										<th>웹메일</th>
										<td>201112345@unisystem.com</td>
									</tr>
									<tr>
										<th>주소</th>
										<td>서울 양천구 목동</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="infoBox">
						<table class="table table-bordered" style="width:1134px;">
							<tbody>
								<tr>
									<th>학번</th>
									<td>201112345</td>
									<th>성명</th>
									<td>김길동</td>
									<th>생년월일</th>
									<td>1996-01-12</td>
									<th>성별</th>
									<td>남성</td>
								</tr>
								<tr>
									<th>대학</th>
									<td>자연과학대학</td>
									<th>학과</th>
									<td>물리학과</td>
									<th>전공</th>
									<td>물리학</td>
									<th>복수전공</th>
									<td></td>
								</tr>
								<tr>
									<th>학년</th>
									<td>2</td>
									<th>국적</th>
									<td>대한민국</td>
									<th>입학일자</th>
									<td>2011-02-06</td>
									<th>졸업일자</th>
									<td></td>
								</tr>
								<tr>
									<th>입학구분</th>
									<td>신입</td>
									<th>학적변동</th>
									<td>재학</td>
									<th>담당교수</th>
									<td>홍말동</td>
									<th>이수학점</th>
									<td>58</td>
								</tr>
							</tbody>
						</table>

					</div>
				</div>
			
		
	</div>
	
	
	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>