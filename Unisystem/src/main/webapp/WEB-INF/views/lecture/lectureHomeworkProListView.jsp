<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    #contentBox>div{padding-left: 30px;}
    #impossible_box{margin-top: 80px;}
    #possible_box div:nth-child(2), #impossible_box div:first-child{
        font-size: 20px; 
        font-weight: 900;
        margin-bottom: 15px;
    }
    #possible_box table, #impossible_box table{width: 1230px; text-align: center;}
    #possible_box table th, #possible_box table th td, #impossible_box table th, #impossible_box table td{padding: 3px 0;}
    #possible_box table th, #impossible_box table th{border-top: 2px solid lightgray; background-color: #eeeeee;}
    #possible_box table td, #impossible_box table td{border-top: 1px solid lightgray;}
    #possible_box table tr:last-child, #impossible_box table tr:last-child{border-bottom: 2px solid lightgray;}
    
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
	
	#insertHomeworkp{
		border-radius:5px;
		border:none;
		background-color: rgb(21, 62, 115);
		color:white;
		font-size:15px;
		padding:3px 12px;
		float:right;
		margin-right:30px;
		margin-bottom:20px;
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
            
            <article id="content_header"><span>자료실 > </span>과제관리</article>
            <input type="hidden" id="studNo" name="studNo" value="${ loginUser.userNo }" />

            
            <div id="contentBox">
                <div id="possible_box">
                
					<button type="button" id="insertHomeworkp" onclick="location.href='proHomeworkEnrollForm.lec';">과제등록</button>
                    <div>제출가능한 과제</div>
                    
                    <table id="pHomeworkList">
                    	<thead>
	                        <tr>
	                            <th style="width: 70px;">번호</th>
	                            <th>과제명</th>
	                            <th style="width: 100px;">담당 교수</th>
	                            <th style="width: 170px;">제출 기한</th>
	                            <th style="width: 120px;">제출 상황</th>
	                        </tr>
                    	</thead>
                    	<tbody>
							<!-- ajax로 리스트 띄워주는 영역 -->                 	
                    	</tbody>
                    </table>
                </div>

                <div id="impossible_box">
                    <div>마감된 과제</div>
                    <table>
                        <tr>
                            <th style="width: 70px;">번호</th>
                            <th>과제명</th>
                            <th style="width: 100px;">담당 교수</th>
                            <th style="width: 170px;">제출 기한</th>
                            <th style="width: 120px;">제출 상황</th>
                            <th style="width: 120px;">채점 상황</th>
                        </tr>
                        
                        <c:forEach var="l" items="${ list }" >
	                        <tr class="trs">
	                            <td class="homeworkpNo">${ l.homeworkpNo }</td>
	                            <td><a href="lectureProHomeworkDetailI.stu?hno=${ l.homeworkpNo }">${ l.homeworkpName }</a></td>
	                            <td>${ l.korName }</td>
	                            <td>${ l.homeworkpEndDateTime }</td>
	                            <td>
									${ l.countHW } / ${ classInfo.currStud }
	                            </td>
	                            <td>
									${ l.countGHW } / ${ classInfo.currStud }
	                            </td>
	                        </tr>
						</c:forEach>
					</table>
						
						
						
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
                    
                </div>


            </div>

        </div>
    </div>
    
    <script>
    	$(function(){
    		selectPhomeworkList();
    	})
    		
    		// 제출가능한 과제 리스트 조회용  ajax
    		function selectPhomeworkList(){
    		
    			$.ajax({
    				url:"selectProPhomeworkList.lec",
    				success:function(list){
    					
    					let value = "";
    					let status = "";
    					for(let i in list){
    						
    						
	    					value += "<tr>"
	                              + 	"<td>"+ list[i].homeworkpNo + "</td>"
	                              + 	"<td>" + "<a href='lectureProHomeworkDetailP.stu?hno="+ list[i].homeworkpNo + "'>" + list[i].homeworkpName + "</a></td>"
	                              +		"<td>" + list[i].korName + "</td>"
	                              + 	"<td>" + list[i].homeworkpEndDateTime + "</td>"
	                              + 	"<td>" + list[i].countHW + " / " +  ${ classInfo.currStud } + "</td>"
	                              + "</tr>"; 				
    					}
    					
    					$("#pHomeworkList tbody").html(value);	

    				}, error:function(){
    					console.log("제출가능한 과제 리스트 조회용 ajax 통신 실패");
    				}
    			})
    		
    		
    		}
    </script>

    <!-- footer.jsp-->
    <jsp:include page="../common/footer.jsp" />
</body>
</html>