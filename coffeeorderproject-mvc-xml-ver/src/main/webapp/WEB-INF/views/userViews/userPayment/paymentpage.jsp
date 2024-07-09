<%@page import="org.apache.jasper.tagplugins.jstl.core.Param"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 결제페이지 yoona 윤아 -->
<!DOCTYPE html>
<html lang="en">

       <head>
        <meta charset="utf-8">
        <title>HOLLYS - 결제</title>
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
        <link href="/coffeeorderproject/assets/css/admin-list.css" rel="stylesheet" /> <!-- yoona -->
    </head>


    <body>

        <!-- Spinner Start -->
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar start -->
       <jsp:include page="/WEB-INF/userViews/modules/header-nav.jsp" />
        <!-- Navbar End -->


        <!-- Modal Search Start -->
        <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-fullscreen">
                <div class="modal-content rounded-0">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Search by keyword</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body d-flex align-items-center">
                        <div class="input-group w-75 mx-auto d-flex">
                            <input type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1">
                            <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal Search End -->


        <!-- Single Page Header start -->
        <div class="container-fluid page-header py-5">
            <h1 class="text-center text-white display-6">Checkout</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="/coffeeorderproject/home">Home</a></li>
                <li class="breadcrumb-item active text-white">결제</li>
            </ol>
        </div>
        <!-- Single Page Header End -->
        
        
	<!-- 상단 장바구니 담은 목록 표시 테이블 start 시작 - yoona 윤아 -->
		<div style = "height: 100px;"></div> <!-- 여백 만들기용 박스 -->
            <div class="container py-5">
                <div class="table-responsive" style="scrollbar-width:none";>
					<div><h2 class="mb-4" style="text-align: center;" >결제하기</h2></div>
					<br>
                    <table class="table" id="item-table">
                        <thead>
                          <tr>
                            <th scope="col">Products</th>
                            <th scope="col">Name</th>
                            <th scope="col">Price</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Total</th>
               <!--              <th scope="col">삭제하기</th> -->
                          </tr>
                        </thead>
                        <tbody class="product-list-table">
                        <%-- 장바구니 리스트 출력 --%>
                        <form action="paymentpage" method="POST">
						    <c:forEach var="cartList" items="${cartArr}">
						        <tr style="position: relative; top: 10px;">
						            <th scope="row" >
						                <div class="d-flex align-items-center">
						                <c:if test="${ cartList.prodNo > 36 }">
						                	<img src="/coffeeorderproject/userAssets/img/replacement.png" data-productno="${cartList.prodNo}" class="img-fluid me-5 rounded-circle" style=" width: 100px; height: 100px; object-fit: scale-down;" alt="img">
						                </c:if>
						                <c:if test="${ cartList.prodNo < 37 }">
						                	<img src="/coffeeorderproject/userAssets/img/product-menu-${ cartList.prodNo }.png" data-productno="${cartList.prodNo}" class="img-fluid me-5 rounded-circle" style=" width: 100px; height: 100px; object-fit: scale-down;" alt="img">
						                    <!-- <img src="img/vegetable-item-3.png" class="img-fluid me-5 rounded-circle" style="width: 80px; height: 80px;" alt=""> -->
						                </c:if>
						                </div>
						            </th>
						            <!-- 사진 끝 -->
						            
						            
						            <td>
						                <p class="mb-0 mt-4 prodname-val">${ cartList.prodName }</p>
						                <input type="hidden" class="prod-name" name="prodName" value="${ cartList.prodName }">
						                <input type="hidden" class="prod-name" name="prodNo" value="${ cartList.prodNo }">
						            </td>
						            <td>
						                <p class="mb-0 mt-4">${cartList.prodPrice}</p>
						            </td>
						            <td>
						                <div class="input-group quantity mt-4 cartquantity-val" style="width: 100px;">${cartList.cartquantity}</div>
						                <input type="hidden" class="prod-cartquantity" name="cartquantity" value="${cartList.cartquantity}">
						            </td>
						            <td>
						                <p class="mb-0 mt-4">${cartList.prodPrice * cartList.cartquantity}</p>
						            </td>
						        <!--     <td style="position: relative; top: 25px;">
						                <button class="btn btn-md rounded-circle bg-light border mt-4" id="prod-delete-btn">
						                    <i class="fa fa-times text-danger"></i>
						                </button>
						                <button type="button" class="btn btn-outline-primary">삭제</button>
						            </td> -->
						        </tr>
						    </c:forEach>
                        </tbody>
                    </table>
                </div>
                
             
                
             </div>
             
             
    <!-- 상단 장바구니 담은 목록 표시 테이블 start 시작 - yoona 윤아 -->
        
        <!-- Checkout Page Start -->
        <div style = "height: 50px;"></div> <!-- 여백 만들기용 박스 -->
        <div class="container-fluid py-5">
            <div class="container py-5">
                 
                    <div class="row g-5">
                        <div style="width: 700px; position: relative; margin: auto;" >
                            <div class="form-item">
                                <label class="form-label my-3">닉네임</label>
                                <input type="text" class="form-control pay-input-box" name="userNickname" value="${ loginUser.userNickname }" readonly style="background-color: rgb(245, 246, 247)">
                                <input type="hidden" name="username" value="${ loginUser.userNickname }"/>
                            </div>
                            <div class="form-item">
                                <label class="form-label my-3">휴대폰 번호</label>
                                <input type="text" class="form-control pay-input-box" name="userPhone" value="${ loginUser.userPhone }" readonly style="background-color: rgb(245, 246, 247)">
                                <input type="hidden" name="username" value="${ loginUser.userPhone }"/>
                            </div>
                            
                            <div class="form-item">
                       
                         	<label class="form-label my-3">요청사항</label>
                            <select class="form-control" name="requestmenu" style="background-color: white">
                                <option style="text-align: right;">▼</option>
                                <option value = "1">얼음 많이 주세요.</option>
                                <option value = "2">얼음 적게 주세요.</option>
                                <option value = "3">시럽 넣어 주세요.</option>
                                <option value = "4">캐리어에 담아주세요.</option>
                            </select>
                            </div>
                            <!-- 쿠폰 버튼 시작 -->
			                <div class="mt-5">
			                    <!-- <input type="text" class="border-0 border-bottom rounded me-5 py-3 mb-4" placeholder=""> -->
			                	<c:choose>
			                	<c:when test="${ empty loginUser.couponId }">
			                    <input type="text" class="form-control" id="pay-coupon-checkbox" name="coupon" value="사용 가능한 쿠폰이 없습니다." readonly>
			                	</c:when>
			                	<c:otherwise>
			                	<input type="text" class="form-control" id="pay-coupon-checkbox" name="coupon" value="사용 가능 쿠폰: ${ fn:length(loginUser.usercoupon) }장"> <!-- usercoupon 배열에 데이터가 등록됐는지에 대한 코드 -->
			                	</c:otherwise>
			                    </c:choose>
			                    <button type="button" id="coupon-use-btn" class="btn border-secondary px-4 py-3 text-primary pay-coupon-btn">
			                    쿠폰 사용하기
			                    </button>
			                    <input type="hidden" id="couponuse" name="couponuse" value="false"> 
			                    <input type="hidden" name="userId" value="${ loginUser.userId }">
			                </div> 
			                
			                
			                <!-- 쿠폰 버튼 끝 -->
                            
                            <hr>
                            <div style = "height: 100px;"></div> <!-- 여백 만들기용 박스 -->
                            <div class="row g-4 text-center align-items-center justify-content-center border-bottom py-3">
                                <div class="col-12">
                                    <div class="form-check text-start my-3">
                                    	<ul style="padding-left: 0;"><li class="form-check-input bg-primary border-0" style=" list-style-type: none;"></li></ul>
                                        <label class="form-check-label" for="Payments-1"><div class="pay-total-text">주문금액 |</div>
                                        <c:forEach var="cartList" items="${cartArr}">
                                        <c:set var="i" value="${i+cartList.prodPrice * cartList.cartquantity}"/>
                                        </c:forEach>
                                        <div class="pay-font all-price">${i}</div> <!-- 상품가격 총합 -->
                                        </label>
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="row g-4 text-center align-items-center justify-content-center border-bottom py-3">
                                <div class="col-12">
                                    <div class="form-check text-start my-3">
                                        <ul style="padding-left: 0;"><li class="form-check-input bg-primary border-0" style=" list-style-type: none;"></li></ul>
                                        <label class="form-check-label" for="Delivery-1"><div class="pay-total-text">쿠폰할인 |</div>
	                                        <c:choose>
	                                        <c:when test="${ not empty loginUser.couponId }"><div class=" pay-font" id="use-coupone-ok" style="display: none">2000</div></c:when>
	                                        <c:otherwise><div class=" pay-font" id="use-coupone-no" >0</div></c:otherwise>
                                        </c:choose>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="row g-4 text-center align-items-center justify-content-center border-bottom py-3">
                                <div class="col-12">
                                    <div class="form-check text-start my-3">
                                        <ul style="padding-left: 0;"><li class="form-check-input bg-primary border-0" style=" list-style-type: none;"></li></ul>
                                        <label class="form-check-label" for="Paypal-1"><div class="pay-total-text">결제금액 |</div>
                                          <div class="pay-font real-pr real-total">${i}</div>
                                    </div>
                                </div>
                            </div>
                            <div style = "height: 50px;"></div> <!-- 여백 만들기용 박스 -->
						
                            <div class="row g-4 text-center align-items-center justify-content-center pt-4">
                                <button type="button" data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn border-secondary py-3 px-4 text-uppercase w-100 text-primary real-btn-0">결제하기</button>
                                <button type="button" id="cancel-btn" class="btn border-secondary py-3 px-4 text-uppercase w-100 text-primary">취소하기</button>
                            </div>
                          
      <!-- 모달창 -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">결제하기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      

	      <div class="modal-body">
	        <div class="d-grid gap-2 col-6 mx-auto">
			 <!--  <button class="btn order-status-btn" type="button" value="결제완료" style="background-color: rgb(245, 212, 93); color: blue;">결제완료</button>
			  <button class="btn order-status-btn" type="button" value="주문확정" style="background-color: rgb(245, 212, 93); color: blue;">주문확정</button>
			  <button class="btn order-status-btn" type="button" value="제조완료" style="background-color: rgb(245, 212, 93); color: blue;">제조완료</button>
			  <button class="btn order-status-btn" type="button" value="픽업완료" style="background-color: rgb(245, 212, 93); color: blue;">픽업완료</button> -->
			   <label class="btn btn order-status-radio" name="pay-card" id="radio-1" style="background-color: rgb(245, 212, 93); color: blue;">
				    <input type="radio" name="pay-card" value="카드결제" >
				    <span>카드결제</span>
				</label>
			 
				<label class="btn btn order-status-radio" name="pay-card" id="radio-2" style="background-color: rgb(245, 212, 93); color: blue;">
				    <input type="radio" name="pay-card" value="네이버페이">
				    <span>네이버페이</span>
				</label>
				 
				<label class="btn btn order-status-radio" name="pay-card" id="radio-3" style="background-color: rgb(245, 212, 93); color: blue;">
				    <input type="radio" name="pay-card" value="카카오페이">
				    <span>카카오페이</span>
				</label>
				<label class="btn btn order-status-radio" name="pay-card" id="radio-4" style="background-color: rgb(245, 212, 93); color: blue;">
				    <input type="radio" name="pay-card" value="토스페이">
				    <span>토스페이</span>
				</label>
			</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn" data-bs-dismiss="modal" style="color: #73685d;">취소</button>
	        <button type="submit" class="btn payment-btn" name="payment-btn" value="realPayment" style="background-color: #73685d; color: white;" >결제</button>
	        
	        
	      </div>
	   </form>
    </div>
  </div>
