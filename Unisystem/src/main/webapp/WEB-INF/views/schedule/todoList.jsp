<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
</head>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>

.flex {
    -webkit-box-flex: 1;
    -ms-flex: 1 1 auto;
    flex: 1 1 auto
}
.page_title {
	color: rgb(15, 43, 80);
	font-size: 40px;
	font-weight: 800;
	margin-top: 50px;
	margin-bottom: 10px;
	margin-left: 66px;
}
.updel{
	height: 24px;
    margin-right: 125px;
    font-size: 15px;
    position: relative;
    top: 45px;
    left: 20px;
}
.updel a{
	text-decoration: none;
	color: black;
	float: right;
}

@media (max-width:991.98px) {
    .padding {
        padding: 10px;
    }
}

.bo_content {
	margin-top: 51px;
	width: 1100px;
	float: left;
	background-color: white;
	margin-left: 150px;
	padding-bottom: 50px;
	position: relative;
    top: -1120px;
    left: 100px;
}


@media (max-width:767.98px) {
    .padding {
        padding: 10px;
    }
}

.padding {
    padding: 50px;
}

.card {
    box-shadow: none;
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
    -ms-box-shadow: none
}

.pl-3,
.px-3 {
    padding-left: 50px;
}

.card {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 1px solid #d2d2dc;
    border-radius: 0
}

.pr-3,
.px-3 {
    padding-right: 10px; !important
}

.card .card-body {
    padding: 10px 10px;
}

.card-body {
    flex: 1 1 auto;
    padding: 10px;
}

.card .card-title {
    color: #000000;
    margin-bottom: 10px;
    text-transform: capitalize;
    font-size: 20px;
    font-weight: 500;
}

.add-items {
    margin-bottom: 10px;
    overflow: hidden
}

.d-flex {
    display: flex 
}

.add-items input[type="text"] {
    border-top-right-radius: 0;
    border-bottom-right-radius: 0;
    width: 100%;
    background: transparent
}

.form-control {
    border: 1px solid #f3f3f3;
    font-weight: 400;
    font-size: 20px;
}

.form-control {
    display: block;
    width: 100%;
    padding: 10px 10px;
    font-size: 20px;
    line-height: 1;
    color: #495057;
    background-color: #ffffff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: 2px;
    transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out
}

.add-items .btn {
    margin-left: 10px;
}

.btn {
    font-size: 20px;
    line-height: 1;
    font-weight: 400;
    padding: 10px 10px;
    border-radius: 40px;
}

.list-wrapper {
    height: 100%;
    max-height: 100%
}

.add-items {
    margin-bottom: 10px;
    overflow: hidden
}

.add-items input[type="text"] {
    border-top-right-radius: 0;
    border-bottom-right-radius: 0;
    width: 100%;
    background: transparent
}

.add-items .btn,
.add-items .fc button,
.fc .add-items button,
.add-items .ajax-upload-dragdrop .ajax-file-upload,
.ajax-upload-dragdrop .add-items .ajax-file-upload,
.add-items .swal2-modal .swal2-buttonswrapper .swal2-styled,
.swal2-modal .swal2-buttonswrapper .add-items .swal2-styled,
.add-items .wizard>.actions a,
.wizard>.actions .add-items a {
    margin-left: 10px;
}

.rtl .add-items .btn,
.rtl .add-items .fc button,
.fc .rtl .add-items button,
.rtl .add-items .ajax-upload-dragdrop .ajax-file-upload,
.ajax-upload-dragdrop .rtl .add-items .ajax-file-upload,
.rtl .add-items .swal2-modal .swal2-buttonswrapper .swal2-styled,
.swal2-modal .swal2-buttonswrapper .rtl .add-items .swal2-styled,
.rtl .add-items .wizard>.actions a,
.wizard>.actions .rtl .add-items a {
    margin-left: auto;
    margin-right: 10px;
}

.list-wrapper {
    height: 100%;
    max-height: 100%
}

.list-wrapper ul {
    padding: 0;
    text-align: left;
    list-style: none;
    margin-bottom: 0
}

