<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link href="resources/css/pages/wrapperStyle.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<style>
	.float{
		float:left;
	}
	.form{
		padding-left:100px;
		margin-top:50px;
	}
	.form-group input, .select, input{
		width:250px;
		margin:0px;
		margin-right:10px;
	}
	#Male, #Female{
		width:13px;
	}
	select, .ads input{
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
		width:100%;
		color:white;
		font-size:30px;
		font-weight:700;
		text-align:center;
  		line-height:90px;	
	}
	.ads>input{
		margin-bottom:10px;
		margin-right:5px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
		
		<div id="wrap">
			<div id="sidebar" style="float:left"><jsp:include page="../common/adminSidebar.jsp" /></div>
			<div id="content" style="float:left">
				<div class="topBox">
					<div class="pageName"><p>마이페이지&nbsp;>&nbsp;기본정보&nbsp;>&nbsp;</p><p style="color:black; font-size:24px; font-weight:900;">&nbsp;교수 관리</p></div>
				</div>
					
						<div class="form">
				            <h2 style="font-weight:700">교수 등록</h2>
					        <br>
			               <form id="insertForm" action="insert.pr" method="post" enctype="multipart/form-data">
			                
			                <div class="form-group">
			                
			                    <label>* 이름 :</label>
			                    <div>
				                    <input type="text" class="form-control float" id="korName" name="korName" placeholder="한글" required>
				                    <input type="text" class="form-control" id="engName" name="engName" placeholder="영문" required>
			                    </div>
			                    <br>
			                    
			                    <label for="userPwd">* 생년월일 :</label>
			                    <input type="number" class="form-control" id="birthday" name="birthday" placeholder="ex) 910101" required><br>
			                    
			                    <label for=""> * 성별 : </label><br>
			                    <div>				                    
				                    <input type="radio" name="gender" id="Male" value="M">
				                    <label for="Male">남자</label> &nbsp;&nbsp;
				                    <input type="radio" name="gender" id="Female" value="F">
				                    <label for="Female">여자</label><br>
			                    </div><br>
			                    
			                    <label for="univ">* 소속 :</label>
									<div>
										<div class="float">
												
											
											<select id="univList" name="profUniv" class="select" required>
												<option value="" style="display: none;" selected>대학별 조회</option>
												<option>문과대학</option>
												<option>공과대학</option>
												<option>경영대학</option>
												<option>사범대학</option>
												<option>의과대학</option>
												<option>예술체육대학</option>
												<option>자연과학대학</option>
											</select>
										</div>
										<div>
											<input type="text" class="form-control float" name="profDepartment" placeholder="학과" required>
																		
											<input type="text" class="form-control" name="profMajor" placeholder="전공" required>
										</div>
									</div>
									
								<br>

								
								
			                    <label>* 직급 :</label>
			                    <div>
									<div>
										<select class="select" name="profRank">
											<option value="1">조교수</option>
											<option value="2">부교수</option>
											<option value="3">평교수</option>
											<option value="4">객원교수</option>
										</select>
									</div>
								</div>
								<br>

			                    <label for="nation"> * 국적 :</label>
			                    <input type="text" class="form-control" id="nation" name="nation" value="대한민국"><br>
			                    
			                    <label for="phone"> * 연락처 :</label>
			                    <input type="tel" class="form-control" id="phone" name="phone" maxlength="11" placeholder="(-없이 입력)"><br>
			                    
			                    <label for="email"> * 이메일 :</label>
			                    <input type="email" class="form-control" id="email" name="email"><br>
			                    
								<label for="address"> * 주소 :</label>
								
								<div class="ads">
									<input type="hidden" id="totalAddress" name="address">
									<input type="text" id="sample3_postcode" placeholder="우편번호" style="width:170px" required>
									<input type="button" onclick="postNo();" value="우편번호 찾기" style="width:130px"><br>
									<input type="text" id="sample3_address" placeholder="주소" style="width:500px"><br>
									<input type="text" id="sample3_detailAddress" placeholder="상세주소" style="width:300px">
									<input type="text" id="sample3_extraAddress" placeholder="참고항목" style="width:187px;">
								</div>
								
								<div id="wrapper" style="display:none; border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
									<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="esc()" alt="접기 버튼">
								</div>
																			 
			                	    <br>
					           	  <label>* 프로필 사진 :</label>
		                	    	<input type="file" id="upfile" class="form-control-file" name="upfile">
		                	    <div>
		                	    </div>
			                
					           	
									<button type="submit" class="submitBtn">
										<p>교수 정보 등록</p>
									</button>
									
				                </div>
				                <br>
				            </form>
								            
						</div>
							
				</div>
			</div>
				
		
	<jsp:include page="../common/footer.jsp" />
	
	<script>
		$(function(){
			sidebar();

			// 날짜 선택 js
			var dateSelector = document.querySelector('.dateSelector');
			dateSelector.flatpickr({
				
			}); 
			
			
			var result = "";
			
			// 생년월일 글자수 제한
			$("#birthday").on('keypress', function(){
				birth = $(this).val();
				result = handleOnInput(birth, 5);
				
				if(result != null){			
					$("#birthday").val(result);
					// 컨트롤러로 넘어간 값이 6자리가 맞는지 확인할 것!	
				}
			})
			
			// controller로 넘기기 위한 profUniv:값 형태
			$("#univList").on("change", function(){
				let checkUniv = $(this).val();
				
				$("input[name=profUniv]").val(checkUniv);
				
			})
			
			
			   
		})
		
		// 주소 api 닫기
		function esc(){
			$("#wrapper").hide();
			sidebar();	
		}
		
		function submitBtn(){
			$("#insertForm").submit();
		}
		
		// 사이드바 길이 조절
		function sidebar(){
			document.getElementById("content").style.marginBottom = "50px";
			let $len = $("#content").height();
				if($len > 750){
					$(".wrap_sidebar").css('height', $len);
				}else if($len > 1400){
					consone.log("짱김");
					$(".wrap_sidebar").css('height', $len + 170);
				}else{
					$(".wrap_sidebar").css('height', 270);
					document.getElementById("content").style.marginBottom = "280px";
				}
		}
	
		// 글자수 제한 핸들러
		function handleOnInput(el, maxlength){
		
			let value = 0;
			if(el.length > maxlength)	{
				value = el.substr(0, maxlength);
				return value;
			}
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