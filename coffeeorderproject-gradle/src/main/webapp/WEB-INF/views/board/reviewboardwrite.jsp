<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!-- 라이브러리 -->
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>


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
</head>

<body>

	<!-- Spinner Start -->
	<div id="spinner"
		class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
		<div class="spinner-grow text-primary" role="status"></div>
	</div>
	<!-- Spinner End -->

	<%-- Header Start --%>
	<jsp:include page="/WEB-INF/views/userViews/modules/header-nav.jsp" />
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
		<h1 class="text-center text-white display-6">리뷰 작성하기</h1>
		<ol class="breadcrumb justify-content-center mb-0">
			<li class="breadcrumb-item"><a href="/coffeeorderproject/home">Home</a></li>
			<li class="breadcrumb-item active text-white">ReviewBoardWrite</li>
		</ol>
	</div>
	<!-- Single Page Header End -->

	<!-- Main Content Start -->

	<!-- Cart Page Start -->
	<div class="container-fluid py-5">
		<div class="container py-5">
			<div class="table-responsive">
				<form action="reviewboardwrite" method="post" enctype="multipart/form-data">
					<input type="hidden" name="prodNo" value="${ userOrder.prodNo }">
					<input type="hidden" name="boardcategoryId" value="1">
					<h2> ${ userOrder.prodName } 리뷰 </h2>
					
					<table class="table">
						<thead>

							<tr>
								<td><input type="hidden" name="userId"
									value="${ loginUser.userId }"> 작성자:${ sessionScope.loginUser.userId }
								</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th><div style="width: 580px;">
										제목 <input type="text" name="boardTitle" style="width: 580px;" />
									</div></th>
							</tr>
							<tr>
								<th style="height: 50px">첨부 파일<input type="file"
									name="attach" style="width: 580px; height: 30px" /></th>
							</tr>
							<tr>
								<td><textarea name="boardContent" style="width: 580px"
										rows="15"></textarea></td>
							</tr>
							<tr>
								<td colspan="5" ><input
									class="btn border-secondary rounded-pill px-2 py-1 text-primary"
									type="submit" value="글 작성하기" /> 
									<%-- 가독성 구분선 --%>
									<input
									class="btn border-secondary rounded-pill px-2 py-1 text-primary"
									id="tolist_button"
									type="button" value="작성 취소"  /></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
	<!-- Cart Page End -->


	<!-- Main Content End -->
	<script src="http://code.jquery.com/jquery-3.7.1.js"></script>
	<script type="text/javascript">
		
	$(function() {
		
	
		$('#tolist_button').on('click', function(event) {
			location.href = 'review?pageNo=${ pageNo }';
		});
		
		

	});
		</script>
	<%-- Footer Start --%>
	<jsp:include page="/WEB-INF/views/userViews/modules/footer.jsp" />
	<%-- Footer End --%>


	<!-- Back to Top -->
	<a href="#"
		class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
		class="fa fa-arrow-up"></i></a>


	<!-- JavaScript Libraries -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="/coffeeorderproject/resources/userAssets/lib/easing/easing.min.js"></script>
<script src="/coffeeorderproject/resources/userAssets/lib/waypoints/waypoints.min.js"></script>
<script src="/coffeeorderproject/resources/userAssets/lib/lightbox/js/lightbox.min.js"></script>
<script src="/coffeeorderproject/resources/userAssets/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Template Javascript -->
<script src="/coffeeorderproject/resources/userAssets/js/main.js"></script>
<script src="/coffeeorderproject/resources/assets/js/core/jquery-3.7.1.js"></script>
</body>

</html>