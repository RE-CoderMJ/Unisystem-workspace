<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<jsp:include page="../common/links.jsp" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@300&display=swap" rel="stylesheet">
<style>
	 body {
            margin: 0;
            padding: 0;
            font: 12pt "Tahoma";
            width:100%;
            height:100%;
        }
        * {
            box-sizing: border-box;
            -moz-box-sizing: border-box;
        }
        #page {
            width: 21cm;
            height: 29.5cm;
            padding: 1.5cm;
            margin:auto;
            border-radius: 5px;
            background: url("../resources/images/certificate/국문_졸업증명서.PNG");
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            background-size:contain;
        }
        @page {
            size: A4;
            margin: 5;
            /*size: landscape;*/
        }
        /*
        @media print {
            #page {
                margin: 0;
                border: initial;
                border-radius: initial;
                width: initial;
                min-height: initial;
                box-shadow: initial;
                background: initial;
                page-break-after: always;
            }
        }
        */
        div{
        	font-family:'Noto Serif KR', serif;
        	font-size: 26px;
        	font-weight:400;
        	margin-left:285px;
        	margin-bottom:8px;
        }
        #name{
        	width:100px;
        	margin-top:200px;
        }
        #department{
        	margin-bottom:55px;
        }
        #issue-date{
        	margin-top:210px;
        	margin-left:220px;
        }
        span{
        	font-size:16px;
        }
        #cert-no{
        	margin-right:420px;
        	margin-top:-30px;
        }
        #rep{
        	width:100px;
        	height:35px;
        	border:none;
        	border-radius:5px;
        	background:RGB(26,86,162);
        	color:white;
        	margin-left:900px;
        	margin-bottom:30px;
        }
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.3/html2pdf.bundle.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){ 
		
		$(document).on('click', '.btn_print', function(event){
			event.preventDefault();
			
			let element = document.getElementById('page'); 

			html2pdf().set({filename: '(국문)졸업증명서_' + '${c.studName}' + '.pdf'}).from(element).save();

		});

	});
</script>
</head>
<body>
	<input type="button" id="rep" value="저장하기" class="btn_print">
	<div id="page">
		<span id="cert-no">제 ${c.cerNo }호</span>
		<span>${c.useFor}&nbsp;&nbsp;&nbsp;${c.toTypeT } : ${c.toWhom }</span>
		<div id="name">${c.studName }</div>
		<div id="date-of-birth">${c.birthday }</div>
		<div id="department">${c.department }</div>
		<div>${c.studInto }</div>
		<div>${c.studGrad}</div>
		<div id="issue-date">${c.issueDate }</div>
	</div>
</body>
</html>