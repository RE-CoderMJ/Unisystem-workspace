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
<link href="resources/css/webMail/detailView.css" rel="stylesheet">
<style>
	.fa-star{
		cursor:pointer!important;
	}
</style>
</head>
<body>
	<jsp:include page="../common/links.jsp"/>
	<jsp:include page="../common/header.jsp" />

    <div id="wrapper">

        <jsp:include page="webMailSidebar.jsp" />
        <section>
            <header id="mail-boxes-header">
                <div id="tools">
	                <button id="send-btn" type="submit" class="reply"><i class="fas fa-arrow-right"></i>&nbsp;답장</button>
	                <button style="margin-left: -4px;" id="forward">전달</button>
	                <button onclick="moveToTrash(${mt.mailNo})"><i class="fa fa-trash fa-sm" aria-hidden="true"></i>삭제</button>
	                <button style="margin-left: -5px;">스팸등록</button>
	                <button onclick="history.back()">목록</button>                
                </div>
                <hr class="detail-lines">
                <div id="title-area">
                <c:choose>
                	<c:when test="${mt.important eq 'Y' }">
                		<i class="fa fa-star fa-xs" aria-hidden="true"></i>
                	</c:when>
                	<c:otherwise>
                		<i class='fa fa-star fa-xs unimportant' aria-hidden='true'></i>
                	</c:otherwise>
                </c:choose>
                &nbsp;
                	<span id="title">${mt.title}</span>
                </div>
                <div id="info-area">
               		<span>보낸 사람</span>${mt.userFromName}&lt;${mt.userFromAdd }&gt;<br>
               		<span>받는 사람</span>${mt.userToName}&lt;${mt.address}&gt;
                </div>
                <hr class="detail-lines">
            </header>
            <article>
                <div id="contents">
                	${mt.content}
                </div>
               
                <hr class="detail-lines" style="margin-left:55px;">
				<div id="att-area">
					<span id="att-title">첨부파일</span>
					<div id="att-list">
					<c:choose>
						<c:when test="${not empty attList}">
							<c:forEach var="att" items="${attList}">
								<div><a href="${att.path}${att.changeName}" download="${att.originName}">${ att.originName }</a></div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<div>첨부된 파일이 없습니다.</div>
						</c:otherwise>
					</c:choose>					
					</div>
				</div>                
               
            </article>
        </section>
    </div>

	<jsp:include page="../common/footer.jsp" />
	
	<script>
		function moveToTrash(mNo){
			$.ajax({
				url:"webMail.moveToTrash",
				data:{mNo:mNo,tNo:2},
				success:function(){
					$("#deleteCompleted").modal('show');
				},error:function(){
					console.log("휴지통 이동 ajax통신 실패");
				}
			
			})
		}
		
		$(document).on("click", "#deleteCompletedClosebtn", function(){
			history.back();
		})
	</script>
	
	<!-- 답장 기능 -->
	<script>
		$(document).on("click", ".reply", function(){
			
			let mNo = ${mt.mailNo};
			location.href= "webMail.writeReplyForwardForm?mNo=" + mNo + "&tNo=1";
						
		})
		
	</script>
	
	<!-- 전달 기능 -->
	<script>
		$(document).on("click", "#forward", function(){
			
			let mNo = ${mt.mailNo};
			location.href= "webMail.writeReplyForwardForm?mNo=" + mNo + "&tNo=2";
						
		})
		
	</script>
	
	<script>
		$(document).ready(function(){
			let $len = $("section").height();
			$("#webMail-sidebar").css('height', $len + 22);
		})
	</script>
	
	<!-- 중요처리 -->
	<script>
		$(document).on("click", ".fa-star", function(){
			
			let status;
			if($(this).hasClass("unimportant")){
				$(this).removeClass("unimportant");
				status = 'Y';
			}else{
				$(this).addClass("unimportant");
				status = 'N';
			}
			
			changeImportance(${mt.mailNo}, status);
	
		})
		
		function changeImportance(mNo,status){
			$.ajax({
				url:"webMail.changeImportance",
				data:{mNo:mNo, status:status, type:1},
				success:function(result){
					if(result > 0){
						location.reload();				
					}
				},error:function(){
					console.log("중요처리 ajax통신 실패");
				}
			})
		}
		
	</script>
	
</body>
</html>