<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>HOLLYS - 장바구니</title>
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
        
        <style>
        	.total-cart-container {
        		display: flex;
        		align-items: center;
        		justify-content: center;
        	}
        	.emailMessage-main-container {
				border: 3px solid green;
				border-radius: 20px;
				position: absolute;
				top: 50%;
				left: 50%;
				transform: translate(-50%, -50%);
				width: 50%;
				height: 50%;
				display: flex;
				flex-direction: column;
				align-items: center;
				justify-content: center;
			}
			
			.emailMessage-main-container div {
				color: green;
			}
			
			.btn-container {
				display: grid;
				grid-template-columns: 1fr 1fr;
				column-gap: 2rem;
				margin-top: 4rem;
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

        <!-- Spinner Start -->
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->


        <%-- Header Start --%>
        <jsp:include page="/WEB-INF/views/userViews/modules/header-nav.jsp" />
		<%-- Header End --%>


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


        


		<c:choose>
			<c:when test="${ productArr.size() ne 0 }">
			<!-- Single Page Header start -->
	        <div class="container-fluid page-header py-5">
	            <h1 class="text-center text-white display-6">Cart</h1>
	            <ol class="breadcrumb justify-content-center mb-0">
	                <li class="breadcrumb-item"><a href="/coffeeorderproject/home">Home</a></li>
	                <li class="breadcrumb-item active text-white">Cart</li>
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
	                            <th scope="col">Quantity</th>
	                            <th scope="col">Total</th>
	                            <th scope="col">Delete</th>
	                          </tr>
	                        </thead>
	                        <form action="/coffeeorderproject/userPayment/paymentpage" method="POST">
	                        <tbody>
	                        <%-- tr 반복 --%>
	                        <%-- Session loginUser --%>
	                        	<c:forEach var="products" items="${ productArr }" varStatus="status">
	                            <input type="hidden" class="prodno-hidden-input" name="prodno" value="${ products.prodNo }">
	                            <input type="hidden" class="cartquantity-hidden-input" name="cartquantity" value="${ products.cartquantity }">
	                            <tr>
	                                <th scope="row">
	                                    <div class="d-flex align-items-center">
		                                    <c:if test="${ products.prodNo > 36 }">
		                                    	<img src="/coffeeorderproject/resources/userAssets/img/replacement.png" class="img-fluid me-5 rounded-circle" style="width: 80px; height: 80px;" alt="">
		                                    </c:if>
		                                    <c:if test="${ products.prodNo < 37 }">
		                                        <img src="/coffeeorderproject/resources/userAssets/img/product-menu-${ products.prodNo }.png" class="img-fluid me-5 rounded-circle" style="width: 80px; height: 80px;" alt="">
		                                    </c:if>
	                                    </div>
	                                </th>
	                                <td>
	                                    <p class="mb-0 mt-4">${ products.prodName }</p>
	                                </td>
	                                <td>
	                                    <p class="mb-0 mt-4 product-price" id="product-price" data-price="${ products.prodPrice }">${ products.prodPrice } ₩</p>
	                                </td>
	                                <td>
	                                    <div class="input-group quantity mt-4" style="width: 100px;" data-idx="${ status.index }">
	                                        <div class="input-group-btn">
	                                            <button type="button" class="btn btn-sm btn-minus rounded-circle bg-light border count-minus-btn" id="count-minus-btn" >
	                                            <i class="fa fa-minus"></i>
	                                            </button>
	                                        </div>
	                                        <input type="text" class="form-control form-control-sm text-center border-0 product-count" value="${ products.cartquantity }">
	                                        <div class="input-group-btn">
	                                            <button type="button" class="btn btn-sm btn-plus rounded-circle bg-light border count-plus-btn" id="count-plus-btn">
	                                                <i class="fa fa-plus"></i>
	                                            </button>
	                                        </div>
	                                    </div>
	                                </td>
	                                <td>
	                                    <p class="mb-0 mt-4 product-all-price">${ products.prodPrice * products.cartquantity } ₩</p>
	                                </td>
	                                <td>
	                                    <button type="button" class="btn btn-md rounded-circle bg-light border mt-4 delete-btn" data-prodno="${ products.prodNo }" data-prodname="${ products.prodName }" >
	                                        <i class="fa fa-times text-danger"></i>
	                                    </button>
	                                </td>
	                            
	                            </tr>
	                            </c:forEach>
	                            
	                        </tbody>
	                        
	                    </table>
	                </div>
	                <!-- <div class="mt-5">
	                    <input type="text" class="border-0 border-bottom rounded me-5 py-3 mb-4" placeholder="Coupon Code">
	                    <button class="btn border-secondary rounded-pill px-4 py-3 text-primary" type="button">Apply Coupon</button>
	                </div> -->
	                <div class="total-cart-container">
	                    <div class="col-sm-8 col-md-7 col-lg-6 col-xl-4">
	                        <div class="bg-light rounded">
	                            <div class="p-4">
	                                <h1 class="display-6 mb-4">Cart <span class="fw-normal">Total</span></h1>
	                                <div class="d-flex justify-content-between mb-4">
	                                    <h5 class="mb-0 me-4">총 수량:</h5>
	                                    <p class="mb-0 total-count">0</p>
	                                </div>
	                                <!-- <div class="d-flex justify-content-between">
	                                    <h5 class="mb-0 me-4">Shipping</h5>
	                                    <div class="">
	                                        <p class="mb-0">Flat rate: $3.00</p>
	                                    </div>
	                                </div>
	                                <p class="mb-0 text-end">Shipping to Ukraine.</p> -->
	                            </div>
	                            <div class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
	                                <h5 class="mb-0 ps-4 me-4">총 가격:</h5>
	                                <p class="mb-0 pe-4 total-price">0 ₩</p>
	                            </div>
	                            <button type="submit" name="payment-btn" value="payment-btn" class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4 payment-btn">
	                            	결제하기
	                            </button>
	                        </div>
	                    </div>
	                </div>
	                </form>
	            </div>
	        </div>
	        <!-- Cart Page End -->
	        
	        <%-- Footer Start --%>
	        <jsp:include page="/WEB-INF/views/userViews/modules/footer.jsp" />
			<%-- Footer End --%>
	        </c:when>
	        <c:otherwise>
	        	<div class="emailMessage-main-container">
					<h2>장바구니가 텅 비었어요ㅜㅜ</h2>
					<div class="btn-container">
						<a href="/coffeeorderproject/home" class="completepay-home-btn">Home으로 가기</a>
						<a href="/coffeeorderproject/hollysProduct/shop?page=1&select=0" class="completepay-mypay-btn">메뉴 보러가기</a>
					</div>
				</div>
	        </c:otherwise>
        </c:choose>


        



        <!-- Back to Top -->
        <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>   

        
    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/coffeeorderproject/resources/userAssets/lib/easing/easing.min.js"></script>
    <script src="/coffeeorderproject/resources/userAssets/lib/waypoints/waypoints.min.js"></script>
    <script src="/coffeeorderproject/resources/userAssets/lib/lightbox/js/lightbox.min.js"></script>
    <script src="/coffeeorderproject/resources/userAssets/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="/coffeeorderproject/resources/userAssets/js/main.js"></script>
    <script>
    	// 총 수량 function
    	function getTotalCount() {
    		let totalCount = 0;
        	for (let i = 0; i < $('.product-count').length; i++) {
        		totalCount += Number($('.product-count').eq(i).val());
        	}
        	$('.total-count').html(`\${totalCount}`);
    	}
    	
    	// 총 가격 function
    	function getTotalPrice() {
    		let totalPrice = 0;
        	for (let i = 0; i < $('.product-all-price').length; i++) {
        		const length = $('.product-all-price').eq(i).html().length;
        		totalPrice += Number($('.product-all-price').eq(i).html().substring(0, length - 1));
        	}
        	$('.total-price').html(`\${totalPrice} ₩`);
    	}
    
    	// 총 수량
    	getTotalCount();
    
    	// 총 가격
    	getTotalPrice();
    	
	 	// 수량 Minus btn 기능 & 상품 수량 0이하로 가지 않게하는 기능
		$('.count-minus-btn').on('click', function(e) {
			const index = $(this).parent().parent().data('idx');
			
			if ($('.product-count').eq(index).val() <= 1) {
				$('.product-count').eq(index).val('1');
			}
			
			const allPrice = $('.product-count').eq(index).val() * $('.product-price').eq(index).data('price');
			$('.product-all-price').eq(index).html(`\${allPrice} ₩`);
			$('.cartquantity-hidden-input').eq(index).val($('.product-count').eq(index).val());
			
			getTotalCount();
			getTotalPrice();
		});
    	
    	// 수량 Plus btn 기능
		$('.count-plus-btn').on('click', function(e) {
			const index = $(this).parent().parent().data('idx');
			
			const allPrice = $('.product-count').eq(index).val() * $('.product-price').eq(index).data('price');
			$('.product-all-price').eq(index).html(`\${allPrice} ₩`);
			$('.cartquantity-hidden-input').eq(index).val($('.product-count').eq(index).val());
			
			getTotalCount();
			getTotalPrice();
		});
    	
    	// 상품 삭제 기능
    	$('.delete-btn').on('click', function(e) {
    		const prodName = $(this).data('prodname');
    		const prodNo = $(this).data('prodno');
    		const ok = window.confirm(`\${prodName} 을/를 장바구니에서 삭제하시겠습니까?`);
    		if (ok) {
    			location.href = `cart-delete?prodno=\${prodNo}`;
    		}
    	});
    	
    </script>
    </body>

</html>