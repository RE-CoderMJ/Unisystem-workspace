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
    height: 1000px;
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
        width: 1270px;
        height: 700px;
        background-color: white;
        padding-top: 30px;
    }  
    #contentBox>div{padding-left: 30px;}  
    #content_name{
        font-size: 25px;
        font-weight: 900;
        margin-bottom: 20px;
    }
    #date_border{
        border: 1px solid lightgray;
        margin: 0px 30px;
        height: 80px;
    }
    #date_border>span{font-weight: 700; margin-left: 390px;}
    #year, #semester{
        width: 80px;
        height: 30px;
        margin-left: 20px;
        margin-top: 25px;
    }
    #semester{margin-left: 10px;}
    #date_border>button{
        border: none;
        border-radius: 5px;
        background-color: lightgray;
        margin-left: 30px;
        padding: 3px 10px;
    }
    #date_border>button:focus{outline: none;}
    table{
        margin: 20px 30px;
        width: 1210px;
        text-align: center;
    }
    table th, table td{padding: 3px 0;}
    table td{border-top: 1px solid lightgray;}
    table tr:last-child td{border-bottom: 2px solid lightgray;}
    #table_header th{background-color: #eeeeee; border-top: 2px solid lightgray;}
</style>
</head>
<body>
    <!-- 교수 마이페이지 - 진행강의 조회 페이지 -->

    <!-- header 영역 -->
    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/links.jsp"/>

    <div id="wrap">

        <div style="float: left;">
            <!-- sidebar 영역 -->
            <jsp:include page="../professor/pmySidebar.jsp" />
        </div>

        <div id="wrap_content" style="float: left;">
            
            <article id="content_header"><span>강의 > </span>진행강의 조회</article>

            <div id="contentBox">

                <div id="content_name">담당 강의</div>
                <div id="date_border">
                    <span>년도 학기</span>
                    <select name="" id="year">
                        <option value="">2022</option>
                        <option value="">2021</option>
                        <option value="">2020</option>
                    </select>
                    <select name="" id="semester">
                        <option value="">1학기</option>
                        <option value="">2학기</option>
                    </select>
                    <button type="button">조회</button>
                </div>
              
                <table>
                    <tr id="table_header">
                        <th style="width: 70px;">번호</th>
                        <th>강좌명</th>
                        <th style="width: 100px;">강의유형</th>
                        <th style="width: 100px;">담당교수</th>
                        <th style="width: 100px;">수강인원</th>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td><a href="">IT미디어와 미래역량</a></td>
                        <td>대면강의</td>
                        <td>김말똥</td>
                        <td>74</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td><a href="">IT미디어와 미래역량</a></td>
                        <td>대면강의</td>
                        <td>김말똥</td>
                        <td>74</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td><a href="">IT미디어와 미래역량</a></td>
                        <td>대면강의</td>
                        <td>김말똥</td>
                        <td>74</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td><a href="">IT미디어와 미래역량</a></td>
                        <td>대면강의</td>
                        <td>김말똥</td>
                        <td>74</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td><a href="">IT미디어와 미래역량</a></td>
                        <td>대면강의</td>
                        <td>김말똥</td>
                        <td>74</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td><a href="">IT미디어와 미래역량</a></td>
                        <td>대면강의</td>
                        <td>김말똥</td>
                        <td>74</td>
                    </tr>
                </table>


            </div>

        </div>
    </div>




    </div>

    <!-- footer.jsp-->
    <jsp:include page="../common/footer.jsp" />
</body>
</html>