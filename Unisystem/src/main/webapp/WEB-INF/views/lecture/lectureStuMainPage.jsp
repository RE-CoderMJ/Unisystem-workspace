<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<style>
    /* 강의페이지 상단 남색부분 css*/
    #classHeader_info_left, #classHeader_info_middle, #classHeader_info_right{float: left;}
    #classHeader_info_left_pro div{float: left; margin-top: 10px;}
    #classHeader_info_left_pro_name{padding-top: 10px;}
    #classHeader{
        width: 100%;
        height: 200px;
        background-color: rgb(15, 43, 80);
    }
    #classHeader_info{
        width: 1500px;
        margin: auto;
        color: white;
        padding-top: 25px;
    }
    #classHeader_info_left{
        margin-left: 30px;
        font-size: 19px;
    }
    #classHeader_info_left i{
        font-size: 50px;
        margin-right: 15px;
    }
    #classHeader_info_middle{
        margin-left: 680px;
        margin-right: 20px;
        float: left;
    }
    #classHeader_info_middle div{
        border-right: 1px solid rgb(55, 73, 97);
        margin-left: 20px;
        height: 150px;
    }
    #classHeader_info_right h6{margin-bottom: 10px;}

    /* 흰색 내용부분 css */
    #wrap{
        height: 1000px;
        width: 1500px;
        margin: auto;
    }
    #outline, #attendance{
        margin-top: 15px;
        margin-left: 15px;
        background-color: white;
        width: 1305px;
        height: 200px;
        border: 1px solid #e0e0e0;
        padding-top: 15px;
        padding-left: 20px;
        padding-right: 20px;
    }
    #outline div:first-child{
        font-size: 20px; 
        font-weight: bolder;
        padding-bottom: 10px;
    }
    #notice i{
        width: 70px;
        height: 70px;
        border-radius: 50%;
        background-color: rgb(103, 48, 126);
        font-size: 45px;
        color: white;
        padding-left: 20px;
        padding-top: 12px;
        margin-top: 20px;
        margin-left: 15px;
    }
    #notice, #evaluation{cursor: pointer;}
    #evaluation i{
        width: 70px;
        height: 70px;
        border-radius: 50%;
        background-color: #E74C3C;
        font-size: 45px;
        color: white;
        padding-left: 13px;
        padding-top: 12px;
        margin-top: 20px;
        margin-left: 15px;
    }
    #attendance{
        height: 200px; 
        padding: 0;
        margin-top: 15px;
        margin-left: 15px;
        background-color: white;
        width: 1305px;
        height: 200px;
        border: 1px solid #e0e0e0;
    }
    #attendance_title{
        background-color: #f5f5f5;
        height: 48px;
        padding-left: 20px;
    }
    #attendance_title>div{
        font-size: 19px; 
        font-weight: 900;
        padding-bottom: 10px;
        float: left; 
        margin-top: 10px;
    }
    #attendance_title>div:first-child{margin-right: 110px;}
    #attendance_title>div:nth-child(2){
        border-right: 3px solid lightgray;
        margin-left: 20px;
        height: 170px;
        margin-right: 30px;
    }
    #attendance_title_left>div{
        font-size: 14px;
        font-weight: 500;
    }
    #attendance_title_right>div{
        font-size: 17px;
        font-weight: 500;
    }
    #attend>div:first-child, #absence>div:first-child, #lateness>div:first-child{
        width: 70px;
        height: 70px;
        border-radius: 50%;
        background-color: #E74C3C;
        font-size: 32px;
        color: white;
        padding-left: 16px;
        padding-top: 12px;
        margin-top: 20px;
        margin-left: 60px;
    }
    #attend>div:last-child, #absence>div:last-child, #lateness>div:last-child{
        font-size: 13px; 
        font-weight: 400; 
        margin-left: 84px; 
        margin-top: 3px;
        margin-right: 20px;
    }
    #attend, #absence, #lateness{float: left;}
    #attend{margin-left: 40px;}
    #absence, #lateness{margin-left: 30px;}
    #absence>div:first-child, #lateness>div:first-child{padding-left: 26px;}
    #attend>div:first-child{background-color: #153e73;}
    #absence>div:first-child{background-color: #C0392B;}
    #lateness>div:first-child{background-color: #16A085;}
    #attendance_title_right>div{margin-top: 25px;}
    #attendance_title_right>div:focus{border-bottom: black;}
    #classPlan{
        height: 200px; 
        padding: 0;
        margin-top: 15px;
        margin-left: 15px;
        background-color: white;
        width: 1305px;
        height: auto;
        border: 1px solid #e0e0e0
    }
    #classPlan_title{
        background-color: #f5f5f5;
        height: 48px;
        padding-left: 20px;
        padding-top: 10px;
        font-size: 19px;
        font-weight: 900;
    }
    #classPlan>div:nth-child(2){
        margin: 30px 0;
        margin-left: 30px;
    }
    #classPlan_content>div:nth-child(odd){font-size: 19px;font-weight: 900;margin-bottom: 20px;}
    #classPlan_content table{
        width: 1000px; 
        margin: auto; 
        text-align: center;
        font-size: 17px;
    }
    #classPlan_content table tr:first-child{background-color: #e0e0e0;}
    #classPlan_content table th, #classPlan_content table td{padding: 7px 0px;}
    #classPlan_content div:nth-child(3){margin-top: 30px;}

    /* footer css */
    #wrap::after{display:block;content:"";clear:both;}
