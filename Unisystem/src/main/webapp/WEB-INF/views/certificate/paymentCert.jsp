<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNI SYSTEM</title>
<link href="resources/css/certificate/paymentCert.css" rel="stylesheet">
<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous" type="text/javascript"></script>
<!-- 아임포트 -->
<script src ="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
</head>
<body>

	<jsp:include page="../common/links.jsp" />
	<jsp:include page="../common/header.jsp" />	
	
	<div id="wrapper">
		<jsp:include page="../student/smySidebar.jsp" />
		<section>
			<header id="cert-header">
				<div id="pageName-area">
					<div class="pageName"><p style="color:gray">마이페이지>&nbsp;</p><p style="font-size:19px; font-weight:600;">증명서 발급</p></div>
					<br><br>
					<div id="pageName">증명서 발급 신청</div>
					<br><br>
	                <hr id="cert-line">
	            </div>
			</header>
			<article>
				<div id="contents">
            		<div style="font-size:17px; font-weight:600; margin-bottom:30px;"><i class="fas fa-check-circle fa-lg"></i>&nbsp;&nbsp;신청내역 및 결제</div>
            		<table class="table table-bordered" id="list" style="width:900px;">
            			<thead>
            				<tr>
            					<th>신청증명서</th>
            					<th>용도</th>
            					<th>제출처</th>
            					<th>증명수수료</th>
            				</tr>            			
            			</thead>
            			<tbody>
	            			<c:forEach var="c" items="${list}">
	            				<tr>
	            					<input type="hidden" class="tt" value="${ c.cerNo }">
	            					<td>${c.cerTypeT }</td>
	            					<td>${c.useFor }</td>
	            					<td>${c.toWhom}</td>
	            					<td>1,000원</td>
	            				</tr>
	            			</c:forEach>
            			</tbody>
            		</table>
            		<div id="sum-area">
            			<div>
	            			<span style="margin-left:180px">총계 ${fn:length(list)}건</span>
	            			<span style="margin-left:60px">1,000원 x </span>
	            			<span>${fn:length(list)}</span>
	            			<span style="margin-left:10px">= 최종 결제액</span>
	            			<span style="margin-left:10px; color:yellow;">${1000 * fn:length(list) }</span>
	            			<span>원</span>
            			</div>
            		</div>
            		<div id="btn-area">
	            		<button class="btns" style="background:gray" onclick="history.back()">뒤로가기</button>
	            		<button class="btns" id="pay">결제</button>
            		</div>
            	</div>
			</article>
		</section>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
	
	<!-- pay js -->
	<script type="text/javascript">
		$(document).ready(function(){			   	  
			
			$("#pay").click(function(e){
				
				let no = [];
				$(".tt").each(function(i, obj){
					no.push($(obj).val());
				})
				
				console.log(no);
				
				var IMP = window.IMP;
				var code = "imp70460028"; //가맹점 식별코드
				IMP.init(code);
				
				//결제요청
				IMP.request_pay({
					//name과 amout만있어도 결제 진행가능
					pg : 'kakao', //pg사 선택 (kakao, kakaopay 둘다 가능)
					pay_method: 'card',
					merchant_uid : 'merchant_' + new Date().getTime(),
					name : '증명서 출력 ${fn:length(list)} 건', // 상품명
					amount : '${1000 * fn:length(list) }',
					buyer_email : '${loginUser.email}',
					buyer_name : '${loginUser.korName}',
					buyer_tel : '${loginUser.phone}',  //필수항목
					//결제완료후 이동할 페이지 kko나 kkopay는 생략 가능
					m_redirect_url : 'https://localhost:8009/uni/myStu.cert.list'
				}, function(rsp){
					
					if(rsp.success){//결제 성공시
						var msg = '결제가 완료되었습니다';
						var result = {
						"imp_uid" : rsp.imp_uid,
						"merchant_uid" : rsp.merchant_uid,
						"pay_date" : new Date().getTime(),
						"amount" : rsp.paid_amount,
						"card_no" : rsp.apply_num,
						"refund" : 'payed'
						}
						console.log("결제성공 " + msg);
						
						$.ajax({
							url : 'myStu.cert.pay', 
					        type :'POST',
					        //data : {cerNoList : '${list}'}, 
					        data:{cerNoList:no},
					        traditional:true,
					        success: function(result){
					          if(result == "success"){
								 console.log("추가성공");
								 location.href="myStu.cert.list";
					          }
					        },
					        error:function(){
					          console.log("결제 여부 수정 ajax 통신 실패!!!");
					        }
						}) //ajax
						
					}
					else{//결제 실패시
						var msg = '결제에 실패했습니다';
						msg += '에러 : ' + rsp.error_msg
					}
				});//pay
			}); //check1 클릭 이벤트
			
		})
	</script>
	
	<script>
		$(document).ready(function(){
			let $len = $("section").height();
			$(".wrap_sidebar").css('height', $len + 22);
		})
	</script>

</body>
</html>