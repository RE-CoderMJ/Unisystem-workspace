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
	float: right;
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
	width: 800px;
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
	top: -20px;
}

.board-content textarea {
	resize: none;
	width: 850px;
	margin: auto;
	height: 650px;
	margin-left: 210px;
	margin-top: 20px;
}

.b-count {
	font-size: 16px;
	display: inline-block;
	float: right;
	position: relative;
	left: 34px;
	top: -10px;
}

#bfile {
	margin-left: 126px;
	margin-top: 10px;
}

.upload-area {
	margin: auto;
	margin-left: 210px;
	margin-top: 10px;
}

.updel {
	height: 24px;
	margin-right: 212px;
	font-size: 15px;
}

.updel a {
	text-decoration: none;
	color: black;
	float: right;
}

.bdel {
	margin-right: 4px;
}

.replyDiv {
	width: 869px;
	margin: auto;
	margin-top: 36px;
	margin-right: 195px;
	position: relative;
	right: 10px;
}
</style>

<body>



	<jsp:include page="../common/links.jsp" />
	<!-- header.jsp 영역 -->
	<jsp:include page="../common/header.jsp" />

	<!-- sidebar.jsp 영역 
		  교수가 로그인하면 pmySidebar
		  학생이 로그인하면 smySidebar -->


	<div
		style="background-color: rgb(235, 242, 252); width: 1500px; margin: auto; margin-top: 30px;">
		<div class="sidewrap">
			<jsp:include page="../student/smySidebar.jsp" />
		</div>

		<div class="bo_content">
			<!-- title -->
			<div class="page_title">커뮤니티</div>

			<c:if
				test="${ loginUser != null && (loginUser.userNo eq b.userNo) }">
				<div class="updel">
					<a onclick="postFormSubmit(1);">수정</a> 
					<a class="bdel" onclick="postFormSubmit(2);">삭제</a>
				</div>
			</c:if>

			<div class="grayWrap">
				<input type="text" name="boardTitle" value="${ b.boardTitle }" readonly />
				
				<br> 
				
				<input type="hidden" value="${loginUser.userNo}" name="userNo" />

				<div class="ctg-area">
					<span>날짜</span> ${ b.createDate } 
					<span>작성자</span> ${b.boardWriter} 
					<span>카테고리</span>${ b.subCategory }


					<div class="b-count">
						<b style="color: rgb(231, 76, 60); font-size: 16px;">조회수</b> ${ b.boCount }
					</div>
				</div>
			</div>



			<div class="board-content">
				<textarea name="boardContent" readonly>${ b.boardContent }</textarea>
			</div>

			<div class="upload-area">
				<c:choose>
					<c:when test="${ empty  at.originName }">
	                    		첨부파일이 없습니다.
	                    	</c:when>
					<c:otherwise>
						<a href="${at.path}" download="${at.originName}">${at.originName}</a>
					</c:otherwise>
				</c:choose>

				<form id="postForm" action="" method="post">
					<input type="hidden" name="bno" value="${ b.boardNo }"> <input
						type="hidden" name="filePath" value="${at.path}">
				</form>

				<script>
	            	function postFormSubmit(num){
	            		if(num == 1){ // 수정하기 클릭시
	            			$("#postForm").attr("action", "updateForm.bo").submit();
	            		}else{ // 삭제하기 클릭시
	            			$("#postForm").attr("action", "delete.bo").submit();
	            		}
	            	}
	            </script>

				<button onclick="javascript:history.go(-1);" class="b_write">목록으로</button>



				<!-- ajax 댓글구현 -->
				<div class="replyDiv">
					<table id="replyArea" class="table">
						<thead>
							<c:choose>
								<c:when test="${ empty loginUser }">
									<th colspan="2"><textarea class="form-control" cols="55"
											rows="2" style="resize: none; width: 100%" readonly>로그인한 사용자만 이용가능한 서비스입니다. 로그인 후 이용바랍니다.</textarea>
									</th>
									<th style="vertical-align: middle"><button
											class="btn btn-secondary" disabled>등록하기</button></th>
								</c:when>
								
								
								<c:otherwise>
									<th colspan="2"><textarea class="form-control" id="msg" cols="55" rows="2" style="resize: none; width: 100%"></textarea></th>
									<th style="vertical-align: middle"><button type="button" id="btnSend" class="btn btn-secondary" onclick="addReply();">등록하기</button></th>
								</c:otherwise>
							</c:choose>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				<br> <br>




				<script>
				$(document).ready(function(){
					
				    $('#btnSend').on('click', function(evt) {
					  evt.preventDefault();
				  if (socket.readyState !== 1) return;
				    	  let msg = $('input#msg').val();
				    	  socket.send(msg);
				    });
				});
				</script>

				<script>
				let ruserNo = '${loginUser.userNo}';
				let boardNo = ${b.boardNo};
			    
			$(function(){
	    		selectReplyList();
	    		
	    		$(document).on("click", ".close", function(){
					let replyNo = $(this).children("span[name=close]").val();
					replyDelete();
					})
	    	})
	     
			//댓글작성이고 -> 알림을 주고싶으면  success에 알림구문을 추가해준다. 
	    	function addReply(){
	    		if($("#msg").val().trim().length != 0){
	    			
	    			$.ajax({
	    				url:"rinsert.bo",
	    				data:{
	    					rboardNo : ${b.boardNo},
	    					replyContent:$('#msg').val(),
	    					ruserNo:'${loginUser.userNo}'
	    				}, success:function(status){
	    					if(status =="success"){
	    						//websocket에 보내기(댓글작성자 게시글작성자 글번호)
	    						console.debug("socket",socket)
		    						if(socket != null){ 
		    							let socketMsg = "reply,"+ '${loginUser.userNo}' +","+ '${b.userNo}' +","+'${b.boardWriter}';
		    							//가져올 변수들 홑따옴표로 감싸주기
		    							
			    						console.debug("jsp::socket>",socketMsg)
		    							socket.send(socketMsg);
			    						
			    						selectReplyList();
			    						$('#msg').val("");
		    						}
	    						}
	    					}, error:function(){
	    					console.log("댓글작성용 ajax 통신실패");
	    				}
	    			})
	    			
	    		}else{
	    			alert('댓글 작성 후 등록요청해주세요!');
	    		}
	    	}
	    	
			function selectReplyList(){
	    		$.ajax({
	    			url:"rlist.bo",
	    			data:{bno:${b.boardNo}},
	    			success:function(list){
	    				console.log(list);
	    				let value="";
	    				
	    				for(let i in list){
	    					value += "<tr>"
	    						  + "<th>" + list[i].replyWriter +"</th>"
	    						  + "<td>" + list[i].replyContent + "</td>"
	    						  + "<td>" + list[i].createDate; 
	    						  
	    						  if(list[i].ruserNo == ruserNo){
	    							value += "<span name='close' class='close'>x</span>";
	    						  }
	    						  
	    					value += "</td>"
	    						  + "<input type='hidden' value='"+list[i].replyNo+"' name='replyNo' id='replyNo'/>"
	    						  + "</tr>";
	    						  
	    				}
	    				$("#replyArea tbody").html(value);
	    				$("#rcount").text(list.length);
	    			},
	    			error:function(){
	    				console.lof("댓글리스트 조회용 ajax 통신실패");
	    			}
	    		});
	    	}
			
			
			function replyDelete(){
				if(!confirm("댓글을 삭제하시겠습니까?"))
 				{
 					return false;
 				}else{
 					
 				$.ajax({
 				  type: 'POST',  
 				  dataType:'json',
 				  url: "replyDelete",
 				  data: {replyNo: $('#replyNo').val()},
 				  success:
 					function(result){
 					   if(result == 1){
 						alert('삭제되었습니다.');
 						window.location.reload();
 						
 						}
 				  }
 				});
 				}
			}
			
	    	</script>


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