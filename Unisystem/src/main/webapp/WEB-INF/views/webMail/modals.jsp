<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<style>
	.modal-backdrop{
		 background-color: rgba(0,0,0,.0001) !important;
	}
    .modalMsg-area{
    	margin-top: 20px;
    	margin-bottom : 30px;
    }
    .modalMsg-head{
    	font-weight: 700;
    	font-size : 14px;
    }
	#deleteCompletedClosebtn{
	    background-color: rgb(26, 86, 162);
	    width: 260px;
	    color: white;
	    font-weight: bolder;
	}
	
	/*스팸등록 모달창*/
	#title{
	    font-weight: bolder;
	    font-size: 17px;
	    margin-bottom: 15px;
	}
	#descr{
		font-size:13px;
		margin-bottom:15px;
	}
	/* 라디오 인풋 영역 */
	#select-area{
	    margin-left: 60px;
	    margin-bottom: 10px;
	}
	#select-area label{
		font-size: 14px;
	}
	/* 버튼영역 */
	#spambtn-area>*{
	    width: 48%;
	    margin-top: 10px;
	    font-weight: bolder;
	}
	#emptySpambtn-area>*{
	    width: 48%;
	    margin-top: 10px;
	    font-weight: bolder;
	}
	#emptyTrashbtn-area>*{
	    width: 48%;
	    margin-top: 10px;
	    font-weight: bolder;
	}
	#deleteSpambtn-area>*{
	    width: 48%;
	    margin-top: 10px;
	    font-weight: bolder;
	}
	#deleteTrashbtn-area>*{
	    width: 48%;
	    margin-top: 10px;
	    font-weight: bolder;
	}
	#deleteContact-area>*{
		width: 48%;
	    margin-top: 10px;
	    font-weight: bolder;
	}
	#addContact-btnArea>*{
		width: 120px;
	    font-weight: bolder;
	    margin-left:5px;
	}
	#addContact-btnArea{
		margin-left:25px;
		margin-bottom:20px;
	}
	#editContact-btnArea>*{
		width: 120px;
	    font-weight: bolder;
	    margin-left:5px;
	}
	#editContact-btnArea{
		margin-left:25px;
		margin-bottom:20px;
	}
	#spam-btn, #spam-confirm-btn, #trash-confirm-btn, 
	#spam-delete-confirm-btn, #trash-delete-confirm-btn,
	#contact-delete-confirm-btn, #addContact-btn,
	#editContact-btn{
	    color: white;
	    background-color: rgb(26, 86, 162);
	}
	#spam-close, #spam-closebtn, #trash-closebtn, 
	#spam-delete-closebtn, #trash-delete-closebtn,
	#contact-delete-closebtn, #addContactClose-btn,
	#editContactClose-btn{
	    border: 1px solid gray;
	    color: gray;
	    margin-bottom: 10px;
	    float:left;
	}
	#spamCompletedClosebtn{
	    background-color: rgb(26, 86, 162);
	    width: 260px;
	    color: white;
	    font-weight: bolder;
	}
	
	/*주소록 모달창*/
	 .modal .modal-footer{
         justify-content: center;
     }
     .modal .modal-header{
         border-bottom: 0;
     }
     .md-box p{
         font-size: 14px;
         color: #555;
         font-weight: 500;
         margin-bottom:10px;
         margin-left:20px;
     }
     .md-box input{
         font-size: 22px;
         padding: 5px 0;
         border: 1px solid gray;
         border-radius:3px;
         width: 230px;
         margin-bottom: 20px;
         margin-left:20px;
     }
     .md-box .btn-box button{
         background-color: rgb(26, 86, 162);
     }
	
