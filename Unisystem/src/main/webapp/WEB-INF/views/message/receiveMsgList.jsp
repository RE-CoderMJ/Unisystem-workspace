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
   
</style>
<body>


	<!-- header.jsp 영역 -->
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../message/messageModal.jsp" />
	<!-- sidebar.jsp 영역 
		  교수가 로그인하면 pmySidebar
		  학생이 로그인하면 smySidebar -->


	<div style="background-color: rgb(235, 242, 252); width: 1500px; margin:auto; margin-top:30px;">
		<div class="sidewrap">
			<jsp:include page="../student/smySidebar.jsp" />
		</div>

		<div class="bo_content">
			<!-- title -->


			<div class="page_title">받은 메시지</div>
			
			<hr width="1200px;">

			<div class="head_count msg_division">받은 메시지 목록</div>

			<br>

			<div class="btn-search">
			<div class="btn-area">
				<a class="btn btn-sm" id="mdel" style="color:white; background-color:rgb(192, 57, 43);">선택삭제</a> 
				<a class="btn btn-sm" href="" data-toggle="modal" data-target="#msgModal" style="background-color:rgb(44, 62, 80); color:white;">쪽지보내기</a>
			</div>
		 
			
</div>
			<br clear="both"> <br> <br>

			<br clear="both">



			<!-- ajax로 리스트 불러오기  쪽지 받았을 때 상단에 알림이 뜨도록 -->
			<!-- list 영역-->
			<table class="table" id="msgArea" style="width: 900px; text-align: center;">
			<thead>
				<tr>
					<th width=""><input type="checkbox" id="checkAll"></th>
					<th width="100px">보낸사람</th>
					<th width="300px">내용</th>
					<th width="100px">상태</th>
					<th>보낸날짜</th>
				</tr>
			</thead>
			
			<tbody>
						
			</tbody>
			</table>
			
			
			<div class="modal" id="detailrecMsg">
			<div class="modal-dialog">
				<div class="modal-content" style="border-radius: 80px; padding-bottom:20px;">
					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title" id="mtitle">받은메시지 조회</h4>
						<button type="button" class="close" id="close"
							data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body" id="mbody">
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

		<!-- footer.jsp-->
		<jsp:include page="../common/footer.jsp" />

	</div>
	
	
<script>
		$(function(){
			receiveMsgList(1);
			
			$(document).on("click", ".text-overflow > a", function(){
				console.log();
				
				let value="";
				
				$.ajax({
					url:"detail.rmsg",
					dataType:'json',
					type:'POST',
					data:{
						messageNo:$(this).parent().siblings("input[name=messageNo]").val()
					},
					success:function(list){
						console.log(list);
						
						value +="<p>" 
							   + 	"<b>보낸이:</b>" + list.msgWriter
							   + "</p>"
							   + "<textarea class='modalText' name='msgContent' id='msgContent'>"
							   +  list.msgContent
							   + "</textarea>";
						
						$('#mbody').html(value);
						$('#detailrecMsg').modal('show');
						
						$('#detailrecMsg').on('hidden.bs.modal', function(){
							location.reload();
						})
						
						console.log(value);
					}, error:function() {
						console.log("쪽지디테일 조회용 ajax 통신실패");
					}
					
				});//ajax
			}) //document
		})	 //$function
			
		
		//쪽지 리스트 조회 ajax구현하기 
		function receiveMsgList(cPageNo){
    		$.ajax({
    			type: 'POST',  
				dataType:'json',
    			url:"rmsg.list",
    			data:{currentPage:cPageNo, userNo: '${loginUser.userNo}'},
    			success:function(data){
    				console.log(data);
    				
	    			let value="";
    				
    				if(data.list.length == 0){
    					
    					value = "<tr><td colspan='5' style='text-align:center;'>받은 메시지가 없습니다.</td></tr>"
    					
    				}else{
    				
    				for(let i in data.list){
    					let readYN = "";
    					
    					if(data.list[i].readYN == 'Y'){
    						readYN += "<td><b style='color:rgb(15,43,80);'>읽음<b></td>";
  						 	// readYN = "읽음";
  						  }else if(data.list[i].readYN =='N'){
  							readYN += "<td><b style='color:rgb(192, 57, 43);'>안읽음<b></td>";
  							//readYN = "안읽음";
  						  }
    					
    					value += "<tr>"
    						  + "<td class='td ck'>" 
    						  + "<input class='checkbox' name='checkBox' type='checkbox'>"
    						  + '<input type="hidden" name="deleteYN" id="mYN"/>'
    						  +"</td>"
    						  + "<input type='hidden' name='messageNo' id='msgNo' value='"+ data.list[i].messageNo +"'>"
    						  + "<td>" + data.list[i].msgWriter + "</td>"
    						  + "<td class='text-overflow'>" +"<a>" + data.list[i].msgContent +"</a>"+"</td>"
    						  + readYN
    						  + "<td>" + data.list[i].sendDate + "</td>"
    						  + "</tr>";
    					}
    				}
    				
    				let piValue = "";
					
					if(data.pi.currentPage == 1){
						piValue += "<li class='page-item disabled'><a class='page-link' href='#'>&lt;</a></li>";
					}else{
						piValue += "<li class='page-item'><a class='page-link' onclick='receiveMsgList(" + (data.pi.currentPage-1) + ")'>&lt;</a></li>";
					}
                    
					for(let p = data.pi.startPage; p<=data.pi.endPage; p++){
						
						if(p == data.pi.currentPage){
							piValue += "<li class='page-item disabled active'><a class='page-link' onclick='receiveMsgList(" + p + ")'>" + p + "</a></li>";
						}else{
							piValue += "<li class='page-item'><a class='page-link' onclick='receiveMsgList(" + p + ")'>" + p + "</a></li>";
						}
					}
					
					if(data.pi.currentPage == data.pi.maxPage){
						piValue += "<li class='page-item disabled'><a class='page-link' href='#'>&gt;</a></li>";
					}else{
						piValue += "<li class='page-item'><a class='page-link' onclick='receiveMsgList(" + (data.pi.currentPage + 1) + ")'>&gt;</a></li>"
    			}
				
					$(".pagination").html(piValue);
					$("#cPage").val(data.pi.currentPage);
					$("#msgArea tbody").html(value);
    			},error:function(){
    				console.log("쪽지리스트 조회용 ajax 통신실패");
    			}
    		}); //ajax 끝 
		} //func
		

		
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
	 					location.reload();
    					}//success
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