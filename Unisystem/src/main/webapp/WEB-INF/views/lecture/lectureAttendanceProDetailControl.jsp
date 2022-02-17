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
        height: 1150px;
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
        height: 950px;
        background-color: white;
        padding-top: 50px;
        padding-left: 30px;
        padding-right: 30px;
    }
    #contentBox>div:first-child{
        background-color: rgb(15, 43, 80);
        color: white;
        padding: 10px 25px;
        width: 115px;
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
        height: 650px;
        margin-top: 20px;
        padding-top: 10px;
        padding-left: 15px;
    }
    #attendance_table{width: 1195px;text-align: center;}
    #attendance_table thead tr:first-child{border-top: 2px solid lightgray;background-color: #eeeeee; width: 200px;}
    #attendance_table tr{border-bottom: 1px solid lightgray;}
    #attendance_table thead tr{border-bottom: 1px solid lightgray;}
    #attendance_table tr:last-child{border-bottom: 2px solid lightgray;}
    #attendance_table th:first-child{width: 30px;}
    #attendance_table th:nth-child(2){width: 50px;}
    #attendance_table th:nth-child(3){width: 80px;}
    #attendance_table th:nth-child(4){width: 60px;}
    #attendance_table th:nth-child(5){width: 60px;}
    #attendance_table th:nth-child(6){width: 200px;}
    #attendance_table th, #attendance_table td{padding: 4px 0;}
    .attend, .absence, .tardiness{
        border: none;
        border-radius: 5px;
        padding: 4px 10px;
        font-size: 13px;
        margin: 0px 5px;
    }
    .attend:focus, .absence:focus, .tardiness:focus{outline: none;}
    .attend{background-color: rgb(21, 62, 115); color: white;}
    .absence{background-color: rgb(192, 57, 43); color: white;}
    .tardiness{background-color: rgb(22, 160, 133); color: white;}
    #cancle_submit_button{margin-left: 500px; margin-top: 40px;}
    #cancle_submit_button button{
        border: none;
        border-radius: 5px;
        font-size: 18px;
        padding: 3px 20px;
    }
    #cancle_submit_button button:focus{outline: none;}
    #cancle_submit_button>button:last-child{margin-left: 20px; background-color: rgb(21, 62, 115); color: white;}
    #class_title{
        font-size: 25px;
        font-weight: 900;
        margin-left: 450px;
        margin-bottom: 10px;
    }
    #StudentCount>span{color: #F39C12; font-weight: 900;}
    
    /* 스크롤바 */
	.flex{
	  display:flex;
	}	
	.scroll{
	    width: 1200;
	    padding: 0px 13px 0px 13px;
	    overflow-y: scroll;
	    overflow-x: hidden;
	    height: 400px;
	    box-sizing: border-box;
	    color: black;
	    font-family: 'Nanum Gothic';
	    background-color: white;
	    margin-right: 50px;
	}
	/* 스크롤바 설정*/
	.type2::-webkit-scrollbar{
	    width: 6px;
	}	
	/* 스크롤바 막대 설정*/
	.type2::-webkit-scrollbar-thumb{
	    height: 17%;
	    background-color: rgb(21, 62, 115);
	    border-radius: 10px;  
	}	
	/* 스크롤바 뒷 배경 설정*/
	.type2::-webkit-scrollbar-track{
	    background-color: #d1d9ff;
	}
	.type2{width:1190px}
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
                
                <div>출석현황</div>
                <div></div>

                <div>
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

                    <div id="class_title">2022.01.01강의 출결관리</div>
                    <div id="StudentCount">
                        총 <span>74</span>명
                    </div>
                    
                    <div class="scroll type2">
	                    <table id="attendance_table">
	                    	<thead>
		                        <tr>
		                            <th>번호</th>
		                            <th>학년</th>
		                            <th>학번</th>
		                            <th>이름</th>
		                            <th>구분</th>
		                            <th>출결</th>
		                        </tr>
	                        </thead>
	                        
	                        <form action="" method="">
	                        
		                        <tbody>
		                        	<c:forEach var="l" items="${ list }">
		                        	
				                        <tr>
				                            <td>${ l.rownum }</td>
				                            <td>
				                            	<c:if test="${ l.totalSemester eq 0 and l.totalSemester < 1}">
				                            		1학년
				                            	</c:if>
				                            	<c:if test="${ l.totalSemester eq 2 and l.totalSemester < 3}">
				                            		2학년
				                            	</c:if>
				                            	<c:if test="${ l.totalSemester eq 3 and l.totalSemester < 4}">
				                            		3학년
				                            	</c:if>
				                            	<c:if test="${ l.totalSemester ge 4}">
				                            		4학년
				                            	</c:if>		                            			                            			                            	
				                            </td>
				                            <td>${ l.studNo }</td>
				                            <td>${ l.korName }</td>
				                            <td></td>
				                            <td>
				                                <button class="attend">출석</button>
				                                <button class="absence ">결석</button>
				                                <button class="tardiness">지각</button>
				                            </td>
				                        </tr>
				                        
		                        	</c:forEach>                 
			                        
		                        </tbody>
	                        </form>
	
	                    </table>

                    </div>

                    <div id="cancle_submit_button">
                        <button>취소</button>
                        <button>제출</button>
                    </div>

                </div>

            </div>

        </div>
    </div>

    <!-- footer.jsp-->
    <jsp:include page="../common/footer.jsp" />
</body>
</html>