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
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<style>
    #mail-info{
    	border: solid 1px black;
        width: 1170px;
        margin: auto;
        margin-top: 40px;
    }
    #mail-info>span{
        font-weight: 900;
    }
    #mail-info>input{
        width: 1060px;
        height: 30px;
    }
    #write-to{
        margin-left: 15px;
    }
    #write-cc, #write-title{
        margin-left: 50px;
    }
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />

    <div id="wrapper">

        <jsp:include page="webMailSidebar.jsp" />
        <section>
        	<form method="post">
	            <header id="mail-boxes-header">
	                <div id="mailbox-name">메일 쓰기</div>
	                <button><i class="fas fa-arrow-right"></i>보내기</button>
	                <button>임시저장</button>
	            </header>
	            <article>
	               <div id="mail-info">
	                    <span>받는 사람</span>
	                    <input id="write-to" type="text">
	                    <br><br>
	                    <span>참조</span>
	                    <input id="write-cc" type="text">
	                    <br><br>
	                    <span>제목</span>
	                    <input id="write-title" type="text">
	                    <textarea id="summernote" name="editordata"></textarea>
	               </div>
	            </article>
            </form>
        </section>
    </div>
	
	<jsp:include page="../common/footer.jsp" />
	
	<script>
		$(document).ready(function() {
			$('#summernote').summernote({
				placeholder: 'Hello Bootstrap 4',
				tabsize: 2,
				height: 100
			});
		});
	</script>

	<!--
	<script>
		$(document).ready(function(){
			$("#summernote").summernote({
				height: 300,
				minHeight: null,
				maxHeight: null,
				focus: true,
				lang: "ko-KR",
				placeholder : '최대 자까지 쓸 수 있습니다.'
			});
		});
	</script>
	-->
</body>
</html>