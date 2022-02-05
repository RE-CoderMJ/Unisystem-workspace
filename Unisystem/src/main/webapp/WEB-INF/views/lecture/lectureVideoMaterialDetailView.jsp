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
    #content_header>span{font-size: 17px; color: lightgrey;}
    /* content 영역*/
    #contentBox{
        margin-left: 30px;
        margin-top: 30px;
        width: 1290px;
        height: 700px;
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
    #contentBox_content{margin-top: 30px;}
    #contentCount>span{color: #F39C12;}
    #contentBox_video{
        background-color: lightgray;
        width: 600px;
        height: 280px;
    }

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
            
            <article id="content_header"><span>자료실 > </span>영상자료실</article>

            <div id="contentBox">

                <div id="contentBox_border">
                    <div id="contentBox_header">
                        X주차 영상자료
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
                        <div id="contentBox_video">
                            
                        </div>
                        <div id="contentBox_content">
                            다음 수업 전까지 반드시 위에 영상을 시청해오시기 바랍니다.
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