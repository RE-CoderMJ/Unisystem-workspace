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
    }
    #stu_info th{background-color: #eeeeee; width: 200px;}
    #stu_info th, #stu_info td{padding: 5px 0;}
    #stu_info tr:first-child{border-top: 2px solid lightgray; border-bottom: 1px solid lightgray;}
    #stu_info tr:last-child{border-top: 1px solid lightgray; border-bottom: 2px solid lightgray;}
    #contentBox>div:nth-child(4){
        border: 1px solid lightgray;
        height: 300px;
        margin-top: 20px;
        padding-top: 10px;
        padding-left: 15px;
    }
    #grade_table{width: 1195px;text-align: center;}
    #grade_table tr:first-child{border-top: 2px solid lightgray;background-color: #eeeeee; width: 200px;}
    #grade_table tr{border-bottom: 1px solid lightgray;}
    
</style>
</head>
<body>
	<!-- header 영역 -->
    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/links.jsp"/>
    <div id="wrap">
    
    	<div style="float: left;">
            <!-- sidebar 영역 -->
            <jsp:include page="../student/sclassSidebar.jsp" />
        </div>
        
        <div id="wrap_content" style="float: left;">
        
        	<article id="content_header"><span>성적/출석관리 > </span>성적 조회</article>
        	
        	<div id="contentBox">
                
                <div>강의성적</div>
                <div></div>

                <div>
                    <table id="stu_info">
                        <tr>
                            <th>학번</th>
                            <td>20131111</td>
                        </tr>
                        <tr>
                            <th>이름</th>
                            <td>홍길동</td>
                        </tr>
                        <tr>
                            <th>휴대전화</th>
                            <td>01012345678</td>
                        </tr>
                    </table>
                </div>
                
                <div>
                	<br>
                	<table id="grade_table">
                		<tr>
                			<th>출석(20%)</th>
                			<th>과제(20%)</th>
                			<th>중간(30%)</th>
                			<th>기말(30%)</th>
                			<th>합계</th>
                			<th>등급</th>
                		</tr>
                		<tr>
                			<td>20</td>
                			<td>18</td>
                			<td>26</td>
                			<td>26</td>
                			<td>90</td>
                			<td>A</td>
                		</tr>
                	</table>
         		
                </div>
        </div>
    
    </div>
	
	<!-- footer.jsp-->
    <jsp:include page="../common/footer.jsp" />
</body>
</html>