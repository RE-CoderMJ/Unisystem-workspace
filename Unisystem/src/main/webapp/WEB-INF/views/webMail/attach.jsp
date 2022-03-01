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
                <button id="refresh"><i class="fas fa-redo fa-xs"></i></button>
                <div id="tools">
                    <div id="tools-left">
                        <input type="checkbox" id="checkAll">
                        <button style="margin-left: 10px;" id="read">읽음</button>
                        <button id="trash"><i class="fa fa-trash fa-sm" aria-hidden="true"></i>삭제</button>
                        <button style="margin-left: -5px;">스팸등록</button>
                        <button id="reply">답장</button>
                        <button style="margin-left: -4px;" id="forward">전달</button>
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

				<input type="hidden" id="cPage">
				
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
							   + "<input type='hidden' name='mNo' value='" + result.list[i].mailNo + "'>"
							   + "<input type='hidden' name='read-date' value='" + result.list[i].readDate + "'>"
							   + "<input class='checkbox-att' type='checkbox'>";
						if(result.list[i].important == "N"){
							value += "<div class='important-att'><i class='fa fa-star fa-sm unimportant' aria-hidden='true'></i></div>";
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
												
						// 사이드바와 컨텐츠영역 길이 맞춤
						let $len = $("section").height();
						$("#webMail-sidebar").css('height', $len + 22);
						
						$("#cPage").val(result.pi.currentPage); 
					}
					
                	
					
				},error:function(){
					console.log("첨부파일 메일함 목록 조회용 ajax 통신 실패");
				}
			})
		}
	</script>
	
	<script>
		$(function(){
			$(document).on("click", ".mail> .title-att", function(){
				location.href="webMail.detailView?mNo=" + $(this).siblings("input[name=mNo]").val();
			});		
		})
	</script>
	
	<!-- 전체 선택/해제 -->
	<script>
		$(document).on("click", "#checkAll", function(){
			if($("#checkAll").is(":checked")){
				$(".checkbox-att").prop("checked", true);
			}else{
				$(".checkbox-att").prop("checked", false);
			}
		});		
	</script>
	
	<!-- 읽음처리 -->
	<script>
		$(document).on("click", "#read", function(){
			let checkValue = [];
			let mNoList = [];
			
			let value;
			let mNo;
			
			$(".checkbox-att:checked").each(function(){
				value = $(this).siblings("input[name=read-date]").val();
				checkValue.push(value);
				
				mNo = $(this).siblings("input[name=mNo]").val();
				mNoList.push(mNo);
			});
			
			let status;
			for(let i in checkValue){
				
				if(checkValue[i] == 'undefined'){
					status = 0;
				}else{
					status = 1;
				}

				changeReadStatus(status, mNoList[i]);
			}
		})
		
		function changeReadStatus(status, mNo){
			$.ajax({
				url:"webMail.changeReadStatus",
				data:{status:status, mNo:mNo},
				success:function(result){
					if(result > 0){
					selectAttachMailList($("#cPage").val());						
					}
				},error:function(){
					console.log("읽음처리용 ajax통신 실패");
				}
			
			})
		}
		
	</script>
	
	<!-- 메일 휴지통으로 이동 -->
	<script>
		$(document).on("click", "#trash", function(){
			let checkValue = [];
			
			let mNo;

			$(".checkbox-att:checked").each(function(){
				mNo = $(this).siblings("input[name=mNo]").val();
				checkValue.push(mNo);
			});
			
			for(let i in checkValue){
				moveToTrash(checkValue[i]);
			}
		})
		
		function moveToTrash(mNo){
			$.ajax({
				url:"webMail.moveToTrash",
				data:{mNo:mNo, tNo:2},
				success:function(){
					$("#deleteCompleted").modal('show');
					selectAttachMailList($("#cPage").val());
				},error:function(){
					console.log("휴지통 이동 ajax통신 실패");
				}
			
			})
		}
		
	</script>
	
	<!-- 답장 기능 -->
	<script>
		$(document).on("click", "#reply", function(){
			
			let count = 0;
			
			$(".checkbox-att:checked").each(function(){
				count++;
			});
			
			if(count > 1){
				alert("답장은 1개의 메일만 선택이 가능합니다.");
			}else{
				let mNo = $(".checkbox-att:checked").siblings("input[name=mNo]").val();
				location.href= "webMail.writeReplyForwardForm?mNo=" + mNo + "&tNo=1";
			}
						
		})
	</script>
	
	<!-- 전달 기능 -->
	<script>
		$(document).on("click", "#forward", function(){
			
			let count = 0;
			
			$(".checkbox-att:checked").each(function(){
				count++;
			});
			
			if(count > 1){
				alert("전달은 1개의 메일만 선택이 가능합니다.");
			}else{
				let mNo = $(".checkbox-att:checked").siblings("input[name=mNo]").val();
				location.href= "webMail.writeReplyForwardForm?mNo=" + mNo + "&tNo=2";
			}
						
		})
		
	</script>
	
	<!-- 중요처리 -->
	<script>
		$(document).on("click", ".important-att", function(){
			
			let status;
			if($(this).children("i").hasClass("unimportant")){
				$(this).children("i").removeClass("unimportant");
				status = 'Y';
			}else{
				$(this).children("i").addClass("unimportant");
				status = 'N';
			}
			
			changeImportance($(this).siblings("input[name=mNo]").val(), status);
	
		})
		
		function changeImportance(mNo,status){
			$.ajax({
				url:"webMail.changeImportance",
				data:{mNo:mNo, status:status, type:1},
				success:function(result){
					if(result > 0){
						selectAttachMailList($("#cPage").val());						
					}
				},error:function(){
					console.log("중요처리 ajax통신 실패");
				}
			})
		}
	</script>
	
</body>
</html>