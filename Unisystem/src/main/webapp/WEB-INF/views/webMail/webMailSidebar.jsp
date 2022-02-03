<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<style>
	/*사이드바 전체영역 스타일*/
    #webMail-sidebar{
        background-color: white;
        width: 190px;
        height: 1000px;
        float: left;
    }
    .sidebar-lines{
        margin-left: 5px;
        margin-right: 5px;
        border: darkgray solid 1px;
    }

    /*메일쓰기, 내게쓰기 스타일*/
    #btn-wrapper{
        width: 100%;
        height: 60px;
        padding: 20px 15px;
    }
    #btn-wrapper>button{
        width: 75px;
        height: 35px;
        background-color: RGB(26,86,162);
        color: white;
        border:none;
        border-radius: 3px;
        font-weight: 550;
        font-size: 14px;
    }
    #writeMail{
        margin-right: 3px;
    }
    /*안읽음, 중요, 첨부*/
    #top{
        margin-left: 12px;
        margin-top: 13px;
    }
    #top::after{display:block;content:"";clear:both;}
    #top>div{
        float: left;
        width: 55px;
        height: 40px;
    }
    #top>div>div{
        font-size: 13px;;
    }
    #unread-count{
        color: RGB(26,86,162);
        font-weight: 700;
        font-size: 17px;
    }
    #important{
        margin-top: -3px;
    }
    .fa-star{color:RGB(252,175,23);}
    #att{
        margin-top: -2px;
    }
    .fa-paperclip{color: gray;}
    
    /*메일함*/
    #mail-boxes{
        margin-top: 13px;
        margin-bottom: 13px;
    }
    #mail-boxes>div{
        width: 100%;
        height: 30px;
        line-height: 29px;
        padding-left: 13px;
        font-size: 13px;
        cursor: pointer;
    }
    #mail-boxes>div:hover{
        background-color: rgba(211, 209, 209, 0.34);
    }
    #mail-boxes span{
        color: RGB(26,86,162);
        font-weight: 700;
        font-size: 13px;
        margin-left: 10px;
        height: 100%;
        line-height: 29px;
    }
    #mail-boxes button{
        background-color: white;
        border: gray solid 1px;
        border-radius: 3px;
        font-size: 13px;
        width: 67px;
        height: 23px;
        line-height: 20px;
        margin-left: 35px;
    }
    .fa-trash{
        color: gray;
        cursor: pointer;
    }
    
    /*주소록*/
    #contact{
        width: 100%;
        height: 40px;
        line-height: 29px;
        padding-left: 13px;
        font-size: 13px;
        cursor: pointer;
    }
    #contact:hover{
        background-color: rgba(211, 209, 209, 0.34);
    }
    #contact span{
        font-size: 16px;
        font-weight: 600;
        margin-left: 10px;
    }
    .fa-address-book{
        color:  RGB(26,86,162);
        height: 40px;
        margin-top: 7px;
    }
</style>
</head>
<body>
	<nav id="webMail-sidebar">
            <div id="btn-wrapper">
                <button id="writeMail">메일쓰기</button>
                <button id="writeMailToMS">내게쓰기</button>
            </div>
            <div id="top" align="center">
                <div id="unread">
                    <div id="unread-count">6</div><div>안읽음</div>
                </div>
                <div id="important">
                    <i class="fa fa-star fa-xs" aria-hidden="true"></i><div>중요</div>
                </div>
                <div id="att">
                    <i class="fa fa-paperclip fa-sm" aria-hidden="true"></i><div>첨부</div>
                </div>
            </div>
            <hr class="sidebar-lines">
            <div id="mail-boxes">
                <div>받은메일함 <span>6</span></div>
                <div>내게쓴메일함</div>
                <div>보낸메일함<button>수신확인</button></div>
                <div>임시보관함</div>
                <div>
                    스팸메일함
                    <span>10</span>
                    <i class="fa fa-trash fa-sm" aria-hidden="true" style="margin-left: 55px;"></i>
                </div>
                <div>
                    휴지통
                    <span>32</span>
                    <i class="fa fa-trash fa-sm" aria-hidden="true" style="margin-left: 80px;"></i>
                </div>
            </div>
            <hr class="sidebar-lines">
            <div id="contact">
                <i class="fa fa-address-book fa-2x" aria-hidden="true"></i>
                <span>주소록</span>
            </div>
        </nav>
</body>
</html>