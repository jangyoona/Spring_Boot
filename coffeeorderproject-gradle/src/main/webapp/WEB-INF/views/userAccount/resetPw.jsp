<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>HOLLYS - 비밀번호 재설정</title>	
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
	<link href="/coffeeorderproject/resources/userAssets/css/resetPw.css" rel="stylesheet">
	
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
			        <h5>비밀번호 재설정</h5>
			      </div>
				
			      <div class="my-main-logIn">
 			         <form action="reset-passwd" method="POST">
			          <label for="user-id">아이디
			            <input class="my-id-input" name="userId" type="text">
			          </label>
			          <p></p>
			          <label for="new-pw">새비밀번호
			            <input class="my-pw-input" id="newPw" name="newpw" type="password">
			          </label>
			          <p class="newPw-msg"></p>
			          <label for="chekc-pw">비밀번호 확인
			            <input class="my-checkPw-input" id="check-pw" type="password">
			          </label>
			          <p class="checkPw-msg"></p>
				
			          <div class="my-btn-container">
			            <input type="submit" id="my-resetPw-btn" value="비밀번호 재설정" />
			            <input type="button" class="my-cancel-btn" value="취소" />
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
    <script src="/coffeeorderproject/resources/userAssets/js/resetPw.js"></script>
</body>
</html>