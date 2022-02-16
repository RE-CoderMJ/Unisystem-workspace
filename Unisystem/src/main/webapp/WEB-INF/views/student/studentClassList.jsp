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
        margin-bottom: 30px;
        margin-left: 30px;
        font-size: 24px;
        font-weight: 900;
    }
    #content_header>span{font-size: 17px; color: lightgrey;}
    /* content 영역*/
    #contentBox{
        margin-left: 30px;
        margin-top: 30px;
        width: 1270px;
        height: 700px;
        background-color: white;
        padding-top: 13px;
    }  
    #contentBox>div{padding-left: 30px;}  
    #content_name{
        font-size: 25px;
        font-weight: 900;
        margin-bottom: 20px;
    }
    #date_border{
        border: 1px solid lightgray;
        margin: 0px 30px;
        height: 80px;
    }
    #date_border>span{font-weight: 700; margin-left: 390px;}
    #classYear, #classSemester{
        width: 80px;
        height: 30px;
        margin-left: 20px;
        margin-top: 25px;
    }
    #classSemester{margin-left: 10px;}
    #date_border>button{
        border: none;
        border-radius: 5px;
        background-color: lightgray;
        margin-left: 30px;
        padding: 3px 10px;
    }
    #date_border>button:focus{outline: none;}
    table{
        margin: 20px 30px;
        width: 1210px;
        text-align: center;
    }
    table th, table td{padding: 3px 0;}
    table td{border-top: 1px solid lightgray;}
    table tr:last-child td{border-bottom: 2px solid lightgray;}
    #table_header th{background-color: #eeeeee; border-top: 2px solid lightgray;}
    #classKorName:hover{
       	color: rgb(26, 86, 162);
		text-decoration:underline;
		cursor:pointer;
    }
</style>
</head>
<body>
    <!-- 학생 마이페이지 - 내가 수강중인 강의 페이지 -->

    <!-- header 영역 -->
    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/links.jsp"/>
    
	
    <div id="wrap">

        <div style="float: left; margin-top : 30px">
            <!-- sidebar 영역 -->
            <jsp:include page="../student/smySidebar.jsp"/>
        </div>
		
        <div id="wrap_content" style="float: left;">
            

            <div id="contentBox">
            <article id="content_header"><span>수업 > </span>내가 수강중인 강의</article>

                <div id="content_name">수강 강좌</div>
                
                
                <form action="studentDateClassList.me" method="post">
                	<input type="hidden" name="userNo" value="${loginUser.userNo}" id="userNo"/>
	                <div id="date_border">
	                    <span>년도 학기</span>         
	                    
		                <select name="classYear" id="classYear">
	                    	<!-- 년도를 출력해주는 ajax 함수 실행하는 공간 -->
		                </select>    
		                    
	                    
	                    <select name="classSemester" id="classSemester">
	                        <option value="1">1학기</option>
	                        <option value="2">2학기</option>
	                    </select>
	                    <button type="button" onclick="searchClassList();">조회</button>
	                </div>
	                
                </form>
               
                <table id="classList">
                	<thead>
	                    <tr id="table_header">
	                        <th style="width: 70px;">과목코드</th>
	                        <th>강좌명</th>
	                        <th style="width: 100px;">강의유형</th>
	                        <th style="width: 100px;">담당교수</th>
	                        <th style="width: 100px;">수강인원</th>
	                    </tr>
                	</thead>
                    <tbody>
                    
	                    <c:forEach var="l" items="${ list }">
	                    <input type="hidden" value="${ l.classNo }" id="classNo" name="classNo"/>
	                    	
	                    	
	                    	<!-- list가 비어있을 경우 -->
	                    	<c:if test="${ empty list}">
		                    	<tr>
			                    	<td colspan=6>
			                    	 강의가 존재하지 않습니다.
			                    	</td>
		                    	</tr>
	                    	</c:if>
	                    	
	                    	<!-- list가 비어있지 않을 경우 -->
		                    <tr>
		                        <td>${ l.classCode }</td>
		                        <td id="classKorName">${l.classKorName}</td>
		                        <td>
		                        	<c:if test="${ l.classCategory eq 1 }">
		                        		대면강의
		                        	</c:if>
		                        	<c:if test="${ l.classCategory eq 2 }">
		                        		비대면강의
		                        	</c:if>
		                        </td>
		                        <td>${ l.korName }</td>
		                        <td>${ l.currStud }</td>
		                    </tr>                    
	                    </c:forEach>
       
                    </tbody>
                    
                </table>
				
				<script>
            	$(function(){
            		// 페이지상에 모든 요소들이 다 만들어지고 년도리스트 조회해오는 함수 호출
             		selectYearList();
            	})
            	
            	
            	//td요소에 클릭이라는 이벤트 발생 시 실행할 함수 => 링크이동
            	$(function(){
            		$("#classList>tbody td:nth-child(2)").on("click", function(){
            			location.href='lectureMain.stu?lno=' + $(this).siblings().eq(0).text();
            		});
            	})		
            	
            	
            	// 드롭박스에 년도 list를 가져오는 ajax
            	function selectYearList(){ 
            		$.ajax({
            			url:"YearList.me",
            			data:{},
            			async : false,
            			success:function(list){
            				console.log(list);
            				let value = "";
            				for(let i in list){
                            	value += "<option value=" + list[i].classYear +">" + list[i].classYear + "</option>";
            				}
            				$("#classYear").append(value);
            				
            			}, error:function(){
            				console.log("년도리스트조회용 ajax 통신 실패");
            			}
            			
            		})
            	}
            	
            	// 검색된 년도와 학기에 맞는 강의 list를 가져오는 ajax
            	function searchClassList(){
            		
            		var userNo = $("#userNo").val();
            		var classYear = $("select[name=classYear]").val();
            		var classSemester = $("select[name=classSemester]").val();      
            		
            		$.ajax({
            			url:"studentSearchList.me",
            			data:{
            				userNo : userNo,
            				classYear : classYear,
            				classSemester : classSemester
            				},
            			type:"POST",
            			success:function(searchList){
            				console.log(searchList);
            				let value = "";
            				var classCategory="";
            				for(let i in searchList){
            					
            					if(searchList[i].classCategory == 1){
            						classCategory = "대면강의";
            					} else {
            						classCategory = "비대면강의";
            					}
            					
                            	value += "<tr>"
                                    +		"<td id='classCode'>" + searchList[i].classCode + "</th>"
                                    +		"<td id='classKorName'>" + searchList[i].classKorName + "</td>"                            
                                    +		"<td>" + classCategory + "</td>"
                                    +		"<td>" + searchList[i].korName + "</td>"
                                    +		"<td>" + searchList[i].currStud + "</td>"
                              	  		+ "</tr>";
 								
                              	 
	                             $(document).on("click", "#className", function(){
	                             	location.href='lectureMain.stu?lno=' + $(this).siblings().eq(0).text();
	                             });	
  
            				}
            				$("#classList>tbody").html(value);
            				
            			}, error:function(){
            				console.log("년도학기에 따른 강의조회용 ajax 통신 실패")
            			}
            			
            		})
						
            	}
            	
            	
				
				</script>

            </div>

        </div>
    </div>
    </div>
  
    <!-- footer.jsp-->
    <jsp:include page="../common/footer.jsp" />
</body>
</html>