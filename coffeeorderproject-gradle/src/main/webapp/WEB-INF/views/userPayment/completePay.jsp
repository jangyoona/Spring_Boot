<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>HOLLYS - 결제 완료</title>	
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
    <link href="/coffeeorderproject/userAssets/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
    <link href="/coffeeorderproject/userAssets/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


    <!-- Customized Bootstrap Stylesheet -->
    <link href="/coffeeorderproject/userAssets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/coffeeorderproject/userAssets/css/style.css" rel="stylesheet">
	<link href="/coffeeorderproject/userAssets/css/emailMessage.css" rel="stylesheet">
	<style>
		.emailMessage-main-container {
			row-gap: 4rem;
		}
		
		.emailMessage-main-container h2 {
			color: black;
		}
	
		.btn-container {
			display: grid;
			grid-template-columns: 1fr 1fr;
			column-gap: 2rem;
		}
		
		.btn-container a {
				border: 1px solid #81c408;
				border-radius: 20px;
				padding: 1rem;
				text-align: center;
				transition: all 0.4s;
			}
			
			.btn-container a:hover {
				background-color: green;
				color: white;
			}
	</style>
</head>
<body>
	<%-- Header Start --%>
    <jsp:include page="/WEB-INF/userViews/modules/header-nav.jsp" />
	<%-- Header End --%>
	
	<%-- Main Start --%>
	<div class="emailMessage-main-container">
		<h2>결제완료</h2>
		<h5>결제가 완료되었습니다.<br/>이용해주셔서 감사합니다.</h5>
		<div class="btn-container">
			<a href="/coffeeorderproject/home" class="completepay-home-btn">Home으로 가기</a>
			<a href="/coffeeorderproject/userMyPage/order-list?page=1" class="completepay-mypay-btn">결제 내역 보러가기</a>
		</div>
	</div>
	<%-- Main End --%>

	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/coffeeorderproject/userAssets/lib/easing/easing.min.js"></script>
    <script src="/coffeeorderproject/userAssets/lib/waypoints/waypoints.min.js"></script>
    <script src="/coffeeorderproject/userAssets/lib/lightbox/js/lightbox.min.js"></script>
    <script src="/coffeeorderproject/userAssets/lib/owlcarousel/owl.carousel.min.js"></script>
    
</body>
</html>