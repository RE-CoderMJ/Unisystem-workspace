<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="resources/css/pages/wrapperStyle.css" rel="stylesheet">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<style>
	#content{
		height:750px;
	}
	.btnTopBox{
		width:100%;
		height:50px;
		position:relative;
	}
	.btnBox{
		width:220px;
		position: absolute;
		right:-60px;
		top:25px;
	}
	.profileBox{height:263px;}
	.profileBox>div{
		height:100%;
		float:left;
	}
	.imgBox{
		width:20%;
	}
	.imgBox>div{
		width:206px;
		height:240px;
		margin:20px 50px;
		background:lightgray;
	}
	.modifyBox{
		width:80%;
	}
	.infoBox{
		width:100%;
		height:300px;
		margin-left:21px;
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
		height:40px;
		line-height:40px;
	}
	.ads input, .modal input{
		width:250px;
		margin-right:10px;
		height:40px;
		border:1px solid lightgray;
		border-radius: 5px;
		color:gray;
		margin-bottom:10px;
	}
	.float{
		float:left;
	}
	input{
		width:100%;
		border:none;
		padding-left:10px;
	}
	select{
		width:150px;
	}
	input:focus{
		background:#ebf2fc;
	}
</style>
</head>
<body style="background-color:#ebf2fc">
<jsp:include page="../common/links.jsp" />
		
		
	<jsp:include page="../common/header.jsp" />
	
		<form id="updateInfo" action="updateInfo.ad" method="post">
		<div id="wrap">
			<div id="sidebar" style="float:left;"><jsp:include page="../common/adminSidebar.jsp" /></div>
			<div id="content" style="float:left;">
				<div class="topBox">
				<div class="pageName"><p>관리자 페이지&nbsp;>&nbsp;기본정보&nbsp;>&nbsp;</p><p style="color:black; font-size:24px; font-weight:900;">&nbsp;학생 관리</p></div>
				</div>
				<div class="btnTopBox">
					<div class="btnBox">
						<button type="button" class="btn btn-outline-secondary" style="background:#4361EE; color:white; border:none;" onclick="return updateInfo();">정보 변경하기</button>
					</div>
				</div>
				
				<div class="profileBox">
					<div class="imgBox">
						<c:if test="${ empty profileImg }">
							<div></div>
						</c:if>
						<c:if test="${ not empty profileImg }">
							<img src="${ stud.profileImg }">
						</c:if>
						
					</div>
					<div class="modifyBox">
						<table class="pfBox table table-bordered" style="margin-top:20px">
							<tbody>
								<tr>
									<th width="200">* 성명</th>
									<td width="200"><input type="text" name="korName" value="${ stud.korName }"></td>
									<td width="200"><input type="text" name="engName" value="${ stud.engName }"></td>
								</tr>
							</tbody>
						</table>
						<table class="table table-bordered">
							<tbody>
								<tr>
									<th width="300">* 전화번호</th>
									<td><input type="text" name="phone" value="${ stud.phone }"></td>
								</tr>
								<tr>
									<th>* 이메일</th>
									<td><input type="text" name="email" value="${ stud.email }"></td>
								</tr>
								<tr>
									<th>* 웹메일</th>
									<td><input type="text" name="webMail" value="${ stud.webMail }"></td>
								</tr>
								<tr>
									<th>* 주소</th>
									<td><input type="text" name="address" value="${ stud.address }"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="infoBox">
					<table class="table table-bordered" style="width:1180px;">
						<tbody>
							<tr>
								<th width="150">학번</th>
								<td width="150"><input type="text" name="userNo" value="${ stud.userNo }"></td>
								<th width="150">성명</th>
								<td width="150"><input type="text" value="${ stud.korName }" disabled></td>
								<th width="150">* 생년월일</th>
								<td width="150"><input type="text" name="birthday" value="${ stud.birthday }"></td>
								<th width="150">성별</th>
								<c:choose>
									<c:when test="${ stud.gender eq 'M'}">
										<td><input value="남자" disabled></td>
									</c:when>
									<c:otherwise>
										<td><input value="여자" disabled></td>
									</c:otherwise>
								</c:choose>
							</tr>
							<tr>
								<th>* 대학</th>
								<td><input type="text" name="studUniv" value="${ stud.studUniv }"></td>
								<th>* 학과</th>
								<td><input type="text" name="studDepartment" value="${ stud.studDepartment }"></td>
								<th>* 전공</th>
								<td><input type="text" name="studMajor" value="${ stud.studMajor }"></td>
								<th>* 복수전공</th>
								<td width="150"><input type="text" name="studMinor" value="${ stud.studMinor }"></td>
							</tr>
							<tr>
								<th>학년</th>
						 <c:choose>
							<c:when test="${ stud.studSemester < 2 }">
								<td><input value="1학년" disabled></td>
							</c:when>
							<c:when test="${ stud.studSemester < 4 }">
								<td><input value="2학년" disabled></td>
							</c:when>
							<c:when test="${ stud.studSemester < 6 }">
								<td><input value="3학년" disabled></td>
							</c:when>
							<c:otherwise>
								<td><input value="4학년" disabled></td>
							</c:otherwise>
						</c:choose>
								<th>* 국적</th>
								<td><input type="text" name="nation" value="${ stud.nation }"></td>
								<th>* 입학일자</th>
								<td><input type="text" name="studInto" value="${ stud.studInto }"></td>
								<th>* 졸업일자</th>
								<td><input type="text" name="studGrad" value="${ stud.studGrad }"></td>
							</tr>
							<tr>
								<th>* 입학구분</th>
									<td>
									<select class="select float" name="studDivision">
											<option value="1">신입</option>
											<option value="2">편입</option>
											<option value="3">재입학</option>
									</select>
									</td>
								<th>* 학적변동</th>
									<td>
									<select class="select float" name="studStatus">
											<option value="1">재학</option>
											<option value="2">휴학</option>
											<option value="3">졸업</option>
											<option value="4">자퇴</option>
									</select>
									</td>
								<th>담당교수</th>
								<td><input value="${ stud.sprofName }"></td>
								<th></th>
								<td></td>
							</tr>
						</tbody>
					</table>

				</div>
			</div>			
		</div>
	</form>
		
	<jsp:include page="../common/footer.jsp" />
	
	<script>
		
		$(function(){
			sidebar();
		})
		
		// 사이드바 길이 조절
		function sidebar(){
			document.getElementById("content").style.marginBottom = "50px";
			let $len = $("#content").height();
			
				if($len > 750){
					$(".wrap_sidebar").css('height', $len);
				}else{
					$(".wrap_sidebar").css('height', 270);
					document.getElementById("content").style.marginBottom = "70px";
				}
		}
		
		function updateInfo(){
			alertify.confirm('학생 정보 변경', '현재 정보로 학생 정보를 변경하시겠습니까?'
			, function(){
					console.log("학생 정보를 변경합니다.");
					$("#updateInfo").submit();
			}, function(){ 
					console.log("변경 취소");
			});
				
			
		}
					
				
		
	</script>
</body>
</html>