</style>
</head>
<body>
    
    <!-- header 영역 -->
    <jsp:include page="../common/header.jsp" />
    
        <div id="classHeader">

            <div id="classHeader_info">

                <div id="classHeader_info_left">
                    <div>IT미디어와미래역량</div>
                    <div id="classHeader_info_left_pro">
                        <div><i class="fas fa-user-circle"></i></div>
                        <div id="classHeader_info_left_pro_name">김말똥 교수</div>
                    </div>
                </div>

                <div id="classHeader_info_middle">
                    <select name="" id="" style="float: left; padding: 5px 4px; width: 220px; border-radius: 5px;">
                        <option value="">IT미디어와미래역량</option>
                        <option value="">헌법</option>
                        <option value="">테니스</option>
                    </select>
                    <div style="float: left;"></div>
                </div>

                <div id="classHeader_info_right">
                    <h6 style="font-weight: bold;">공지사항</h6>
                    <div>-[기말시험 대체 과제물]</div>
                    <div>-[기말시험 대체 과제물 작성 관련 필독사항]</div>
                    <div>-[기말시험 공지 및 평가 공지]</div>
                    <div>-[기말시험] 관련 공지</div>
                </div>

            </div>

            
        </div>
        
        <div id="wrap">

            <div style="float: left;">
                <!-- sidebar 영역 -->
                <jsp:include page="../student/sclassSidebar.jsp" />
            </div>

            <div id="wrap_content" style="float: left;">

                <div id="outline">
                    <div>강의 개요</div>
                    <div style="border-bottom: 2px solid lightgray;"></div>
                    <div>
                        <div id="notice" style="float: left;" onclick="location.href='lectureNotice.stu'">
                            <i class="fas fa-microphone"></i>
                            <div style="font-size: 13px; font-weight: 400; margin-left: 25px; margin-top: 3px;">공지사항</div>
                        </div>
                        <div id="evaluation" style="margin-left: 110px;" onclick="location.href='lectureEvaluation.stu'">
                            <i class="fas fa-check"></i>
                            <div style="font-size: 13px; font-weight: 400; margin-left: 25px; margin-top: 3px;">강의평가</div>
                        </div>
                    </div>
                </div>

                <div id="attendance">

                    <div id="attendance_title">

                        <div id="attendance_title_left">
                            <p>출석 현황</p>
                            <div id="attend" onclick="">
                                <div>32</div>
                                <div>출석</div>
                            </div>
        
                            <div id="absence" onclick="">
                                <div>0</div>
                                <div>결석</div>
                            </div>
        
                            <div id="lateness" onclick="">
                                <div>0</div>
                                <div>지각</div>
                            </div>

                        </div>

                        <div></div>

                        <div id="attendance_title_right">
                            과제 현황
                            <div onclick="">
                                - IT미디어와 미래역량 기말과제1 (2013.03.12까지 필히 제출)
                            </div>
                        </div>
                    </div>


                </div>

                <div id="classPlan">

                    <div id="classPlan_title">강의계획표</div>

                    <div id="classPlan_content">
                        <div>교과목개요</div>
                        <div style="margin-right: 30px;">
                            과거에서 현재에 이르는 IT 관련 기술 및 기업의 역사를 짚어 보고, 이들 IT 기술에 의해 촉발된 4차 산업혁명의 진행 현황, 
                            4차 산업혁명에 활용되고 있는 각종 요소들에 대한 이해 및 이들간의 상관관계를 살펴본다. 이에 따른 미래 사회의 변화 및 
                            이에 우리의 대응을 어떻게 할 지 생각하는 시간을 가지도록 한다. 총 15주에 걸친 강의로 강의의 내용은 강의 시점의 현황에 따라 순서 및 내용에 변경이 있을 수 있다.
                        </div>

                        <div>학습 평가 방식</div>
                        <table border="1px">
                            <tr>
                                <th style="width: 120px;">평가방법(%)</th>
                                <th>출석</th>
                                <th>과제</th>
                                <th>중간</th>
                                <th>기말</th>
                            </tr>
                            <tr>
                                <td></td>
                                <td>20</td>
                                <td>10</td>
                                <td>35</td>
                                <td>35</td>
                            </tr>
                        </table>
                    </div>

                </div>


            </div>

        </div>

    </div>




    <!-- footer.jsp-->
   <jsp:include page="../common/footer.jsp" />
</body>
</html>