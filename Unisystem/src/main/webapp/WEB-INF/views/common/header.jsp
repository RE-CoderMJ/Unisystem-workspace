<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

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
    #header{
        width: 1500px;
        margin: auto;
    }
    #header-up{
        background-color: rgb(21, 62, 115);
        height: 35px; 
    }
    #header-up #homepage{
        margin-left: 80px;
        background-color: rgb(14, 43, 80);
        color: white;
        padding: 5px 10px;
        height: 35px;
        display: block;
        width: 100px;
    }
    #header-up-right{
        margin-left: 950px;
    }
    #header-up-right span, #header-up-right i{
        color: white;
        vertical-align: middle;
        display: inline-block;
        margin-top: 3px;
    }
    #header-up-right #logout{
        background-color: rgb(14, 43, 80);
        color: white;
        padding: 5px 10px;
        height: 35px;
        display: block;
        float: right;
        margin-left: 20px;
    }
    #header-down{
        margin: 10px 0;
    }
    #header-down img{
        width: 300px;
        margin-left: 70px;
    }
    #header-down-right{
        display: inline-block;
        margin-left: 300px;
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
    <div id="header">

        <div id="header-up">
            <div style="float: left;"><a href="" id="homepage">HOMEPAGE</a></div>
            <div id="header-up-right" style="float: left;">
                <i class="fas fa-user"></i>
                <span>홍길동(학생)님 환영합니다.</span>
                <a href="" id="logout">로그아웃 →</a>
            </div>
        </div>

        <div id="header-down">
            <img src="resources/images/LOGO_WIDTH.png">
            <div id="header-down-right">
                <a href="">웹메일</a>
                <a href="">마이페이지</a>
                <a href="">공지사항</a>
                <a href="">커뮤니티</a>
                <div id="search-area">
                    <input type="text" name="search" id="search">
                    <button id="searchBtn" onclick=""><i class="fas fa-search"></i></button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>