<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" >
<head>
	
	<meta charset="UTF-8">
	<title>CodePen - Nice Login Screen </title>
	<link href="https://fonts.googleapis.com/css?family=Montserrat:500,800" rel="stylesheet">
	<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/Resources/dist/style.css">
	
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
	    <script type="text/javascript">
	        $(document).ready(function() {
	
				// 페이지에 바로 버턴 누름을 방지하기 위해
				// 고객 로그인
				$('#signinBtn').click(function() {
					
					// ID 유효성 체크
					if( ($('#custoemrId').val().length) < 1) {
						alert('아이디가 입력되지 않았습니다.');
						$('#custoemrId').focus();
						return;
					}	
					// PW 유효성 체크
					if( ($('#custoemrPw').val().length) < 1) {
						alert('비밀번호가 입력되지 않았습니다.');
						$('#custoemrPw').focus();
						return;
					}	
					$('#signinForm').submit();
				});
				// 사원 로그인
				$('#empSigninBtn').click(function() {
					
					// ID 유효성 체크
					if( ($('#empId').val().length) < 1) {
						alert('아이디가 입력되지 않았습니다.');
						$('#empId').focus();
						return;
					}	
					// PW 유효성 체크
					if( ($('#empPw').val().length) < 1) {
						alert('비밀번호가 입력되지 않았습니다.');
						$('#empPw').focus();
						return;
					}	
					$('#empSigninForm').submit();
				});
	        });
	    </script>
</head>
<body>
<!-- partial:index.partial.html -->
<div class="container">
  <!-- Heading -->
  <h1>LOGIN</h1>
  
  <!-- Links -->
  <ul class="links">
    <li>
      <a href="#" id="signin">고객 로그인!</a>
    </li>
    <li>
      <a href="#" id="signup">판매자 로그인</a>
    </li>
    <li>
      <a href="#" id="reset">RESET</a>
    </li>
  </ul>
  
  <!-- Form -->
  <form  action="" method="post">
    <!-- ID input -->
    <div class="first-input input__block first-input__block">
       <input type="text" placeholder="ID" class="input" id="email">
    </div>
    <!-- password input -->
    <div class="input__block">
       <input type="password" placeholder="Password" class="input" id="password">
    </div>
    <!-- Login button -->
    <button class="signin__btn">
      Login
    </button>
  </form>
  <!-- separator -->
  <div class="separator">
    <p>OR</p>
  </div>
  
  <!-- 비회원 button -->
  <button class="github__btn">
    <i class="fa"></i>
    비회원 주문하기
  </button>
</div>

<footer>
  <p>
    Thank you for watching
    <i class="fa fa-heart"></i> 
  </p>
  <p>
    SNS :
    <a href="https://www.facebook.com/chouaib45" >
      <i class="fa fa-facebook"></i>
    </a>
    <a href="http://twitter.com/chouaibblgn45">
      <i class="fa fa-twitter"></i> 
    </a>
    <a href="http://instagram.com/chouaib_blgn">
      <i class="fa fa-instagram"></i> 
    </a>
    <a href="http://linkedin.com/in/chouaibblgn/">
      <i class="fa fa-linkedin"></i>
    </a>
    <a href="https://www.behance.net/geek30">
      <i class="fa fa-behance"></i>
    </a>
  </p>
</footer>
<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script><script  src="${pageContext.request.contextPath}/Resources/dist/script.js"></script>

</body>
</html>
