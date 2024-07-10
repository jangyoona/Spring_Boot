<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>HOLLYS - 로그인</title>	
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/coffeeorderproject/resources/userAssets/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
    <link href="/coffeeorderproject/resources/userAssets/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


    <!-- Customized Bootstrap Stylesheet -->
    <link href="/coffeeorderproject/resources/userAssets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/coffeeorderproject/resources/userAssets/css/style.css" rel="stylesheet">
	<link href="/coffeeorderproject/resources/userAssets/css/login.css" rel="stylesheet">
</head>
<body>
	<%-- Header Start --%>
    <jsp:include page="/WEB-INF/views/userViews/modules/header-nav.jsp" />
	<%-- Header End --%>
	
	<%-- Main Start --%>
	<div class="container-fluid py-5 mb-5">
    	<div class="container py-5">
		    <main>
			    <div class="my-main-container">
			      <div class="my-main-name">
			        <h5>Log In</h5>
			      </div>
				
			      <div class="my-main-logIn">
 			         <form action="/coffeeorderproject/userAccount/login" method="POST">
			          <label for="my-id-input">ID
			            <input class="my-id-input" name="id" type="text">
			          </label>
			          <label for="my-password-input">PW
			            <input class="my-pw-input" name="pw" type="password">
			          </label>
				
			          <div class="my-btn-container">
			            <input type="button" id="my-register-btn" value="회원가입" />
			            <input type="submit" class="my-submit-btn" value="로그인" />
			            <input type="button" id="my-resetPw-btn" value="비밀번호 재설정" />
			            <%-- 
			            비밀번호 재설정 input 태그 만들고,
			            클릭하면 사용자가 메일 id, pw 입력하는 jsp 로 이동하게 만들고,
			            입력하면 SendMail Servlet 에서 받고,
			            임의의 난수를 session에 저장하고,
			            
			            유저에게 메일을 전송
			             
			             --%>
			          </div>
			        </form>
			  
			      </div>
			    </div>
			</main>
		</div>
	</div>
	<%-- Main End --%>

	<%-- Footer Start --%>
    <jsp:include page="/WEB-INF/views/userViews/modules/footer.jsp" />
	<%-- Footer End --%>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/coffeeorderproject/resources/userAssets/lib/easing/easing.min.js"></script>
    <script src="/coffeeorderproject/resources/userAssets/lib/waypoints/waypoints.min.js"></script>
    <script src="/coffeeorderproject/resources/userAssets/lib/lightbox/js/lightbox.min.js"></script>
    <script src="/coffeeorderproject/resources/userAssets/lib/owlcarousel/owl.carousel.min.js"></script>
    <script>
    	$(() => {
    		// 회원가입 페이지로 이동
    		$('#my-register-btn').on("click", (e) => {
    			location.href = "/coffeeorderproject/userAccount/register";
    		});
    		
    		// 사용자 인증 페이지로 이동
    		$('#my-resetPw-btn').on("click", (e) => {
    			location.href = "/coffeeorderproject/userAccount/checkUser";
    		});
    		
    		// Log in Btn (id, pw input value examine) 기능
    		$('.my-submit-btn').click((e) => {
    		  let id = $('.my-id-input').val();
    		  let pw = $('.my-pw-input').val();

    		  // 공백 검사 및 db에서 ID 및 PW 검사
    		  if(id.length === 0 || pw.length === 0){
    		    e.preventDefault();
    		    return window.alert('ID, PW를 입력해주세요.');
    		  }

    		});
    		
    		// 로그인 실패
    		if (${not empty param.loginfail}) {
    			window.alert("아이디, 비밀번호를 다시 확인해주세요");
    		}
    	});
    </script>
</body>
</html>