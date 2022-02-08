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
	                <button><i class="fa fa-trash fa-sm" aria-hidden="true"></i>삭제</button>
	                <button style="margin-left: -5px;">스팸등록</button>
	                <button>목록</button>                
                </div>
                <hr class="detail-lines">
                <div id="title-area">
                	<i class="fa fa-star fa-xs" aria-hidden="true"></i>
                	<span id="title">기말고사 질문에 대한 답변입니다.</span>
                </div>
                <div id="info-area">
               		<span>보낸 사람</span>김땡땡&lt;kimprof12@unisystem.com&gt;<br>
               		<span>받는 사람</span>김나다&lt;20221394@unisystem.com&gt;
                </div>
                <hr class="detail-lines">
            </header>
            <article>
                <div id="contents">
                	남는 것은 영락과 부패 뿐이다 낙원을 장식하는 천자만홍이 어디 있으며 인생을 풍부하게 하는 온갖 과실이 어디<br><br>

					능히 품으며 그들의 이상은 아름답고 소담스러운 열매를 맺어 우리 인생을 풍부하게 하는 것이다 보라 청춘을 ! 그들의 몸이 얼마나 튼튼하며 그들의 피부가 얼마나 생생하며 그들의 눈에 무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 우리의 귀는 생의 찬미를 듣는다 그것은 웅대한 관현악이며<br><br>
					
					맺어 우리 인생을 풍부하게 하는 것이다 보라 청춘을 ! 그들의 몸이 얼마나 튼튼하며 그들의 피부가 얼마나 생생하며 그들의 눈에 무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 우리의<br><br>
					남는 것은 영락과 부패 뿐이다 낙원을 장식하는 천자만홍이 어디 있으며 인생을 풍부하게 하는 온갖 과실이 어디<br><br>

                </div>
               
                <hr class="detail-lines" style="margin-left:55px;">
				<div id="att-area">
					<span id="att-title">첨부파일</span>
					<div id="att-list">
						<div>설명.hwp</div>
						<div>설명2.hwp</div>					
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
	
</body>
</html>