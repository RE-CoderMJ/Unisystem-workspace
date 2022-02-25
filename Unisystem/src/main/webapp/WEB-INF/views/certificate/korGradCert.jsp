<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
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
        .page {
            width: 21cm;
            min-height: 29.7cm;
            padding: 2cm;
            margin: 1cm auto;
            border-radius: 5px;
            background: url("../resources/images/certificate/국문_졸업증명서.PNG");
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            background-size:contain;
        }
        @page {
            size: A4;
            margin: 0;
            /*size: landscape;*/
        }
        @media print {
            .page {
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
</style>
</head>
<body face="HYGoThic-Medium" encoding="UniKS-UCS2-H">
	<div class="page">
		<div>성민석</div>
		<div>1993년 3월 6일</div>
		<div>공과대학 / 컴퓨터공학과</div>
		<div>2014년 3월 3일</div>
		<div>2018년 2월 14일</div>
		<div>2021년 2월 25일</div>
	</div>
</body>
</html>