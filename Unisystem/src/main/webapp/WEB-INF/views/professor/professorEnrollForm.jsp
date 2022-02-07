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
	#wrap{
		margin:auto;
		width:1500px;
		height:auto;
	}
	#wrap>div{
		float:left;
	}
	#sidebar{
		width:20%;
		height:1100px;
	}
	#content{
		width:80%;
		height:auto;
		margin-top:50px;
		margin-bottom:50px;
		background-color:white;
		border:1px solid lightgray;
	}
	.pageName{
		padding:7px;
		height:50px;
		}
	
	.pageName>p{
		margin:0px;
		float:left;
		line-height:30px;
	}
	.form-group input, .select{
		width:250px;
		margin:0px;
		margin-right:10px;
	}
	.float{
		float:left;
	}
	.form{
		padding-left:100px;
		margin-top:50px;
	}
	#Male, #Female{
		width:13px;
	}
	.select{
		height:40px;
		border:1px solid lightgray;
		border-radius: 5px;
		color:gray;
	}
	.submitBtn{
		background:rgb(21, 62, 115);
	    width:300px;
	    height:90px;
	    margin-top:70px;
	    border-radius:7px;
	    margin-left:350px;
	}
	.submitBtn>p{
		color:white;
		font-size:30px;
		font-weight:700;
		text-align:center;
  		line-height:90px;	
	}
</style>
</head>
<body>
		
	<jsp:include page="../common/header.jsp" />
	
		
		<div id="wrap">
			<div id="sidebar" style="float:left"><jsp:include page="../common/adminSidebar.jsp" /></div>
			<div id="content" style="float:left">
						<div class="pageName"><p style="color:gray">마이페이지>기본정보>&nbsp;</p><p style="font-size:19px; font-weight:600;">교수 관리</p></div>
					
						<div class="form">
				            <h2 style="font-weight:700">교수 등록</h2>
					        <br>
			               <form action="" method="post" onsubmit="">
			                <div class="form-group">
			                    <label for="userId">* 이름 :</label>
			                    <div>
				                    <input type="text" class="form-control float" id="userId" name="" placeholder="한글" required>
				                    <input type="text" class="form-control" id="userId" name="" placeholder="영문" required>
			                    </div>
			                    <br>
			                    
			                    <label for="userPwd">* 생년월일 :</label>
			                    <input type="number" class="form-control" id="userPwd" name="" placeholder="ex) 970222" required><br>
			                    
			                    <label for=""> * 성별 : </label><br>
			                    <div>				                    
				                    <input type="radio" name="" id="Male" value="M">
				                    <label for="Male">남자</label> &nbsp;&nbsp;
				                    <input type="radio" name="" id="Female" value="F">
				                    <label for="Female">여자</label><br>
			                    </div><br>
			                    
			                    <label for="univ">* 소속 :</label>
									<div>
										<input type="text" class="form-control float" id="" placeholder="소속" list="univList" required>
										<div>
											<datalist id="univList">
												<option>조회해오기</option>
											</datalist>
										</div>
									
									<input type="text" class="form-control float" id="" list="departList" placeholder="학과" required>
									<div>
										<datalist id="departList">
											<option>조회해오기</option>
										</datalist>
									</div>
									
									<input type="text" class="form-control" id="" placeholder="전공" list="majorList" required>
									<div>
										<datalist id="majorList">
											<option>조회해오기</option>
										</datalist>
									</div>
								</div>
								<br>

								
								
			                    <label for="userName">* 직급 :</label>
			                    <div>
									<div>
										<select class="select float">
											<option value="1">조교수</option>
											<option value="2">부교수</option>
											<option value="3">평교수</option>
											<option value="4">객원교수</option>
										</select>
									</div>
								</div>
								<br>

			                    <label for="nation"> * 국적 :</label>
			                    <input type="text" class="form-control" id="age" name="" placeholder="대한민국"><br>
			                    
			                    <label for="phone"> * 연락처 :</label>
			                    <input type="tel" class="form-control" id="phone" name="" placeholder="(-없이 입력)"><br>
			                    
			                    <label for="email"> * 이메일 :</label>
			                    <input type="email" class="form-control" id="email" name="" placeholder=""><br>
			                    
								<label for="address"> * 주소 :</label>
								<div>
				                    <input type="text" class="form-control float" id="address" name="" placeholder="우편번호" style="width:150px">
				                    <input type="text" class="form-control" id="address" name="" placeholder="상세주소" style="width:500px"><br>
								</div>
			                   	
									<div class="submitBtn" onclick="">
										<p>정보 등록</p>
									</div>
				                </div>
				                <br>
				            </form>
								            
						</div>
							
				</div>
			</div>
				
		
	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>