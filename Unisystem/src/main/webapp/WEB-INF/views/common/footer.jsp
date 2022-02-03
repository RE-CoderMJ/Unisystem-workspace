<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<style>
	html{
	    position: relative;
	}
	body{
	    min-height: 100%;
	    margin-bottom:140px;
	}
	.footer{
		padding-top:200px;
		background: rgb(44, 62, 80);
	    position:absolute;
	    left: 0;
	    right: 0;
	    bottom: 0;
	    width: 100%;
	    padding: 15px 0;
	}
	/*
	html, body{
	    margin: 0;
	    padding: 0;
	    height: 100%;
  		position: relative;
	}
	.footer_outer{
		background: rgb(44, 62, 80);
		height:140px;
		width:100%;
		position:absolute;
		bottom:0;
		left:0;
		right:0;
	}
	.footer{ 
		margin:0 auto;
		width:1500px;
		height:140px;
		font-size:14px;

	}
	*/
	.footer>div{
		color:lightgray;			
		padding:43px 75px;
	}
	.footer div{
		float:left;
		height:100%;
	}
	.footer_left{
		width:75%;
	}
	.footer_right{
		width:25%;
	}
	#phoneIcon{
		padding:8px 12px;
	}
	
</style>
</head>
<body>

		<div class="footer">
			<div class="footer_left">
					01234   서울특별시  유니구  유니동  /  대표전화 (ARS) 1588-5252 <br>
					Copyright (c)  2000-2022  UniSystem.  All Rights Reserved.
			</div>
			<div class="footer_right">
				<div id="phoneIcon">
					<i class="fas fa-phone-volume fa-2x"></i>
				</div>
				<label>
					TEL. 012-345-7890 <br>
					FAX. 012-345-7899				
				</label>
			</div>
		</div>
</body>
</html>