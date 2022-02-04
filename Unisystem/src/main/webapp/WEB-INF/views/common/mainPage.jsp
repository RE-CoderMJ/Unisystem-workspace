<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<style>
	#content{
		width: 1500px;
		background-color:white;
		height:1000px;
		margin: auto;
		margin-top:50px;
		margin-bottom:50px;
		border:solid black 1px;
	}
	#content::after{display:block;content:"";clear:both;}
</style>
</head>

<body>	

   <jsp:include page="header.jsp" />
   
   <div id="content">
   		<p>컨텐츠영역</p>
   		<a href="lectureMain.stu">강의게시판</a>
   </div>
   
   <jsp:include page="footer.jsp" />

</body>
</html>