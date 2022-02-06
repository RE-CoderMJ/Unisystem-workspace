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
    #content_header>span{font-size: 17px; color: lightgrey;}
    /*강의계획표 영역*/
    #classPlanBox{
        margin-left: 30px;
        margin-top: 30px;
        width: 1290px;
        height: 700px;
        background-color: white;
        padding-top: 70px;
    }
    #classPlanBox_table{
        padding-top: 30px;
        margin-left: 30px;
        width: 1230px;
        text-align: center;
    }
    #classPlanBox_table th, #classPlanBox_table td{padding: 3px 0;}
    #classPlanBox_table tr:first-child{background-color: #eeeeee; border-top: 2px solid lightgray;}
    #classPlanBox_table tr:last-child{border-top: 1px solid lightgray; border-bottom: 2px solid lightgray;}
    #classPlanBox_table th:first-child{width: 50px;}
    #classPlanBox_table th:nth-child(3){width: 80px;}
    #classPlanBox_table th:nth-child(4){width: 110px;}
    #classPlanBox_table th:nth-child(5){width: 80px;}
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

            <article id="content_header"><span>강의정보 > </span>강의계획표</article>

            <div id="classPlanBox">
                <table id="classPlanBox_table">
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>조회수</th>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>
                            [IT미디어와미래역량 강의계획표]
                            <span><i class="fas fa-paperclip"></i></span>
                        </td>
                        <td>김말똥</td>
                        <td>2022.01.01</td>
                        <td>13</td>
                    </tr>
                </table>
            </div>

        </div>
    </div>

    <!-- footer.jsp-->
    <jsp:include page="../common/footer.jsp" />
</body>
</html>