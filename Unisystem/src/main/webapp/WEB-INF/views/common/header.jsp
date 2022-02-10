<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- font -->
link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&family=IBM+Plex+Sans+KR:wght@300&family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<style>
	body *{
		font-family: 'Gothic A1', sans-serif;
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
        margin-left: 1065px;
    }
    #header-up-right span, #header-up-right i{
        color: white;
        line-height: 43px;
        display: inline-block;
    }
    #header-up-right #logout{
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
</style>
</head>
<body>
    <header id="header">

        <div id="header-up">
        	<div id="header-up-line">
	            <div style="float: left;"><a href="" id="homepage">HOMEPAGE</a></div>
	            <div id="header-up-right" style="float: left;">
	                <i class="fas fa-user"></i>
	                <span>홍길동(학생)님 환영합니다.</span>
	                <a href="logout.me" id="logout">로그아웃 →</a>
	            </div>
            </div>
        </div>

        <div id="header-down">
        	<div id="header-down-line">
	            <img src="resources/images/LOGO_WIDTH.png">
	            <nav id="header-down-right">
	                <a href="">웹메일</a>
	                <a href="">마이페이지</a>
	                <a href="">공지사항</a>
	                <a href="list.bo">커뮤니티</a>
	                <div id="search-area">
	                    <input type="text" name="search" id="search">
	                    <button id="searchBtn" onclick=""><i class="fas fa-search"></i></button>
	                </div>
	            </nav>
            </div>
        </div>
    </header>
</body>
</html>