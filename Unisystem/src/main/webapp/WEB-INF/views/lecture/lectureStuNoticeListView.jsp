<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<style>
    #wrap{
        height: 900px;
        width: 1500px;
        margin: auto;
    }
    
    /* page header 영역 */
    #content_header{
        margin-top: 30px;
        margin-left: 30px;
        font-size: 24px;
        font-weight: 900;
    }
    
    /*공지사항 영역*/
    #noticeBox{
        margin-left: 30px;
        margin-top: 30px;
        width: 1290px;
        height: 700px;
        background-color: white;
    }
    #noticeBox table{
        margin-left: 30px; margin-top: 5px;
        width: 1230px;
        text-align: center;
    }
    #noticeBox table thead th:first-child{width: 60px;}
    #noticeBox table thead th:nth-child(2){width: 800px;}
    #noticeBox table thead th:nth-child(3){width: 80px;}
    #noticeBox table thead th:nth-child(4){width: 100px;}
    #noticeBox table thead th:nth-child(5){width: 60px;}
    #noticeBox table thead th, #noticeBox table tbody td{padding: 3px 0;}
    #noticeBox table thead tr th{border-top: 2px solid lightgray; background-color: #eeeeee;}
    #noticeBox table tbody tr td{border-top: 1px solid lightgray;}
    #noticeBox table tbody tr:last-child{border-bottom: 2px solid lightgray;}
    #noticeBox table tbody tr td a{color: black;}
    #noticeCount{
        margin-left: 30px;
        padding-top: 30px;
        font-weight: 500;
    }
    #noticeCount>span{color: #F39C12;}
    
    /* 페이징바 css */
    .pagination {
        display: inline-block;
        width:fit-content;
        margin:auto;
        margin-top: 30px;
    }
    .pagination a {
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
    border: 1px solid #ddd;
    }

    .pagination a.active {
    background-color: #153E73;
    color: white;
    border: 1px solid #153E73;
    }

    .pagination a:hover:not(.active) {background-color: #ddd;}

    .pagination a:first-child {
    border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
    }

    .pagination a:last-child {
    border-top-right-radius: 5px;
    border-bottom-right-radius: 5px;
    }
    
    /* footer css */
    #wrap::after{display:block;content:"";clear:both;}
</style>
</head>
<body>
    <!-- header 영역 -->
    <jsp:include page="../common/header.jsp" />
    
    <div id="wrap">
        
        <div style="float: left;">
            <!-- sidebar 영역 -->
            <jsp:include page="../student/sclassSidebar.jsp" />
        </div>

        <div id="wrap_content" style="float: left;">

            <article id="content_header">공지사항</article>

            <div id="noticeBox">

                <div id="noticeCount">총 <span>33</span>개의 글</div>
                
                <table>
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>33</td>
                            <td>
                                <a href="">[기말시험 대체 과제물]</a>
                                <span><i class="fas fa-paperclip"></i></span>
                            </td>
                            <td>김말똥</td>
                            <td>2022.01.01</td>
                            <td>13</td>
                        </tr>
                        <tr>
                            <td>33</td>
                            <td>
                                <a href="">[기말시험 대체 과제물]</a>
                                <span><i class="fas fa-paperclip"></i></span>
                            </td>
                            <td>김말똥</td>
                            <td>2022.01.01</td>
                            <td>13</td>
                        </tr>
                        <tr>
                            <td>33</td>
                            <td>
                                <a href="">[기말시험 대체 과제물]</a>
                                <span><i class="fas fa-paperclip"></i></span>
                            </td>
                            <td>김말똥</td>
                            <td>2022.01.01</td>
                            <td>13</td>
                        </tr>
                        <tr>
                            <td>33</td>
                            <td>
                                <a href="">[기말시험 대체 과제물]</a>
                                <span><i class="fas fa-paperclip"></i></span>
                            </td>
                            <td>김말똥</td>
                            <td>2022.01.01</td>
                            <td>13</td>
                        </tr>
                        <tr>
                            <td>33</td>
                            <td>
                                <a href="">[기말시험 대체 과제물]</a>
                                <span><i class="fas fa-paperclip"></i></span>
                            </td>
                            <td>김말똥</td>
                            <td>2022.01.01</td>
                            <td>13</td>
                        </tr>
                        <tr>
                            <td>33</td>
                            <td>
                                <a href="">[기말시험 대체 과제물]</a>
                                <span><i class="fas fa-paperclip"></i></span>
                            </td>
                            <td>김말똥</td>
                            <td>2022.01.01</td>
                            <td>13</td>
                        </tr>
                        <tr>
                            <td>33</td>
                            <td>
                                <a href="">[기말시험 대체 과제물]</a>
                                <span><i class="fas fa-paperclip"></i></span>
                            </td>
                            <td>김말똥</td>
                            <td>2022.01.01</td>
                            <td>13</td>
                        </tr>
                        <tr>
                            <td>33</td>
                            <td>
                                <a href="">[기말시험 대체 과제물]</a>
                                <span><i class="fas fa-paperclip"></i></span>
                            </td>
                            <td>김말똥</td>
                            <td>2022.01.01</td>
                            <td>13</td>
                        </tr>
                        <tr>
                            <td>33</td>
                            <td>
                                <a href="">[기말시험 대체 과제물]</a>
                                <span><i class="fas fa-paperclip"></i></span>
                            </td>
                            <td>김말똥</td>
                            <td>2022.01.01</td>
                            <td>13</td>
                        </tr>
                        <tr>
                            <td>33</td>
                            <td>
                                <a href="">[기말시험 대체 과제물]</a>
                                <span><i class="fas fa-paperclip"></i></span>
                            </td>
                            <td>김말똥</td>
                            <td>2022.01.01</td>
                            <td>13</td>
                        </tr>
                        <tr>
                            <td>33</td>
                            <td>
                                <a href="">[기말시험 대체 과제물]</a>
                                <span><i class="fas fa-paperclip"></i></span>
                            </td>
                            <td>김말똥</td>
                            <td>2022.01.01</td>
                            <td>13</td>
                        </tr>
                        <tr>
                            <td>33</td>
                            <td>
                                <a href="">[기말시험 대체 과제물]</a>
                                <span><i class="fas fa-paperclip"></i></span>
                            </td>
                            <td>김말똥</td>
                            <td>2022.01.01</td>
                            <td>13</td>
                        </tr>
                        <tr>
                            <td>33</td>
                            <td>
                                <a href="">[기말시험 대체 과제물]</a>
                                <span><i class="fas fa-paperclip"></i></span>
                            </td>
                            <td>김말똥</td>
                            <td>2022.01.01</td>
                            <td>13</td>
                        </tr>
                        <tr>
                            <td>33</td>
                            <td>
                                <a href="">[기말시험 대체 과제물]</a>
                                <span><i class="fas fa-paperclip"></i></span>
                            </td>
                            <td>김말똥</td>
                            <td>2022.01.01</td>
                            <td>13</td>
                        </tr>
                        <tr>
                            <td>33</td>
                            <td>
                                <a href="">[기말시험 대체 과제물]</a>
                                <span><i class="fas fa-paperclip"></i></span>
                            </td>
                            <td>김말똥</td>
                            <td>2022.01.01</td>
                            <td>13</td>
                        </tr>
                    </tbody>
                </table>

                <div class="pagination">
                    <a href="#">&laquo;</a>
                    <a href="#">1</a>
                    <a class="active" href="#">2</a>
                    <a href="#">3</a>
                    <a href="#">4</a>
                    <a href="#">5</a>
                    <a href="#">6</a>
                    <a href="#">&raquo;</a>
                  </div>
                  

            </div>
        
        </div>

    </div>

    <!-- footer.jsp-->
    <jsp:include page="../common/footer.jsp" />
</body>
</html>