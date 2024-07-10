<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>HOLLYS - 상품 상세</title>
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
        <link href="/coffeeorderproject/resources/userAssets/css/shop-detail.css" rel="stylesheet">
        <style>
        	div.sticky {
        		position: sticky;
        		top: 8rem;
        	}
        	
        	.review-border {
        		border-bottom : 1px solid rgb(255, 181, 36);
        	}
        	
        	.owl-stage {
        		display: flex;
        		align-items: stretch;
        	}
        	
        	.display-grid {
        		display: grid;
        		grid-template-rows: 1fr 0.7fr;
        	}
        	
        	.align {
        		display: grid;
        		align-items: center;
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


        <!-- Single Page Header start -->
        <div class="container-fluid page-header py-5">
            <h1 class="text-center text-white display-6">Product Detail</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="/coffeeorderproject/home">Home</a></li>
                <li class="breadcrumb-item active text-white">Product Detail</li>
            </ol>
        </div>
        <!-- Single Page Header End -->


        <!-- Single Product Start -->
        <div class="container-fluid py-5 mt-5">
            <div class="container py-5">
                <div class="row g-4 mb-5">
                    <div class="col-lg-8 col-xl-9">
                        <div class="row g-4">
                            <div class="col-lg-6">
                               	<c:if test="${ detailProduct.prodNo > 36 }">
                         			<img src="/coffeeorderproject/resources/userAssets/img/replacement.png" class="img-fluid rounded" alt="Image">
                                </c:if>
                                <c:if test="${ detailProduct.prodNo < 37 }">
                                <div class="border rounded">
                                    <a href="#">
                                        	<img src="/coffeeorderproject/resources/userAssets/img/product-menu-${ detailProduct.prodNo }.png" class="img-fluid rounded" alt="Image">
                                    </a>
                                </div>
                               	</c:if>
                            </div>
                            <div class="col-lg-6">
                            	<%-- 상품 이름 --%>
                                <h4 class="fw-bold mb-3">${ detailProduct.prodName }</h4>
                                <%-- 상품 카테고리 --%>
                                <p class="mb-3">카테고리: ${ detailProduct.productCategoryName }</p>
                                <%-- 상품 가격 --%>
                                <h5 class="fw-bold mb-3">${ detailProduct.prodPrice } ₩</h5>
                                
                                <%-- 상품 설명란 --%>
                                <p class="mb-4">${ detailProduct.prodexplain }</p>
                                
                            </div>
                            <div class="col-lg-12">
                                <nav>
                                    <div class="nav nav-tabs mb-3">
                                        <button class="nav-link active border-white border-bottom-0" type="button" role="tab"
                                            id="nav-about-tab" data-bs-toggle="tab" data-bs-target="#nav-about"
                                            aria-controls="nav-about" aria-selected="true">Description</button>
                                        <button class="nav-link border-white border-bottom-0" type="button" role="tab"
                                            id="nav-mission-tab" data-bs-toggle="tab" data-bs-target="#nav-mission"
                                            aria-controls="nav-mission" aria-selected="false">Reviews</button>
                                    </div>
                                </nav>
                                <div class="tab-content mb-5">
                                    <div class="tab-pane active" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
                                        <p>${ detailProduct.prodexplain }</p>
                                        <div class="px-2">
                                            <div class="row g-4">
                                                <div class="col-6">
                                                    <div class="row bg-light align-items-center text-center justify-content-center py-2">
                                                        <div class="col-6">
                                                            <p class="mb-0">칼로리</p>
                                                        </div>
                                                        <div class="col-6">
                                                            <p class="mb-0">9kcal</p>
                                                        </div>
                                                    </div>
                                                    <div class="row text-center align-items-center justify-content-center py-2">
                                                        <div class="col-6">
                                                            <p class="mb-0">당류</p>
                                                        </div>
                                                        <div class="col-6">
                                                            <p class="mb-0">0g/0%</p>
                                                        </div>
                                                    </div>
                                                    <div class="row bg-light text-center align-items-center justify-content-center py-2">
                                                        <div class="col-6">
                                                            <p class="mb-0">단백질</p>
                                                        </div>
                                                        <div class="col-6">
                                                            <p class="mb-0">0g/1%</p>
                                                        </div>
                                                    </div>
                                                    <div class="row text-center align-items-center justify-content-center py-2">
                                                        <div class="col-6">
                                                            <p class="mb-0">나트륨</p>
                                                        </div>
                                                        <div class="col-6">
                                                            <p class="mb-0">0mg/0%</p>
                                                        </div>
                                                    </div>
                                                    <div class="row bg-light text-center align-items-center justify-content-center py-2">
                                                        <div class="col-6">
                                                            <p class="mb-0">카페인</p>
                                                        </div>
                                                        <div class="col-6">
                                                            <p class="mb-0">153mg</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="nav-mission" role="tabpanel" aria-labelledby="nav-mission-tab">
                                    	<%-- 리뷰 반복 div --%>
                                    	<%-- 리뷰가 없는 경우 --%>
                                    	<c:choose>
                                    		<c:when test="${ empty reviewArr }">
                                    			<div class="d-flex review-border">
		                                            <div class="">
		                                                <h5>해당 상품관련 리뷰가 없습니다.
		                                                구매하고 리뷰를 남겨주세요!</h5>
		                                            </div>
		                                        </div>
                                    		</c:when>
                                    		<c:otherwise>
	                                    		<c:forEach var="reviews" items="${ reviewArr }">                                    	
			                                        <div class="d-flex review-border">
			                                            <!-- <img src="img/avatar.jpg" class="img-fluid rounded-circle p-3" style="width: 100px; height: 100px;" alt=""> -->
			                                            <div class="">
			                                                <p class="mb-2" style="font-size: 14px;">${ reviews.boardModifyDate }</p>
			                                                <div class="d-flex justify-content-between">
			                                                    <h5>${ reviews.usernickname }</h5>
			                                                    
			                                                </div>
			                                                <p>${ reviews.boardContent } </p>
			                                            </div>
			                                        </div>
		                                    	</c:forEach>
                                    		</c:otherwise>
                                    	</c:choose>
                                    	
                                        
                                    </div>
                                    <div class="tab-pane" id="nav-vision" role="tabpanel">
                                        <p class="text-dark">Tempor erat elitr rebum at clita. Diam dolor diam ipsum et tempor sit. Aliqu diam
                                            amet diam et eos labore. 3</p>
                                        <p class="mb-0">Diam dolor diam ipsum et tempor sit. Aliqu diam amet diam et eos labore.
                                            Clita erat ipsum et lorem et sit</p>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    <div class="col-lg-4 col-xl-3">
                        <div class="row g-4 fruite sticky">
                            <div class="col-lg-12">
                            	<%-- 상품 이름 --%>
                                <h4 class="fw-bold mb-3">${ detailProduct.prodName }</h4>
                                <%-- 상품 가격 --%>
                                <h5 class="fw-bold mb-3">${ detailProduct.prodPrice } ₩</h5>
                                <%-- 상품 수량 --%>
                            	<div class="input-group quantity mb-5" style="width: 100px;">
                                    <div class="input-group-btn">
                                        <button class="btn btn-sm btn-minus rounded-circle bg-light border" id="product-minus-btn" >
                                            <i class="fa fa-minus"></i>
                                        </button>
                                    </div>
                                    <input type="text" class="form-control form-control-sm text-center border-0 product-count" id="product-count" value="1">
                                    <div class="input-group-btn">
                                        <button class="btn btn-sm btn-plus rounded-circle bg-light border">
                                            <i class="fa fa-plus"></i>
                                        </button>
                                    </div>
                                </div>
                                <button class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary" id="put-cart-btn" data-prodno="${ detailProduct.prodNo }"><i class="fa fa-shopping-bag me-2 text-primary"></i> 담기</button>
                                <a href="/coffeeorderproject/hollysProduct/shop?page=1&select=0" class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary"><i class="bi bi-cup-straw"></i> Menu</a>
                                
                            </div>
                        </div>
                    </div>
                </div>
                <h1 class="fw-bold mb-0">관련 상품</h1>
                <div class="vesitable">
                    <div class="owl-carousel vegetable-carousel justify-content-center">
                    	<c:forEach var="products" items="${ cateProducts }">
	                        <div class="border border-primary rounded position-relative vesitable-item display-grid">
	                            <div class="vesitable-img">
	                            	<c:if test="${ products.prodNo > 36 }">
	                            		<img src="/coffeeorderproject/resources/userAssets/img/replacement.png" data-productno="${products.prodNo}" class="img-fluid w-100 rounded-top" alt="img">
	                            	</c:if>
	                            	<c:if test="${ products.prodNo < 37 }">
	                                	<img src="/coffeeorderproject/resources/userAssets/img/product-menu-${ products.prodNo }.png" class="img-fluid w-100 rounded-top" alt="">
	                            	</c:if>
	                            </div>
	                            <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">${ products.productCategoryName }</div>
	                            <div class="p-4 pb-0 rounded-bottom align">
	                                <h4>${ products.prodName }</h4>
	                                <p>${ products.prodexplain }</p>
	                                <div class="d-flex justify-content-between flex-lg-wrap">
	                                    <p class="text-dark fs-5 fw-bold">${ products.prodPrice }₩</p>
	                                    <a href="shop-detail?prodno=${ products.prodNo }" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="bi bi-arrow-up-right"></i> 보러가기</a>
	                                </div>
	                            </div>
	                        </div>
                    	</c:forEach>
                       
                    </div>
                </div>
            </div>
        </div>
        <!-- Single Product End -->
    

        <%-- Footer Start --%>
        <jsp:include page="/WEB-INF/views/userViews/modules/footer.jsp" />
		<%-- Footer End --%>



        <!-- Back to Top -->
        <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>   

        
    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/coffeeorderproject/resources/userAssets/lib/easing/easing.min.js"></script>
    <script src="/coffeeorderproject/resources/userAssets/lib/waypoints/waypoints.min.js"></script>
    <script src="/coffeeorderproject/resources/userAssets/lib/lightbox/js/lightbox.min.js"></script>
    <script src="/coffeeorderproject/resources/userAssets/lib/owlcarousel/owl.carousel.min.js"></script>
    <script>
    	// 상품 수량 0이하로 가지 않게하는 기능
    	$('#product-minus-btn').on('click', (e) => {
    		if ($('.product-count').val() <= 1) {
    			$('.product-count').val('2');
    		}
    	});
    	
    	// 장바구니에 담는 기능
    	$('#put-cart-btn').on('click', (e) => {
    		
    		if (${loginUser == null}) {
    			alert('로그인 후 이용해주세요.');
    			e.stopPropagation();
    			e.preventDefault();
    			return
    		} else {
        		const productCount = $('#product-count').val();
        		/* const ok = window.confirm("장바구니로 이동하시겠습니까?");
        		if (ok) {
        			location.href = "cart-product";
        		} else {
        			location.href = `put-cart?productCount=\${productCount}&prodno=${param.prodno}`;
        		} */
        		$.ajax({
        			"type" : "POST",
        			"url" : "put-cart",
        			"data" : "productCount=" + productCount + "&prodno=" + ${param.prodno},
        			"dataType" : "text",
        			"success" : (result, status, xhr) => {
        				const ok = window.confirm("장바구니로 이동하시겠습니까?");
    					if (ok) {
    						location.href = "cart-product";
    					} else {
    						location.reload();
    					}
        			},
        			"error" : (xhr, status, err) => { alert("Error. 다시 시도해주세요") }
        		});
    		}
    		
    		
    	});
    	
    </script>

    <!-- Template Javascript -->
    <script src="/coffeeorderproject/resources/userAssets/js/main.js"></script>
    </body>

</html>