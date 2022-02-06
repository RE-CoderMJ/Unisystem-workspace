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
    #mails{
        width: 1180px;
        height: auto;
        min-height: 100px;
        margin-left: 90px;
        margin-top: 30px;
    }
    #mails::after{display:block;content:"";clear:both;}
    .mail{
        width: 340px;
        height: 150px;
        border: 1px gray solid;
        float: left;
        margin-right: 50px;
        margin-bottom: 50px;
    }
    .mail>div{
        float:left;
    }

    .checkbox-att{
        display: block;
        width: 15px;
        height: 15px;
        margin-left: 10px;
        margin-top:10px;
        float:left
    }
    .important-att{
        width: 20px;
        height: 20px;
        margin-left: 10px;
        margin-top : 4px;
    }
    .read-status-att{
        width: 20px;
        height: 20px;
        margin-left: 5px;
        margin-top : 4px;
    }
    .from-att{
        width: 60px;
        margin-left: 20px;
        margin-top : 6px;
    }
    .date-att{
        width: 120px;
        margin-left: 50px;
        margin-top : 4px;
        font-size: 15px;
    }
    .title-att{
        width: 200px;
        margin-left: 10px;
        margin-top : 4px;
        font-size: 15px;
    }
    .line-att{
        border: solid darkgray 1px;
        width: 320px;
        margin-top: 65px;
        margin-bottom: -15px;
    }
    .mail a{
        font-size: 15px;
        margin-left: 10px;
    }
</style>
</head>
<body>
	<jsp:include page="../common/links.jsp"/>
	<jsp:include page="../common/header.jsp" />

    <div id="wrapper">

        <jsp:include page="webMailSidebar.jsp" />
        <section>
            <header id="mail-boxes-header">
                <div id="mailbox-name">첨부파일이 있는 메일</div>
                <div id="mail-count">
                	<span id="unread-count">6</span><span> / 65</span>
                </div>
                <button id="redo"><i class="fas fa-redo fa-xs"></i></button>
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
                <div id="mails">
                    <div class="mail">
                        <input class="checkbox-att" type="checkbox">
                        <div class="important-att"><i class="fa fa-star fa-sm" aria-hidden="true"></i></div>
                        <div class="read-status-att"><i class="far fa-envelope-open"></i></div>
                        <div class="from-att">김나다</div>
                        <div class="date-att">2022-01-19 22:05</div>
                        <div class="title-att">[보낸메일함] 질문드립니다.</div>
                        <hr class="line-att"><br>
                        <a href="">첨부파일.hwp</a><br>
                        <a href="">질문지.pdf</a>
                    </div>
                    <div class="mail">
                        <input class="checkbox-att" type="checkbox">
                        <div class="important-att"><i class="fa fa-star fa-sm" aria-hidden="true"></i></div>
                        <div class="read-status-att"><i class="far fa-envelope-open"></i></div>
                        <div class="from-att">김나다</div>
                        <div class="date-att">2022-01-19 22:05</div>
                        <div class="title-att">[보낸메일함] 질문드립니다.</div>
                        <hr class="line-att"><br>
                        <a href="">첨부파일.hwp</a><br>
                        <a href="">질문지.pdf</a>
                    </div>
                    <div class="mail">
                        <input class="checkbox-att" type="checkbox">
                        <div class="important-att"><i class="fa fa-star fa-sm" aria-hidden="true"></i></div>
                        <div class="read-status-att"><i class="far fa-envelope-open"></i></div>
                        <div class="from-att">김나다</div>
                        <div class="date-att">2022-01-19 22:05</div>
                        <div class="title-att">[보낸메일함] 질문드립니다.</div>
                        <hr class="line-att"><br>
                        <a href="">첨부파일.hwp</a><br>
                        <a href="">질문지.pdf</a>
                    </div>
                    <div class="mail">
                        <input class="checkbox-att" type="checkbox">
                        <div class="important-att"><i class="fa fa-star fa-sm" aria-hidden="true"></i></div>
                        <div class="read-status-att"><i class="far fa-envelope-open"></i></div>
                        <div class="from-att">김나다</div>
                        <div class="date-att">2022-01-19 22:05</div>
                        <div class="title-att">[보낸메일함] 질문드립니다.</div>
                        <hr class="line-att"><br>
                        <a href="">첨부파일.hwp</a><br>
                        <a href="">질문지.pdf</a>
                    </div>
                    <div class="mail">
                        <input class="checkbox-att" type="checkbox">
                        <div class="important-att"><i class="fa fa-star fa-sm" aria-hidden="true"></i></div>
                        <div class="read-status-att"><i class="far fa-envelope-open"></i></div>
                        <div class="from-att">김나다</div>
                        <div class="date-att">2022-01-19 22:05</div>
                        <div class="title-att">[보낸메일함] 질문드립니다.</div>
                        <hr class="line-att"><br>
                        <a href="">첨부파일.hwp</a><br>
                        <a href="">질문지.pdf</a>
                    </div>
                    <div class="mail">
                        <input class="checkbox-att" type="checkbox">
                        <div class="important-att"><i class="fa fa-star fa-sm" aria-hidden="true"></i></div>
                        <div class="read-status-att"><i class="far fa-envelope-open"></i></div>
                        <div class="from-att">김나다</div>
                        <div class="date-att">2022-01-19 22:05</div>
                        <div class="title-att">[보낸메일함] 질문드립니다.</div>
                        <hr class="line-att"><br>
                        <a href="">첨부파일.hwp</a><br>
                        <a href="">질문지.pdf</a>
                    </div>
                    <div class="mail">
                        <input class="checkbox-att" type="checkbox">
                        <div class="important-att"><i class="fa fa-star fa-sm" aria-hidden="true"></i></div>
                        <div class="read-status-att"><i class="far fa-envelope-open"></i></div>
                        <div class="from-att">김나다</div>
                        <div class="date-att">2022-01-19 22:05</div>
                        <div class="title-att">[보낸메일함] 질문드립니다.</div>
                        <hr class="line-att"><br>
                        <a href="">첨부파일.hwp</a><br>
                        <a href="">질문지.pdf</a>
                    </div>
                    <div class="mail">
                        <input class="checkbox-att" type="checkbox">
                        <div class="important-att"><i class="fa fa-star fa-sm" aria-hidden="true"></i></div>
                        <div class="read-status-att"><i class="far fa-envelope-open"></i></div>
                        <div class="from-att">김나다</div>
                        <div class="date-att">2022-01-19 22:05</div>
                        <div class="title-att">[보낸메일함] 질문드립니다.</div>
                        <hr class="line-att"><br>
                        <a href="">첨부파일.hwp</a><br>
                        <a href="">질문지.pdf</a>
                    </div>
                    
                </div>
                
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