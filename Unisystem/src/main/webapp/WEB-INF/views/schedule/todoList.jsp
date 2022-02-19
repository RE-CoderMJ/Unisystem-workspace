<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
</head>
<style>

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
    top: -51px;
    left: 20px;
}

p{
margin-left: 66px;
}

.updel a{
	text-decoration: none;
	color: black;
	font-weight:300px;
	float: right;
}

.bo_content {
	width: 1000px;
	background-color: white;
	padding-bottom: 50px;
	min-height: 700px;
}


/* Include the padding and border in an element's total width and height */
* {
  box-sizing: border-box;
}

/* Remove margins and padding from the list */
ul {
  margin: 0;
  padding: 0;
}

/* Style the list items */
ul li {
  cursor: pointer;
  position: relative;
  padding: 12px 8px 12px 40px;
  list-style-type: none;
  background: #eee;
  font-size: 18px;
  transition: 0.2s;
  
  /* make the list items unselectable */
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* Set all odd list items to a different color (zebra-stripes) */
ul li:nth-child(odd) {
  background: #f9f9f9;
}

/* Darker background-color on hover */
ul li:hover {
  background: #ddd;
}

/* When clicked on, add a background color and strike out text */
ul li.checked {
  background: #888;
  color: #fff;
  text-decoration: line-through;
}

/* Add a "checked" mark when clicked on */
ul li.checked::before {
  content: '';
  position: absolute;
  border-color: #fff;
  border-style: solid;
  border-width: 0 2px 2px 0;
  top: 10px;
  left: 16px;
  transform: rotate(45deg);
  height: 15px;
  width: 7px;
}

/* Style the close button */
.close {
  position: absolute;
  right: 0;
  top: 0;
  padding: 12px 16px 12px 16px;
}

.close:hover {
  background-color: #f44336;
  color: white;
}

/* Style the header */
.header {
  background-color: rgb(21,62,115);
  padding: 30px 40px;
  color: white;
  text-align: center;
}

/* Clear floats after the header */
.header:after {
  content: "";
  display: table;
  clear: both;
}

/* Style the input */
input {
  margin: 0;
  border: none;
  border-radius: 0;
  width: 75%;
  padding: 10px;
  float: left;
  font-size: 16px;
}

/* Style the "Add" button */
.addBtn {
  padding: 10px;
  width: 25%;
  background: #d9d9d9;
  color: #555;
  float: left;
  text-align: center;
  font-size: 16px;
  cursor: pointer;
  transition: 0.3s;
  border-radius: 0;
  border:none;
}

.addBtn:hover {
  background-color: #bbb;
}
</style>
<body>

	
	
		<div>
		<!-- header.jsp 영역 -->
		<jsp:include page="../common/header.jsp" />
		</div>
		<!-- sidebar.jsp 영역 
		  교수가 로그인하면 pmySidebar
		  학생이 로그인하면 smySidebar -->
		<div id="todoOuter" style="background-color: rgb(235, 242, 252); width: 1500px; margin:auto; margin-top:30px;">  
		<br clear="both">
				<jsp:include page="../student/smySidebar.jsp" />
			 <jsp:include page="../common/links.jsp"/>

			<div class="bo_content"  >
			
				<!-- title -->
			<div class="page_title">투두리스트</div>
			<p>오늘 <b style="color:rgb(231, 76, 60);">해야할 일</b>은 무엇인가요?</p>
			<hr width="1200px;" align="center;">
			<div class="updel">
			<a href="calendar">캘린더</a>
			</div>
			
			<div style="width:860px; margin:auto;">
			<div id="todoWrap">
				   <input type="hidden" name="tuserNo" id="tuserNo" value="${loginUser.userNo}" />
				 
				<div id="myDIV" class="header">
				  <h2 style="margin:5px; margin-bottom:15px;"">My To Do List</h2>
				  <input type="text" id="myInput" name="todoContent" placeholder="To Do 리스트 내용">
				  <button onclick="addTodo();" class="addBtn">할 일 추가</button>
				</div>
				<ul id="myUL">
				  <li>오늘 할일을 입력하세요</li>
				  <li class="checked">완료한 항목</li>
				</ul>

    		</div>
    	</div>
 
	<script>
	
	$(function(){
		todoSelect();
		
		$(document).on("click", ".close", function(){
			console.log("클릭되나?");
			todoDelete();
		})
		
		$(document).on("click", ".checked", function(){
			todoCheck();
		})
	})
	
	//todo입력 ajax
	function addTodo(){
		$.ajax({
			  type: 'POST',  
			  dataType:'json',
			  url: "todoInsert",
			  data: {
				  tuserNo : $('#tuserNo').val(),
				  todoContent: $('#myInput').val()
					},
			  success:
				function(result){
				   if(result == 1){
					alert('등록이 완료되었습니다 :)');
					todoSelect();
					$("#myInput").val("");
					}
			 	 }
			});
	}
	
	function todoSelect(){
		$.ajax({
			type:'POST',
			dataType:'json',
			url:"todoSelect",
			data : {
				tuserNo : $('#tuserNo').val()
			},
		 	success:function(data){
		 		 console.log(data);
		 		 let value="";
		 		 
		 		 for(let i in data){
		 			 value +=  "<li>"+ '<input type="hidden" name="todoNo" id="todoNo" value="'+data[i].todoNo+'"/>'
							 + data[i].todoContent + "<span class='close'>x</span> </li>";
		 		 }
		 		 $('#myUL').html(value);
		 		 console.log(value);
		 	}
		});
	}
	
	
		function todoDelete(){
			$.ajax({
				type:'POST',
				dataType:'json',
				url:"todoDelete",
				data : {
					todoNo : $('#todoNo').val(),
					tuserNo : $('#tuserNo').val()
				},
			 	success:function(){
			 	 	alert('일정이 삭제되었습니다!');
			 	 	location.reload();
			 		}
			 	
			});
		}
		
		function todoCheck(){
			$.ajax({
				type:'POST',
				dataType:'json',
				url:"todoCheck",
				data : {
					todoNo : $('#todoNo').val(),
					tuserNo : $('#tuserNo').val()
				},
			 	success:function(){
			 	 	 
			 		}
			 	
			});
		}
	
	
	
	
	
	// Create a "close" button and append it to each list item
	var myNodelist = document.getElementsByTagName("LI");
	var i;
	for (i = 0; i < myNodelist.length; i++) {
	  var span = document.createElement("SPAN");
	  var txt = document.createTextNode("\u00D7");
	  span.className = "close";
	  span.appendChild(txt);
	  myNodelist[i].appendChild(span);
	}

	// Click on a close button to hide the current list item
	var close = document.getElementsByClassName("close");
	var i;
	for (i = 0; i < close.length; i++) {
	  close[i].onclick = function() {
	    var div = this.parentElement;
	    div.style.display = "none";
	  }
	}

	// Add a "checked" symbol when clicking on a list item
	var list = document.querySelector('ul');
	list.addEventListener('click', function(ev) {
	  if (ev.target.tagName === 'LI') {
	    ev.target.classList.toggle('checked');
	  }
	}, false);

	// Create a new list item when clicking on the "Add" button
	function newElement() {
	  var li = document.createElement("li");
	  var inputValue = document.getElementById("myInput").value;
	  var t = document.createTextNode(inputValue);
	  li.appendChild(t);
	  if (inputValue === '') {
	    alert("You must write something!");
	  } else {
	    document.getElementById("myUL").appendChild(li);
	  }
	  document.getElementById("myInput").value = "";

	  var span = document.createElement("SPAN");
	  var txt = document.createTextNode("\u00D7");
	  span.className = "close";
	  span.appendChild(txt);
	  li.appendChild(span);

	  for (i = 0; i < close.length; i++) {
	    close[i].onclick = function() {
	      var div = this.parentElement;
	      div.style.display = "none";
	    }
	  }
	}
	</script>	
		
			</div>
		
			

	
	
	 
     		
	</div>
	<!-- footer.jsp-->
	<jsp:include page="../common/footer.jsp" />
	<script>
	

</script>

</body>
</html>