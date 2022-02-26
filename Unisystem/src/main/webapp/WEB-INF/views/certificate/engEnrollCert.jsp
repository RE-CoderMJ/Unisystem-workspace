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
            background: url("../resources/images/certificate/영문_재학증명서.PNG");
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
        	font-size: 18px;
        	font-weight:400;
        	margin-left:310px;
        	margin-bottom:10px;
        }
        #issue-date{
        	margin-left:570px;
        	font-size: 15px;
        	margin-bottom:210px;
        }
        #cert-no{
        	margin-left:570px;
        	font-size: 15px;
        	margin-top:75px;
        	margin-bottom:0px;
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

			html2pdf().set({filename: 'CertificateOfEnrollment_' + '${c.engName}' + '.pdf'}).from(element).save();

		});

	});
</script>
</head>
<body>
	<input type="button" id="rep" value="저장하기" class="btn_print">
	<div id="page">
		<div id="cert-no">${c.cerNo }</div>
		<div id="issue-date">${c.issueDate }</div>
		<div id="name">${c.engName }</div>
		<div id="date-of-birth">${c.birthday }</div>
		<div>${c.studInto }</div>		
	</div>
</body>
</html>