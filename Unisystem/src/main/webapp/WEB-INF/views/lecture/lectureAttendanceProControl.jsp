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
    /* content 영역*/
    #contentBox{
        margin-left: 30px;
        margin-top: 30px;
        width: 1290px;
        height: 785px;
        background-color: white;
        padding-top: 50px;
        padding-left: 30px;
        padding-right: 30px;
    }
    #contentBox>div:nth-child(2){
        width: 1230px;
        border-bottom: 2px solid lightgray;
        margin-bottom: 20px;
    }
    #contentBox>div:nth-child(3){
        border: 1px solid lightgray;
        height: 130px;
        padding-top: 10px;
    }
    #contentBox_title{
	display:inline-block;
    width: auto;
    background-color: rgb(15, 43, 80);
    color: white;
    padding: 10px 25px;
    }
    #stu_info{
        width: 1210px;
        margin: auto;
        text-align: center;
        margin-top: 17px;
    }
    #stu_info th{background-color: #eeeeee; width: 200px;}
    #stu_info th, #stu_info td{padding: 5px 0;}
    #stu_info tr:first-child{border-top: 2px solid lightgray; border-bottom: 1px solid lightgray;}
    #stu_info tr:last-child{border-top: 1px solid lightgray; border-bottom: 2px solid lightgray;}

    #contentBox>div:nth-child(4){
        border: 1px solid lightgray;
        height: 490px;
        margin-top: 20px;
        padding-top: 10px;
        padding-left: 15px;
    }
    #attendance_table{width: 1195px;text-align: center;}
    #attendance_table tr:first-child{border-top: 2px solid lightgray;background-color: #eeeeee; width: 200px;}
    #attendance_table tr{border-bottom: 1px solid lightgray;}
    #attendance_table tr:last-child{border-bottom: 2px solid lightgray;}
    #attendance_table th:first-child{width: 30px;}
    #attendance_table th:nth-child(3){width: 140px;}
    #attendance_table th:nth-child(4){width: 90px;}
    #attendance_table th, #attendance_table td{padding: 2px 0;}
    
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
</head>
<body>
    <!-- header 영역 -->
    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/links.jsp"/>
    
    <div id="wrap">
        
        <div style="float: left;">
			<!-- sidebar 영역 -->
            <!-- 로그인한 계정이 교수일 경우 -->
            <jsp:include page="../professor/pclassSidebar.jsp" />

        </div>

        <div id="wrap_content" style="float: left;">

            <article id="content_header"><span>성적/출석관리 > </span>출결 관리</article>

            <div id="contentBox">
                
                <div id="contentBox_title">[${ classInfo.classKorName }] 출석현황</div>
                <div></div>

                <div id="stu_info_outer">
                    <table id="stu_info">
                        <tr>
                            <th>강의명</th>
                            <td>${ classInfo.classKorName }</td>
                        </tr>
                        <tr>
                            <th>수강인원</th>
							<td>${ classInfo.currStud }명</td>
                        </tr>
                    </table>
                </div>

                <div>
                    <div style="font-size: 15px;">*출석 요건 : 기간 내 출석 인정 요구 시간 이상을 학습할 경우</div>
                    <div style="margin-bottom: 10px; font-size: 15px;">출석-[○], 지각=[▲], 결석-[X]</div>
                    <table id="attendance_table">
                        <tr>
                            <th></th>
                            <th>강의 제목</th>
                            <th>수업일자</th>
                            <th>출석</th>
                        </tr>
                        
                        <c:forEach var="l" items="${ list }">
	                        <tr>
	                            <td>${ l.rownum }</td>
	                            <td>${ l.classTitle }</td>
	                            <td>${ l.attendanceDate }</td>
	                            <td><a href="lectureAttDetailControl.stu">바로가기</a></td>
	                        </tr>
						</c:forEach>
						
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
                </div>

            </div>

        </div>
    </div>

    <!-- footer.jsp-->
    <jsp:include page="../common/footer.jsp" />
</body>
</html>