.list-wrapper ul li {
    font-size: 20px;
    padding: 10px 0;
    border-bottom: 1px solid #f3f3f3
}

.list-wrapper ul li:first-child {
    border-bottom: none
}

.list-wrapper ul li .form-check {
    max-width: 90%;
    margin-top: 10px;
    margin-bottom: 10px;
}

.list-wrapper ul li .form-check label:hover {
    cursor: pointer
}

.list-wrapper input[type="checkbox"] {
    margin-right: 10px;
}

.list-wrapper .remove {
    cursor: pointer;
    font-size: 20px;
    font-weight: 600;
    width: 10px;
    height:10px;
    line-height: 20px;
    text-align: center
}

.list-wrapper .completed {
    text-decoration: line-through;
    text-decoration-color: #3da5f4
}

.list-wrapper ul li .form-check {
    max-width: 90%;
    margin-top: 10px;
    margin-bottom: 10px;
}

.list-wrapper ul li .form-check,
.list-wrapper ul li .form-check .form-check-label,
.email-wrapper .mail-sidebar .menu-bar .profile-list-item a .user .u-name,
.email-wrapper .mail-sidebar .menu-bar .profile-list-item a .user .u-designation,
.email-wrapper .mail-list-container .mail-list .content .sender-name,
.email-wrapper .message-body .attachments-sections ul li .details p.file-name,
.settings-panel .chat-list .list .info p {
    text-overflow: ellipsis;
    overflow: hidden;
    max-width: 100%;
    white-space: nowrap
}

.form-check {
    position: relative;
    display: block;
    margin-top: 10px;
    margin-bottom: 10px;
    padding-left: 0
}

.list-wrapper ul li .form-check,
.list-wrapper ul li .form-check .form-check-label,
.email-wrapper .mail-sidebar .menu-bar .profile-list-item a .user .u-name,
.email-wrapper .mail-sidebar .menu-bar .profile-list-item a .user .u-designation,
.email-wrapper .mail-list-container .mail-list .content .sender-name,
.email-wrapper .message-body .attachments-sections ul li .details p.file-name,
.settings-panel .chat-list .list .info p {
    text-overflow: ellipsis;
    overflow: hidden;
    max-width: 100%;
    white-space: nowrap
}

.form-check .form-check-label {
    min-height: 18px;
    display: block;
    margin-left: 10px;
    font-size: 20px;
    line-height: 1.5
}

.form-check-label {
    margin-bottom: 0
}

.list-wrapper input[type="checkbox"] {
    margin-right: 15px
}

.form-check .form-check-label input {
    position: absolute;
    top: 0;
    left: 0;
    margin-left: 0;
    margin-top: 0;
    z-index: 1;
    cursor: pointer;
    opacity: 0;
    filter: alpha(opacity=0)
}

input[type="radio"],
input[type="checkbox"] {
    box-sizing: border-box;
    padding: 0
}

.list-wrapper ul li .form-check,
.list-wrapper ul li .form-check .form-check-label,
.email-wrapper .mail-sidebar .menu-bar .profile-list-item a .user .u-name,
.email-wrapper .mail-sidebar .menu-bar .profile-list-item a .user .u-designation,
.email-wrapper .mail-list-container .mail-list .content .sender-name,
.email-wrapper .message-body .attachments-sections ul li .details p.file-name,
.settings-panel .chat-list .list .info p {
    text-overflow: ellipsis;
    overflow: hidden;
    max-width: 100%;
    white-space: nowrap
}

.form-check .form-check-label input[type="checkbox"]+.input-helper:before {
    content: "";
    width: 18px;
    height: 18px;
    border-radius: 2px;
    border: solid #405189;
    border-width: 2px;
    -webkit-transition: all;
    -moz-transition: all;
    -ms-transition: all;
    -o-transition: all;
    transition: all;
    transition-duration: 0s;
    -webkit-transition-duration: 250ms;
    transition-duration: 250ms
}

