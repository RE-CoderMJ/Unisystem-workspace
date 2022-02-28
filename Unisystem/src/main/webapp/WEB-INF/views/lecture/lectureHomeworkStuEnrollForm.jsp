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
    height: 1350px;
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
        height: 1200px;
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
    #pro_name>div:first-child{font-size: 18px; font-weight: 900;}
    #pro_name>div:first-child span{font-size: 15px; font-weight: 600;}
    #contentBox_file{
        border: 2px solid lightgrey;
        height: 60px;
        width: 400px;
        padding: 5px 20px;
        vertical-align: middle;
    }
    #contentBox_file i{font-size: 50px;}
    #contentBox_content{margin-top: 30px;}
    #contentCount>span{color: #F39C12;}

    /* 하단 button 영역 */
    #two_btn{
        position: absolute;
        clear: right;
        float: right;
        width: 200px;
        height: 40px;
        left: 1090px;
        bottom: 0px;
    }
    #two_btn button{
        border: none;
        border-radius: 3px;
        padding: 3px 10px;
        background-color: lightgray;
    }
    #two_btn button:focus{outline: none;}
    #two_btn button:first-child{margin-right: 5px;}

    /* 과제 제출 영역*/
    #contentBox_border_bottom{
        margin-top: 10px;
        height: 420px;     
        border: 1px solid lightgrey;
        margin-left: 30px;
        width: 1230px;
        padding: 20px;
    }
    #contentBox_border_bottom_header{
        font-size: 20px;
        font-weight: 900;
        margin-bottom: 20px;
    }
    #contentBox_border_bottom>div:nth-child(2){
        border: 1px solid lightgray;
        padding: 10px;
    }
    #contentBox_border_bottom textarea{
        border: 1px solid lightgray;
        padding: 10px 5px;
    }
    #contentBox_border_bottom textarea:focus{outline: none;}
    #contentBox_border_bottom button{
        margin-left: 1093px;
        margin-top: 5px;
        padding: 3px 15px;
        background-color: rgb(21, 62, 115);
        border-radius: 5px;
        color: white;
    }

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
    
    .filename{
	  white-space: nowrap;
	  overflow: hidden;
	  text-overflow: ellipsis;
	  width:400px; 
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
                        ${ h.homeworkpName }
                        <c:if test="${ not empty at.originName}">
	                    	<span><i class="fas fa-paperclip"></i></span>
                        </c:if>
                    </div>

                    <div id="contentBox_info">
                        <div><i class="fas fa-user-circle"></i></div>
                        <div id="pro_name">
                            <div>${ h.korName }<span>교수</span></div>
                            <div>${ h.homeworkpEndDateTime }</div>
                        </div>
                    </div>

                    <div>
                        <div id="contentBox_file">
                            <i class="far fa-folder" style="float: left;"></i>
                            <div style="float: left; margin-top: 12px; margin-left: 10px;">
                            
							<c:choose>
		                    	<c:when test="${ empty at.originName}">
		                    		첨부파일이 없습니다.
		                    	</c:when>
		                    	<c:otherwise>
	                        		<a href="${ at.path }" download="${ at.originName }">${ at.originName }</a>
		                    	</c:otherwise>
                        	</c:choose>
                        	                           
                            </div>
                        </div>
                        <div>마감기한 : ${ h.homeworkpEndDateTime }</div>
                        <div id="contentBox_content">
                            ${ h.homeworkpContent }
                        </div>
                    </div>

                    <div id="two_btn">
                        <button type="button" onclick="history.back()">목록</button>
                        <button type="button" style="cursor:pointer;" onclick="window.scrollTo(0,0);">▲TOP</button>
                    </div>
   
                </div>
                <form id="enrollForm" method="post" action="stuHomeworkInsert.lec" enctype="multipart/form-data"> 
                    <input type="hidden" name="homeworkpNo" id="homeworkpNo" value="${ h.homeworkpNo }" />
                    <input type="hidden" name="studNo" value="${ loginUser.userNo }" />
                    <div id="contentBox_border_bottom">
                        <div id="contentBox_border_bottom_header">과제 제출</div>
                        <div>
                            <div>
                                <div class="box-file-input">
                                    <label><input type="file" name="upfile" class="file-input"  accept="image/*,.pdf" id="upfile"></label>
                                    <span class="filename">
                                    	
                                    </span>
                                </div>
                            </div>   
                        	<div>
                                <textarea name="homeworksContent" id="homeworksContent" rows="7" style="resize: none; width: 100%;" placeholder="내용을 입력하세요."></textarea>
                                <button type="submit">제출</button>
                            </div>
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
                    
                    $(function(){
                    	selectStuHomeworkDetail();
                    	selectStuAttachHomework();
                    })
                    
                    function selectStuHomeworkDetail(){
                    	
                    	let homeworkpNo = $("#homeworkpNo").val();
                    	
                    	$.ajax({
                    		url:"selectStuHomeworkDetail.lec",
                    		data:{
                    			homeworkpNo : homeworkpNo
                    		},
                    		success:function(h){
                    			
                    			console.log(h);
                    			let value = "";
                    			
                    			value = h.homeworksContent;
                    			$("#homeworksContent").html(value);
                    		}, error:function(){
                    			
                    		}
                    	})
                    }
                    
                    function selectStuAttachHomework(){
                    	
                    	let homeworkpNo = $("#homeworkpNo").val();
                    	
                    	$.ajax({
                    		url:"selectStuAttachHomework.lec",
                    		data:{
                    			homeworkpNo : homeworkpNo
                    		},
                    		success:function(att){
                    			let value = "";
                    			
                    			if(att != null){
									value = "<a href='" + att.path + "' download='" + att.originName + "' >" + att.originName  + "</a>";  
									//$("#filename a").attr("href", "${ at.path }");
									//$("#filename a").attr("download", "${ at.originName }");
									//$("#filename a").html("${ at.originName }");
									
									$(".filename").html(value);
                    			} else{
                    				
                    				value = "파일을 선택해주세요.";
                    				$(".filename").html(value);
                    			}
                    			
                    		}, error:function(){
                    			
                    		}
                    	})
                    }
                </script>
                


            </div>

        </div>
    </div>

    <!-- footer.jsp-->
    <jsp:include page="../common/footer.jsp" />
</body>
</html>