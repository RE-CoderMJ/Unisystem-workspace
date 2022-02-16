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
    #classYear, #classSemester{
        width: 80px;
        height: 30px;
        margin-left: 20px;
        margin-top: 25px;
    }
    #classSemester{margin-left: 10px;}
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
                
                <form action="studentDateClassList.me" method="post">
                	<input type="hidden" name="userNo" value="${loginUser.userNo}" id="userNo"/>
	                <div id="date_border">
	                    <span>년도 학기</span>
	                    
	                    <select name="classYear" id="classYear">
	                        <!-- 년도를 출력해주는 ajax 함수 실행하는 공간 -->
	                    </select>
	                    
	                    <select name="classSemester" id="classSemester">
	                        <option value="1">1학기</option>
	                        <option value="2">2학기</option>
	                    </select>
	                    
	                    <button type="button">조회</button>
	                </div>
              	</form>
                <table>
                    <tr id="table_header">
                        <th style="width: 70px;">강의코드</th>
                        <th>강좌명</th>
                        <th style="width: 100px;">강의유형</th>
                        <th style="width: 100px;">담당교수</th>
                        <th style="width: 100px;">수강인원</th>
                    </tr>
                    
            	    <c:forEach var="l" items="${ list }">
            	    <input type="hidden" value="${ l.classNo }" id="classNo" name="classNo"/>
            	    	
                    	<!-- list가 비어있을 경우 -->
                    	<c:if test="${ empty list}">
	                    	<tr>
		                    	<td colspan=5>
		                    	 강의가 존재하지 않습니다.
		                    	</td>
	                    	</tr>
                    	</c:if>
                    	
                    	<!-- list가 비어있지 않을 경우 -->            	    	
	                    <tr>
	                        <td>${ l.classCode }</td>
	                        <td><a href="">${l.classKorName}</a></td>
	                        <td>
	                        	<c:if test="${ l.classCategory eq 1 }">
	                        		대면강의
	                        	</c:if>
	                        	<c:if test="${ l.classCategory eq 2 }">
	                        		비대면강의
	                        	</c:if>
	                        </td>
	                        <td>${ l.korName }</td>
	                        <td>
	                        	<c:if test="${ empty l.currStud }">
	                        		0
	                        	</c:if>
	                        	${ l.currStud }
	                        </td>
	                    </tr>	    
            	    </c:forEach>
                </table>


            </div>

        </div>
    </div>




    </div>

    <!-- footer.jsp-->
    <jsp:include page="../common/footer.jsp" />
</body>
</html>