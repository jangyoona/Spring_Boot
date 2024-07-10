<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- <%@ taglib prefix="c" uri="jakarta.tags.core"%> --%>
<!-- 라이브러리 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>HOLLYS-Review</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
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
	href="/coffeeorderproject/userAssets/lib/lightbox/css/lightbox.min.css"
	rel="stylesheet">
<link
	href="/coffeeorderproject/userAssets/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">


<!-- Customized Bootstrap Stylesheet -->
<link href="/coffeeorderproject/userAssets/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Template Stylesheet -->

<link href="/coffeeorderproject/userAssets/css/style.css"
	rel="stylesheet">
</head>

<body>

	<!-- Spinner Start -->
	<div id="spinner"
		class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
		<div class="spinner-grow text-primary" role="status"></div>
	</div>
	<!-- Spinner End -->

	<%-- Header Start --%>
	<jsp:include page="/WEB-INF/resources/userViews/modules/header-nav.jsp" />
	<%-- Header End --%>

	<!-- Modal Search Start -->
	<div class="modal fade" id="searchModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-fullscreen">
			<div class="modal-content rounded-0">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Search by
						keyword</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body d-flex align-items-center">
					<div class="input-group w-75 mx-auto d-flex">
						<input type="search" class="form-control p-3"
							placeholder="keywords" aria-describedby="search-icon-1">
						<span id="search-icon-1" class="input-group-text p-3"><i
							class="fa fa-search"></i></span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal Search End -->

	<!-- Single Page Header start -->
	<div class="container-fluid page-header py-5">
		<h1 class="text-center text-white display-6">리뷰</h1>
		<h1 class="text-center text-white display-6"> 키워드 : ${keyword} </h1>
		<ol class="breadcrumb justify-content-center mb-0">
			<li class="breadcrumb-item"><a href="/coffeeorderproject/home">Home</a></li>
			<li class="breadcrumb-item active text-white">SearchList</li>
		</ol>
	</div>
	<!-- Single Page Header End -->

	<!-- Main Content Start -->

	<!-- Cart Page Start -->
	<div class="container-fluid py-5">
		<div class="container py-5">
			<div class="table-responsive">
				<div class="mt-5">

					<table>
						<tr>
							<td>
								<form action="search" method="POST">
									<input type="text" name="keyword"
										class="border-0 border-bottom rounded me-1 py-1 mb-4"
										placeholder="키워드 검색" value="${keyword}" >
									<button type="submit"
										class="btn border-secondary rounded-pill px-2 py-1 text-primary"
										type="button">검색</button>
								</form>
							<form action="searchprodno" method="POST">
									<label for="product">메뉴 선택: &nbsp;&nbsp;&nbsp;</label> <select
										name="prodno" id="lang">
										
									<option value="${product.prodNo}">${ prodName.prodName }</option>
										
										<c:forEach var="product" items="${ prodList }">
											<c:if
												test="${ not product.prodActive }">
												<option value="${product.prodNo}">${product.prodName}</option>
											</c:if>
										</c:forEach>
									</select> &nbsp;&nbsp;
									<button type="submit"
										class="btn border-secondary rounded-pill px-2 py-1 text-primary"
										type="button">선택</button>
								</form>
							</td>
						</tr>
					</table>
				</div>

				<table class="table">
					<thead>
						<tr>
							<!-- <th colspan="5" style="text-align: right;">
								<button 
									id="write-comment-btn"
									class="btn border-secondary rounded-pill px-2 py-1 text-primary"
									type="button">새로운 글 작성하기</button>
							</th> -->
							<tr><th colspan="5" ><h6 align="center">리뷰작성은 마이페이지 주문목록에서 작성 가능합니다.</h6></th></tr>
							</tr>
						<tr>
							<th scope="col">작성한 날짜</th>
							<th scope="col">작성자</th>
							<th scope="col">메뉴</th>
							<th scope="col">글 제목</th>
							<th scope="col">수정한 날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="board" items="${searchList }">
							<c:if test="${ not board.boardDelete}">
								<tr>
									<td>${ board.boardDate }</td>
									<td>${ board.userId }</td>
									<td>${ board.prodName }</td>
									<td><a
										href="detail?boardno=${board.boardNo}&pageNo=${pageNo}&keyword=${keyword}">
											${board.boardTitle} </a></td>
									<td>${board.boardModifyDate}</td>
								</tr>
							</c:if>
						</c:forEach>

					</tbody>
					<tr>
						<td colspan="5"  style="text-align: center;"><br> <br> ${ pager }
							<br> <br></td>
					</tr>
					
				</table>
				<input type="button" id="tolist_button" value="돌아가기"
					style="height: 25px"
					class="btn border-secondary rounded-pill px-4 py-1 text-primary" />
			</div>
		</div>
	</div>
	<!-- Cart Page End -->

	<!-- pageList -->
	
	<!-- //// -->


	<!-- Main Content End -->
	
	<script src="http://code.jquery.com/jquery-3.7.1.js"></script>
	<script type="text/javascript">	
	$(function() {
		

		$('#write-comment-btn').on('click', function(event) {
			event.preventDefault();
			if(${ loginUser == null } ){
				alert('로그인이 필요합닌다.');
				return;
			}else{
				location.href = 'reviewboardwrite';
			}
		});
		
		$('#tolist_button').on('click', function(event) {
			location.href = 'review?pageNo=${ pageNo }';
		});
		
		// contact seller
    	$('.contact-seller').on('click', function(event) {
    		event.preventDefault();
    		if (${loginUser == null}) {
 		        alert('로그인이 필요한 서비스 입니다.');
 		        return;
			}else {
				location.href="inquiry1on1"; 
				
			}
		});
		
		});
		
		
		
		
		
		

	</script>

	

	<%-- Footer Start --%>
	<jsp:include page="/WEB-INF/resources/userViews/modules/footer.jsp" />
	<%-- Footer End --%>


	<!-- Back to Top -->
	<a href="#"
		class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
		class="fa fa-arrow-up"></i></a>


	<!-- JavaScript Libraries -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/coffeeorderproject/userAssets/lib/easing/easing.min.js"></script>
	<script
		src="/coffeeorderproject/userAssets/lib/waypoints/waypoints.min.js"></script>
	<script
		src="/coffeeorderproject/userAssets/lib/lightbox/js/lightbox.min.js"></script>
	<script
		src="/coffeeorderproject/userAssets/lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Template Javascript -->
	<script src="/coffeeorderproject/userAssets/js/main.js"></script>
</body>

</html>