</style>
</head>
<body>
	<jsp:include page="../common/links.jsp" />
	
    <!-- 메일 삭제완료 Modal -->
    <div class="modal" id="deleteCompleted">
        <div class="modal-dialog modal-sm modal-dialog-centered">
            <div class="modal-content">

                <!-- Modal body -->
                <div class="modal-body" align="center">
                    <div class="modalMsg-area">
                        메일이 휴지통으로 이동되었습니다.
                    </div>
                    <div>
                      <button type="button" class="btn" data-dismiss="modal" id="deleteCompletedClosebtn">확인</button>
                    </div>              
                </div>
        
            </div>
        </div>
    </div>

    <!-- 스팸 Modal -->
    <div class="modal" id="spamConfirmModal">
        <div class="modal-dialog modal-sm modal-dialog-centered">
            <div class="modal-content">

                <!-- Modal body -->
                <div class="modal-body" align="center">
                    <div id="title">
                        스팸메일 등록하기         
                    </div>
                    <div id="descr">선택한 메일의 스팸처리 방법을 설정해주세요.</div>
                    <form action="">
                        <div id=select-area align="left">
                            <input type="radio" name="moveTo" id="spam" checked>
                            <label for="spam">스팸메일함으로 보내기</label><br>

                            <input type="radio" name="moveTo" id="delete">
                            <label for="delete" style="color:red;">영구 삭제하기</label><br>
                        </div>
                        <div id="spambtn-area">
                          <a type="button" class="btn" id="spam-btn" data-dismiss="modal" data-toggle="modal" href="#spamCompleted">스팸처리</a>
                          <button type="button" class="btn" data-dismiss="modal" id="spam-close">취소</button>
                        </div>              
                    </form>
                </div>
        
            </div>
        </div>
    </div>
    
    <!-- 스팸처리 완료 Modal -->
    <div class="modal" id="spamCompleted">
        <div class="modal-dialog modal-sm modal-dialog-centered">
            <div class="modal-content">

                <!-- Modal body -->
                <div class="modal-body" align="center">
                    <div class="modalMsg-area">
                        스팸 처리가 정상적으로 <br>완료되었습니다.
                    </div>
                    <div>
                      <button type="button" class="btn" data-dismiss="modal" id="spamCompletedClosebtn">확인</button>
                    </div>              
                </div>
        
            </div>
        </div>
    </div>
	
	
	<!-- 스팸메일함 비우기 Modal -->
    <div class="modal" id="emptySpamAskModal">
        <div class="modal-dialog modal-sm modal-dialog-centered">
            <div class="modal-content">

                <!-- Modal body -->
                <div class="modal-body" align="center">
                    <div class="modalMsg-head">
                    	스팸메일함을 비우면<br>
                    	지워진 메일(중요메일포함)들은 <br>
                    	복구할 수 없습니다.<br>
                    	대량의 메일을 처리할 경우 시간이<br>
                    	오래 걸릴 수 있습니다.
                    </div>
                    <div class="modalMsg-area">
                    	스팸메일함을 비우시겠습니까?
                    </div>
                    <div id="emptySpambtn-area">
                      <button type="button" class="btn" id="spam-confirm-btn" data-dismiss="modal" data-toggle="modal" onclick="deleteContent();">확인</a>
                      <button type="button" class="btn" data-dismiss="modal" id="spam-closebtn">닫기</button>
                    </div>              
                </div>
        
            </div>
        </div>
    </div>
    
    <!-- 스팸메일 영구삭제 Modal -->
    <div class="modal" id="deleteSpamModal">
        <div class="modal-dialog modal-sm modal-dialog-centered">
            <div class="modal-content">

                <!-- Modal body -->
                <div class="modal-body" align="center">
                    <div class="modalMsg-head">
                    	스팸메일을 지우면 지워진 메일들은<br>
                    	복구할 수 없습니다.<br>
                    </div>
                    <div class="modalMsg-area">
                    	스팸메일을 삭제하시겠습니까?
                    </div>
                    <div id="deleteSpambtn-area">
                      <button type="button" class="btn" id="spam-delete-confirm-btn" data-dismiss="modal" data-toggle="modal" onclick="deleteContent();">확인</a>
                      <button type="button" class="btn" data-dismiss="modal" id="spam-delete-closebtn">닫기</button>
                    </div>              
                </div>
        
            </div>
        </div>
    </div>
    
    <!-- 휴지통 비우기 Modal -->
    <div class="modal" id="emptyTrashAskModal">
        <div class="modal-dialog modal-sm modal-dialog-centered">
            <div class="modal-content">

                <!-- Modal body -->
                <div class="modal-body" align="center">
                    <div class="modalMsg-head">
                    	휴지통을 비우면<br>
                    	지워진 메일(중요메일포함)들은 <br>
                    	복구할 수 없습니다.<br>
                    	대량의 메일을 처리할 경우 시간이<br>
                    	오래 걸릴 수 있습니다.
                    </div>
                    <div class="modalMsg-area">
                    	휴지통을 비우시겠습니까?
                    </div>
                    <div id="emptyTrashbtn-area">
                      <button type="button" class="btn" id="trash-confirm-btn" data-dismiss="modal" data-toggle="modal" onclick="deleteContent();">확인</a>
                      <button type="button" class="btn" data-dismiss="modal" id="trash-closebtn">닫기</button>
                    </div>              
                </div>
        
            </div>
        </div>
    </div>
	
	<!-- 휴지통메일 영구삭제 Modal -->
    <div class="modal" id="deleteTrashModal">
        <div class="modal-dialog modal-sm modal-dialog-centered">
            <div class="modal-content">

                <!-- Modal body -->
                <div class="modal-body" align="center">
                    <div class="modalMsg-head">
                    	휴지통의 메일을 지우면 지워진 메일들은<br>
                    	복구할 수 없습니다.<br>
                    </div>
                    <div class="modalMsg-area">
                    	메일을 삭제하시겠습니까?
                    </div>
                    <div id="deleteTrashbtn-area">
                      <button type="button" class="btn" id="trash-delete-confirm-btn" data-dismiss="modal" data-toggle="modal" onclick="deleteContent();">확인</a>
                      <button type="button" class="btn" data-dismiss="modal" id="trash-delete-closebtn">닫기</button>
                    </div>              
                </div>
        
            </div>
        </div>
    </div>
    
    <!-- 주소록 삭제 Modal -->
    <div class="modal" id="deleteContact">
        <div class="modal-dialog modal-sm modal-dialog-centered">
            <div class="modal-content">

                <!-- Modal body -->
                <div class="modal-body" align="center">
                    <div class="modalMsg-area">
                    	정말 삭제하시겠습니까?
                    </div>
                    <div id="deleteContact-area">
                      <button type="button" class="btn" id="contact-delete-confirm-btn" data-dismiss="modal" data-toggle="modal" onclick="deleteContent();">확인</a>
                      <button type="button" class="btn" data-dismiss="modal" id="contact-delete-closebtn">닫기</button>
                    </div>              
                </div>
        
            </div>
        </div>
    </div>
    
    <!-- 주소록 추가 Modal -->
    <div class="modal" id="addContact">
		<form id="" action="" method="post">
		          <div class="modal-dialog modal-sm modal-dialog-centered">
		              <div class="modal-content">
		                  <!-- Modal Header -->
		                  <div class="modal-header">
		                      <button type="button" class="close" data-dismiss="modal">&times;</button>
		                  </div>
		                  <!-- Modal body -->
		                  <div class="modal-body">
		                      <div class="md-box">
		                          <p>이름</p>
		                          <input type="text" id="memName" name="name">
		                          <!-- <input type="hidden" name="name"> -->
		                      </div>
		                      <div class="md-box">
		                          <p>이메일 주소</p>
		                          <input type="text" id="memEmail" name="email">
		                          <!-- <input type="hidden" name="email"> -->
		                      </div>
		                      <div class="md-box">
		                          <p>연락처</p>
		                          <input type="text" id="memTel" name="tel" >
		                          <!-- <input type="hidden" name="tel"> -->
		                      </div>
		                  </div>
		              
		              <!-- Modal footer -->
		               <div id="addContact-btnArea">
		                   <button type="button" id="addContactClose-btn" class="btn" data-dismiss="modal">취소</button>
		                   <button type="submit" id="addContact-btn" class="btn" data-toggle="modal">등록하기</button>
		               </div>
		           </div>
		       </div>
		</form>
	</div>
	
    <!-- 주소록 수정 Modal -->
	<div class="modal" id="editContact">
		<form id="" action="" method="post">
		          <div class="modal-dialog modal-sm modal-dialog-centered">
		              <div class="modal-content">
		                  <!-- Modal Header -->
		                  <div class="modal-header">
		                      <button type="button" class="close" data-dismiss="modal">&times;</button>
		                  </div>
		                  <!-- Modal body -->
		                  <div class="modal-body">
		                      <div class="md-box">
		                          <p>이름</p>
		                          <input type="text" id="memName" name="name">
		                          <!-- <input type="hidden" name="name"> -->
		                      </div>
		                      <div class="md-box">
		                          <p>이메일 주소</p>
		                          <input type="text" id="memEmail" name="email">
		                          <!-- <input type="hidden" name="email"> -->
		                      </div>
		                      <div class="md-box">
		                          <p>연락처</p>
		                          <input type="text" id="memTel" name="tel" >
		                          <!-- <input type="hidden" name="tel"> -->
		                      </div>
		                  </div>
		              
		              <!-- Modal footer -->
		               <div id="editContact-btnArea">
		                   <button type="button" id="editContactClose-btn" class="btn" data-dismiss="modal">취소</button>
		                   <button type="submit" id="editContact-btn" class="btn" data-toggle="modal">수정하기</button>
		               </div>
		           </div>
		       </div>
		</form>
	</div>
	
</body>
</html>