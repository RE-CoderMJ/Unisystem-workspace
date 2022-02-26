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
    height: 1000px;
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
        height: 750px;
        background-color: white;
        padding-top: 30px;
    }
    #contentBox_border{
        height: 640px;     
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
    #contentBox_info>div:nth-child(2){margin-bottom: 20px;}
    #contentBox_info{
        border-bottom: 2px solid lightgray; 
        margin-bottom: 30px;
        }
    #pro_name>div:first-child{font-size: 18px; font-weight: 900; margin-bottom: 30px; padding-top: 10px;}
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
        margin-top: 20px;
        margin-left: 40px;
        float: right;
        width: 150px;
        height: 40px;
        left: 1090px;
        bottom: 0px;
    }
    #two_btn button{
        border: none;
        border-radius: 3px;
        padding: 3px 13px;
        background-color: lightgray;
    }
    #two_btn button:focus{outline: none;}
    #two_btn button:first-child{margin-right: 5px;}
    #two_btn button:last-child{background-color: rgb(21, 62, 115); color: white;}

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

                <form id="updateForm" method="post" action="updateProHomework.lec" enctype="multipart/form-data">

                    <div id="contentBox_border">
                        <div id="contentBox_header">
                            <input type="text" id="title" name="homeworkpName" placeholder="제목 입력" value="${ h.homeworkpName }">
                            <c:if test="${ not empty at.originName}">
	                            <span><i class="fas fa-paperclip"></i></span>
                        	</c:if>
                        </div>
    
                        <div id="contentBox_info">
                            <div><i class="fas fa-user-circle"></i></div>
                            <div id="pro_name">
                                <div>${ loginUser.korName }<span>교수</span></div>
                            	<input type="hidden" id="classNo" name="classNo" value="${ classInfo.classNo }" />
                            </div>
                        </div>
    
                        <div>
                            <div id="contentBox_file">
                                <div class="box-file-input">
                                    <label><input type="file" name="reupfile" class="file-input" accept="image/*" id="upfile"></label>
	                                <c:if test="${ not empty at.originName }">                                
			                                                               현재 업로드된 파일 : 
			                            <a href="${ at.changeName }" download="${ at.originName }">${ at.originName }</a>
			                            <!-- 첨부파일이 있을때만 넘어가는 input type="hidden" 요소  -->
			                            <input type="hidden" name="originName" value="${ at.originName }" />
			                            <input type="hidden" name="changeName" value="${ at.changeName }" />
		                        	</c:if>
                                </div>      
                            </div>
                            <label for="meeting-time">마감기한 : </label>

							<input type="datetime-local" id="meeting-time"
							   	   name="homeworkpEndDateTime" value="${ h.homeworkpEndDateTime }" >
							       
                            <div id="contentBox_content">
                                <textarea name="homeworkpContent" id="contentBox_text" cols="30" rows="10" placeholder="내용을 입력하세요." >${ h.homeworkpContent }</textarea>
                            </div>
                        </div>
    
                        <div id="two_btn">
                            <button type="button" onclick="history.back()">목록</button>
                            <button type="submit">수정</button>
                        </div>
       
                    </div>

                </form>


                
                <script>                   
                    $(document).on("change", ".file-input", function(){
                    
                    $filename = $(this).val();

                    if($filename == "")
                        $filename = "파일을 선택해주세요.";

                    $(".filename").text($filename);

                    })
                    
      
  					document.getElementById('meeting-time').value = new Date().toISOString().slice(0, 16);

                </script>

            </div>

        </div>
    </div>

    <!-- footer.jsp-->
    <jsp:include page="../common/footer.jsp" />
</body>
</html>