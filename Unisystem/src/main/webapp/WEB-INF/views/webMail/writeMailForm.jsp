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
    #mail-info{
        width: 1170px;
        margin: auto;
        margin-top: 40px;
        margin-bottom:50px;
    }
    #mail-info>span{
        font-weight: 900;
    }
    #mail-info>input{
        width: 1060px;
        height: 30px;
    }
    #write-to{
        margin-left: 18px;
    }
    #write-cc, #write-title{
        margin-left: 50px;
    }
	#contents-area{
		margin-top:30px;
		margin-left:80px;
	}
	#file{
		width:200px;
		margin-left: 80px;
		margin-top:30px;
	}
	#send-btn, #draft-btn{
		background: white;
		height: 30px;
		border: solid darkgray 1px;
		border-radius:2px;
		margin-right : 5px;
		margin-top : 10px;
	}
	.fa-arrow-right{
		color: RGB(26,86,162);
	}
	.footer_right{
		 margin-left:160px!important;
	}
	.footer_right label{
		 font-weight:normal!important;
	}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />

    <div id="wrapper">

        <jsp:include page="webMailSidebar.jsp" />
        <section>
        	<form method="post" enctype="multipart/form-data">
	            <header id="mail-boxes-header">
	                <div id="mailbox-name">메일 쓰기</div>
	                <br><br>
	                <button id="send-btn" type="submit" formaction="webMail.send"><i class="fas fa-arrow-right"></i>&nbsp;보내기</button>
	                <button id="draft-btn" type="submit" formaction="webMail.saveDraft">임시저장</button>
	            </header>
	            <article>
	               <div id="mail-info">
	               		<input type="hidden" name="userNo" value="${ loginUser.userNo }">
	               		<input type="hidden" name="mNo" value="${mf.mailNo}">
	                    <span>받는 사람</span>
	                    <c:choose>
	                    	<c:when test="${ address eq null }">
			                    <input id="write-to" type="text" name="userToNo" required value="${mf.userToNo > null ? ' ' : mf.userToNo }" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);">
							</c:when>
							<c:otherwise>
								<input id="write-to" type=***************"text" name="userToNo" required value="${address}" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);">
							</c:otherwise>	                    	                    	
	               		</c:choose>
	                    <br><br> 
	                    <span>참조</span>
	                    <input id="write-cc" type="text" name="cc" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);">
	                    <br><br>
	                    <span>제목</span>
	                    <input id="write-title" type="text" name="title" value="${mf.title > null ? ' ' : mf.title }">
	                    <div id="contents-area">
	                    	<textarea id="summernote" name="content" style="margin-left:100px">${mf.content > null ? ' ' : mf.content }</textarea>
	                    </div>
	                 	<input type="file" multiple id="files" name="files">
	               </div>
	            </article>
            </form>
        </section>
    </div>	
	
	<!-- include libraries(jQuery, bootstrap) -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<!-- include summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<script>
		$(document).ready(function(){
			$("#summernote").summernote({
				width: 1060,
				height: 500,
				minHeight: null,
				maxHeight: null,
				focus: true,
				lang: "ko-KR",
				placeholder : '최대 자까지 쓸 수 있습니다.',
				toolbar: [
					    // [groupName, [list of button]]
					    ['fontname', ['fontname']],
					    ['fontsize', ['fontsize']],
					    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
					    ['color', ['forecolor','color']],
					    ['table', ['table']],
					    ['para', ['ul', 'ol', 'paragraph']],
					    ['height', ['height']],
				],
				fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
				fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
			});
			
			let $len = $("section").height();
			$("#webMail-sidebar").css('height', $len + 22);
		});
		
	</script>
	
	<script>
		function noSpaceForm(obj) { // 공백사용못하게
		    var str_space = /\s/;  // 공백체크
		    if(str_space.exec(obj.value)) { //공백 체크
		        alert("해당 항목에는 공백을 사용할수 없습니다.\n\n공백은 자동적으로 제거 됩니다.");
		        obj.focus();
		        obj.value = obj.value.replace(' ',''); // 공백제거
		        return false;
		    }
		}
	</script>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>