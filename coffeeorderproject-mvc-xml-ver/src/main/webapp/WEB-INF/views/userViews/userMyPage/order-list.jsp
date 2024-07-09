<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<!DOCTYPE html>
<html lang="ko">

    <head>
<meta charset="utf-8">
<title>나의 주문 내역</title>
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
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->


       <%-- Header Start --%>
	<jsp:include page="/WEB-INF/views/userViews/modules/header-nav.jsp" />
	<%-- Header End --%>


        


        <!-- Single Page Header start -->
        <div class="container-fluid page-header py-5">
            <h1 class="text-center text-white display-6">OrderList</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="/coffeeorderproject/home">Home</a></li>
                <li class="breadcrumb-item"><a href="#">Pages</a></li>
                <li class="breadcrumb-item active text-white">OrderList</li>
            </ol>
        </div>
        <!-- Single Page Header End -->


        <!-- Cart Page Start -->
        <div class="container-fluid py-5">
            <div class="container py-5">
                <div class="table-responsive">
                   <table class="table"style="width: 100%; height: 100%;" >
					<thead>
						<tr>
							
						<tr>
                            <th scope="col">주문일자</th>
                            <th scope="col">주문번호</th>                            
                            <th scope="col">주문자명</th>
                            <th scope="col">메뉴</th>
                            <th scope="col">수량</th>
                            <th scope="col">쿠폰사용</th>
                            <th scope="col">금액</th>
                            <th scope="col">결제방법</th>
                            <th scope="col">주문상태</th>
                            <th scope="col">리뷰쓰기</th>
						</tr>
					</thead>
					 <tbody>
                    <c:set var="previousOrderId" value="" />
                    <c:forEach var="orderList" items="${orders}">
                        <c:choose>
                            <c:when test="${orderList.orderId != previousOrderId}">
                                <tr>
                                    <td><fmt:formatDate value="${orderList.orderDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                    <td>${orderList.orderId}</td>
                                    <td>${orderList.userName}</td>
                                    <td>${orderList.prodName}</td>
                                    <td>${orderList.cartQuantity}</td>
                                    <c:choose>
                                        <c:when test="${orderList.couponuse == false}">
                                            <td>N</td>
                                        </c:when>
                                        <c:otherwise>
                                            <td>Y</td>
                                        </c:otherwise>
                                    </c:choose>
                                    <td>${orderList.totalPrice}</td>
                                    <td>${orderList.orderPayment}</td>
                                    <td>${orderList.orderStatus}</td>
                                    <td>
                                        <c:if test="${orderList.orderStatus eq '픽업완료'}">
                                            <a data-orderid="${orderList.orderId}" class="btn border border-secondary rounded-pill px-3 text-primary revivewButton">
                                                리뷰쓰기
                                            </a>
                                        </c:if>
                                    </td>
                                </tr>
                                <c:set var="previousOrderId" value="${orderList.orderId}" />
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>${orderList.prodName}</td>
                                    <td>${orderList.cartQuantity}</td>
                                    <c:choose>
                                        <c:when test="${orderList.couponuse == false}">
                                            <td>N</td>
                                        </c:when>
                                        <c:otherwise>
                                            <td>Y</td>
                                        </c:otherwise>
                                    </c:choose>
                                    <td>${orderList.totalPrice}</td>
                                    <td>${orderList.orderPayment}</td>
                                    <td>${orderList.orderStatus}</td>
                                    <td>
                                        <c:if test="${orderList.orderStatus eq '픽업완료'}">
                                            <a data-orderid="${orderList.orderId}" class="btn border border-secondary rounded-pill px-3 text-primary revivewButton">
                                                리뷰쓰기
                                            </a>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
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
		<jsp:include page="/WEB-INF/views/userViews/modules/footer.jsp" />
		<%-- Footer End --%>


        <!-- Back to Top -->
        <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>   

        
    <!-- JavaScript Libraries -->
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

	<!-- Template Javascript -->
	<script src="/coffeeorderproject/resources/userAssets/js/main.js"></script>
	
	<script>
	
	$(function() {
		// 페이지 번호 버튼 클릭 이벤트 처리
	   $('.page-number-btn').on('click', function() {
	       // 해당 페이지 번호 가져오기
	       var pageNumber = $(this).text();
	       // 페이지 이동
	       window.location.href = 'order-list?page=' + pageNumber;
	   });

	   // 이전 페이지 버튼 클릭 이벤트 처리
	   $('.page-previous-btn').on('click', function() {
	       // 현재 페이지 번호 가져오기
	       var currentPage = parseInt('${param.page}');
	       if (currentPage > 1) {
	           // 이전 페이지로 이동
	           window.location.href = 'order-list?page=' + (currentPage - 1);
	       }
	   });

	   // 다음 페이지 버튼 클릭 이벤트 처리
	   $('.page-next-btn').on('click', function() {
	       // 현재 페이지 번호 가져오기
	       var currentPage = parseInt('${param.page}');
	       var allPageNum = parseInt('${end}');
	       if (currentPage < allPageNum) {
	           // 다음 페이지로 이동
	           window.location.href = 'order-list?page=' + (currentPage + 1);
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
			   window.location.href = 'order-list?page=' + (lastPageNum);
		   }
		   
	   });
	   
		// 처음 페이지 버튼 클릭 이벤트 처리
	   $('.page-first-btn').on('click',function(){
		   // 현재 페이지 번호 가져오기  
		   const currentPage = parseInt('${param.page}');
		   
		   if (currentPage > 1){
			   //처음 페이지로 이동하기
			   window.location.href = 'order-list?page=1' ;
		   }
		   
	   });
	   // 총 페이지의 수가 1이라면 버튼 삭제 처리
	   if ( ${end} == 1 ) {
  			$('div.col-12').css('display', 'none');
  			
  		} else {
  			$('div.col-12').css('display', '');
  			
  		}
	    
	   
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
	   
	   $('.revivewButton').on('click',function(){
		   const orderid = $(this).data('orderid');
		   window.location.href = 'reviewboardwrite?orderid=' + (orderid);
		  
		   
	   });
	});
	   

       
    </script>
	
</body>

</html>