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
<link href="resources/css/webMail/attach.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../common/links.jsp"/>
	<jsp:include page="../common/header.jsp" />

    <div id="wrapper">

        <jsp:include page="webMailSidebar.jsp" />
        <section>
            <header id="mail-boxes-header">
                <div id="mailbox-name">첨부파일이 있는 메일</div>
                <div id="mail-count">
                	<span id="unread-count">6</span><span> / 65</span>
                </div>
                <button id="redo"><i class="fas fa-redo fa-xs"></i></button>
                <div id="tools">
                    <div id="tools-left">
                        <input type="checkbox" class="checkbox">
                        <button style="margin-left: 10px;">읽음</button>
                        <button><i class="fa fa-trash fa-sm" aria-hidden="true"></i>삭제</button>
                        <button style="margin-left: -5px;">스팸등록</button>
                        <button>답장</button>
                        <button style="margin-left: -4px;">전달</button>
                    </div>
                    <div id="tools-right" align="right">
                        <select name="" id="search-option">
                            <option value="">전체</option>
                            <option value="">제목+내용</option>
                            <option value="">보낸사람</option>
                        </select>
                        <input type="search" name="" id="">
                        <button><i class="fas fa-search fa-sm" id="mail-search-btn"></i></button>
                    </div>
                </div>
            </header>
            <article>
                <div id="mails">
                    
                </div>
                
                <div class="container">
                    <ul class="pagination justify-content-center">
                      
                    </ul>
                 </div>

            </article>
        </section>
    </div>

	<jsp:include page="../common/footer.jsp" />
	
	<script>
		$(function(){
			selectAttachMailList(1);
		});
		
		function selectAttachMailList(cPageNo){
			$.ajax({
				url:"webMail.selectAttachMailList",
				data:{currentPage:cPageNo, userNo:"${loginUser.userNo}"},
				success:function(result){
					
					let value="";
					for(let i in result.list){
						value += "<div class='mail'>"
							   + "<input type='hidden' value='" + result.list[i].mailNo + "'>"
							   + "<input class='checkbox-att' type='checkbox'>";
						if(result.list[i].important == "N"){
							value += "<div class='important-att'><i class='fa fa-star fa-sm' style='color:lightgray;' aria-hidden='true'></i></div>";
						}else{
							value += "<div class='important-att'><i class='fa fa-star fa-sm' aria-hidden='true'></i></div>";
						}
						
						if(result.list[i].readDate != null){
							value += "<div class='read-status-att'><i class='far fa-envelope-open'></i></div>";
						}else{
							value += "<div class='read-status-att'><i class='far fa-envelope'></i></div>";
						}
						
						value += "<div class='from-att'>" + result.list[i].userFromName + "</div>"
							   + "<div class='date-att'>" + result.list[i].sendDate + "</div>";
						
						if(result.list[i].readDate == null){
							if(result.list[i].ccStatus == "N"){
								value += "<div class='title-att' style='color:blue'>" + result.list[i].title + "</div>";								
							}else{
								value += "<div class='title-att' style='color:blue'> cc:" + result.list[i].title + "</div>";
							}
							
						}else{
							if(result.list[i].ccStatus == "N"){
								value += "<div class='title-att'>" + result.list[i].title + "</div>";								
							}else{
								value += "<div class='title-att'> cc:" + result.list[i].title + "</div>";
							}
							
						}
						
						value += "<hr class='line-att'><br>";
						
						for(let j in result.attList){
							if(result.attList[j].refNo == result.list[i].mailFromNo){
								value += "<a class='files' href='" + result.attList[j].path + result.attList[j].changeName + "' download='" + result.attList[j].originName + "'>" + result.attList[j].originName + "</a><br>";
							}
						}
						
						value += "</div>";
						
						$("#mails").html(value);
						
						let piValue = "";
						
						if(result.pi.currentPage == 1){
							piValue += "<li class='page-item disabled'><a class='page-link' href='#'>&lt;</a></li>";
						}else{
							piValue += "<li class='page-item'><a class='page-link' onclick='selectAttachMailList(" + (result.pi.currentPage-1) + ")'>&lt;</a></li>";
						}
	                    
						for(let p = result.pi.startPage; p<=result.pi.endPage; p++){
							
							if(p == result.pi.currentPage){
								piValue += "<li class='page-item disabled active'><a class='page-link' onclick='selectAttachMailList(" + p + ")'>" + p + "</a></li>";
							}else{
								piValue += "<li class='page-item'><a class='page-link' onclick='selectAttachMailList(" + p + ")'>" + p + "</a></li>";
							}
							
						}
		            	
						if(result.pi.currentPage == result.pi.maxPage){
							piValue += "<li class='page-item disabled'><a class='page-link' href='#'>&gt;</a></li>";
						}else{
							piValue += "<li class='page-item'><a class='page-link' onclick='selectAttachMailList(" + (result.pi.currentPage + 1) + ")'>&gt;</a></li>"
						}
						
						$(".pagination").html(piValue);
						
					}
					
                	
					
				},error:function(){
					console.log("첨부파일 메일함 목록 조회용 ajax 통신 실패");
				}
			})
		}
	</script>
	
	<script>
		$(function(){
			$(document).on("click", ".mail", function(){
				location.href="webMail.detailView?mNo=" + $(this).children("input").val();
			});		
		})
	</script>
	
	<script>
		$(document).ready(function(){
			let $len = $("section").height();
			console.log($len);
			$("#webMail-sidebar").css('height', $len + 22);
		})
	</script>
	
</body>
</html>