<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link
	href="/coffeeorderproject/resources/userAssets/lib/lightbox/css/lightbox.min.css"
	rel="stylesheet">
<link
	href="/coffeeorderproject/resources/userAssets/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">


<!-- Customized Bootstrap Stylesheet -->
<link href="/coffeeorderproject/resources/userAssets/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Template Stylesheet -->
<link href="/coffeeorderproject/resources/userAssets/css/style.css"
	rel="stylesheet">
<!-- <link href="/coffeeorderproject/userAssets/css/login.css" rel="stylesheet"> -->

<!-- MyPage Stylesheet -->
<link href="/coffeeorderproject/resources/userAssets/css/MyPage.css"
	rel="stylesheet">
	

</head>
<body>
	
	

	<%-- Header Start --%>
	<jsp:include page="/WEB-INF/views/userViews/modules/header-nav.jsp" />
	<%-- Header End --%>
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br>


	<%-- MyPage Start --%>
	
	<div class="wrap">
		<div class="greenContainer" >
			<div>
				<div class="grade" >ID : ${ loginUser.userId }</div>
				<div class="name">${ loginUser.userNickname }</div>
			</div>
			<div class="modify" >가입일 : ${ loginUser.userRegidate }</div>
		</div>

		<div class="summaryContainer">
			<div class="item">
				<div class="number"><c:out value="${userOrders.size()}" />회</div>
				<div>주문내역</div>
			</div>
			<div class="item">
				<div class="number">${ appUserCart.size() }</div>
				<div>장바구니</div>
			</div>
			<div class="item">
				<div class="number">${board.size()}</div>
				<div>상품리뷰</div>
			</div>
			<div class="item">
				<div class="number">${fn:length(userCoupon)}</div>
				<div>잔여쿠폰</div>
			</div>
		</div>
		
		<c:set var="paymentCompleteCount" value="0" />
		<c:set var="orderConfirmedCount" value="0" />
		<c:set var="productionCompleteCount" value="0" />
		<c:set var="pickupCompleteCount" value="0" />
		
		<c:forEach var="orderList" items="${ userOrders }">
		    <c:choose>
		        <c:when test="${orderList.orderStatus == '결제완료'}">
		            <c:set var="paymentCompleteCount" value="${paymentCompleteCount + 1}" />
		        </c:when>
		        <c:when test="${orderList.orderStatus == '주문확정'}">
		            <c:set var="orderConfirmedCount" value="${orderConfirmedCount + 1}" />
		        </c:when>
		        <c:when test="${orderList.orderStatus == '제조완료'}">
		            <c:set var="productionCompleteCount" value="${productionCompleteCount + 1}" />
		        </c:when>
		        <c:when test="${orderList.orderStatus == '픽업완료'}">
		            <c:set var="pickupCompleteCount" value="${pickupCompleteCount + 1}" />
		        </c:when>
		    </c:choose>
		</c:forEach>
		
		<div class="shippingStatusContainer">
			<div class="title">주문/결제</div>
			<div class="status">

				
				<div class="item">
					<div>
						<div class="number"><c:out value="${paymentCompleteCount}" />회</div>
						<div class="text">결제완료</div>
					</div>
					<div class="icon">></div>
				</div>
				<div class="item">
					<div>
						<div class="green number"><c:out value="${orderConfirmedCount}" />회</div>
						<div class="text">주문확정</div>
					</div>
					<div class="icon">></div>
				</div>
				<div class="item">
					<div>
						<div class="number"><c:out value="${productionCompleteCount}" />회</div>
						<div class="text">제조완료</div>
					</div>
					<div class="icon">></div>
				</div>
				<div class="item">
					<div>
						<div class="number"><c:out value="${pickupCompleteCount}" />회</div>
						<div class="text">픽업완료</div>
					</div>
					<div class="icon">></div>
				</div>


				<div class="listContainer">
					<a href="/coffeeorderproject/userMyPage/order-list?page=1" class="item">
						<div class="icon">ii</div>
						<div class="text">
							주문내역<span class="circle"></span>
						</div>
						<div class="right">></div>
					</a> <a href="/coffeeorderproject/userMyPage/user-review?page=1" class="item">
						<div class="icon">ii</div>
						<div class="text">리뷰내역</div>
						<div class="right">></div>
					</a> <a href="/coffeeorderproject/inquiry1on1" class="item">
						<div class="icon">ii</div>
						<div class="text">1:1 문의</div>
						<div class="right">></div>
					</a> 
				</div>
				<div class="listContainer">
					<a href="/coffeeorderproject/userMyPage/like?page=1" class="item">
						<div class="icon">ii</div>
						<div class="text">찜한상품</div>
						<div class="right">></div>
					</a>
					<a href="/coffeeorderproject/userMyPage/update-user" class="item">
							<div class="icon">ii</div>
							<div class="text">회원정보 변경</div>
							<div class="right">></div>
						</a><a href="/coffeeorderproject/userMyPage/logout" class="item">
							<div class="icon">ii</div>
							<div class="text">로그아웃</div>
							<div class="right">></div>
							
							
						</a>
				</div>

			</div>
		</div>
	</div>

	<%-- MyPage End --%>



	<%-- Footer Start --%>
	<jsp:include page="/WEB-INF/views/userViews/modules/footer.jsp" />
	<%-- Footer End --%>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/coffeeorderproject/resources/userAssets/lib/easing/easing.min.js"></script>
	<script
		src="/coffeeorderproject/resources/userAssets/lib/waypoints/waypoints.min.js"></script>
	<script
		src="/coffeeorderproject/resources/userAssets/lib/lightbox/js/lightbox.min.js"></script>
	<script
		src="/coffeeorderproject/resources/userAssets/lib/owlcarousel/owl.carousel.min.js"></script>
</body>
</html>