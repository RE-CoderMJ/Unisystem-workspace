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
	width: 1270px;
	float: left;
	background-color: white;
	margin-left: 30px;
	padding-bottom: 50px;
	float:right;
}
.moBtn{
	background-color: rgb(15, 43, 80);
	color: white;
	height: 40px;
	width: 80px;
	border-radius: 3px;
	font-size: 14px;
	cursor: pointer;
	position: relative;
	right: 0px;
	border:none;
}
.page_title {
	color: rgb(15, 43, 80);
    font-size: 40px;
    font-weight: 800;
    margin-top: 37px;
    margin-bottom: 10px;
    margin-left: 53px;
}


#searchForm>* {
	float: left;
	margin-right: 10px;
	border: none;
}

.custom-select {
	border: 1px solid lightgray;
	height: 25px;
	border-radius: 3px;
}

.search_wrap .btn {
	background-color: rgb(15, 43, 80);
	color: white;
	height: 40px;
	width: 60px;
	border-radius: 3px;
	font-size: 14px;
	cursor: pointer;
	position: relative;
	right: 0px;
}

.search_wrap input {
	height: 40px;
	border: 1px solid lightgray;
	margin-left: 0px;
}

.search_wrap {
	margin-left: 728px;
	margin-top: 10px;
	margin-bottom: 15px
}

.head_count {
	margin-left: 55px;
}

.bo_content table {
	background-color: white;
	margin: auto;
	position: relative;
	top: -40px;
}

#pagingArea {
	width: fit-content;
	margin: auto;
	margin-top: 20px;
}

#pagingArea a {
	text-decoration: none;
	color: black;
}

ul {
	list-style: none;
	margin: 0 0 10 10;
}

li {
	float: left;
	margin-left: 20px;
}

#pagingArea a:hover {
	color: rgb(231, 76, 60);
	font-weight: 700;
}

.bo_content {
	position: relative;
	top: 0px;
}

.ctg-area {
	margin-top: 10px;
	margin-bottom: 20px;
	float: left;
	margin-right: 100px;
	margin-left: 188px;
}

.ctg-area button {
	background-color: rgba(0, 0, 0, 0);
	border: none;
	cursor: pointer;
}

.ctg-area button:hover {
	color: rgb(26, 86, 162);
	font-weight: 700;
}

.b_write {
	border: none;
	float: right;
	margin-right: 98px
}

/*페이징바*/
.container{
    margin-top: 50px;
}
.page-link{
    color:rgb(21, 62, 115)!important;
    border: none!important;
    border-radius: 200px!important;
}
.page-item.active .page-link {
    color: #fff !important;
    background: black!important;
}
.btn-search{
float:right;
margin-right:87px;
}
.page-link{
cursor:pointer;
}
#mtitle{
margin-left:148px;
font-weight:600;
}
#sbody textarea{
	width: 383px;
    resize: none;
    height: 400px;
}

.wrap_sidebar{
height: 955px !important;
}
</style>
<body>

	<!-- header.jsp 영역 -->
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/links.jsp" />
	<jsp:include page="../message/messageModal.jsp" />
	
	<!-- sidebar.jsp 영역 
		  교수가 로그인하면 pmySidebar
		  학생이 로그인하면 smySidebar -->


	<div style="background-color: rgb(235, 242, 252); width: 1500px; margin:auto; margin-top:30px;">
			
				<c:choose>
					<c:when test="${loginUser.userDiv eq 1 }">
						<jsp:include page="../student/smySidebar.jsp" />
					</c:when>
					<c:when test="${loginUser.userDiv eq 2 }">
						<jsp:include page="../professor/pmySidebar.jsp" />
					</c:when>
					<c:when test="${loginUser.userDiv eq 3 }">
						<jsp:include page="../common/adminSidebar.jsp" />
					</c:when>
				</c:choose>
		
		<div class="bo_content">
			<!-- title -->


			<div class="page_title">보낸 메시지</div>
			
			<hr width="1200px;">

			<div class="head_count msg_division">보낸 메시지 목록</div>

			<br>

			<div class="btn-search">
			<div class="btn-area">
				<a class="btn btn-sm" id="mdel" style="color:white; background-color:rgb(192, 57, 43);">선택삭제</a> 
				<a class="btn btn-sm" href="" data-toggle="modal" data-target="#msgModal" style="background-color:rgb(44, 62, 80); color:white;">쪽지보내기</a>
			</div>
		 
			
