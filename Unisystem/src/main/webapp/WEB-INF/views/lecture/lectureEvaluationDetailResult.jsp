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
    height: 1700px;
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
        height: 1770px;
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
    #class_evaluation{margin-top: 100px;}
    #class_evaluation_header th:first-child{width: 60px;}
    #submitBtn button:focus{outline: none;}
    #submitBtn button:first-child{margin-right: 5px;}
    #class_evaluation tr:first-child, #class_evaluation tr:nth-child(1){background-color: #e0e0e0;}
    #class_evaluation tr{border-top: 1px solid lightgray;}
    #class_evaluation tr:first-child{border-top: 2px solid #bcbcbc;}
    #class_evaluation tr:last-child{border-bottom: 2px solid #bcbcbc;}
    #class_evaluation th, #class_evaluation td{padding: 3px 0;}
    table span{color: red;}


    /* 하단 button 영역 */
    #list{
        border: none;
        border-radius: 5px;
        background-color: lightgray;
        padding: 3px 10px;
        margin-left: 1185px;
        margin-top: 20px;
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
</style>
</head>
<body>
    <!-- header 영역 -->
    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/links.jsp"/>
    
    <div id="wrap">
        
        <div style="float: left;">
			<!-- sidebar 영역 -->
            
            <!-- 로그인한 계정이 교수일 경우 -->
            <jsp:include page="../professor/pclassSidebar.jsp" />
        </div>

        <div id="wrap_content" style="float: left;">

            <article id="content_header">강의평가</article>

            <div id="evaluationBox">

                <div>
                    IT미디어와미래역량 <span>강의 평가</span>
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

                <div class="question" style="margin: 0px 20px; margin-top: 50px; font-weight: 600;">
                    14번. 11번 문항과 관련하여 '매우 아니다, 대체로 아니다' 로 답변하신 경우 이 강의에서 어떤 성차별 및 인권침대 등이 있었는지 구체적으로 기술하여 주십시오.  (한글 1000자 내외)
                </div>
                <table id="class_evaluation" style="margin-top: 30px;">
                        <tr id="class_evaluation_header">
                            <th>순번</th>
                            <th>답변</th>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>
                                언론·출판에 대한 허가나 검열과 집회·결사에 대한 허가는 인정되지 아니한다. 국회는 정부의 동의없이 정부가 제출한 지출예산 각항의 금액을 증가하거나 새 비목을 설치할 수 없다. 누구든지 체포 또는 구속을 당한 때에는 즉시 변호인의 조력을 받을 권리를 가진다. 다만, 형사피고인이 스스로 변호인을 구할 수 없을 때에는 법률이 정하는 바에 의하여 국가가 변호인을 붙인다. 국무위원은 국무총리의 제청으로 대통령이 임명한다. 공무원의 직무상 불법행위로 손해를 받은 국민은 법률이 정하는 바에 의하여 국가 또는 공공단체에 정당한 배상을 청구할 수 있다. 이 경우 공무원 자신의 책임은 면제되지 아니한다. 
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>
                                언론·출판에 대한 허가나 검열과 집회·결사에 대한 허가는 인정되지 아니한다. 국회는 정부의 동의없이 정부가 제출한 지출예산 각항의 금액을 증가하거나 새 비목을 설치할 수 없다. 누구든지 체포 또는 구속을 당한 때에는 즉시 변호인의 조력을 받을 권리를 가진다. 다만, 형사피고인이 스스로 변호인을 구할 수 없을 때에는 법률이 정하는 바에 의하여 국가가 변호인을 붙인다. 국무위원은 국무총리의 제청으로 대통령이 임명한다. 공무원의 직무상 불법행위로 손해를 받은 국민은 법률이 정하는 바에 의하여 국가 또는 공공단체에 정당한 배상을 청구할 수 있다. 이 경우 공무원 자신의 책임은 면제되지 아니한다. 
                            </td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>
                                언론·출판에 대한 허가나 검열과 집회·결사에 대한 허가는 인정되지 아니한다. 국회는 정부의 동의없이 정부가 제출한 지출예산 각항의 금액을 증가하거나 새 비목을 설치할 수 없다. 누구든지 체포 또는 구속을 당한 때에는 즉시 변호인의 조력을 받을 권리를 가진다. 다만, 형사피고인이 스스로 변호인을 구할 수 없을 때에는 법률이 정하는 바에 의하여 국가가 변호인을 붙인다. 국무위원은 국무총리의 제청으로 대통령이 임명한다. 공무원의 직무상 불법행위로 손해를 받은 국민은 법률이 정하는 바에 의하여 국가 또는 공공단체에 정당한 배상을 청구할 수 있다. 이 경우 공무원 자신의 책임은 면제되지 아니한다. 
                            </td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>
                                언론·출판에 대한 허가나 검열과 집회·결사에 대한 허가는 인정되지 아니한다. 국회는 정부의 동의없이 정부가 제출한 지출예산 각항의 금액을 증가하거나 새 비목을 설치할 수 없다. 누구든지 체포 또는 구속을 당한 때에는 즉시 변호인의 조력을 받을 권리를 가진다. 다만, 형사피고인이 스스로 변호인을 구할 수 없을 때에는 법률이 정하는 바에 의하여 국가가 변호인을 붙인다. 국무위원은 국무총리의 제청으로 대통령이 임명한다. 공무원의 직무상 불법행위로 손해를 받은 국민은 법률이 정하는 바에 의하여 국가 또는 공공단체에 정당한 배상을 청구할 수 있다. 이 경우 공무원 자신의 책임은 면제되지 아니한다. 
                            </td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td>
                                언론·출판에 대한 허가나 검열과 집회·결사에 대한 허가는 인정되지 아니한다. 국회는 정부의 동의없이 정부가 제출한 지출예산 각항의 금액을 증가하거나 새 비목을 설치할 수 없다. 누구든지 체포 또는 구속을 당한 때에는 즉시 변호인의 조력을 받을 권리를 가진다. 다만, 형사피고인이 스스로 변호인을 구할 수 없을 때에는 법률이 정하는 바에 의하여 국가가 변호인을 붙인다. 국무위원은 국무총리의 제청으로 대통령이 임명한다. 공무원의 직무상 불법행위로 손해를 받은 국민은 법률이 정하는 바에 의하여 국가 또는 공공단체에 정당한 배상을 청구할 수 있다. 이 경우 공무원 자신의 책임은 면제되지 아니한다. 
                            </td>
                        </tr>
                </table>
                <div class="container">
                    <ul class="pagination justify-content-center">
                        <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item active"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">4</a></li>
                        <li class="page-item"><a class="page-link" href="#">5</a></li>
                        <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
                    </ul>
                </div>

                <div class="question" style="margin: 0px 20px; margin-top: 50px; font-weight: 600;">
                    15번. 교수님의 강의내용 및 방법에 개선할 점이 있다면 구체적으로 무엇인가요? (한글 1000자 내외) 
                </div>
                <table id="class_evaluation" style="margin-top: 30px;">
                        <tr id="class_evaluation_header">
                            <th>순번</th>
                            <th>답변</th>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>
                                언론·출판에 대한 허가나 검열과 집회·결사에 대한 허가는 인정되지 아니한다. 국회는 정부의 동의없이 정부가 제출한 지출예산 각항의 금액을 증가하거나 새 비목을 설치할 수 없다. 누구든지 체포 또는 구속을 당한 때에는 즉시 변호인의 조력을 받을 권리를 가진다. 다만, 형사피고인이 스스로 변호인을 구할 수 없을 때에는 법률이 정하는 바에 의하여 국가가 변호인을 붙인다. 국무위원은 국무총리의 제청으로 대통령이 임명한다. 공무원의 직무상 불법행위로 손해를 받은 국민은 법률이 정하는 바에 의하여 국가 또는 공공단체에 정당한 배상을 청구할 수 있다. 이 경우 공무원 자신의 책임은 면제되지 아니한다. 
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>
                                언론·출판에 대한 허가나 검열과 집회·결사에 대한 허가는 인정되지 아니한다. 국회는 정부의 동의없이 정부가 제출한 지출예산 각항의 금액을 증가하거나 새 비목을 설치할 수 없다. 누구든지 체포 또는 구속을 당한 때에는 즉시 변호인의 조력을 받을 권리를 가진다. 다만, 형사피고인이 스스로 변호인을 구할 수 없을 때에는 법률이 정하는 바에 의하여 국가가 변호인을 붙인다. 국무위원은 국무총리의 제청으로 대통령이 임명한다. 공무원의 직무상 불법행위로 손해를 받은 국민은 법률이 정하는 바에 의하여 국가 또는 공공단체에 정당한 배상을 청구할 수 있다. 이 경우 공무원 자신의 책임은 면제되지 아니한다. 
                            </td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>
                                언론·출판에 대한 허가나 검열과 집회·결사에 대한 허가는 인정되지 아니한다. 국회는 정부의 동의없이 정부가 제출한 지출예산 각항의 금액을 증가하거나 새 비목을 설치할 수 없다. 누구든지 체포 또는 구속을 당한 때에는 즉시 변호인의 조력을 받을 권리를 가진다. 다만, 형사피고인이 스스로 변호인을 구할 수 없을 때에는 법률이 정하는 바에 의하여 국가가 변호인을 붙인다. 국무위원은 국무총리의 제청으로 대통령이 임명한다. 공무원의 직무상 불법행위로 손해를 받은 국민은 법률이 정하는 바에 의하여 국가 또는 공공단체에 정당한 배상을 청구할 수 있다. 이 경우 공무원 자신의 책임은 면제되지 아니한다. 
                            </td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>
                                언론·출판에 대한 허가나 검열과 집회·결사에 대한 허가는 인정되지 아니한다. 국회는 정부의 동의없이 정부가 제출한 지출예산 각항의 금액을 증가하거나 새 비목을 설치할 수 없다. 누구든지 체포 또는 구속을 당한 때에는 즉시 변호인의 조력을 받을 권리를 가진다. 다만, 형사피고인이 스스로 변호인을 구할 수 없을 때에는 법률이 정하는 바에 의하여 국가가 변호인을 붙인다. 국무위원은 국무총리의 제청으로 대통령이 임명한다. 공무원의 직무상 불법행위로 손해를 받은 국민은 법률이 정하는 바에 의하여 국가 또는 공공단체에 정당한 배상을 청구할 수 있다. 이 경우 공무원 자신의 책임은 면제되지 아니한다. 
                            </td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td>
                                언론·출판에 대한 허가나 검열과 집회·결사에 대한 허가는 인정되지 아니한다. 국회는 정부의 동의없이 정부가 제출한 지출예산 각항의 금액을 증가하거나 새 비목을 설치할 수 없다. 누구든지 체포 또는 구속을 당한 때에는 즉시 변호인의 조력을 받을 권리를 가진다. 다만, 형사피고인이 스스로 변호인을 구할 수 없을 때에는 법률이 정하는 바에 의하여 국가가 변호인을 붙인다. 국무위원은 국무총리의 제청으로 대통령이 임명한다. 공무원의 직무상 불법행위로 손해를 받은 국민은 법률이 정하는 바에 의하여 국가 또는 공공단체에 정당한 배상을 청구할 수 있다. 이 경우 공무원 자신의 책임은 면제되지 아니한다. 
                            </td>
                        </tr>
                </table>
                <div class="container">
                    <ul class="pagination justify-content-center">
                        <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item active"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">4</a></li>
                        <li class="page-item"><a class="page-link" href="#">5</a></li>
                        <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
                    </ul>
                </div>

                <button type="button" id="list">목록가기</button>
            </div>

        </div>
    </div>

    <!-- footer.jsp-->
    <jsp:include page="../common/footer.jsp" />
</body>
</html>