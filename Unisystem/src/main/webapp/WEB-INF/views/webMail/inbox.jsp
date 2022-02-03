<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<style>
    div{
        border:  black 1px soli;
        box-sizing: border-box;
    }
    /*사이드바 전체영역 스타일*/
    #webMail-sidebar{
        background-color: white;
        width: 190px;
        height: 1000px;
        margin-top: 30px;
        margin-left: 200px;
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
    /*내용 영역 스타일*/
    section{
        background-color: white;
        width: 1270px;
        height: 1000px;
        margin-top: 30px;
        margin-left: 420px;
        margin-bottom: 50px;
        padding-top: 23px;
    }
    section::after{display:block;content:"";clear:both;}
    #mailboxes-header{
        margin-left: 39px;
        width: 1300px;
    }
    #inbox{
        color: rgb(15, 43, 80);
        font-size: 20px;
        font-weight: 900;
        width: 110px;
        margin-bottom: 10px;
    }
    #tools{
        margin-top: 35px;
        margin-bottom: 10px;
        width: 1300px;
        height: 30px;
    }
    #tools-left{
        float: left;
        width: 280px;
        height: 30px;
    }
    #tools-left>button{
        background-color: white;
        border: gray 1px solid;
        border-radius: 3px;
        font-size: 13px;
        color: rgb(36, 36, 36);
        margin-right: 1px;
        height: 25px;
    }
    #tools-right{
        margin-left: 300px;
        width: 400px;
        height: 30px;
    }
    #search-option{
        height: 25px;
        width: 80px;
    }
    #tools-right>input{
        height: 25px;
        width: 200px;
        padding-right: 20px;
        margin-right: 20px;
        border: rgb(26, 86, 162) 3px solid;
    }
    #tools-right>button{
        width: 20px;
        height: 20px;
        background-color: white;
        margin-left: -35px;
        margin-bottom: -30px;
        border: none;
    }
    #list{
        width: 1200px;
        margin-left: 30px;
        border-top:darkgray 2px solid;
    }
    .check-area{
        width: 2px;
    }
    .important{
        width:1px;
    }
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css">
</head>
<body>
	
	<jsp:include page="../common/header.jsp" />
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
	<section>
        <header id="mailboxes-header">
            <div id="inbox">받은 메일함</div>
            <div id="tools">
                <div id="tools-left">
                    <input type="checkbox" class="checkbox">
                    <button style="margin-left: 10px;">읽음</button>
                    <button><i class="fa fa-trash fa-sm" aria-hidden="true"></i>삭제</button>
                    <button style="margin-left: -5px;">스팸등록</button>
                    <button>답장</button>
                    <button style="margin-left: -4px;">전달</button>
                </div>
                <div id="tools-right" align="right">
                    <select name="" id="search-option">
                        <option value="">전체</option>
                        <option value="">제목+내용</option>
                        <option value="">보낸사람</option>
                    </select>
                    <input type="search" name="" id="">
                    <button><i class="fas fa-search"></i></button>
                </div>
            </div>
        </header>
        <article>
            <table class="table table-hover" id="list">
                <tbody>
                    <tr>
                        <td class="check-area"><input type="checkbox" class="checkbox"></td>
                        <td class="important"><i class="fa fa-star fa-xs" aria-hidden="true"></i></td>
                        <td class="read-status"><i class="far fa-envelope"></i></td>
                        <td  class="att"><i class="fa fa-paperclip fa-sm" aria-hidden="true"></i></td>
                        <td>김땡땡 교수님</td>
                        <td>이번 기말고사에 관한 답변입니다.</td>
                        <td>2022-01-18 16:29</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" class="checkbox"></td>
                        <td class="important"><i class="fa fa-star fa-xs" aria-hidden="true"></i></td>
                        <td class="read-status"><i class="far fa-envelope"></i></td>
                        <td  class="att"><i class="fa fa-paperclip fa-sm" aria-hidden="true"></i></td>
                        <td>김땡땡 교수님</td>
                        <td>이번 기말고사에 관한 답변입니다.</td>
                        <td>2022-01-18 16:29</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" class="checkbox"></td>
                        <td class="important"><i class="fa fa-star fa-xs" aria-hidden="true"></i></td>
                        <td class="read-status"><i class="far fa-envelope-open"></i></td>
                        <td class="att"><i class="fa fa-paperclip fa-sm" aria-hidden="true"></i></td>
                        <td>김땡땡 교수님</td>
                        <td>이번 기말고사에 관한 답변입니다.</td>
                        <td>2022-01-18 16:29</td>
                    </tr>
                </tbody>
              </table>
            </div>
        </article>
    </section>

	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>