.form-check .form-check-label input[type="checkbox"]+.input-helper:before,
.form-check .form-check-label input[type="checkbox"]+.input-helper:after {
    position: absolute;
    top: 0;
    left: 0
}

.form-check .form-check-label input[type="checkbox"]+.input-helper:after {
    -webkit-transition: all;
    -moz-transition: all;
    -ms-transition: all;
    -o-transition: all;
    transition: all;
    transition-duration: 0s;
    -webkit-transition-duration: 10px;
    transition-duration: 10px;
    font-family: Material Design Icons;
    opacity: 0;
    filter: alpha(opacity=0);
    -webkit-transform: scale(0);
    -ms-transform: scale(0);
    -o-transform: scale(0);
    transform: scale(0);
    content: '\F12C';
    font-size: 20px;
    font-weight: bold;
    color: #ffffff
}

.form-check .form-check-label input[type="checkbox"]+.input-helper:before,
.form-check .form-check-label input[type="checkbox"]+.input-helper:after {
    position: absolute;
    top: 0;
    left: 0
}

.form-check .form-check-label input[type="checkbox"]:checked+.input-helper:before {
    background: #405189;
    border-width: 0
}

.form-check .form-check-label input[type="checkbox"]+.input-helper:before {
    content: "";
    width: 18px;
    height: 18px;
    border-radius: 2px;
    border: solid #405189;
    border-width: 2px;
    -webkit-transition: all;
    -moz-transition: all;
    -ms-transition: all;
    -o-transition: all;
    transition: all;
    transition-duration: 0s;
    -webkit-transition-duration: 250ms;
    transition-duration: 250ms
}

.form-check .form-check-label input[type="checkbox"]+.input-helper:after {
    font-family: FontAwesome;
    content: "\f095";
    display: inline-block;
    padding-right: 3px;
    vertical-align: middle;
    color: #fff
}

.text-primary,
.list-wrapper .completed .remove {
    color: #405189 !important
}

.list-wrapper .remove {
    cursor: pointer;
    font-size: 20px;
    font-weight: 600;
    width: 1.25rem;
    height: 1.25rem;
    line-height: 20px;
    text-align: center
}

.ml-auto,
.list-wrapper .remove,
.mx-auto {
    margin-left: auto !important
}

.mdi-close-circle-outline:before {
    content: "\F15A"
}

.list-wrapper ul li {
    font-size: 20px;
    padding: .4rem 0;
    border-bottom: 1px solid #f3f3f3
}

.mdi:before {
    font-family: FontAwesome;
    content: "\f00d";
    display: inline-block;
    padding-right: 3px;
    vertical-align: middle;
    font-size: 20px;
    color: #405189
}

.list-wrapper ul {
    padding: 0;
    text-align: left;
    list-style: none;
    margin-bottom: 0
}

.flex-column-reverse {
    flex-direction: column-reverse !important
}

.d-flex,
.loader-demo-box,
.distribution-chart-legend .distribution-chart,
.distribution-chart-legend .distribution-chart .item,
.list-wrapper ul li,
.email-wrapper .mail-sidebar .menu-bar .profile-list-item a,
.email-wrapper .mail-sidebar .menu-bar .profile-list-item a .user,
.email-wrapper .mail-list-container .mail-list .details,
.email-wrapper .message-body .attachments-sections ul li .thumb,
.email-wrapper .message-body .attachments-sections ul li .details .buttons,
.lightGallery .image-tile .demo-gallery-poster,
.swal2-modal,
.navbar .navbar-menu-wrapper .navbar-nav,
.navbar .navbar-menu-wrapper .navbar-nav .nav-item.nav-profile,
.navbar .navbar-menu-wrapper .navbar-nav .nav-item.dropdown .navbar-dropdown .dropdown-item {
    display: flex !important
}

