<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="kor">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

    <head>
        <meta charset="utf-8">
        <title>HOLLYS - Menu</title>
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
        <link href="/coffeeorderproject/resources/userAssets/css/shop.css" rel="stylesheet">
        
        <style>
        	.display-grid {
        		display: grid;
        		grid-template-rows: 1fr 1fr;
        	}
        	
        	.align-grid {
        		display: grid;
        		grid-template-rows: 0.5fr 1fr 0.3fr;
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


        <!-- Single Page Header start -->
        <div class="container-fluid page-header py-5">
            <h1 class="text-center text-white display-6">Menu</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="/coffeeorderproject/home">Home</a></li>
                <li class="breadcrumb-item active text-white">Menu</li>
            </ol>
        </div>
        <!-- Single Page Header End -->


        <!-- Fruits Shop Start-->
        <%-- 5. 정렬 (일반 / 인기순 / 가격순)
        	 6. 상품 클릭하면 상세 페이지로 이동  --%>
        <div class="container-fluid fruite py-5">
            <div class="container py-5">
                <h1 class="mb-4">HOLLYS MENU</h1>
                <div class="row g-4">
                    <div class="col-lg-12">
                        <div class="row g-4">
                            <div class="col-xl-3">
                                <div class="input-group w-100 mx-auto d-flex">
                                	<c:choose>
	                                	<c:when test="${ empty param.search }">
		                                    <input type="search" class="form-control p-3 search-input" placeholder="메뉴명 검색" aria-describedby="search-icon-1">
	                                	</c:when>
	                                	<c:otherwise>
	                                	    <input type="search" class="form-control p-3 search-input" value="${ param.search }" aria-describedby="search-icon-1">
	                                	</c:otherwise>
                                	</c:choose>
                                    <span id="search-icon-1" class="input-group-text p-3 search-btn" style="cursor:pointer"><i class="fa fa-search"></i></span>
                                </div>
                            </div>
                            <div class="col-6"></div>
                            <div class="col-xl-3">
                                <div class="bg-light ps-3 py-3 rounded d-flex justify-content-between mb-4">
                                    <label for="fruits">정렬:</label>
                                    <select id="fruits" name="fruitlist" class="border-0 form-select-sm bg-light me-3 sort-select" form="fruitform">
                                        <option value="0">일반</option>
                                        <option value="1">인기순</option>
                                        <option value="2">가격순</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <%-- 상품 목록 --%>
                        <div class="row g-4">
                        	<%-- 상품 sidebar --%>
                            <div class="col-lg-3">
                                <div class="row g-4">
                                    <%-- Categories --%>
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <h4>Categories</h4>
                                            <div class="mb-2">
                                                <input type="radio" class="me-2 cate-input" id="Categories-1" name="category" value="0">
                                                <label for="Categories-1"> 전체상품</label>
                                            </div>
                                            <div class="mb-2">
                                                <input type="radio" class="me-2 cate-input" id="Categories-2" name="category" value="1">
                                                <label for="Categories-2"> 커피</label>
                                            </div>
                                            <div class="mb-2">
                                                <input type="radio" class="me-2 cate-input" id="Categories-3" name="category" value="2">
                                                <label for="Categories-3"> 홀리치노</label>
                                            </div>
                                            <div class="mb-2">
                                                <input type="radio" class="me-2 cate-input" id="Categories-4" name="category" value="3">
                                                <label for="Categories-4"> 빙수</label>
                                            </div>
                                            <div class="mb-2">
                                                <input type="radio" class="me-2 cate-input" id="Categories-5" name="category" value="4">
                                                <label for="Categories-5"> 음료</label>
                                            </div>
                                            <div class="mb-2">
                                                <input type="radio" class="me-2 cate-input" id="Categories-6" name="category" value="5">
                                                <label for="Categories-6"> 디저트</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- 상품 개별 container --%>
                            <div class="col-lg-9">
                                <div class="row g-4 justify-content-center">
                                	<%-- 이걸 반복해야함 --%>
                                	<c:if test="${ empty productArr }">
                                		<h2>일치하는 메뉴가 없습니다.</h2>
                                	</c:if>
                                	<c:forEach var="products" items="${ productArr }">
                                		<div class="col-md-6 col-lg-6 col-xl-4" style="cursor: pointer">
	                                        <div class="rounded position-relative fruite-item detail-product display-grid" data-productno="${products.prodNo}">
	                                            <div class="fruite-img">
	                                            	<c:if test="${ products.prodNo > 36 }">
	                                            	<img src="/coffeeorderproject/resources/userAssets/img/replacement.png" data-productno="${products.prodNo}" class="img-fluid w-100 rounded-top" alt="img">
	                                            	</c:if>
	                                            	<c:if test="${ products.prodNo < 37 }">
	                                            	<img src="/coffeeorderproject/resources/userAssets/img/product-menu-${ products.prodNo }.png" data-productno="${products.prodNo}" class="img-fluid w-100 rounded-top" alt="img">
	                                            	</c:if>
	                                                
	                                            </div>
	                                            
	                                            <div class="p-4 border border-secondary border-top-0 rounded-bottom align-grid">
	                                                <h4 data-productno="${products.prodNo}">${ products.prodName }</h4>
	                                                <p data-productno="${products.prodNo}">${ products.prodexplain }</p>
	                                                <div class="d-flex justify-content-between flex-lg-wrap">
	                                                    <p class="text-dark fs-5 fw-bold mb-0" data-productno="${products.prodNo}">가격 : ${ products.prodPrice }원</p>
	                                                    <c:set var="loop_flag" value="false" />
													
													<c:choose>
													    <c:when test="${not empty loginUser }">
													        <c:forEach var="like" items="${likeList}">
													            <c:if test="${like.prodNo == products.prodNo}">
													                <a href="javascript:" data-productno="${ products.prodNo }" data-like='unlike' class="btn border border-secondary rounded-pill px-3 text-primary likeButton">
													                    <i class="bi bi-star-fill"></i> <span>찜 해제</span>
													                </a>
													                <c:set var="loop_flag" value="true" />
													            </c:if>
													        </c:forEach>
													        <c:if test="${not loop_flag}">
													            <a href="javascript:" data-productno="${ products.prodNo }" data-like='like' class="btn border border-secondary rounded-pill px-3 text-primary likeButton">
													                <i class="bi bi-star"></i> <span>찜</span>
													            </a>
													        </c:if>
													    </c:when>
													    <c:otherwise>
													        <a href="javascript:" class="btn border border-secondary rounded-pill px-3 text-primary likeButton">
													            <i class="fa fa-times text-danger"></i> <span>찜</span>
													        </a>
													    </c:otherwise>
													</c:choose>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
                                	</c:forEach>
                                	
                                	<%-- 상품 limit 9개로 쪼개기 해야됨 --%>
                                  
                                    
                                    <%-- 상품 페이지(1, 2, 3, 4, ...) --%>
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
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Fruits Shop End-->


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

    <!-- Template Javascript -->
    <script src="/coffeeorderproject/resources/userAssets/js/main.js"></script>
    <script src="/coffeeorderproject/resources/userAssets/js/shop.js"></script>
    <script>
    
    	// Select Category Function
	    $('.cate-input').on('click', (e) => {
	    	location.href = `shop-category?category=\${ $(e.currentTarget).val() }&page=1&select=${param.select}`;
	    });
    	
    	// Menu Search Function
    	$('.search-btn').on('click', (e) => {
    		const searchKeyword = $('.search-input').val();
    		if (searchKeyword.length == 0) {
    			e.preventDefault();
    			window.alert("입력된 검색어가 없습니다.");
    		} else {
    			location.href = `shop-search?search=\${ searchKeyword }&page=1&select=${param.select}`;	
    		}
    		
    	});
    	
    	// Sort Select
    	$('.sort-select').on("change", () => {
    		const selectValue = $('.sort-select').val();
    		if (${param.category != null}) {
    			location.href = `/coffeeorderproject/hollysProduct/shop-category?page=1&select=\${selectValue}&category=${param.category}`;
    		} else if (${param.search != null}) {
    			location.href = `/coffeeorderproject/hollysProduct/shop-search?search=${param.search}&page=1&select=\${selectValue}`;
    		} else {
    			location.href = `/coffeeorderproject/hollysProduct/shop?page=${param.page}&select=\${ selectValue }`;
    		}
    		
    	});
    	
    	// pagination Btn Function
    	$('button.page-number-btn').on('click', (e) => {
    		const page = $(e.target).html();
    		const selectValue = $('.sort-select').val();
    		
    		if (${param.category != null}) {
    			location.href = `/coffeeorderproject/hollysProduct/shop-category?category=${ param.category }&page=\${page}&select=${param.select}`;
    		} else if (${param.search != null}) {
    			location.href = `/coffeeorderproject/hollysProduct/shop-search?search=${ param.search }&page=\${page}&select=${param.select}`;
    		} else {
	    		location.href = `/coffeeorderproject/hollysProduct/shop?page=\${page}&select=${ param.select }`;    			
    		}
    		
    	});
    	
    	$('button.page-first-btn').on('click', (e) => {
    		if (${param.category != null}) {
    			location.href = `/coffeeorderproject/hollysProduct/shop-category?category=${ param.category }&page=1&select=${param.select}`;
    		} else if (${param.search != null}) {
    			location.href = `/coffeeorderproject/hollysProduct/shop-search?search=${ param.search }&page=1&select=${param.select}`;
    		} else {
	    		location.href = `/coffeeorderproject/hollysProduct/shop?page=1&select=${ param.select }`;    			
    		}
    	});
    	
    	$('button.page-previous-btn').on('click', (e) => {
    		if (${param.category != null}) {
    			location.href = `/coffeeorderproject/hollysProduct/shop-category?category=${ param.category }&page=${ param.page - 1 }&select=${param.select}`;
    		} else if (${param.search != null}) {
    			location.href = `/coffeeorderproject/hollysProduct/shop-search?search=${ param.search }&page=${ param.page - 1 }&select=${param.select}`;
    		} else {
	    		location.href = `/coffeeorderproject/hollysProduct/shop?page=${ param.page - 1 }&select=${ param.select }`;    			
    		}
    	});
    	
    	$('button.page-next-btn').on('click', (e) => {
    		if (${param.category != null}) {
    			location.href = `/coffeeorderproject/hollysProduct/shop-category?category=${ param.category }&page=${ param.page + 1 }&select=${param.select}`;
    		} else if (${param.search != null}) {
    			location.href = `/coffeeorderproject/hollysProduct/shop-search?search=${ param.search }&page=${ param.page + 1 }&select=${param.select}`;
    		} else {
	    		location.href = `/coffeeorderproject/hollysProduct/shop?page=${ param.page + 1 }&select=${ param.select }`;    			
    		}
    	});
    	
	    let allPageNumber = ${productCount / 9 + (productCount % 9 > 0 ? 1 : 0)}
	    allPageNumber = Math.floor(allPageNumber);
	    
    	$('button.page-last-btn').on('click', (e) => {
    		if (${param.category != null}) {
    			location.href = `/coffeeorderproject/hollysProduct/shop-category?category=${ param.category }&page=\${ allPageNumber }&select=0`;
    		} else if (${param.search != null}) {
    			location.href = `/coffeeorderproject/hollysProduct/shop-search?search=${ param.search }&page=\${ allPageNumber }&select=0`;
    		} else {
	    		location.href = `/coffeeorderproject/hollysProduct/shop?page=\${allPageNumber}&select=${ param.select }`;    			
    		}
    	});
    
	    // pagination Btn UI & Category Btn UI & Select Sort UI 
	    if (${ param.page } == 1) {
   			$('button.page-previous-btn').css('display', 'none');
   			$('button.page-first-btn').css('display', 'none');
   		} else {
   			$('button.page-previous-btn').css('display', '');
   			$('button.page-first-btn').css('display', '');
   		}
	    
	    /* $('button.page-number-btn').length */
	    if (${ param.page } == allPageNumber) {
   			$('button.page-next-btn').css('display', 'none');
   			$('button.page-last-btn').css('display', 'none');
   		} else {
   			$('button.page-next-btn').css('display', '');
   			$('button.page-last-btn').css('display', '');
   		}
	    
	    $('.pagination button.page-number-btn').removeClass('active');
	    for (let i = 0; i < $('.pagination button.page-number-btn').length; i++) {
	    	if ($('.pagination button.page-number-btn').eq(i).html() == ${param.page}) {
	    		$('.pagination button.page-number-btn').eq(i).addClass('active');
	    		break;
	    	}
	    }
	    
	    if (${param.category != null}) {
	    	$('.cate-input').removeAttr('checked');
		    $('.cate-input').eq(${param.category}).attr('checked', true);
	    }
	    
	    if (${param.select != null}) {
	    	$('.sort-select option').removeAttr('selected');
	    	$('.sort-select option').eq(${param.select}).attr('selected', 'selected');
	    }
	    
	 	// Detail Product
	    $('.detail-product, .detail-product > div img, .detail-product > div p, .detail-product > div h4').on('click', function(e) {
	    	console.log($(this).data('productno'));
	    	const prodno = $(this).data('productno');
	    	location.href = `shop-detail?prodno=\${prodno}`;
	    	e.stopPropagation();
	    	e.preventDefault();
	    });
	 	
	    // 찜 추가 및 삭제 시작
	    $('.likeButton').on('click', function(event) {
	    	const productNo = $(this).data('productno');
	    	console.log(productNo);
	    	if (productNo) {
	    		console.log(1);
	    		// alert('로그인한 사용자');
	    		const isLike = $(this).data('like');
	    		if (isLike == "like") {
	    			// alert('찜 클릭');
	    			likeOrUnlike(productNo, '${ loginUser.userId }', 'add');
	    		} else {
	    			// alert('찜 해제 클릭');
	    			likeOrUnlike(productNo, '${ loginUser.userId }', 'remove');
	    		}
	    	} else {
	    		alert('로그인하지 않은 사용자');
	    	}
	    	event.stopPropagation();
	    	event.preventDefault();
	    });
	    // 찜 목록 시작
	    function likeOrUnlike(prodNo, userId, action) {
		    $.ajax({
		        url: 'shop',
		        method: 'POST',
		        data: { "prodNo": prodNo, "userId": userId, "action": action },
		        success: function(data) {
		            if (data == 'true') {
		            	$(`a.likeButton[data-productno=\${prodNo}]`).data('like', action == 'add' ? "unlike" : "like");
		            	if (action == 'add') {
		            		$(`a.likeButton[data-productno=\${prodNo}] i`).removeClass('bi-star').addClass('bi-star-fill');		            		
		            	} else {
		            		$(`a.likeButton[data-productno=\${prodNo}] i`).removeClass('bi-star-fill').addClass('bi-star');
		            	}
		            	$(`a.likeButton[data-productno=\${prodNo}] span`).text(action == 'add' ? "찜 해제" : "찜");
		            	
		            } else {
		                alert(`찜 \${ action=='add' ? '추가' : '취소'} 실패: ` + (data.message || '알 수 없는 오류'));
		            }
		        },
		       error: function(xhr, status, err) {
		            alert(`찜 \${ action=='add' ? '추가' : '취소'} 에러`);
		        } 
		    });
	    }
	   // 찜 추가 및 삭제 끝
	   

    </script>
   
    </body>

</html>