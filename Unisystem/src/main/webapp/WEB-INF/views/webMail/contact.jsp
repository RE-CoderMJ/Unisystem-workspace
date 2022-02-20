<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css">
<link href="resources/css/webMail/mailboxes.css" rel="stylesheet">
<style>
	#list{
		text-align:center;
	}
</style>
</head>
<body>
	<jsp:include page="../common/links.jsp"/>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="modals.jsp" />

    <div id="wrapper">

        <jsp:include page="webMailSidebar.jsp" />
        <section>
            <header id="mail-boxes-header">
                <div id="mailbox-name"><i class="fa fa-address-book fa-lg" aria-hidden="true"></i>&nbsp;&nbsp; 주소록</div>
                <br>
                <div id="tools">
                    <div id="tools-left">
                        <button data-toggle="modal" data-target="#addContact"><span style="color:navy">+</span>&nbsp;추가</button>
                        <button data-toggle="modal" data-target="#deleteContact"><span style="color:red">-</span>&nbsp;삭제</button>
                        <button data-toggle="modal" data-target="#editContact">수정</button>
                        <button style="margin-left: -4px;">메일쓰기</button>
                    </div>
                    <div id="tools-right" align="right">
                        <select name="" id="search-option">
                            <option value="">전체</option>
                            <option value="">이름</option>
                            <option value="">연락처</option>
                        </select>
                        <input type="search" name="" id="">
                        <button><i class="fas fa-search fa-sm" id="mail-search-btn"></i></button>
                    </div>
                </div>
            </header>
            <article>
                <table class="table table-hover" id="list">
                    <tbody>
                    	<tr style="background:rgb(232, 232, 232);">
                    		<th><input type="checkbox" class="checkbox"></th>
                    		<th>No.</th>
                    		<th>이름</th>
                    		<th>이메일 주소</th>
                    		<th>연락처</th>
                    	</tr>
                        <tr>
                            <td><input type="checkbox" class="checkbox"></td>
                            <td>1</td>
                            <td>김땡땡 교수님</td> 
                            <td>39201939@unisystem.com</td>
                            <td>010-1234-5678</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" class="checkbox"></td>
                            <td>1</td>
                            <td>김땡땡 교수님</td> 
                            <td>39201939@unisystem.com</td>
                            <td>010-1234-5678</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" class="checkbox"></td>
                            <td>1</td>
                            <td>김땡땡 교수님</td> 
                            <td>39201939@unisystem.com</td>
                            <td>010-1234-5678</td>
                        </tr>
                        
                    </tbody>
                </table>
                
                <div class="container">
                    <ul class="pagination justify-content-center">
                      
                    </ul>
                  </div>
				<input type="hidden" id="cPage">
            </article>
        </section>
    </div>

	<jsp:include page="../common/footer.jsp" />
	
	<script>
		$(function(){
			//selectContactList(1);
		});
		
		function selectContactList(cPageNo){
			$.ajax({
				url:"webMail.selectContactList",
				data:{currentPage:cPageNo, userNo:'${loginUser.userNo}'},
				success:function(result){
					
					let value = "";
					
					if(result.list.length === 0){
						value = "<tr><td style='text-align:center;'>주소록이 비어있습니다.</td></tr>"
					}else{
						
						
						
						let piValue = "";
						
						if(result.pi.currentPage == 1){
							piValue += "<li class='page-item disabled'><a class='page-link' href='#'>&lt;</a></li>";
						}else{
							piValue += "<li class='page-item'><a class='page-link' onclick='selectContactList(" + (result.pi.currentPage-1) + ")'>&lt;</a></li>";
						}
	                    
						for(let p = result.pi.startPage; p<=result.pi.endPage; p++){
							
							if(p == result.pi.currentPage){
								piValue += "<li class='page-item disabled active'><a class='page-link' onclick='selectContactList(" + p + ")'>" + p + "</a></li>";
							}else{
								piValue += "<li class='page-item'><a class='page-link' onclick='selectContactList(" + p + ")'>" + p + "</a></li>";
							}
							
						}
		            	
						if(result.pi.currentPage == result.pi.maxPage){
							piValue += "<li class='page-item disabled'><a class='page-link' href='#'>&gt;</a></li>";
						}else{
							piValue += "<li class='page-item'><a class='page-link' onclick='selectContactList(" + (result.pi.currentPage + 1) + ")'>&gt;</a></li>"
						}
						
						$(".pagination").html(piValue);
						
						// 사이드바와 컨텐츠영역 길이 맞춤
						let $len = $("section").height();
						$("#webMail-sidebar").css('height', $len + 22);
						
						$("#cPage").val(result.pi.currentPage);
					}
					
					$("#list").html(value);
					
				},error:function(){
					console.log("주소록 목록 조회용 ajax 통신 실패");
				}
				
			});
		}
	</script>
	
	<script>
		$(document).on("click", "#addContact-btn", function(){
			$.ajax({
				url:"webMail.addContact",
				data:{
					userNo:'${loginUser.userNo}',
					name:$("input[name=name]").val(),
					email:$("input[name=email]").val(),
					phone:$("input[name=phone]").val()
				},
				success:function(result){
					if(result>0){
						$("input[name=name]").val("");
						$("input[name=email]").val("");
						$("input[name=phone]").val("");
						//selectContactList(1);
					}
				},error:function(){
					
				}
			});
		})
	</script>
	
	<script>
		$(document).ready(function(){
			let $len = $("section").height();
			$("#webMail-sidebar").css('height', $len + 22);
		})
	</script>
	
</body>
</html>