<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    #content_header>span{font-size: 17px; color: lightgrey;}
    /* content 영역*/
    #contentBox{
        margin-left: 30px;
        margin-top: 30px;
        width: 1290px;
        height: 700px;
        background-color: white;
        padding-top: 30px;
    }
    #contentBox>div{padding-left: 30px;}
    #impossible_box{margin-top: 80px;}
    #possible_box>div:first-child, #impossible_box>div:first-child{
        font-size: 20px; 
        font-weight: 900;
        margin-bottom: 15px;
    }
    #possible_box table, #impossible_box table{width: 1230px; text-align: center;}
    #possible_box table th, #possible_box table th td, #impossible_box table th, #impossible_box table td{padding: 3px 0;}
    #possible_box table th, #impossible_box table th{border-top: 2px solid lightgray; background-color: #eeeeee;}
    #possible_box table td, #impossible_box table td{border-top: 1px solid lightgray;}
    #possible_box table tr:last-child, #impossible_box table tr:last-child{border-bottom: 2px solid lightgray;}
    
    /* 페이징바 css */
    .pagination {
        display: inline-block;
        width:fit-content;
        margin:auto;
        margin-top: 50px;
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
            
            <article id="content_header"><span>자료실 > </span>과제업로드</article>

            <div id="contentBox">

                <div id="possible_box">
                    <div>제출가능한 과제</div>
                    <table>
                        <tr>
                            <th style="width: 70px;">번호</th>
                            <th>과제명</th>
                            <th style="width: 100px;">담당 교수</th>
                            <th style="width: 170px;">제출 기한</th>
                            <th style="width: 120px;">제출 여부</th>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>[8주차 과제]</td>
                            <td>김말똥</td>
                            <td>2022.01.01 12:00</td>
                            <td>미제출</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>[9주차 과제]</td>
                            <td>김말똥</td>
                            <td>2022.01.01 12:00</td>
                            <td>제출 완료</td>
                        </tr>
                    </table>
                </div>

                <div id="impossible_box">
                    <div>마감된 과제</div>
                    <table>
                        <tr>
                            <th style="width: 70px;">번호</th>
                            <th>과제명</th>
                            <th style="width: 100px;">담당 교수</th>
                            <th style="width: 170px;">제출 기한</th>
                            <th style="width: 120px;">제출 여부</th>
                            <th style="width: 120px;">채점 상황</th>
                            <th style="width: 120px;">점수</th>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>[7주차 과제]</td>
                            <td>김말똥</td>
                            <td>2022.01.01 12:00</td>
                            <td>제출</td>
                            <td>미채점</td>
                            <td><span>/ 100</span></td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>[7주차 과제]</td>
                            <td>김말똥</td>
                            <td>2022.01.01 12:00</td>
                            <td>제출</td>
                            <td>채점됨</td>
                            <td><span>100 / 100</span></td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>[7주차 과제]</td>
                            <td>김말똥</td>
                            <td>2022.01.01 12:00</td>
                            <td>제출</td>
                            <td>채점됨</td>
                            <td><span>100 / 100</span></td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>[7주차 과제]</td>
                            <td>김말똥</td>
                            <td>2022.01.01 12:00</td>
                            <td>제출</td>
                            <td>채점됨</td>
                            <td><span>100 / 100</span></td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>[7주차 과제]</td>
                            <td>김말똥</td>
                            <td>2022.01.01 12:00</td>
                            <td>제출</td>
                            <td>채점됨</td>
                            <td><span>100 / 100</span></td>
                        </tr>
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
    </div>

    <!-- footer.jsp-->
    <jsp:include page="../common/footer.jsp" />
</body>
</html>