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
				<a class="btn btn-sm btn-danger" href="">선택삭제</a> 
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
					<th width="20px"></th>
					<th width="70px">번호</th>
					<th width="100px">보낸사람</th>
					<th width="300px">내용</th>
					<th width="100px">상태</th>
					<th>보낸날짜</th>
				</tr>
			</thead>
			
			<tbody>
						
			</tbody>
			</table>
		


			<!-- paging bar 영역-->
			<div id="pagingArea">

				<ul class="pagination">
					<li class="page-item ltgt"><a href="">&lt;</a></li>
					<li class="page-item"><a href="">1</a></li>
					<li class="page-item"><a href="">2</a></li>
					<li class="page-item"><a href="">3</a></li>
					<li class="page-item"><a href="">4</a></li>
					<li class="page-item"><a href="">5</a></li>
					<li class="page-item ltgt"><a href="">&gt;</a></li>
				</ul>
			</div>

		</div>
		<!-- side바 div영역 끝 -->

		<br clear="both">

		<script>
		
		$(function(){
			receiveMsgList();
		})
		
		//쪽지 리스트 조회 ajax구현하기 
		function receiveMsgList(){
    		$.ajax({
    			type: 'POST',  
				dataType:'json',
    			url:"rmsg.list",
    			data:{userNo: '${loginUser.userNo}'},
    			success:function(data){
    				console.log(data);
    				let value="";
    				
    				for(let i in data){
    					let readYN = "";
    					
    					if(data[i].readYN == 'Y'){
  						  readYN = "읽음 ";
  						  }else if(data[i].readYN =='N'){
  							readYN = "안읽음";
  						  }
    					
    					value += "<tr>"
    						  + "<td>" 
    						  + "<input id='msgCheck' type='checkbox'>"
    						  +"</td>"
    						  + "<td>" + data[i].messageNo +"</td>"
    						  + "<td>" + data[i].msgWriter + "</td>"
    						  + "<td>" + data[i].msgContent + "</td>"
    						  + "<td>"+readYN+ "</td>"
    						  + "<td>" + data[i].sendDate + "</td>"
    						  + "</tr>";
    				}
    				
    				$("#msgArea tbody").html(value);
    			},
    			error:function(){
    				console.log("댓글리스트 조회용 ajax 통신실패");
    			}
    		});
    	}
    </script>

		<!-- footer.jsp-->
		<jsp:include page="../common/footer.jsp" />

	</div>


</body>
</html>