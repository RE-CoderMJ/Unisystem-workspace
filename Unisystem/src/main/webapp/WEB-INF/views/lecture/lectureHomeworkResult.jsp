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
        height: 1110px;
        background-color: white;
        padding-top: 30px;
    }
    #contentBox_border{
        height: 1000px;     
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
    #contentBox_content{
        margin-top: 30px;
    }
    #contentCount>span{color: #F39C12;}

    /* 하단 button 영역 */
    #two_btn{
        position: absolute;
        clear: right;
        float: right;
        width: 200px;
        height: 40px;
        left: 1150px;
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
    #del_up_botton>button:first-child{
        padding:  3px 17px;
        background-color: lightgray;
        border: none;
        color: black;
    }

    #feedback_header{
        margin-top: 250px;
        font-size: 20px;
        font-weight: 900;
        margin-bottom: 5px;
    }
    #feedback_content{
        border: 1px solid lightgray;
        padding: 10px;
    }
    #homework_score_title{
        font-size: 20px;
        margin-top: 70px;
        font-weight: 900;
    }
    #homework_score>span{color: red; margin-left: 15px;}
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
                        8주차 과제
                        <span><i class="fas fa-paperclip"></i></span>
                    </div>

                    <div id="contentBox_info">
                        <div><i class="fas fa-user-circle"></i></div>
                        <div id="pro_name">
                            <div>김말똥<span>교수</span></div>
                            <div>2022.01.01 15:44 <span>조회 13</span></div>
                        </div>
                    </div>

                    <div>
                        <div id="contentBox_file">
                            <i class="far fa-folder" style="float: left;"></i>
                            <div style="float: left; margin-top: 12px; margin-left: 10px;">8주차 과제.docx</div>
                        </div>
                        <div id="contentBox_content">
                            상단에 과제 다운로드 후 2022.01.01 12:00시까지 제출하시길 바랍니다.
                        </div>
                    </div>

                    
                    <div id="feedback_header">과제피드백</div>
                    <div id="feedback_content">
                        <div>어느 부분을 잘 작성했고 어느 부분을 조금 보충해야할 듯 합니다. 전반적으로 잘하셨습니다.</div>
                    </div>
                    
                    <div style="margin-top: 50px;">
                        <span id="homework_score_title">과제 점수</span>
                        <span id="homework_scorestyle" style="font-size: 20px;"><span style="margin-left: 10px; color: red;">80 </span>/ 100</span>
                    </div>

                    <div id="two_btn">
                        <button type="button">목록</button>
                    </div>
                </div>

                


            </div>

        </div>
    </div>

    <!-- footer.jsp-->
    <jsp:include page="../common/footer.jsp" />
</body>
</html>