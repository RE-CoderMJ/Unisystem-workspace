<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<style>
    #wrap{
    height: 1500px;
    width: 1500px;
    margin: auto;
    }
    /* page header 영역 */
    #content_header{
        margin-top: 30px;
        margin-left: 30px;
        font-size: 24px;
        font-weight: 900;
    }
    #content_header>span{font-size: 17px; color: lightgrey;}
    /* content 영역*/
    #contentBox{
        margin-left: 30px;
        margin-top: 30px;
        width: 1290px;
        height: 1360px;
        background-color: white;
        padding-top: 30px;
    }
    #contentBox_border{
        height: 660px;     
        border: 1px solid lightgrey;
        margin-left: 30px;
        width: 1230px;
        padding: 50px;
        position: relative;
    }
    #contentBox_header{
        font-size: 30px;
        font-weight: 900;
        margin-bottom: 10px;
    }
    #contentBox_info>div:first-child{float: left;}
    #contentBox_info>div>i{font-size: 50px; color: grey; margin-right: 8px;}
    #contentBox_info>div:nth-child(2){margin-bottom: 10px;}
    #contentBox_info{
        border-bottom: 2px solid lightgray; 
        margin-bottom: 30px;
        }
    #pro_name>div:first-child{font-size: 18px; font-weight: 900;}
    #pro_name>div:first-child span{font-size: 15px; font-weight: 600;}
    #contentBox_file{
        border: 2px solid lightgrey;
        height: 60px;
        width: 700px;
        padding: 5px 20px;
        vertical-align: middle;
    }
    #contentBox_file i{font-size: 50px;}
    #contentBox_content{margin-top: 30px;}
    #contentCount>span{color: #F39C12;}
    #contentBox_text{
        border: none;
        width: 100%;
        resize: none;
        padding: 5px 5px;
    }
    #title{
        border: 2px solid lightgray;
        width: 100%;
    }
    #title:focus{outline: none;}
    #contentBox_text:focus{outline: none;}

    /* 하단 button 영역 */
    #two_btn{
        margin-top: 240px;
        margin-left: 500px;
        float: right;
        width: 65px;
    }
    #two_btn button{
        border: none;
        border-radius: 3px;
        padding: 3px 13px;
        background-color: lightgray;
    }
    #two_btn button:focus{outline: none;}

    /* 파일 업로드 영역*/
    .box-file-input{
        width: 500px;
        margin-top: 5px;
    }
    .box-file-input label{
	    display:inline-block;
	    background:rgb(21, 62, 115);
	    color:#fff;
	    padding:0px 15px;
	    line-height:35px;
	    cursor:pointer;
    }

    .box-file-input label:after{
    	content:"파일등록";
    }

    .box-file-input .file-input{
    	display:none;
    }

    .box-file-input .filename{
    	display:inline-block;
    	padding-left:10px;
    }
    
    #meeting-time{
   		margin-top : 10px;
    }
    
    /* 하단 학생 과제 리스트 영역 */
    #stuHomeworkList{
    	padding: 40px 30px 0px 30px;
    }
    #stuHomeworkList>div:first-child{
    	font-size:23px;
    	font-weight:900;
    	margin-bottom:10px;
    }
    #stuHomeworkList>div:nth-child(2){
    	float:right;
    	margin-bottom:10px;
    }
    #stuHomeworkList_table{
    	margin: 20px 0px;
        width: 1230px;
        text-align: center;
    }
    #stuHomeworkList_table th, #stuHomeworkList_table td{padding: 3px 0;}
    #stuHomeworkList_table th{background-color: #eeeeee; border-top: 2px solid lightgray;}
    #stuHomeworkList_table tr:last-child td{border-bottom: 2px solid lightgray;}
    #stuHomeworkList_table td{border-top: 1px solid lightgray;}
    
    #endHomeworkBtn{
    	margin-left:1040px;
    	border: none;
        border-radius: 3px;
        padding: 3px 13px;
        background:rgb(21, 62, 115);
        color:white;
    }
    #endHomeworkBtn:focus{outline:none;}
    
    /*페이징바*/
	.container{
	    margin-top: 50px;
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
</style>
</head>
<body>
    <!-- header 영역 -->
    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/links.jsp"/>
    
    <div id="wrap">

        <div style="float: left;">
            <!-- sidebar 영역 -->
            <jsp:include page="../student/sclassSidebar.jsp" />
        </div>

        <div id="wrap_content" style="float: left;">
            
            <article id="content_header"><span>자료실 > </span>과제업로드</article>

            <div id="contentBox">

                    <div id="contentBox_border">
                    
                        <div id="contentBox_header">
                        	과제입니다 어서들 하세요~
                        	<c:if test="${ not empty at.originName}">
	                            <span><i class="fas fa-paperclip"></i></span>
                        	</c:if>
                        </div>
    
                        <div id="contentBox_info">
                            <div><i class="fas fa-user-circle"></i></div>
                            <div id="pro_name">
                                <div>${ loginUser.korName }<span>교수</span></div>
                                <div>2022.03.01 15:44</div>
                            </div>
                        </div>
    
                        <div>
                            <div id="contentBox_file">
                            	<i class="far fa-folder" style="float: left;"></i>
                            	<div style="float: left; margin-top: 12px; margin-left: 10px;">
                            	
								<c:choose>
			                    	<c:when test="${ empty at.originName}">
			                    		<a href="resources/uploadFiles/homework_upfiles/2022022821402575160.pdf" download="Git Commit Message Rule.pdf">Git Commit Message Rule.pdf</a>
			                    	</c:when>
			                    	<c:otherwise>
		                        		<!-- <a href="${ at.path }" download="${ at.originName }">${ at.originName }</a> -->
		                        		<a href="resources/uploadFiles/homework_upfiles/2022022821402575160.pdf" download="Git Commit Message Rule.pdf">Git Commit Message Rule.pdf</a>
			                    	</c:otherwise>
                        		</c:choose>
                        		
                            	</div>
                        	</div>
                            <div id="homeworkpEndDateTime"><!-- 마감기한 : ${ h.homeworkpEndDateTime }  --></div>
                        	<div id="contentBox_content">
                           	<!-- ${ h.homeworkpContent } -->
                           	상단에 과제 다운로드 후 2022.03.03 18:00시까지 제출하시길 바랍니다.
                        	</div>    
                        </div>
							       
                        <div id="two_btn">
                            <button type="button" onclick="location.href='homeworkProEndList.lec';">목록</button>
                        </div>
       
                    </div>
                    
                    <div id="stuHomeworkList">
                    
	                   	<div>과제 제출 현황</div>
	                   	<div> 16명 / ${ classInfo.currStud }명</div>
	                   	<table id="stuHomeworkList_table">
	                   		<thead>
	                   			<tr>
	                   				<th>번호</th>
	                   				<th>학년</th>
	                   				<th>학번</th>
	                   				<th>이름</th>
	                   				<th>제출상황</th>
	                   				<th>제목</th>
	                   				<th>첨부파일</th>
	                   				<th>채점여부</th>
	                   			</tr>
	                   		</thead>
	                   		<tbody>
								<tr>
	                   				<td>1</td>
	                   				<td>1학년</td>
	                   				<td>201800101</td>
	                   				<td>성민석</td>
	                   				<td>제출</td>
	                   				<td><a href="lectureHomeworkResult.stu">201800101 성민석 과제제출입니다.</a></td>
	                   				<td><a href="lectureHomeworkResult.stu">201800101 성민석.docx</a></td>
	                   				<td>채점</td>
	                   			</tr>
	                   			<tr>
	                   				<td>2</td>
	                   				<td>1학년</td>
	                   				<td>201800102</td>
	                   				<td>강기나</td>
	                   				<td>제출</td>
	                   				<td><a href="lectureHomeworkResult.stu">201800102 강기나 과제제출입니다.</a></td>
	                   				<td><a href="lectureHomeworkResult.stu">201800102 강기나.docx</a></td>
	                   				<td>미채점</td>
	                   			</tr>
	                   			<tr>
	                   				<td>3</td>
	                   				<td>1학년</td>
	                   				<td>201800103</td>
	                   				<td>고도일</td>
	                   				<td>미제출</td>
	                   				<td></td>
	                   				<td><a></a></td>
	                   				<td>미채점</td>
	                   			</tr>
	                   			<tr>
	                   				<td>4</td>
	                   				<td>1학년</td>
	                   				<td>201800104</td>
	                   				<td>김송준</td>
	                   				<td>제출</td>
	                   				<td><a href="lectureHomeworkResult.stu">201800104 김송준 과제제출입니다.</a></td>
	                   				<td><a href="lectureHomeworkResult.stu">201800104 김송준.docx</a></td>
	                   				<td>미채점</td>
	                   			</tr>
	                   			<tr>
	                   				<td>5</td>
	                   				<td>1학년</td>
	                   				<td>201800105</td>
	                   				<td>김민균</td>
	                   				<td>제출</td>
	                   				<td><a href="lectureHomeworkResult.stu">201800105 김민균 과제제출입니다.</a></td>
	                   				<td><a href="lectureHomeworkResult.stu">201800105 김민균.docx</a></td>
	                   				<td>미채점</td>
	                   			</tr>
	                   			<tr>
	                   				<td>6</td>
	                   				<td>1학년</td>
	                   				<td>201800106</td>
	                   				<td>김민호</td>
	                   				<td>제출</td>
	                   				<td><a href="lectureHomeworkResult.stu">201800106 김민호 과제제출입니다.</a></td>
	                   				<td><a href="lectureHomeworkResult.stu">201800106 김민호.docx</a></td>
	                   				<td>미채점</td>
	                   			</tr>
	                   			<tr>
	                   				<td>7</td>
	                   				<td>1학년</td>
	                   				<td>201800107</td>
	                   				<td>김도희</td>
	                   				<td>제출</td>
	                   				<td><a href="lectureHomeworkResult.stu">201800107 김도희 과제제출입니다.</a></td>
	                   				<td><a href="lectureHomeworkResult.stu">201800107 김도희.docx</a></td>
	                   				<td>미채점</td>
	                   			</tr>
	                   			<tr>
	                   				<td>8</td>
	                   				<td>1학년</td>
	                   				<td>201800108</td>
	                   				<td>김승민</td>
	                   				<td>제출</td>
	                   				<td><a href="lectureHomeworkResult.stu">201800108 성민석 과제제출입니다.</a></td>
	                   				<td><a href="lectureHomeworkResult.stu">201800108 김승민.docx</a></td>
	                   				<td>미채점</td>
	                   			</tr>
	                   			<tr>
	                   				<td>9</td>
	                   				<td>1학년</td>
	                   				<td>201800109</td>
	                   				<td>김소연</td>
	                   				<td>미제출</td>
	                   				<td></td>
	                   				<td><a></a></td>
	                   				<td>미채점</td>
	                   			</tr>
	                   			<tr>
	                   				<td>10</td>
	                   				<td>1학년</td>
	                   				<td>201800110</td>
	                   				<td>박민화</td>
	                   				<td>제출</td>
	                   				<td><a href="lectureHomeworkResult.stu">201800110 박민화 과제제출입니다.</a></td>
	                   				<td><a href="lectureHomeworkResult.stu">201800110 박민화.docx</a></td>
	                   				<td>미채점</td>
	                   			</tr>	                   				                   			                   				                   				                   				                   				                   				                   				                   				                   				                 	              
	                   		</tbody>
	                   	</table>
	                   	
	                   	<!-- 
	                   	<div class="container">
	                        <ul class="pagination justify-content-center">
	                    		<c:choose>
	                    			<c:when test="${ pi.currentPage eq 1 }">
			                        	<li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
	                    			</c:when>
	                    			<c:otherwise>
			                        	<li class="page-item"><a class="page-link" href="homeworkProEndList.lec?cpage=${ pi.currentPage - 1 }&classNo=${classInfo.classNo}">&lt;</a></li>
	                    			</c:otherwise>
	                    		</c:choose>
	                    		
	                    		<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	                    			<c:choose>
	                    				<c:when test="${ pi.currentPage == p }">
	                            			<li class="page-item active"><a class="page-link" href="homeworkProEndList.lec?cpage=${ p }&classNo=${classInfo.classNo}">${ p }</a></li>	
	                    				</c:when>
	                    				<c:otherwise>
	                    					<li class="page-item"><a class="page-link" href="homeworkProEndList.lec?cpage=${ p }&classNo=${classInfo.classNo}">${ p }</a></li>	
	                    				</c:otherwise>
	                    			</c:choose>
	                    		</c:forEach>
	                    		
	                    		<c:choose>
	                    			<c:when test="${ pi.currentPage eq pi.maxPage }">
			                        	<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
	                    			</c:when>
	                    			<c:otherwise>
			                        	<li class="page-item"><a class="page-link" href="homeworkProEndList.lec?cpage=${ pi.currentPage + 1 }&classNo=${classInfo.classNo}">&gt;</a></li>
	                    			</c:otherwise>
	                    		</c:choose>
	                        </ul>
	                    </div>
	                   	
	                   	 -->
	                   	 
	                   	 <div class="container">
		                    <ul class="pagination justify-content-center">
		                      <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
		                      <li class="page-item active"><a class="page-link" href="#">1</a></li>
		                      <li class="page-item"><a class="page-link" href="#">2</a></li>
		                      <li class="page-item"><a class="page-link" href="#">3</a></li>
		                      <li class="page-item"><a class="page-link" href="#">4</a></li>
		                      <li class="page-item"><a class="page-link" href="#">5</a></li>
		                      <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
		                    </ul>
		                 </div>
                    </div>
    
               </div>
               
               <form id="postForm" action="" method="post">
                   <input type="hidden" id="classNo" name="classNo" value="${ classInfo.classNo }" />
                   <input type="hidden" id="homeworkpNo" name="homeworkpNo" value="${ h.homeworkpNo }" /> 
                   <input type="hidden" name="userNo" value="${ loginUser.userNo }" />
			       <input type="hidden" name="classCode" value="${ classInfo.classCode }" />
			       <input type="hidden" name="classNo" value="${ classInfo.classNo }" />
			       <input type="hidden" name="cpage" value="1" />              
               </form>



                
                <script>                   
                    $(document).on("change", ".file-input", function(){
                    
                    $filename = $(this).val();

                    if($filename == "")
                        $filename = "파일을 선택해주세요.";

                    $(".filename").text($filename);

                    })
                    
      
  					//document.getElementById('meeting-time').value = new Date().toISOString().slice(0, 16);
                    
                    /*
					$(function(){
						selectProInfo();
					})
					
					function selectProInfo(){
						
						let hno = $("#homeworkpNo").val();
						
						$.ajax({
							url:"selectProInfo.lec",
							data:{
								hno:hno
							}, success:function(data){
								console.log(data);
								let value1 = data.homeworkpContent;
								let value2 = data.homeworkpName;
								let value3 = "마감기한 : " + data.homeworkpEndDateTime;
								
								$("#contentBox_content").html(value1);
								$("#contentBox_header").html(value2);
								$("#homeworkpEndDateTime").html(value3);
							}, error:function(){
								
							}
							
						})
					}
                    */
					
                </script>

            </div>

        </div>


    <!-- footer.jsp-->
    <jsp:include page="../common/footer.jsp" />
</body>
</html>