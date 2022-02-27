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
	.profileBox{height:255px;}
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
		padding-left:10px;
		height:40px;
		line-height:40px;
	}
	.modal-body input{
		width:250px;
		margin-right:10px;
		background:rgb(235, 235, 235);
	}
	.ads input{
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
</style>
</head>
<body style="background-color:#ebf2fc">
<jsp:include page="../common/links.jsp" />
		
		
	<jsp:include page="../common/header.jsp" />
	
		<div id="wrap">
			<div id="sidebar" style="float:left;"><jsp:include page="smySidebar.jsp" /></div>
			<div id="content" style="float:left;">
				<div class="topBox">
				<div class="pageName"><p>마이페이지&nbsp;>&nbsp;학적&nbsp;>&nbsp;</p><p style="color:black; font-size:24px; font-weight:900;">&nbsp;내 정보조회</p></div>
				</div>
				<div class="btnTopBox">
					<div class="btnBox">
						<button type="button" class="btn btn-sm btn-outline-secondary">비밀번호 변경</button>
						<button type="button" class="btn btn-sm btn-outline-secondary" data-toggle="modal" data-target="#updateinfo">개인정보수정</button>
					</div>
					
					
					<!-- 정보수정 모달 -->
					 <div class="modal fade" id="updateinfo">
					  <div class="modal-dialog modal-lg">
					    <div class="modal-content">
					    
					      <!-- Modal Header -->
					      <div class="modal-header">
					        <h4 class="modal-title">개인정보 수정</h4>
					        <button type="button" class="close" data-dismiss="modal">&times;</button>
					      </div>
					      
					      <!-- Modal body -->
					      <form action="update.st" method="post">
					      <div class="modal-body">
					      <input type="hidden" name="userNo" value="${ stud.userNo }">
					      
				      	  <label>* 이름 :</label>
		                    <div>
			                    <input type="text" class="form-control float" id="korName" name="korName" value="${ stud.korName }" disabled>
			                    <input type="text" class="form-control" id="engName" name="engName" value="${ stud.engName }" >
		                    </div>
		                    <br>
				      	  
				          <label for="phone"> * 연락처 :</label>
	                      <input type="tel" class="form-control" id="phone" name="phone" maxlength="13" value="${ stud.phone }"><br>
	                    
	                      <label for="email"> * 이메일 :</label>
	                      <input type="email" class="form-control" id="email" name="email" value="${ stud.email }"><br>
	                      
					      
					      <label for="address"> * 주소 :</label>
								
								<div class="ads">
									<input type="hidden" id="totalAddress" name="address" value="${ stud.address }">
									<input type="text" id="sample3_postcode" placeholder="우편번호" style="width:170px">
									<input type="button" onclick="postNo();" value="우편번호 찾기" style="width:130px; color:black;"><br>
									<input type="text" id="sample3_address" value="${ stud.address }" style="width:500px"><br>
									<input type="text" id="sample3_detailAddress" placeholder="상세주소" style="width:300px">
									<input type="text" id="sample3_extraAddress" placeholder="참고항목" style="width:187px;">
								</div>
								
								<div id="wrapper" style="display:none; border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
									<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="esc()" alt="접기 버튼">
								</div>
					      </div>
					      <!-- Modal footer -->
					      <div class="modal-footer">
				      		
					        <button type="submit" class="btn btn-primary" style="background:#A3C4F3; border:none;">변경</button>
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">나가기</button>
					      </div>
					      </form>
					      
					    </div>
					  </div>
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
									<th width="200">성명</th>
									<td width="200">${ stud.korName }</td>
									<td width="200">${ stud.engName }</td>
								</tr>
							</tbody>
						</table>
						<table class="table table-bordered">
							<tbody>
								<tr>
									<th width="300">전화번호</th>
									<td>${ stud.phone }</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td>${ stud.email }</td>
								</tr>
								<tr>
									<th>웹메일</th>
									<td>${ stud.webMail }</td>
								</tr>
								<tr>
									<th>주소</th>
									<td>${ stud.address }</td>
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
								<td width="150">${ stud.userNo }</td>
								<th width="150">성명</th>
								<td width="150">${ stud.korName }</td>
								<th width="150">생년월일</th>
								<td width="150">${ stud.birthday }</td>
								<th width="150">성별</th>
								<td width="120">${ stud.gender }</td>
							</tr>
							<tr>
								<th>대학</th>
								<td>${ stud.studUniv }</td>
								<th>학과</th>
								<td>${ stud.studDepartment }</td>
								<th>전공</th>
								<td>${ stud.studMajor }</td>
								<th>복수전공</th>
								<td>${ stud.studMinor }</td>
							</tr>
							<tr>
								<th>학년</th>
						<c:choose>
							<c:when test="${ stud.studSemester < 2 }">
								<td>1학년</td>
							</c:when>
							<c:when test="${ stud.studSemester < 4 }">
								<td>2학년</td>
							</c:when>
							<c:when test="${ stud.studSemester < 6 }">
								<td>3학년</td>
							</c:when>
							<c:otherwise>
								<td>4학년</td>
							</c:otherwise>
						</c:choose>
								<th>국적</th>
								<td>${ stud.nation }</td>
								<th>입학일자</th>
								<td>${ stud.studInto }</td>
								<th>졸업일자</th>
								<td>${ stud.studGrad }</td>
							</tr>
							<tr>
								<th>입학구분</th>
						<c:choose>
							<c:when test="${ stud.studDivision eq 1 }">
								<td>신입</td>
							</c:when>
							<c:when test="${ stud.studDivision eq 2 }">
								<td>편입</td>
							</c:when>
							<c:otherwise>
								<td>재입학</td>
							</c:otherwise>
						</c:choose>
								<th>학적변동</th>
						<c:choose>
							<c:when test="${ stud.studStatus eq 1 }">
								<td>재학</td>
							</c:when>
							<c:when test="${ stud.studStatus eq 2 }">
								<td>휴학</td>
							</c:when>
							<c:when test="${ stud.studStatus eq 3 }">
								<td>졸업</td>
							</c:when>
							<c:otherwise>
								<td>자퇴</td>
							</c:otherwise>
						</c:choose>
								<th>담당교수</th>
								<td>${ stud.sprofName }</td>
								<th></th>
								<td></td>
							</tr>
						</tbody>
					</table>

				</div>
			</div>			
		
	</div>
	
	<jsp:include page="../common/footer.jsp" />
	
	<script>
		// 사이드바 길이 조절
		function sidebar(){
			document.getElementById("content").style.marginBottom = "50px";
			let $len = $("#content").height();
			
				if($len > 750){
					$(".wrap_sidebar").css('height', $len);
				}else{
					$(".wrap_sidebar").css('height', 270);
				}
		}
		
		$(function(){
			sidebar();
			
			$("#myPage").slideDown();
		})
		
		// 주소 api 닫기
		function esc(){
			$("#wrapper").hide();
			sidebar();	
		}
		
		// 주소 API
		function postNo(){
             // 우편번호 찾기 찾기 화면을 넣을 element
		    var element_wrap = document.getElementById('wrapper');	
		    
	        // 현재 scroll 위치를 저장해놓는다.
	        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
	        new daum.Postcode({
	            oncomplete: function(data) {
	            
	                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
					
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
                    
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample3_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample3_extraAddress").value = '';
	                }
	              
	              
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample3_postcode').value = data.zonecode;
	                document.getElementById("sample3_address").value = addr;
	                
	                document.getElementById('totalAddress').value = data.zonecode + " " + addr + extraAddr;
	                
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample3_detailAddress").focus();
	
	                // iframe을 넣은 element를 안보이게 한다.
	                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
	                element_wrap.style.display = 'none';
	
	                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
	                document.body.scrollTop = currentScroll;
	            },
	            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
	            onresize : function(size) {
	            	sidebar();
	            	address();
	                element_wrap.style.height = size.height+'px';
	            },
	            width : '100%',
	            height : '100%'
	        }).embed(element_wrap);
	        
	        // iframe을 넣은 element를 보이게 한다.
	        element_wrap.style.display = 'block';
	        
	        
	        // 최종적으로 name="address"에 담을 내용
	        $("#sample3_detailAddress").focusout(function(){
		        sidebar();
	        	
	        	let address = $("#totalAddress").val();
				let detailAd = $("#sample3_detailAddress").val();
				
			  $("#totalAddress").val(address + " " + detailAd);
				
	        })
	       
		}
	</script>
</body>
</html>