</div>
<!-- 모달창 -->
        
                            
                       <!-- 아래 결제하기 목록 끝 yoona 윤아 -->
                            
                      </div>
             	  </div>
            </div>
        </div>
        <!-- Checkout Page End -->


        <!-- Footer Start -->
        <jsp:include page="/WEB-INF/userViews/modules/footer.jsp" />
        <!-- Footer End -->



        <!-- Back to Top -->
        <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>   

        
    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/coffeeorderproject/userAssets/lib/easing/easing.min.js"></script>
    <script src="/coffeeorderproject/userAssets/lib/waypoints/waypoints.min.js"></script>
    <script src="/coffeeorderproject/userAssets/lib/lightbox/js/lightbox.min.js"></script>
    <script src="/coffeeorderproject/userAssets/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="/coffeeorderproject/userAssets/js/main.js"></script>
    
    <script type="text/javascript">

    	$(function() {
    		$('#coupon-use-btn').on('click', function() {
    			
    			 if(${ loginUser.couponId }) {
    				const ok = confirm('쿠폰을 사용하시겠습니까?');
    				if(ok) {
    				alert('쿠폰을 사용하였습니다. [할인 금액: 2,000원]');
    				$('#couponuse').val(ok ? 'true' : 'false'); /* true = 사용 false = 미사용 */
    				$('#use-coupone-ok').css("display", "inherit"); /* 쿠폰 사용 안하면 view 노출*/
    				$('#use-coupone-no').css("display", "none"); /* 쿠폰 사용 안하면 view 노출*/
    				const realPrice = $('.all-price').html() - 2000;
    				$('.real-total').html(`\${realPrice}`);

    				}
    			} else {
    				alert('사용 가능한 쿠폰이 없습니다.');
    			}

    			
    		});
    		
    		
    		$('#cancel-btn').on('click', function() {
    			if (confirm('결제를 취소하시겠습니까?')) {
    			history.back();
				}
    		});
    		
    		
    		 $('.payment-btn').on('click', function() {
    			 const ok = confirm('결제를 진행할까요?');
    			 if(!ok) {
 		    		event.preventDefault();
		    		event.stopPropagation();
    			 } else {
    				 
    			 }
    			 
    	 	/* 		const prodName = $(".prodname-val").eq().data("prodname");
    	 			const cartQuantity = $(".cartquantity-val").eq().data("cartquantity");
    				 
    	 			$('.prod-name').val(prodName);
    	 			$('.prod-cartquantity').val(cartQuantity);
    	 			console.log($('.prod-name').val());
    	 			console.log($('.prod-cartquantity').val()); */
    			 });
    		
    		
    		/* 삭제하기 버튼 없앴음 */
  /*   		$('#item-table').on('click', '.btn-outline-primary', function() {
    			console.log("Delete button clicked");
    			$(this).closest('tr').remove();
    			
			}); */
    		
    		
    		
   		   		   

   		  /*  $.ajax({

   			    url : "/userPayment/paymentpage",

   			    data : $("#orderQuantity").serialize(),

   			    method : "POST",

   			   success : function(result) {

   			        // 이 곳에 AJAX 응답 받은 후 처리할 내용 입력 (서버에서 보낸 것은 result에)

   			   }

   			}); */
   		   
		});
    	
    	
    </script>
    </body>

</html>