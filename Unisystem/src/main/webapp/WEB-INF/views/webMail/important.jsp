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
</head>
<body>
	<jsp:include page="../common/links.jsp"/>
	<jsp:include page="../common/header.jsp" />

    <div id="wrapper">

        <jsp:include page="webMailSidebar.jsp" />
        <section>
            <header id="mail-boxes-header">
                <div id="mailbox-name"><i class="fa fa-star fa-xs" aria-hidden="true"></i> &nbsp; 중요 메일함</div>
                <div id="mail-count">
                	| <span id="unread-count">6</span><span> / 65</span>
                </div>
                <button id="redo"><i class="fas fa-redo fa-xs"></i></button>
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
                <table class="table table-hover" id="list">
                    <tbody>
                        
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
			selectImportantList(1);
		});
		
		function selectImportantList(cPageNo){
			$.ajax({
				url:"webMail.selectImportantList",
				data:{currentPage:cPageNo, userNo:'${loginUser.userNo}'},
				success:function(result){
					let value = "";
					if(result.list.length === 0){
						value = "<tr><td style='text-align:center;'>메일함이 비어있습니다.</td></tr>"
					}else{
						
						for(let i in result.list){
							value += "<tr>"
								   + 	"<input type='hidden' name='mNo' value='" + result.list[i].mailFromNo + "'>"
								   + 	"<input type='hidden' name='read-date' value='" + result.list[i].readDate + "'>"
								   +	"<input type='hidden' name='type' value='" + result.list[i].type + "'>"
								   +	"<input type='hidden' name='to-me' value='" + result.list[i].toMe + "'>"
								   +	"<input type='hidden' name='save-status' value='" + result.list[i].saveStatus + "'>"
								   +	"<input type='hidden' name='file-name' value='" + result.list[i].fileName + "'>"
								   +	"<td class='check-area'><input type='checkbox' class='checkbox'></td>";
								   
							if(result.list[i].important == "N"){
								value += "<td class='important'><i class='fa fa-star fa-xs unimportant' aria-hidden='true'></i></td>"
							}else{
								value += "<td class='important'><i class='fa fa-star fa-xs' aria-hidden='true'></i></td>"
							}
							
							if(result.list[i].readDate != null || result.list[i].type == 'f'){
	                    		value += "<td class='read-status'><i class='far fa-envelope-open'></i></td>";
							}else{
								value += "<td class='read-status'><i class='far fa-envelope'></i></td>";
							}
							
							if(result.list[i].fileName != null){
	                    		value += "<td class='att'><i class='fa fa-paperclip fa-sm' aria-hidden='true'></i></td>";
	                    	}else{
		                    	value += "<td class='att'></td>";                    		
	                    	}
	                    	
	                    	
	                    	if(result.list[i].readDate != null || result.list[i].type == 'f'){
		                    	value += "<td class='from overflow'>" + result.list[i].address + "</td>";
		                    	if(result.list[i].ccStatus == "N"){
		 							value += "<td class='title'>" + result.list[i].title + "</td>";                    		
		                    	}else{
		                    		value += "<td class='title'>cc : " + result.list[i].title + "</td>";
		                    	}
	                    	}else{
	                    		value += "<td class='from overflow unread'>" + result.list[i].address + "</td>";
		                    	if(result.list[i].ccStatus == "N"){
		 							value += "<td class='title unread'>" + result.list[i].title + "</td>";                    		
		                    	}else{
		                    		value += "<td class='title unread'>cc : " + result.list[i].title + "</td>";
		                    	}
	                    	}
	
		 					value += 	"<td class='date'>" + result.list[i].sendDate + "</td>"
		 					   	   + "</tr>";
		 					   	   
						}
						
						let piValue = "";
						
						if(result.pi.currentPage == 1){
							piValue += "<li class='page-item disabled'><a class='page-link' href='#'>&lt;</a></li>";
						}else{
							piValue += "<li class='page-item'><a class='page-link' onclick='selectImportantList(" + (result.pi.currentPage-1) + ")'>&lt;</a></li>";
						}
	                    
						for(let p = result.pi.startPage; p<=result.pi.endPage; p++){
							
							if(p == result.pi.currentPage){
								piValue += "<li class='page-item disabled active'><a class='page-link' onclick='selectImportantList(" + p + ")'>" + p + "</a></li>";
							}else{
								piValue += "<li class='page-item'><a class='page-link' onclick='selectImportantList(" + p + ")'>" + p + "</a></li>";
							}
							
						}
		            	
						if(result.pi.currentPage == result.pi.maxPage){
							piValue += "<li class='page-item disabled'><a class='page-link' href='#'>&gt;</a></li>";
						}else{
							piValue += "<li class='page-item'><a class='page-link' onclick='selectImportantList(" + (result.pi.currentPage + 1) + ")'>&gt;</a></li>"
						}
						
						$(".pagination").html(piValue);
						
						// 사이드바와 컨텐츠영역 길이 맞춤
						let $len = $("section").height();
						$("#webMail-sidebar").css('height', $len + 22);
						
						$("#cPage").val(result.pi.currentPage);
					}
					
					$("#list").html(value);
				},error:function(){
					console.log("휴지통 조회용 ajax 통신 실패");
				}
				
			});
		}
	</script>
	
	<!-- 상세조회 -->
	<script>
		$(function(){
			$(document).on("click", ".title", function(){
				
				// 내게쓴 메일일 경우
				if($(this).siblings("input[name=to-me]").val() == 'Y'){
					location.href="webMail.detailToMeView?mNo=" + $(this).siblings("input[name=mNo]").val();
				}else{
					//보낸메일일 경우
					if($(this).siblings("input[name=type]").val() == 'f'){
						location.href="webMail.detailMfView?mNo=" + $(this).siblings("input[name=mNo]").val();
					}else{
						location.href="webMail.detailView?mNo=" + $(this).siblings("input[name=mNo]").val();					
					}
				}					
			})
		});
	</script>
	
	<!-- 전체 선택/해제 -->
	<script>
		$(document).on("click", "#checkAll", function(){
			if($("#checkAll").is(":checked")){
				$(".checkbox").prop("checked", true);
			}else{
				$(".checkbox").prop("checked", false);
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
			
			$(".checkbox:checked").each(function(){
				if($(this).parent().siblings("input[name=type]").val() == 't'){
					value = $(this).parent().siblings("input[name=read-date]").val();
					checkValue.push(value);
					
					mNo = $(this).parent().siblings("input[name=mNo]").val();
					mNoList.push(mNo);					
				}
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
					selectImportantList($("#cPage").val());						
					}
				},error:function(){
					console.log("읽음처리용 ajax통신 실패");
				}
			
			})
		}
		
	</script>
	
	<!-- 중요처리 -->
	<script>
		$(document).on("click", ".important", function(){
			
			let status;
			if($(this).children("i").hasClass("unimportant")){
				$(this).children("i").removeClass("unimportant");
				status = 'Y';
			}else{
				$(this).children("i").addClass("unimportant");
				status = 'N';
			}
			
			type = $(this).siblings("input[name=type]").val();
			changeImportanceT($(this).siblings("input[name=mNo]").val(), status, type);
	
		})
		
		function changeImportanceT(mNo,status, type){
			$.ajax({
				url:"webMail.changeImportanceT",
				data:{mNo:mNo, status:status, type:type},
				success:function(result){
					if(result > 0){
						selectTrashList($("#cPage").val());						
					}
				},error:function(){
					console.log("중요처리 ajax통신 실패");
				}
			})
		}
	</script>
	
	<!-- 휴지통 이동 -->
	<script>
		$(document).on("click", "#trash", function(){

			let mNo;
			let type;
			
			$(".checkbox:checked").each(function(){
				mNo = $(this).parent().siblings("input[name=mNo]").val();
				type = $(this).parent().siblings("input[name=type]").val();
				saveStatus = $(this).parent().siblings("input[name=save-status]").val();
				toMe = $(this).parent().siblings("input[name=to-me]").val();
				moveToTrash(mNo, type, saveStatus, toMe);
			});
			
		})
		
		function moveToTrash(mNo, type, saveStatus, toMe){
			$.ajax({
				url:"webMail.moveToTrashI",
				data:{
					mailNo:mNo, 
					type:type, 
					saveStatus:saveStatus, 
					toMe:toMe
				},
				success:function(result){
					if(result>0){
						$("#deleteCompleted").modal('show');
						selectImportantList($("#cPage").val());						
					}
				},error:function(){
					console.log("휴지통 이동 ajax통신 실패");
				}
			
			})
		}
		
	</script>
	
	<!-- 전달 기능 -->
	<script>
		$(document).on("click", "#forward", function(){
			
			let count = 0;
			
			$(".checkbox:checked").each(function(){
				count++;
			});
			
			let tNo;
			
			if(count > 1){
				alert("전달은 1개의 메일만 선택이 가능합니다.");
			}else{
				let mNo = $(".checkbox:checked").parent().siblings("input[name=mNo]").val();
				
				if($(".checkbox:checked").parent().siblings("input[name=type]").val() == 't'){
					tNo = 1;
				}else{
					tNo = 2;
				}
				
				location.href= "webMail.writeForwardForm?mNo=" + mNo + "&tNo=" + tNo;
			}
						
		})
		
	</script>
	
	<!-- 답장 기능 -->
	<script>
		$(document).on("click", "#reply", function(){
			
			let count = 0;
			
			$(".checkbox:checked").each(function(){
				count++;
			});
			
			if(count > 1){
				alert("답장은 1개의 메일만 선택이 가능합니다.");
			}else{
				if($(".checkbox:checked").parent().siblings("input[name=type]").val() == 'f'){
					alert("답장 가능한 메일이 아닙니다.");
				}else{
					let mNo = $(".checkbox:checked").parent().siblings("input[name=mNo]").val();
					location.href= "webMail.writeReplyForwardForm?mNo=" + mNo + "&tNo=1";					
				}
			}
						
		})
		
	</script>
	
</body>
</html>