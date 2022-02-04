<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<style>
    /* 흰색 내용부분 css */
    #wrap{
    height: 1400px;
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
    /*강의평가 영역*/
    #evaluationBox{
        margin-left: 30px;
        margin-top: 30px;
        width: 1290px;
        height: 1250px;
        background-color: white;
        position: relative;
        margin-bottom: 40px;
    }
    #evaluationBox>div:first-child{
        font-size: 20px; 
        text-align: center; 
        font-weight: 700;
        margin: 0px 20px;
        padding-top: 30px;
        padding-bottom: 30px;
        border-bottom: 2px solid lightgray;
    }
    #evaluationBox>div:first-child>span{
        font-size: 28px; 
        font-weight: 900; 
        margin-left: 3px;
    }
    #evaluationBox>div:nth-child(2), #evaluationBox table{
        margin: 10px 20px;
    }
    #evaluationBox>div:nth-child(2)>span{color: red;}
    #evaluationBox table{width: 1250px; text-align: center;}
    #class_info th:nth-child(odd){background-color: #0F2B50; color: white;}
    #class_info th:nth-child(even){background-color: lightgray}
    #class_info th{width: 80px;}
    #class_info th:nth-child(6){width: 500px; text-align: left; padding-left: 20px;}
    #evaluationBox table textarea{
        resize: none; 
        width: 100%; 
        border: 2px solid lightgray;
        padding: 5px 10px;
        margin-top: 5px;
    }
    textarea:focus{outline: none;}
    #class_evaluation_header th:first-child{width: 60px;}
    #submitBtn button:focus{outline: none;}
    #submitBtn button:first-child{margin-right: 5px;}
    #class_evaluation tr:first-child, #class_evaluation tr:nth-child(2){background-color: #e0e0e0;}
    #class_evaluation tr{border-top: 1px solid lightgray;}
    #class_evaluation tr:first-child{border-top: 2px solid #bcbcbc;}
    #class_evaluation tr:last-child{border-bottom: 2px solid #bcbcbc;}
    #class_evaluation th, #class_evaluation td{padding: 3px 0;}
    /* 하단 button 영역 */
    #submitBtn{
        position: absolute;
        clear: right;
        float: right;
        width: 100px;
        height: 40px;
        left: 1200px;
        bottom: 20px;
    }
    #submitBtn button{
        border: none;
        border-radius: 3px;
        padding: 4px 14px;
        background-color: rgb(21, 62, 115);
        color: white;
        font-size: 16px;
    }
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

            <article id="content_header">강의평가</article>

            <div id="evaluationBox">

                <div>
                    IT미디어와미래역량 <span>강의 평가</span>
                </div>
                <div>
                    <span>강의평가는 익명성을 보장하며 행정업무상 참여인원만을 확인하고 수업개선을 위한 소중한 자료로 활용됩니다.<br></span>
                    강의평가서는 수업의 질을 향상하기 위한 목적으로 제작되었으며, <span>성적평가에는 영향을 받지 않습니다.</span><br><br>

                    * 강의평가를 실시한 강좌는 수정이 불가능하므로 답안을 작성할 때 신중을 기해주시기 바랍니다.<br>
                    * 답변방법<br>
                    -  각 문항에 대한 답은 5단계로 구성되어 있으며, 문항에 대항 하는 답을 체크하여 주시기 바랍니다.<br>
                </div>
                <table id="class_info">
                    <tr>
                        <th>학년도</th>
                        <th>2021</th>
                        <th>학기</th>
                        <th>1학기</th>
                        <th>과목명</th>
                        <th>IT미디어와미래역량</th>
                        <th>교수명</th>
                        <th>김말똥</th>
                    </tr>
                </table>

                <form action="" style="margin-top: 30px;">

                    <table id="class_evaluation">
                            <tr id="class_evaluation_header">
                                <th>순번</th>
                                <th>설문내용</th>
                                <th colspan="5">평가척도</th>
                            </tr>
                            <tr id="score"> 
                                <th></th>
                                <th></th>
                                <th style="width: 60px;">매우<br>그렇다</th>
                                <th style="width: 60px;">대체로<br>그렇다</th>
                                <th style="width: 60px;">보통<br>이다</th>
                                <th style="width: 60px;">대체로<br>아니다</th>
                                <th style="width: 60px;">매우<br>아니다</th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>나는 수업에 지속적인 관심을 가지고 스스로 열심히 공부하였다. </td>
                                <td>
                                    <input type="radio" name="1" value="5">
                                </td>
                                <td>
                                    <input type="radio" name="1" value="4">
                                </td>
                                <td>
                                    <input type="radio" name="1" value="3">
                                </td>
                                <td>
                                    <input type="radio" name="1" value="2">
                                </td>
                                <td>
                                    <input type="radio" name="1" value="1">
                                </td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>수업자료(교재, 참고문헌, 강의자료 등)는 강의를 이해하고 지식을 습득하는데 도움이 되었다. </td>
                                <td>
                                    <input type="radio" name="2" value="5">
                                </td>
                                <td>
                                    <input type="radio" name="2" value="4">
                                </td>
                                <td>
                                    <input type="radio" name="2" value="3">
                                </td>
                                <td>
                                    <input type="radio" name="2" value="2">
                                </td>
                                <td>
                                    <input type="radio" name="2" value="1">
                                </td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>강의는 강의계획서에 따라 체계적으로 진행되었다. </td>
                                <td>
                                    <input type="radio" name="3" value="5">
                                </td>
                                <td>
                                    <input type="radio" name="3" value="4">
                                </td>
                                <td>
                                    <input type="radio" name="3" value="3">
                                </td>
                                <td>
                                    <input type="radio" name="3" value="2">
                                </td>
                                <td>
                                    <input type="radio" name="3" value="1">
                                </td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>교수는 학생들의 수업 이해 정도를 고려하여 수업을 하였다.</td>
                                <td>
                                    <input type="radio" name="4" value="5">
                                </td>
                                <td>
                                    <input type="radio" name="4" value="4">
                                </td>
                                <td>
                                    <input type="radio" name="4" value="3">
                                </td>
                                <td>
                                    <input type="radio" name="4" value="2">
                                </td>
                                <td>
                                    <input type="radio" name="4" value="1">
                                </td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>수업방법(강의, 토론 등)은 학습내용을 이해하는데 적절하였다. </td>
                                <td>
                                    <input type="radio" name="5" value="5">
                                </td>
                                <td>
                                    <input type="radio" name="5" value="4">
                                </td>
                                <td>
                                    <input type="radio" name="5" value="3">
                                </td>
                                <td>
                                    <input type="radio" name="5" value="2">
                                </td>
                                <td>
                                    <input type="radio" name="5" value="1">
                                </td>
                            </tr>
                            <tr>
                                <td>6</td>
                                <td>적절한 과제가 부여되었스며 학습에 도움이 되었다. </td>
                                <td>
                                    <input type="radio" name="6" value="5">
                                </td>
                                <td>
                                    <input type="radio" name="6" value="4">
                                </td>
                                <td>
                                    <input type="radio" name="6" value="3">
                                </td>
                                <td>
                                    <input type="radio" name="6" value="2">
                                </td>
                                <td>
                                    <input type="radio" name="6" value="1">
                                </td>
                            </tr>
                            <tr>
                                <td>7</td>
                                <td>학생들과 질의, 의견 교환 등 상호작용이 원할하였다. </td>
                                <td>
                                    <input type="radio" name="7" value="5">
                                </td>
                                <td>
                                    <input type="radio" name="7" value="4">
                                </td>
                                <td>
                                    <input type="radio" name="7" value="3">
                                </td>
                                <td>
                                    <input type="radio" name="7" value="2">
                                </td>
                                <td>
                                    <input type="radio" name="7" value="1">
                                </td>
                            </tr>
                            <tr>
                                <td>8</td>
                                <td>성적평가는 공정하였으며 평가결과에 대한 피드백을 받았다.</td>
                                <td>
                                    <input type="radio" name="8" value="5">
                                </td>
                                <td>
                                    <input type="radio" name="8" value="4">
                                </td>
                                <td>
                                    <input type="radio" name="8" value="3">
                                </td>
                                <td>
                                    <input type="radio" name="8" value="2">
                                </td>
                                <td>
                                    <input type="radio" name="8" value="1">
                                </td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td>수업 결손(결강, 지각, 단축강의 등)없이 강의하였거나, 휴강을 한 경우에는 보강을 하였다.</td>
                                <td>
                                    <input type="radio" name="9" value="5">
                                </td>
                                <td>
                                    <input type="radio" name="9" value="4">
                                </td>
                                <td>
                                    <input type="radio" name="9" value="3">
                                </td>
                                <td>
                                    <input type="radio" name="9" value="2">
                                </td>
                                <td>
                                    <input type="radio" name="9" value="1">
                                </td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td>이 강의는 전공 또는 교양 지식을 함양하는데 도움이 되었다. </td>
                                <td>
                                    <input type="radio" name="10" value="5">
                                </td>
                                <td>
                                    <input type="radio" name="10" value="4">
                                </td>
                                <td>
                                    <input type="radio" name="10" value="3">
                                </td>
                                <td>
                                    <input type="radio" name="10" value="2">
                                </td>
                                <td>
                                    <input type="radio" name="10" value="1">
                                </td>
                            </tr>
                            <tr>
                                <td>11</td>
                                <td>이 강의는 성차별 및 인권침해 등이 없이 진행되었다.</td>
                                <td>
                                    <input type="radio" name="11" value="5">
                                </td>
                                <td>
                                    <input type="radio" name="11" value="4">
                                </td>
                                <td>
                                    <input type="radio" name="11" value="3">
                                </td>
                                <td>
                                    <input type="radio" name="11" value="2">
                                </td>
                                <td>
                                    <input type="radio" name="11" value="1">
                                </td>
                            </tr>
                            <tr>
                                <td>12</td>
                                <td>이 강의에 만족한다.</td>
                                <td>
                                    <input type="radio" name="12" value="5">
                                </td>
                                <td>
                                    <input type="radio" name="12" value="4">
                                </td>
                                <td>
                                    <input type="radio" name="12" value="3">
                                </td>
                                <td>
                                    <input type="radio" name="12" value="2">
                                </td>
                                <td>
                                    <input type="radio" name="12" value="1">
                                </td>
                            </tr>
                            <tr>
                                <td>13</td>
                                <td>이 강의를 다른 학생들에게 추천하고 싶다.</td>
                                <td>
                                    <input type="radio" name="13" value="5">
                                </td>
                                <td>
                                    <input type="radio" name="13" value="4">
                                </td>
                                <td>
                                    <input type="radio" name="13" value="3">
                                </td>
                                <td>
                                    <input type="radio" name="13" value="2">
                                </td>
                                <td>
                                    <input type="radio" name="13" value="1">
                                </td>
                            </tr>
                            <tr>
                                <td>14</td>
                                <td colspan="6">
                                    11번 문항과 관련하여 '매우 아니다, 대체로 아니다' 로 답변하신 경우 이 강의에서 어떤 성차별 및 인권침대 등이 있었는지 구체적으로 기술하여 주십시오. <br>(한글 1000자 내외)
                                </td>
                            </tr>
                            <tr>
                                <td colspan="7">
                                    <textarea name="" id="" rows="4"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td>15</td>
                                <td colspan="6">
                                    교수님의 강의내용 및 방법에 개선할 점이 있다면 구체적으로 무엇인가요? (한글 1000자 내외)
                                </td>
                            </tr>
                            <tr>
                                <td colspan="7">
                                    <textarea name="" id="" rows="4"></textarea>
                                </td>
                            </tr>
                    </table>
    
                    <div id="submitBtn">
                        <button type="submit">제출</button>
                    </div>

                </form>

            </div>

        </div>
    </div>

    <!-- footer.jsp-->
    <jsp:include page="../common/footer.jsp" />
</body>
</html>