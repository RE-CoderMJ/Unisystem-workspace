<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
<!-- Font Awesome -->
<!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"> -->
<script src="https://kit.fontawesome.com/5e10b477ce.js" crossorigin="anonymous"></script>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
	body *{
		font-family: 'Noto Sans KR', sans-serif;
	}
    #header-up{
        background-color: rgb(21, 62, 115);
        height: 43px;
    }
	#header-up-line{
    	width:1500px;
    	height:43px;
    	margin: auto;
    }
    #homepage{
        background-color: rgb(14, 43, 80);
        color: white;
        height: 43px;
        display: block;
        width: 100px;
        font-weight: 400;
        font-size: 17px;
        text-decoration: none;
        text-align: center;
        line-height: 43px;
    }
    #header-up-right{
        margin-left: 967px;
    }
    #header-up-right span, #header-up-right i{
        color: white;
        line-height: 43px;
        display: inline-block;
    }
    #header-up-right .logout{
        background-color: rgb(14, 43, 80);
        color: white;
        height: 43px;
        width: 100px;
        display: block;
        float: right;
        margin-left: 20px;
        line-height: 43px;
        text-align: center;
        font-weight: 500;
        text-decoration: none;
    }
    #header-down{
        height: 120px;
        background-color: white;
    }
    #header-down-line{
    	width:1500px;
    	height:120px;
    	margin: auto;
    }
    #header-down img{
        width: 320px;
        
    }
    #header-down-right{
        display: inline-block;
        margin-left: 470px;
        margin-top: 35px;
    }
    #header-down-right a{
        color: black;
        margin: 0px 10px;
        font-size: 17px;
    }
    #header-down-right a:hover{
        text-decoration: none;
        color: rgb(26, 86, 162);
        font-weight:bolder;
    }
    #search-area{
        display: inline-block;
        margin-left: 50px;
        position: relative;
    }
    #search-area input{
        border: 2px solid rgb(253, 173, 72);
        padding: 3px 5px;
        width: 280px;
        height: 40px;
    }
    #search-area input:focus{
        outline: 1px solid rgb(253, 173, 72);
    }
    #searchBtn{
        border: none;
        background-color: white;
        color: rgb(253, 173, 72);
        position: absolute;
        left: 245px;
        top: 8px;
    }
    #searchBtn:focus{
        outline: none;
    }
    .msg img{
     height: 30px;
    display: inline-block;
    margin-top: 6px;
    margin-left: 10px;
    }
    .msg{
    color:white;
    }
</style>
</head>
<body>

	<c:if test="${ not empty alertMsg }">
		<script>
			alertify.alert("${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>
	
	<div id="socketAlert"class="alert alert-primary" style="display:none;">
	</div>
	
    <header id="header">
        <div id="header-up">
        	<div id="header-up-line">
	            <div style="float: left;"><a href="enview" id="homepage">HOMEPAGE</a></div>
	            
	            <div style="float: left;" class="msg">
	            <a href="list.msg"><img src="resources/images/msg_icon.png"></a>
	            <div style="margin-top:-28px; margin-left: 42px;">
	            <b>(&nbsp;<span id="msgCount"></span>&nbsp;)</b>
	            </div>
	            </div>
	           
	           
	            <div id="header-up-right" style="float: left;">
	                <i class="fas fa-user"></i>
	                <span>${loginUser.korName}
	                <c:choose>
	                <c:when test="${loginUser.userDiv eq 1}">
	                (학생)님 환영합니다.
	                </c:when>
	                <c:when test="${loginUser.userDiv eq 2}">
	                 (교수)님 환영합니다.
	                </c:when>
	                <c:when test="${loginUser.userDiv eq 3}">
	               	 페이지 입니다.
	                </c:when>
	                <c:otherwise>
	             		로그인 후 이용해주세요.
	                </c:otherwise>
	                </c:choose>
	                
	                </span>
	                
	                <c:choose>
	                <c:when test="${ not empty loginUser }">
	                <a href="logout.me" class="logout">로그아웃 →</a>
	                </c:when>
	                <c:when test="${ empty loginUser }">
	                <a href="loginMain" class="logout">로그인 →</a>
	                </c:when>
	                </c:choose>
	            </div>
            </div>
        </div>

        <div id="header-down">
        	<div id="header-down-line">
	            <a href="enview"><img src="resources/images/LOGO_WIDTH.png"></a>
	            <nav id="header-down-right">

	                <a href="webMail.inbox">웹메일</a>
					
					<!-- 마이페이지 : 학생일 때 -->
					<c:if test="${ loginUser.userDiv eq 1 }">
		                <a href="list.st">마이페이지</a>
					</c:if>
					
					<!-- 마이페이지 : 교수일 때 -->
					<c:if test="${ loginUser.userDiv eq 2 }">
		                <a href="list.pr">마이페이지</a>
					</c:if>	
					
					<!-- 마이페이지 : 관리자일 때 -->
					<c:if test="${ loginUser.userDiv eq 3 }">
		                <a href="student.ad">마이페이지</a>
					</c:if>					
					
									
	                <a href="list.nbo">공지사항</a>

	                <a href="list.bo">커뮤니티</a>
	                <div id="search-area">
	                    <input type="text" name="search" id="search">
	                    <button id="searchBtn" onclick=""><i class="fas fa-search"></i></button>
	                </div>
	            </nav>
            </div>
        </div>
        
    </header>
    
    <!-- 웹소켓 js -->
    <script>
	var socket = null; //다른페이지 어디서든 소켓으로 메시지를 보낼수 있도록 전역변수처리 
	
	$(document).ready(function(){
		connectWS();
		
		unreadMsg();
	});
	
	function connectWS(){
		//msg websocket
		var ws = new WebSocket("ws://localhost:8009/uni/msgEcho");
		socket = ws;
	    ws.onopen = function () {
	        console.log('Info: connection opened.');
	    };
	
	
	    ws.onmessage = function (event) {
	        console.log("ReceiveMessage:", event.data+'\n');
	       let $socketAlert =  $('div #socketAlert');
	       $socketAlert.html(event.data);
	       $socketAlert.css('display','block');
	       
	       setTimeout(function(){
	    	   $socketAlert.css('display','none');
	       }, 5000);
	    };
	
	
	    ws.onclose = function (event) { 
	    	console.log('Info: connection closed.'); 
	    	//setTimeout( function(){ connect(); }, 1000); // retry connection!!
	    };
	    ws.onerror = function (err) { console.log('Error',err); };
	}
	
	function unreadMsg(){
		$.ajax({
			type: 'POST',  
			dataType:'json',
			url:"unread.msg",
			data:{userNo:'${loginUser.userNo}'},
			success:function(data){
				
				console.log(data);
				
					let value=""
					value += data;
					$('#msgCount').html(value);
					
					}//success
					
			, error:function() {
			console.log("안읽은 메시지 갯수 ajax 통신조회실패");
					}//error	
			});//ajax끝
	}
	
	
    </script>
    
  
</body>
</html>