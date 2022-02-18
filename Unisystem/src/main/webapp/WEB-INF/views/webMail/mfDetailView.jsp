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
</head>
<body>
	<jsp:include page="../common/links.jsp"/>
	<jsp:include page="../common/header.jsp" />

    <div id="wrapper">

        <jsp:include page="webMailSidebar.jsp" />
        <section>
            <header id="mail-boxes-header">
                <div id="tools">
	                <button id="send-btn" type="submit"><i class="fas fa-arrow-right"></i>&nbsp;답장</button>
	                <button style="margin-left: -4px;">전달</button>
	                <button onclick="moveToTrash(${mf.mailNo});"><i class="fa fa-trash fa-sm" aria-hidden="true"></i>삭제</button>
	                <button style="margin-left: -5px;">스팸등록</button>
	                <buttononclick="history.back()">목록</button>                
                </div>
                <hr class="detail-lines">
                <div id="title-area">
                <c:choose>
                	<c:when test="${mf.important eq 'Y' }">
                		<i class="fa fa-star fa-xs" aria-hidden="true"></i>
                	</c:when>
                	<c:otherwise>
                		<i class='fa fa-star fa-xs' style='color:lightgray;' aria-hidden='true'></i>
                	</c:otherwise>
                </c:choose>
                	<span id="title">${mf.title}</span>
                </div>
                <div id="info-area">
               			<span>보낸 사람</span>${mf.fromName}&lt;${mf.address }&gt;<br>
                	<c:choose>
                	<c:when test="${mf.userToNo eq mf.address }">
               			<span>받는 사람</span>${mf.fromName}&lt;${mf.address}&gt;
               		</c:when>
               		<c:otherwise>
               			<span>받는 사람</span>${mf.userToName}&lt;${mf.userToNo}&gt;
               		</c:otherwise>
               		</c:choose>
                </div>
                <hr class="detail-lines">
            </header>
            <article>
                <div id="contents">
                	${mf.content}
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
		$(document).ready(function(){
			let $len = $("section").height();
			console.log($len);
			$("#webMail-sidebar").css('height', $len + 22);
		})
	</script>
	
	<script>
		function moveToTrash(mNo){
			$.ajax({
				url:"webMail.moveToTrash",
				data:{mNo:mNo,tNo:1},
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
	
</body>
</html>