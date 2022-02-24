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
            background: url("../resources/images/certificate/영문_졸업증명서.PNG");
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
<body>
	<div class="page">
	</div>
</body>
</html>