.bo_content p{
	margin-left:66px;
}
</style>
<body>

	<div id="outer">


		<!-- header.jsp 영역 -->
		<jsp:include page="../common/header.jsp" />

		<!-- sidebar.jsp 영역 
		  교수가 로그인하면 pmySidebar
		  학생이 로그인하면 smySidebar -->


		<div style="background-color: rgb(235, 242, 252); width: 1500px;">
		
		
			<div class="sidewrap">
				<jsp:include page="../student/smySidebar.jsp" />
			</div>


			<div class="bo_content" style="width:1000px;">
			
				<!-- title -->
			<div class="page_title">투두리스트</div>
			<p>오늘 <b style="color:rgb(231, 76, 60);">해야할 일</b>은 무엇인가요?</p>
			<hr width="850px;" align="center;">
			<div class="updel">
			<a href="">캘린더</a>
			</div>
			
			
			<div id="todoWrap"   >
			<div class="page-content page-container" id="page-content" style="width:1000px;">
				<div class="padding" style="width:1000px;">
					<div class="row container d-flex justify-content-center">
						<div class="col-md-12">
							<div class="card px-3">
								<div class="card-body">
									<h4 class="card-title">Todo list</h4>
									<div class="add-items d-flex">
										<input type="text" class="form-control todo-list-input"
											placeholder="What do you need to do today?">
										<button
											class="add btn btn-primary font-weight-bold todo-list-add-btn">Add</button>
									</div>
									<div class="list-wrapper">
										<ul class="d-flex flex-column-reverse todo-list">
											<li>
												<div class="form-check">
													<label class="form-check-label"> <input
														class="checkbox" type="checkbox"> For what reason
														would it be advisable. <i class="input-helper"></i></label>
												</div> <i class="remove mdi mdi-close-circle-outline"></i>
											</li>
											<li class="completed">
												<div class="form-check">
													<label class="form-check-label"> <input
														class="checkbox" type="checkbox" checked=""> For
														what reason would it be advisable for me to think. <i
														class="input-helper"></i></label>
												</div> <i class="remove mdi mdi-close-circle-outline"></i>
											</li>
											<li>
												<div class="form-check">
													<label class="form-check-label"> <input
														class="checkbox" type="checkbox"> it be advisable
														for me to think about business content? <i
														class="input-helper"></i></label>
												</div> <i class="remove mdi mdi-close-circle-outline"></i>
											</li>
											<li>
												<div class="form-check">
													<label class="form-check-label"> <input
														class="checkbox" type="checkbox"> Print Statements
														all <i class="input-helper"></i></label>
												</div> <i class="remove mdi mdi-close-circle-outline"></i>
											</li>
											<li class="completed">
												<div class="form-check">
													<label class="form-check-label"> <input
														class="checkbox" type="checkbox" checked=""> Call
														Rampbo <i class="input-helper"></i></label>
												</div> <i class="remove mdi mdi-close-circle-outline"></i>
											</li>
											<li>
												<div class="form-check">
													<label class="form-check-label"> <input
														class="checkbox" type="checkbox"> Print bills <i
														class="input-helper"></i></label>
												</div> <i class="remove mdi mdi-close-circle-outline"></i>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		</div>
			<br clear="both">

	<!-- footer.jsp-->
	<jsp:include page="../common/footer.jsp" />
	
	</div>
	<script>
(function($) {
	'use strict';
	$(function() {
	var todoListItem = $('.todo-list');
	var todoListInput = $('.todo-list-input');
	$('.todo-list-add-btn').on("click", function(event) {
	event.preventDefault();

	var item = $(this).prevAll('.todo-list-input').val();

	if (item) {
	todoListItem.append("<li>
	    <div class='form-check'><label class='form-check-label'><input class='checkbox' type='checkbox' />" + item + "<i class='input-helper'></i></label></div><i class='remove mdi mdi-close-circle-outline'></i>
	</li>");
	todoListInput.val("");
	}

	});

	todoListItem.on('change', '.checkbox', function() {
	if ($(this).attr('checked')) {
	$(this).removeAttr('checked');
	} else {
	$(this).attr('checked', 'checked');
	}

	$(this).closest("li").toggleClass('completed');

	});

	todoListItem.on('click', '.remove', function() {
	$(this).parent().remove();
	});

	});
	})(jQuery);
</script>

</body>
</html>