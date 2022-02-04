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
    height: 900px;
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
    
    /*공지사항 영역*/
    #noticeBox{
        margin-left: 30px;
        margin-top: 30px;
        width: 1290px;
        height: 700px;
        background-color: white;
        padding-top: 30px;
    }
    #noticeBox_border{
        height: 640px;     
        border: 1px solid lightgrey;
        margin-left: 30px;
        width: 1230px;
        padding: 50px;
        position: relative;
    }
    #noticeBox_header{
        font-size: 30px;
        font-weight: 900;
        margin-bottom: 10px;
    }
    #noticeBox_info>div:first-child{float: left;}
    #noticeBox_info>div>i{font-size: 50px; color: grey; margin-right: 8px;}
    #noticeBox_info>div:nth-child(2){margin-bottom: 20px;}
    #noticeBox_info{
        border-bottom: 2px solid lightgray; 
        margin-bottom: 30px;
        }
    #pro_name>div:first-child{font-size: 18px; font-weight: 900;}
    #pro_name>div:first-child span{font-size: 15px; font-weight: 600;}
    #noticeBox_file{
        border: 2px solid lightgrey;
        height: 60px;
        width: 400px;
        padding: 5px 20px;
        vertical-align: middle;
    }
    #noticeBox_file i{font-size: 50px;}
    #noticeBox_content{margin-top: 30px;}

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
</style>
</head>
<body>
    <!-- header 영역 -->
    <jsp:include page="../common/header.jsp" />
    
    <div id="wrap">

        <div style="float: left;">
            <!-- sidebar 영역 -->
            <jsp:include page="../student/sclassSidebar.jsp" />
        </div>

        <div id="wrap_content" style="float: left;">
            
            <article id="content_header">공지사항</article>

            <div id="noticeBox">

                <div id="noticeBox_border">
                    <div id="noticeBox_header">
                        기말시험 대체과제물
                        <span><i class="fas fa-paperclip"></i></span>
                    </div>

                    <div id="noticeBox_info">
                        <div><i class="fas fa-user-circle"></i></div>
                        <div id="pro_name">
                            <div>김말똥<span>교수</span></div>
                            <div>2022.01.01 15:44 <span>조회 13</span></div>
                        </div>
                    </div>

                    <div>
                        <div id="noticeBox_file">
                            <i class="far fa-folder" style="float: left;"></i>
                            <div style="float: left; margin-top: 12px; margin-left: 10px;">기말시험 대체과제물.PDF</div>
                        </div>
                        <div id="noticeBox_content">
                            이번 기말시험 대체과제물입니다.<br>
                            다운받아서 2022년 01월 21일 자정까지 과제업로드방에 제출바랍니다.
                        </div>
                    </div>

                    <div id="two_btn">
                        <button type="button">목록</button>
                        <button type="button">▲TOP</button>
                    </div>
                    
                </div>

            </div>

        </div>
    </div>

    <!-- footer.jsp-->
    <jsp:include page="../common/footer.jsp" />
</body>
</html>