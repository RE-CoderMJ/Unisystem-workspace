<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<link href="resources/css/academicStatus/academicStatus.css" rel="stylesheet">
<style>
	#list{
	    width: 1180px;
	    border-top:darkgray 2px solid;
	    border-bottom:darkgray 2px solid;
	    text-align:center ;
	    font-size:15px;
	}
	#list td{
	    cursor: pointer;
	}
	.pending{
		color:green;
	}
	.rejected{
		color:red;
	}
	.accepted{
		color:blue;	
	}
	/*페이징바*/
	.container{
	    margin-top: 50px;
	    margin-bottom: 50px;
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
	#tools{
	    margin-top: 10px;
	    width: 1175px;
	    height: 30px;
	    margin-top:15px;
	    margin-bottom:-40px;
	}
	#tools>button{
	    background-color: white;
	    border: gray 1px solid;
	    border-radius: 3px;
	    font-size: 13px;
	    margin-right: 1px;
	    height: 25px;
	}
	section{
    	min-height:800px;
	}

</style>
</head>
<body>

	<jsp:include page="../common/links.jsp" />
	<jsp:include page="../common/header.jsp" />	
	
	<div id="wrapper">
		<jsp:include page="../professor/pmySidebar.jsp" />
		<section>
			<header id="academic-header">
				<div id="pageName-area">
					<div class="pageName"><p style="color:gray">마이페이지>담당학생관리>&nbsp;</p><p style="font-size:19px; font-weight:600;">학적변동 신청내역</p></div>
					<br><br>
					<div id="pageName">학적변동 신청내역</div>
	                <br>
	                <div id="tools" align="right">
		                <button class="accepted">승인</button>
		                <button class="rejected">반려</button>
					</div>
	            </div>
			</header>
			<article>
                <div id="contents">
          			<table class="table table-hover" id="list">
	                    <tbody>
	                    	<tr style="background:rgb(232, 232, 232);">
	                    		<th><input type="checkbox" class="checkbox"></th>
	                    		<th>No.</th>
	                    		<th>신청학생</th>
	                    		<th>신청구분</th>
	                    		<th>신청날짜</th>
	                    		<th>상태</th>
	                    	</tr>
	                        <tr>
	                            <td><input type="checkbox" class="checkbox"></td>
	                            <td>5</td>
	                            <td>김나다</td> 
	                            <td>휴학</td>
	                            <td>2022-01-19</td>
	                            <td class="pending">대기</td>
	                        </tr>
	                        <tr>
	                            <td><input type="checkbox" class="checkbox"></td>
	                            <td>5</td>
	                            <td>김나다</td> 
	                            <td>휴학</td>
	                            <td>2022-01-19</td>
	                            <td class="pending">대기</td>
	                        </tr>
	                        <tr>
	                            <td><input type="checkbox" class="checkbox"></td>
	                            <td>5</td>
	                            <td>김나다</td> 
	                            <td>휴학</td>
	                            <td>2022-01-19</td>
	                            <td class="pending">대기</td>
	                        </tr>
	                        <tr>
	                            <td><input type="checkbox" class="checkbox"></td>
	                            <td>5</td>
	                            <td>김나다</td> 
	                            <td>휴학</td>
	                            <td>2022-01-19</td>
	                            <td class="pending">대기</td>
	                        </tr>
	                        <tr>
	                            <td><input type="checkbox" class="checkbox"></td>
	                            <td>5</td>
	                            <td>김나다</td> 
	                            <td>휴학</td>
	                            <td>2022-01-19</td>
	                            <td class="pending">대기</td>
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
                
             	</div>
			</article>
		</section>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
	
	
	
</body>
</html>