</div>
			<br clear="both"> 
			
			<br><br>


			<!-- list 영역-->
			<table class="table" id="msgArea" style="width: 900px; text-align: center;">
			<thead>
				<tr>
					<th width=""><input type="checkbox" id="checkAll"></th>
					<th width="100px">받는사람</th>
					<th width="300px">내용</th>
					<th width="100px">상태</th>
					<th>보낸날짜</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
			</table>


		<div class="modal" id="detailSendMsg">
			<div class="modal-dialog">
				<div class="modal-content" style="border-radius: 80px; padding-bottom: 29px;">
					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title" id="mtitle">보낸메시지 조회</h4>
						<button type="button" class="close" id="close"
							data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body" id="sbody" style="margin:auto;">
						
					</div>
				</div>
			</div>
		</div>
		
			<!-- paging bar 영역-->
			<div id="pagingArea">

			<ul class="pagination">
			</ul>
			<input type="hidden" id="cPage">
			</div>
		</div>
		<!-- side바 div영역 끝 -->

		<br clear="both">


	</div>
		<!-- footer.jsp-->
		<jsp:include page="../common/footer.jsp" />

		<script>
	      
		$(function(){
			sendMsgList(1);
			
			$(document).on("click", "#mdel", function(){
				deleteMsg();
			})
			
			$(document).on("click", ".text-overflow > a", function(){
				console.log();
				
				let value="";
				
				$.ajax({
					url:"detail.smsg",
					dataType:'json',
					type:'POST',
					data:{
						messageNo:$(this).parent().siblings("input[name=messageNo]").val()
					},
					success:function(list){
						console.log(list);
						
						value +="<p>" 
							   + 	"<b>받는이:</b>" + list.msgReader
							   + "</p>"
							   + "<textarea class='modalText' name='msgContent' id='msgContent'>"
							   +  list.msgContent
							   + "</textarea>";
						
						$('#sbody').html(value);
						$('#detailSendMsg').modal('show');
						
						console.log(value);
					}, error:function() {
						console.log("쪽지디테일 조회용 ajax 통신실패");
					}
					
				});
			})
			 
		})
		
		//쪽지 리스트 조회 ajax구현하기 
		function sendMsgList(cPageNo){
    		$.ajax({
    			type: 'POST',  
				dataType:'json',
    			url:"smsg.list",
    			data:{currentPage:cPageNo, userNo: '${loginUser.userNo}'},
    			success:function(data){
    				console.log(data);
    				
	    			let value="";
    				
    				if(data.list.length == 0){
    					value = "<tr ><td colspan='5' style='text-align:center;'>보낸 메시지가 없습니다.</td></tr>"
    				}else{
    				
    				for(let i in data.list){
    					let readYN = "";
    					
    					if(data.list[i].readYN == 'Y'){
  						  readYN = "읽음 ";
  						  }else if(data.list[i].readYN =='N'){
  							readYN = "안읽음";
  						  }
    					
    					value += "<tr>"
    						  + "<td>" 
    						  + "<input class='checkbox' type='checkbox'>"
    						  +"</td>"
    						  + "<input type='hidden' name='messageNo' id='msgNo' value='"+ data.list[i].messageNo +"'>"
    						  + "<td>" + data.list[i].msgReader + "</td>"
    						  + "<td class='text-overflow'><a>" + data.list[i].msgContent + "</a></td>"
    						  + "<td>"+readYN+ "</td>"
    						  + "<td>" + data.list[i].sendDate + "</td>"
    						  + "</tr>";
    					}
    				}
    				
    				let piValue = "";
					
					if(data.pi.currentPage == 1){
						piValue += "<li class='page-item disabled'><a class='page-link' href='#'>&lt;</a></li>";
					}else{
						piValue += "<li class='page-item'><a class='page-link' onclick='sendMsgList(" + (data.pi.currentPage-1) + ")'>&lt;</a></li>";
					}
                    
					for(let p = data.pi.startPage; p<=data.pi.endPage; p++){
						
						if(p == data.pi.currentPage){
							piValue += "<li class='page-item disabled active'><a class='page-link' onclick='sendMsgList(" + p + ")'>" + p + "</a></li>";
						}else{
							piValue += "<li class='page-item'><a class='page-link' onclick='sendMsgList(" + p + ")'>" + p + "</a></li>";
						}
						
					}
	            	
					if(data.pi.currentPage == data.pi.maxPage){
						piValue += "<li class='page-item disabled'><a class='page-link' href='#'>&gt;</a></li>";
					}else{
						piValue += "<li class='page-item'><a class='page-link' onclick='sendMsgList(" + (data.pi.currentPage + 1) + ")'>&gt;</a></li>"
    			}
				
					$(".pagination").html(piValue);
					$("#cPage").val(data.pi.currentPage);
					$("#msgArea tbody").html(value);
    				},
    				
    			error:function(){
    				console.log("댓글리스트 조회용 ajax 통신실패");
    			}
    		});
    	}
		
		
		//체크박스 여러개 담는 ajax
		 $(function(){
		            $("#mdel").click(function(){
		          let cknArr = [];
		           	 let value;
		           	 
		           	$(".checkbox:checked").each(function(){
		           		value = $(this).parent().siblings("input[name=messageNo]").val();
		           		cknArr.push(value);
		           	})
		           	
		           	let ckn;
		               for(let i in cknArr){
		                   console.log(cknArr[i]);
		                   ckn = cknArr[i];
		                   deleteMsg(cknArr[i]);
		               }
		           });
		        })

		
		//메시지 삭제 ajax
		
		function deleteMsg(ckn){
			
			$.ajax({
				type: 'POST',  
				dataType:'json',
   			url:"del.msg",
   			data:{messageNo:ckn},
   			success:function(data){
   						console.log(data)
	 					location.reload();}
	
   			, error:function() {
				console.log("선택삭제 ajax 통신실패");
					}//error	
			});//ajax끝
		}
		
		
		 /*전체 체크박스*/
			$(document).on("click", "#checkAll", function(){
				if($("#checkAll").is(":checked")){
					$(".checkbox").prop("checked", true);
				}else{
					$(".checkbox").prop("checked", false);
				}
			});	
    </script>
     

</body>
</html>