<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

    <head>
<meta charset="utf-8">
<title>나의 찜 목록</title>
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
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->


       <%-- Header Start --%>
	<jsp:include page="/WEB-INF/userViews/modules/header-nav.jsp" />
	<%-- Header End --%>


        


        <!-- Single Page Header start -->
        <div class="container-fluid page-header py-5">
            <h1 class="text-center text-white display-6">LikeList</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="/coffeeorderproject/home">Home</a></li>
                <li class="breadcrumb-item"><a href="#">Pages</a></li>
                <li class="breadcrumb-item active text-white">LikeList</li>
            </ol>
        </div>
        <!-- Single Page Header End -->


        <!-- Cart Page Start -->
        <div class="container-fluid py-5">
            <div class="container py-5">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                          <tr>
                            <th scope="col">Products</th>
                            <th scope="col">Name</th>
                            <th scope="col">Price</th>                            
                            <th scope="col">Handle</th>
                          </tr>
                        </thead>
                        <tbody>
                        
							
							<c:forEach var="like" items="${likeList}">
						    <tr>
					        <th scope="row">
				            	<div class="d-flex align-items-center">
					                <img src="/coffeeorderproject/userAssets/img/product-menu-${like.prodNo}.png" class="img-fluid me-5 rounded-circle" style="width: 80px; height: 80px;" alt="">
						            </div>
						        </th>
						        <td>
						            <p class="mb-0 mt-4">${like.prodName}</p>
						        </td>
						        <td>
						            <p class="mb-0 mt-4">${like.prodPrice}원</p>
						        </td>
						        <td>
						            <c:if test="${loginUser != null}">
						                <button id="delete_button_${like.prodNo}" class="btn btn-md rounded-circle bg-light border mt-4 delete_button" 
						                        data-user-id="${loginUser.userId}"
						                        data-prod-no="${like.prodNo}">
						                    <i class="fa fa-times text-danger"></i>
								                </button>
								            </c:if>
								        </td>
								    </tr>
								</c:forEach>
                        <!-- 찜 목록 끝  -->
                            
                        </tbody>
                    </table>
                </div>
                
                <!-- pageList -->
				
	           <div class="col-12">
                 <div class="pagination d-flex justify-content-center mt-5">
                     <button class="rounded page-first-btn">&laquo;</button>
                     <button class="rounded page-previous-btn">&#60;</button>
                     <%-- <c:forEach var="i" begin="1" end="${productCount / 9 + (productCount % 9 > 0 ? 1 : 0)}">
                      <button class="rounded page-number-btn">${i}</button>
                     </c:forEach> --%>
                     <c:forEach var="i" begin="${ start }" end="${ end }">
                      <button class="rounded page-number-btn">${i}</button>
                     </c:forEach>
                     <button class="rounded page-next-btn">&#62;</button>
                     <button class="rounded page-last-btn">&raquo;</button>
                 </div>
             </div>
			<!-- //// -->
                
            </div>
        </div>
        <!-- Cart Page End -->


       	<%-- Footer Start --%>
		<jsp:include page="/WEB-INF/userViews/modules/footer.jsp" />
		<%-- Footer End --%>


        <!-- Back to Top -->
        <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>   

        
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
	<script type="text/javascript">
	
	
	$(function() {
	    $('.delete_button').on('click', function(event) {
	        const prodNo = $(this).data('prod-no');
	        const userId = $(this).data('user-id');
	        const ok = confirm("상품번호 " + prodNo + " 를(을) 찜 목록에서 삭제할까요?");
	        if (ok) {
	            location.href = `/coffeeorderproject/userMyPage/delete?prodNo=\${prodNo}&userId=\${userId}`;
	        }
	    });
	    
	 // 페이지 번호 버튼 클릭 이벤트 처리
		   $('.page-number-btn').on('click', function() {
		       // 해당 페이지 번호 가져오기
		       const pageNumber = $(this).text();
		       // 페이지 이동
		       window.location.href = 'like?page=' + pageNumber;
		   });

		   // 이전 페이지 버튼 클릭 이벤트 처리
		   $('.page-previous-btn').on('click', function() {
		       // 현재 페이지 번호 가져오기
		       const currentPage = parseInt('${param.page}');
		       if (currentPage > 1) {
		           // 이전 페이지로 이동
		           window.location.href = 'like?page=' + (currentPage - 1);
		       }
		   });

		   // 다음 페이지 버튼 클릭 이벤트 처리
		   $('.page-next-btn').on('click', function() {
		       // 현재 페이지 번호 가져오기
		       const currentPage = parseInt('${param.page}');
		       const allPageNum = parseInt('${end}');
		       if (currentPage < allPageNum) {
		           // 다음 페이지로 이동
		           window.location.href = 'like?page=' + (currentPage + 1);
		       }
		   });
		   
		   // 마지막 페이지 버튼 클릭 이벤트 처리
		   $('.page-last-btn').on('click',function(){
			   // 현재 페이지 번호 가져오기  
			   const currentPage = parseInt('${param.page}');
			   // 마지막 페이지 번호 가져오기 
			   const lastPageNum = parseInt('${allPageNum}');
			   if (currentPage < lastPageNum){
				   //마지막 페이지로 이동하기
				   window.location.href = 'like?page=' + (lastPageNum);
			   }
			   
		   });
		   
			// 처음 페이지 버튼 클릭 이벤트 처리
		   $('.page-first-btn').on('click',function(){
			   // 현재 페이지 번호 가져오기  
			   const currentPage = parseInt('${param.page}');
			   
			   if (currentPage > 1){
				   //처음 페이지로 이동하기
				   window.location.href = 'like?page=1'  ;
			   }
			   
		   });
			
			// 페이지 번호 버튼들을 변수에 저장
		   const $pageNumberBtns = $('.pagination button.page-number-btn');

		   // 모든 버튼의 활성화 클래스 제거
		   $pageNumberBtns.removeClass('active');

		   // 페이지 번호에 해당하는 버튼을 찾아 활성화 클래스를 추가
		   $pageNumberBtns.each(function() {
		       if ($(this).text() === `${param.page}`) {
		           $(this).addClass('active');
		           return false; // 반복문 종료
		       }
		   });
			
		   // 총 페이지의 수가 1이라면 버튼 삭제 처리
		   if ( ${end} == 1 ) {
	  			$('div.col-12').css('display', 'none');
	  			
	  		} else {
	  			$('div.col-12').css('display', '');
	  			
	  		}
		   
		   
	});
	
</script>

	
</body>

</html>