<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>비회원 주문 페이지</title>
		
		<!-- jQuery -->
		<!-- CDN 주소 추가 방식 -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		
		<!-- Bootstrap CDN 시작 -->
		<!-- Latest compiled and minified CSS -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
		
		<!-- Latest compiled JavaScript -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		<!-- Bootstrap CDN 끝 -->
		
		<script>
			$(document).ready(function() {
				
				function remaindTime() {
				    var now = new Date();
				    var end = now + new Date(now.getFullYear(),now.getMonth(),now.getDate(),00,30,00);
				    var open = new Date();
				  
				    var nt = now.getTime();
				    var ot = open.getTime();
				    var et = end.getTime();
				  
				   if(nt<ot){
				     $(".time").fadeIn();
				     $("p.time-title").html("금일 오픈까지 남은 시간");
				     sec =parseInt(ot - nt) / 1000;
				     day  = parseInt(sec/60/60/24);
				     sec = (sec - (day * 60 * 60 * 24));
				     hour = parseInt(sec/60/60);
				     sec = (sec - (hour*60*60));
				     min = parseInt(sec/60);
				     sec = parseInt(sec-(min*60));
				     if(hour<10){hour="0"+hour;}
				     if(min<10){min="0"+min;}
				     if(sec<10){sec="0"+sec;}
				      $(".hours").html(hour);
				      $(".minutes").html(min);
				      $(".seconds").html(sec);
				   } else if(nt>et){
				    $("p.time-title").html("금일 마감");
				    $(".time").fadeOut();
				   }else {
				       $(".time").fadeIn();
				     $("p.time-title").html("금일 마감까지 남은 시간");
				     sec =parseInt(et - nt) / 1000;
				     day  = parseInt(sec/60/60/24);
				     sec = (sec - (day * 60 * 60 * 24));
				     hour = parseInt(sec/60/60);
				     sec = (sec - (hour*60*60));
				     min = parseInt(sec/60);
				     sec = parseInt(sec-(min*60));
				     if(hour<10){hour="0"+hour;}
				     if(min<10){min="0"+min;}
				     if(sec<10){sec="0"+sec;}
				      $(".hours").html(hour);
				      $(".minutes").html(min);
				      $(".seconds").html(sec);
				   }
				 }
				 setInterval(remaindTime,1000);
				
				
				
				// 핸드폰 유효성 검사
				/*
					유효성체크
					1) 문자열 내의 모든 - 제거
					2) 문자열이 숫자인지 체크
					3) 총 11자리인지 체크
					4) 앞 3자리 가능한 번호인지 체크
					5) DB 저장할 땐 다시 - 추가
				*/
				
				let customerPhone = $('#customerPhone');
				let phone;
				let phoneThree;
				let result;
				let possibleThree = ['010', '011', '016', '017', '018', '019'];
				
				
				customerPhone.on('blur', function(event) {
					
					// 디버깅
					console.log(customerPhone.val() + ' <-- customerPhon.val()');
					
					// replace(A, B) : A를 B로 바꿈
					// /-/g : 문자열 정규표현식. 문자열 내의 모든 -을 뜻 함.
					// replace(/-/g, "") : 문자열 내의 모든 - 를 ""으로 대체하여 
					// 						모든 - 삭제하는 역할.
					phone = customerPhone.val().replace(/-/g, "");
					
					// 디버깅
					console.log(phone + ' <--  - 제거');
				
					
					// 모든 - 제거 한 후 숫자인지 체크
					// isNan 숫자 일 경우 false, 숫자가 아닐경우 true
					if(isNaN(phone)) {
						
						// 디버깅
						console.log(isNaN(phone) + ' <-- isNaN(phone)');
						
						// input value 초기화
						customerPhone.val('');
						
						alert('올바른 휴대폰 번호를 입력하세요.');
						
						return;
						
					}
					
					// 총 11자리 인지 체크
					if(phone.length != 11) {
						
						// 디버깅
						console.log(phone.length + ' <-- phone.length');
					
						// input value 초기화
						customerPhone.val('');
						
						alert('올바른 휴대폰 번호를 입력하세요.');
						return;
						
					}
					
					// 번호 앞 3자리 추출
					phoneThree = phone.substring(0, 3);
					
					// 디버깅
					console.log(phoneThree + ' <-- phoneThree');
					
					// 앞 3자리가 가능한 3자리 번호인지 체크
					for(let i=0; i<possibleThree.length; i+=1) {
						
						if(phoneThree == possibleThree[i]) {
							// 같으면 가능한 앞 3자리
							
							result = 1;
							
							// DB에 저장할 땐 다시 - 추가 되도록 value 값 설정
							customerPhone.val(phoneThree + '-' + phone.substring(3, 7) + '-' + phone.substring(7, 11));
							
							// 디버깅
							console.log(possibleThree[i] + ' <-- 가능한 앞 3자리');
							
							
						}
						
					}					
					
					// 앞 3자리가 가능한 번호가 아닐경우
					if(result != 1) {
						
						alert('올바른 휴대폰 번호를 입력하세요.');
						
						// input value 초기화
						customerPhone.val('');
						
						return;
						
					}
										
				});
				
			});
		
		
		
		</script>
		
		
	</head>
	
	
	<body>
		<div>
			<div>
				<h1>비회원 주문 페이지</h1>
			</div>
			<div class="sec7-text-box">
  <p class="font18">오늘의 운영시간</p>
  <p class="runTimeCon font25">PM 09:00 ~ PM 09:00 </p>
  <hr/>
  <p class="font15 time-title">금일 마감까지 남은 시간</p>
  <div class="time font40">
    <span class="hours"></span>
    <span class="col">:</span>
    <span class="minutes"></span>
    <span class="col">:</span>
    <span class="seconds"></span>
  </div>

</div>
			<div>
				<form action = "${pageContext.request.contextPath }/order/orderPageNonMember" method = "post">
					<div>
						<table border = "1">
							<input type = "hidden" name = "customerPw" id = "customerPw" value="1234"> 		
							<tr>
								<th>customerName</th>
								<td>
									<input type = "text" name = "customerName" id = "customerName">
								</td>
							</tr>
							
							<tr>
								<th>customerPhone</th>
								<td>
									<input type = "text" name = "customerPhone" id = "customerPhone">
								</td>
							</tr>
							
							<tr>
								<th>address</th>
								<td>
									<textarea rows = "3" cols = "50" name = "address" id = "address"></textarea>
								</td>
						</table>
					</div>
				
					<div>
						<button type = "submit">주문 완료</button>
					</div>
				
				</form>
			</div>
		
		</div>
		
	</body>
</html>