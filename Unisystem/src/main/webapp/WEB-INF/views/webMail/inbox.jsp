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
        box-sizing: border-box;
    }
    #wrapper{
        width: 1500px;
        height: 1100px;
        margin: auto;
        margin-top: 30px;
    }

    /*내용 영역 스타일*/
    section{
        background-color: white;
        width: 1280px;
        height: 1000px;
        margin-bottom: 50px;
        margin-left: 20px;
        display: block;
        float: right;
        padding-top: 23px;
    }
    section::after{display:block;content:"";clear:both;}

    /*메일함 제목*/
    #inbox{
        color: rgb(15, 43, 80);
        font-size: 20px;
        font-weight: 900;
        width: 110px;
        margin-bottom: 10px;
    }
    #mail-boxes-header{
        margin-left: 50px;
    }

    /*버튼 모음*/
    #tools{
        margin-top: 35px;
        margin-bottom: 10px;
        width: 1300px;
        height: 30px;
    }
    /*왼쪽영역 버튼*/
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
    /*검색 영역*/
    #tools-right{
        margin-left: 800px;
        width: 400px;
        height: 30px;
        position: relative;
    }
    #search-option{
        height: 30px;
        width: 80px;
    }
    #tools-right>input{
        height: 30px;
        width: 200px;
        padding-right: 20px;
        margin-right: 20px;
        border: rgb(26, 86, 162) 2px solid;
        outline : rgb(26, 86, 162) 3px solid;
    }
    #tools-right>button{
        width: 20px;
        height: 15px;
        background-color: white;
        position: absolute;
        right: 27px;
        border: none;
        margin-top: 3px;
        outline: none;
    }
    #search-area input:focus{
        outline: 1px solid rgb(253, 173, 72);
    }
    #mail-search-btn{
        color: rgb(26, 86, 162);
    }
    /*메일리스트*/
    #list{
        width: 1200px;
        margin-left: 38px;
        border-top:darkgray 2px solid;
        border-bottom:darkgray 2px solid;
    }
    #list td{
        cursor: pointer;
    }
    /*열 서식*/
    .check-area{
        width: 2px;
    }
    .important{
        width:1px;
    }
    .read-status{
        width: 1px;
    }
    .from{
        width: 300px;
        text-align: center;
    }
    .title{
        width: 500px;
        text-align: center;
    }
    .date{
        width: 200px;
        text-align: right;
    }
    /*읽지 않은 메일일 경우 적용시킬 스타일*/
    .unread{
        color:rgb(35, 120, 232);
        font-weight: 800;
    }

    /*페이징바*/
    .container{
        margin-top: 50px;
    }
    .page-link{
        color:RGB(26,86,162)!important;
        border: none!important;
        border-radius: 200px!important;
    }
    .page-item.active .page-link {
        color: #fff !important;
        background: RGB(26,86,162)!important;
    }
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css">
</head>
<body>
	
	<jsp:include page="../common/header.jsp" />

    <div id="wrapper">

        <jsp:include page="webMailSidebar.jsp" />
        <section>
            <header id="mail-boxes-header">
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
                        <button><i class="fas fa-search fa-sm" id="mail-search-btn"></i></button>
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
                            <td class="att"><i class="fa fa-paperclip fa-sm" aria-hidden="true"></i></td>
                            <td class="from unread">김땡땡 교수님</td>
                            <td class="title unread">이번 기말고사에 관한 답변입니다.</td>
                            <td class="date">2022-01-18 16:29</td>
                        </tr>
                        <tr>
                            <td class="check-area"><input type="checkbox" class="checkbox"></td>
                            <td class="important"><i class="fa fa-star fa-xs" aria-hidden="true"></i></td>
                            <td class="read-status"><i class="far fa-envelope"></i></td>
                            <td class="att"><i class="fa fa-paperclip fa-sm" aria-hidden="true"></i></td>
                            <td class="from unread">김땡땡 교수님</td>
                            <td class="title unread">이번 기말고사에 관한 답변입니다.</td>
                            <td class="date">2022-01-18 16:29</td>
                        </tr>
                        <tr>
                            <td class="check-area"><input type="checkbox" class="checkbox"></td>
                            <td class="important"><i class="fa fa-star fa-xs" aria-hidden="true"></i></td>
                            <td class="read-status"><i class="far fa-envelope-open"></i></i></td>
                            <td class="att"><i class="fa fa-paperclip fa-sm" aria-hidden="true"></i></td>
                            <td class="from">김땡땡 교수님</td>
                            <td class="title">이번 기말고사에 관한 답변입니다.</td>
                            <td class="date">2022-01-18 16:29</td>
                        </tr>
                    </tbody>
                </table>
                
                <div class="container">
                    <ul class="pagination justify-content-center">
                      <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
                      <li class="page-item"><a class="page-link" href="#">1</a></li>
                      <li class="page-item active"><a class="page-link" href="#">2</a></li>
                      <li class="page-item"><a class="page-link" href="#">3</a></li>
                      <li class="page-item"><a class="page-link" href="#">4</a></li>
                      <li class="page-item"><a class="page-link" href="#">5</a></li>
                      <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
                    </ul>
                  </div>

            </article>
        </section>
    </div>

	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>