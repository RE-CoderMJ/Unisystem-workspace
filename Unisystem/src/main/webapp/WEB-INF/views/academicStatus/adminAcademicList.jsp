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
    	min-height:750px;
	}

</style>
</head>
<body>

	<jsp:include page="../common/links.jsp" />
	<jsp:include page="../common/header.jsp" />	
	
	<div id="wrapper">
		<jsp:include page="../common/adminSidebar.jsp" />
		<section>
			<header id="academic-header">
				<div id="pageName-area">
					<div class="pageName"><p style="color:gray">학적변동>&nbsp;</p><p style="font-size:19px; font-weight:600;">학적변동 신청내역</p></div>
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
          				<thead>
	                    	<tr style="background:rgb(232, 232, 232);">
	                    		<th><input type="checkbox" id="checkAll"></th>
	                    		<th>No.</th>
	                    		<th>신청학생</th>
	                    		<th>신청구분</th>
	                    		<th>신청날짜</th>
	                    		<th>상태</th>
	                    	</tr>          					
          				</thead>
	                    <tbody>
	                    	<c:forEach var="as" items="${asList}">
		                        <tr>
		                            <td><input type="checkbox" class="checkbox"></td>
		                            <td class="as-no">${as.asNo}</td>
		                            <td>${as.studName}</td> 
		                            <td class="as-type">${as.asTypeT }</td>
		                            <td>${as.asDate}</td>
		                            <input type="hidden" name="studNo" value="${ as.studNo}">
		                            <c:choose>
		                            	<c:when test="${as.progressT eq '접수'}">
				                            <td class="pending">${as.progressT}</td>
		                            	</c:when>
		                            	<c:when test="${as.progressT eq '담당교수승인'}">
				                            <td class="accepted">${as.progressT}</td>
		                            	</c:when>
		                            	<c:when test="${as.progressT eq '반려'}">
				                            <td class="rejected">${as.progressT}</td>
		                            	</c:when>
		                            </c:choose>
		                        </tr>
	                        </c:forEach>
	                    </tbody>
                	</table>
  					<div class="container">
	                    <ul class="pagination justify-content-center">
	                    	<c:choose>
		                    	<c:when test="${ pi.currentPage eq 1 }">
		                    		<li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
		                    	</c:when>
		                    	<c:otherwise>
		                    		<li class="page-item"><a class="page-link" href="admin.academic.list?currentPage=${ pi.currentPage-1 }">&lt;</a></li>
		                    	</c:otherwise>
		                    </c:choose>
		                    
		                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		                    	<c:choose>
		                    		<c:when test="${pi.currentPage == pi.maxPage}">
		                    			<li class="page-item active"><a class="page-link" href="admin.academic.list?currentPage=${ p }">${ p }</a></li>
		                    		</c:when>
		                    		<c:otherwise>
		                    			<li class="page-item"><a class="page-link" href="admin.academic.list?currentPage=${ p }">${ p }</a></li>
		                    		</c:otherwise>
		                    	</c:choose>
		                    </c:forEach>
		                    
		                    <c:choose>
		                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
		                    		<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
		                    	</c:when>
		                    	<c:otherwise>
		                    		<li class="page-item"><a class="page-link" href="admin.academic.list?currentPage=${ pi.currentPage+1 }">&gt;</a></li>
		                    	</c:otherwise>
		                    </c:choose>
	                    </ul>
                	</div>
                
             	</div>
			</article>
		</section>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
	
	
	
</body>
</html>