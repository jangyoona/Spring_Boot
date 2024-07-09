<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>




<!DOCTYPE html>
<html lang="ko">

   <head>
        <meta charset="utf-8">
        <title>Home</title>
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
        	.slide {
        		margin-top: 6rem;
        	}
        	
        	.display-grid {
        		display: grid;
        	}
        	
        	.owl-stage {
        		display: flex;
        		align-items: stretch;
        	}
        	
        	.align-grid {
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

       


        <!-- Hero Start -->
        <div class="container-fluid py-5 mb-5 slide">
            <div class="container py-5">
                <div class="row g-5 align-items-center">
                    <div class="col-md-12 col-lg-7">
                        <h4 class="mb-3 text-secondary">100% Organic Foods</h4>
                        <h1 class="mb-5 display-3 text-primary">Delicious coffee & dessert</h1>
                        <div class="position-relative mx-auto">
                            <input class="form-control border-2 border-secondary w-75 py-3 px-4 rounded-pill" type="search" placeholder="Search">
                            <span  class="btn btn-primary border-2 border-secondary py-3 px-4 position-absolute rounded-pill text-white h-100 search-detail" 
                            style="top: 0; right: 25%;">Submit Now</span>
                        </div>
				                        
                    </div>
                    <div class="col-md-12 col-lg-5">
                        <div id="carouselId" class="carousel slide position-relative" data-bs-ride="carousel">
                            <div class="carousel-inner" role="listbox">
                                <div class="carousel-item active rounded">
                                    <img src="/coffeeorderproject/resources/userAssets/img/hollys-brand-renewal-green.jpg" class="img-fluid w-100 h-100 bg-secondary rounded" alt="First slide">
                                    
                                </div>
                                
                                 <c:forEach var="product" items="${ productArr }" >
                                 <c:if test="${ imageIsValid[product.prodNo] }">
	                               <div class="carousel-item rounded detail-product " data-productno="${product.prodNo}">
	                                    <img src="/coffeeorderproject/resources/userAssets/img/product-menu-${ product.prodNo }.png" 
	                                    data-productno="${product.prodNo}" class="img-fluid w-100 h-100 bg-secondary rounded carousel-content-img" alt="first slide">
	                                 	<div class="text-white bg-primary px-3 py-1 rounded position-absolute" data-productno="${product.prodNo}" style="top: 10px; right: 10px;">${ product.productCategoryName }</div>
	                             </div>
	                                 
	                            
	                              </c:if>
                            	</c:forEach>   
                               
                            	  
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselId" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselId" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero End -->
        					

        <!-- Featurs Section Start -->
        
        <!-- Featurs Section End -->


        <!-- Fruits Shop Start-->       
        <div class="container-fluid fruite py-5">
            <div class="container py-5">
                <div class="tab-class text-center">
                    <div class="row g-4">
                        <div class="col-lg-4 text-start">
                            <h1>Products by category</h1>
                        </div>
                        <div class="col-lg-8 text-end">
                            <ul id="menu-tabs" class="nav nav-pills d-inline-flex text-center mb-5">
                                <li class="nav-item">
                                    <a class="d-flex m-2 py-2 bg-light rounded-pill active" data-bs-toggle="pill" href="#tab-1">
                                        <span class="text-dark" style="width: 130px;">Coffee</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="d-flex py-2 m-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-2">
                                        <span class="text-dark" style="width: 130px;">Hollyccino</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-3">
                                        <span class="text-dark" style="width: 130px;">Shaved ice</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-4">
                                        <span class="text-dark" style="width: 130px;">Beverage</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-5">
                                        <span class="text-dark" style="width: 130px;">Dessert</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-content">
                    	<c:forEach var="idx" begin="1" end="5">
                        <div id="tab-${ idx }" class="tab-pane fade show p-0 ">
                            <div class="row g-4">
                                <div class="col-lg-12">
                                <!-- 상품 목록 보여주기 -->
                                    <div class="row g-4">
                                    	<c:forEach var="products" items="${productArr}">
										    <c:if test="${products.productCategoryId == idx}">
										        <div  class="col-md-6 col-lg-4 col-xl-3 detail-product" data-productno="${products.prodNo}">
										            <div class="rounded position-relative fruite-item display-grid"data-productno="${products.prodNo}">
										                <div class="fruite-img" data-productno="${products.prodNo}" >
										                <c:set var="imageName" value='${ imageIsValid[products.prodNo] ? "product-menu-" : "" }${ imageIsValid[products.prodNo] ? products.prodNo : "replacement" }' />
										                	<img src='/coffeeorderproject/resources/userAssets/img/${ imageName }.png' class="img-fluid w-100 rounded-top" alt=""data-productno="${products.prodNo}">
										                    
										                </div>
										                <div class="text-white bg-primary px-3 py-1 rounded position-absolute" data-productno="${product.prodNo}" style="top: 10px; right: 10px;">${ products.productCategoryName }</div>
	                            
										               
										                <div class="p-4 border border-secondary border-top-0 rounded-bottom"data-productno="${products.prodNo}">
										                    <h4 data-productno="${products.prodNo}">${products.prodName}</h4>
										                    <p data-productno="${products.prodNo}">${products.prodexplain}</p>
										                    <div  class="d-flex justify-content-between flex-lg-wrap"  data-productno="${products.prodNo}">
										                        <p class="text-dark fs-5 fw-bold mb-0" data-productno="${products.prodNo}">${products.prodPrice}₩</p>
										                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary put-cart-btn" data-prodno="${ products.prodNo }" ><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
										                    </div>
										                </div>
										            </div>
										        </div>
										    </c:if>
										</c:forEach>
                                       
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:forEach>

                    </div>
                </div>      
            </div>
        </div>
        <!-- Fruits Shop End-->


        <!-- Featurs Start -->
        
        <!-- Featurs End -->


        <!-- Vesitable Shop Start-->
        <div class="container-fluid vesitable py-5">
            <div class="container py-5">
                <h1 class="mb-0">Delicious coffee & dessert</h1>
                <div class="owl-carousel vegetable-carousel justify-content-center">
                 
                    <c:forEach var="products" items="${productArr}">
                    
                    <div class="border border-primary rounded position-relative vesitable-item detail-product align-grid" data-productno="${products.prodNo}">
                        <div class="vesitable-img" data-productno="${products.prodNo}">
                        
                        	 <c:set var="imageName" value='${ imageIsValid[products.prodNo] ? "product-menu-" : "" }${ imageIsValid[products.prodNo] ? products.prodNo : "replacement" }' />
							 <img src='/coffeeorderproject/resources/userAssets/img/${ imageName }.png' class="img-fluid w-100 rounded-top" alt=""data-productno="${products.prodNo}">
                        
                        </div>
                         <div class="text-white bg-primary px-3 py-1 rounded position-absolute" data-productno="${product.prodNo}" style="top: 10px; right: 10px;">${ products.productCategoryName }</div>
	                           
                        <div class="p-4 rounded-bottom align"data-productno="${products.prodNo}">
                            <h4 data-productno="${products.prodNo}">${products.prodName}</h4>
                            <p data-productno="${products.prodNo}">${products.prodexplain}</p>
                            <div class="d-flex justify-content-between flex-lg-wrap" data-productno="${products.prodNo}">
                                <p class="text-dark fs-5 fw-bold mb-0" data-productno="${products.prodNo}">${products.prodPrice}₩</p>
                                <a href="" class="btn border border-secondary rounded-pill px-3 text-primary put-cart-btn"  data-prodno="${ products.prodNo }"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                            </div>
                        </div>
                    </div>
                    
                    </c:forEach>
                  
                </div>
            </div>
        </div>
        <!-- Vesitable Shop End -->

	<!-- Banner Section Start-->
	<!-- Banner Section End -->
       


        <!-- Bestsaler Product Start -->
      
        <!-- Bestsaler Product End -->


      


        <!-- Tastimonial Start -->
        <div class="container-fluid testimonial py-5">
            <div class="container py-5">
                <div class="testimonial-header text-center">
                    <h4 class="text-primary">Our Testimonial</h4>
                    <h1 class="display-5 mb-5 text-dark">Our Client Saying!</h1>
                </div>
                <div class="owl-carousel testimonial-carousel">
                    
                         <c:forEach var="board" items="${ boardList }">
                         
                    <div class="testimonial-item img-border-radius bg-light rounded p-4">
                        <div class="position-relative">
                            <i class="fa fa-quote-right fa-2x text-secondary position-absolute" style="bottom: 30px; right: 0;"></i>
                            <div class="mb-4 pb-4 border-bottom border-secondary">
                                <p class="mb-0">- ${board.boardContent}</p>
                            </div>
                            <div class="d-flex align-items-center flex-nowrap">
                                <div class="bg-secondary rounded">
                                   <c:set var="imageName" value='${ imageIsValid[board.prodNo] ? "product-menu-" : "" }${ imageIsValid[board.prodNo] ? board.prodNo : "replacement" }' />
								   <img src='/coffeeorderproject/resources/userAssets/img/${ imageName }.png' class="img-fluid rounded" style="width: 100px; height: 100px;" alt=""data-productno="${board.prodNo}">
                                </div>
                                <div class="ms-4 d-block">
                                    <h4 class="text-dark">${board.boardTitle}</h4>
                                    <p class="m-0 pb-3"> ${ board.prodName }</p>
                                    <p class="m-0 pb-3">ID : ${ board.userId }</p>
                                </div>
                            </div>
                        </div> 
                    </div>
                   
                     </c:forEach>
                </div>
            </div>
        </div>
        <!-- Tastimonial End -->

		<%-- Footer Start --%>
        <jsp:include page="/WEB-INF/views/userViews/modules/footer.jsp" />
		<%-- Footer End --%>


        <!-- Back to Top -->
        <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>   

        
    <!-- JavaScript Libraries -->
    <script src="/coffeeorderproject/resources/assets/js/core/jquery-3.7.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/coffeeorderproject/resources/userAssets/lib/easing/easing.min.js"></script>
    <script src="/coffeeorderproject/resources/userAssets/lib/waypoints/waypoints.min.js"></script>
    <script src="/coffeeorderproject/resources/userAssets/lib/lightbox/js/lightbox.min.js"></script>
    <script src="/coffeeorderproject/resources/userAssets/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="/coffeeorderproject/resources/userAssets/js/main.js"></script>
    <script>
    $(function() {	
    	    
    	<%--
		$(".carousel-content-img").on('error', function(event) {
    		
    		// $(this).attr("src", "");
    		// console.log($(this).attr('src'));
    		$('.carousel-item[data-productno=' + $(this).data('productno') + ']').remove();
    	});
		

    	<c:forEach var="product" items="${ productArr }" >
			$('.carousel-content-img[data-productno=${product.prodNo}]').attr('src', '/coffeeorderproject/resources/userAssets/img/product-menu-${ product.prodNo }.png');
		</c:forEach>
		--%>
		
    	
    	//$(document).ready();
     	$('#tab-1').addClass('active');
   	
    	// Menu Search Function
    	$('.search-detail').on('click', (e) => {
    		const searchKeyword = $('.rounded-pill').val();
    		if (searchKeyword.length == 0) {
    			e.preventDefault();
    			window.alert("입력된 검색어가 없습니다.");
    		} else {
    			location.href = `/coffeeorderproject/views/userViews/hollysProduct/shop-search?search=\${ searchKeyword }&page=1&select=0`;	
        		}
    		
    	});
    	
    		// 장바구니에 담는 기능
	    	$('.put-cart-btn').on('click', function(e) {
		    const $button = $(e.currentTarget); // 클릭된 버튼 요소를 변수에 저장
		    console.log($(this).data('prodno'));
		
		    if (${loginUser == null}) {
		        alert('로그인 후 이용해주세요.');
		        e.stopPropagation();
		        e.preventDefault();
		        return
		    } else {
		        const productCount ='1';
		        const prodno = $(this).data('prodno'); // 저장된 버튼 요소에서 데이터 속성 값을 가져옴
		        
		        $.ajax({
		            "type" : "POST",
		            "url" : "/coffeeorderproject/views/userViews/hollysProduct/put-cart",
		            "data" : "productCount=" + productCount + "&prodno=" + prodno,
		            "dataType" : "text",
		            "success" : (result, status, xhr) => {
		                const ok = window.confirm("장바구니로 이동하시겠습니까?");
		                if (ok) {
		                    location.href = "/coffeeorderproject/views/userViews/hollysProduct/cart-product";
		                }else{
		                	location.reload();
		                }
		            },
		            "error" : (xhr, status, err) => { alert("Error. 다시 시도해주세요") }
		        });
		    }
		});
    	
    	/* // 장바구니에 담는 기능
    	$('.put-cart-btn').on('click',  function(e){
    		
    		const prodno = $(this).data('productno');
    		if (${loginUser == null}) {
    			alert('로그인 후 이용해주세요.');
    			e.stopPropagation();
    			e.preventDefault();
    			return
    		} else {
        		const productCount = '1';
        		 const ok = window.confirm("장바구니로 이동하시겠습니까?");
        		if (ok) {
        			location.href = "/coffeeorderproject/resources/hollysProduct/cart-product";
        		} else {
        			location.href = `put-cart?productCount=\${productCount}&prodno=${param.prodno}`;
        		} 
        		$.ajax({
        			"type" : "POST",
        			"url" : "/coffeeorderproject/resources/hollysProduct/put-cart",
        			"data" : "productCount=1&prodno=" + productno,
        			"dataType" : "text",
        			"success" : (result, status, xhr) => {
        				const ok = window.confirm("장바구니로 이동하시겠습니까?");
    					if (ok) {
    						location.href = "/coffeeorderproject/resources/hollysProduct/cart-product";
    					}
        			},
        			"error" : (xhr, status, err) => { alert("Error. 다시 시도해주세요") }
        		});
    		}
    	}); */
    	
    	
    	// Detail Product
	    $('.detail-product, .detail-product > div img, .detail-product > div p, .detail-product > div h4 .detail-product > div > a:not(.put-cart-btn)').on('click', function(e) {
	    	
	    	if($(e.target).data('productno') != null) {
	    		const prodno = $(this).data('productno');
		    	location.href = `/coffeeorderproject/views/userViews/hollysProduct/shop-detail?prodno=\${prodno}`;
	    	}
	    	e.stopPropagation();
	    	e.preventDefault();
	    });
    	
    	
	 
    });
	   
	 
    	
    </script>
    </body>

</html>