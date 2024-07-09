<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
  
<!-- Navbar start -->
<div class="container-fluid fixed-top">
    <div class="container topbar bg-primary d-none d-lg-block">
        <div class="d-flex justify-content-between">
            <div class="top-info ps-2">
                <small class="me-3"><i class="fas fa-map-marker-alt me-2 text-secondary"></i> <a href="https://yeoksam.greenart.co.kr/" class="text-white">서울 강남구 강남대로 428 만이빌딩 5층, 10층</a></small>
                <small class="me-3"><i class="fas fa-envelope me-2 text-secondary"></i><a href="https://yeoksam.greenart.co.kr/" class="text-white">02-3481-1006</a></small>
                
	
            	</div>
            <div class="top-link pe-2">
            	<small class="me-3"><i class="fas fa-map-marker-alt me-2 text-secondary"></i><a href="" class="text-white">TOTAL VISIT : ${ total == null ? "0" : total }</a></small>
                
                
              
               <%-- session으로 로그인 확인 후 조건문으로 jsp 적기 --%> 
               <c:choose>
                <c:when test="${ not empty loginUser }">
                 <a href="#" class="text-white"><small class="text-white ms-2">${ loginUser.userNickname } 님 반갑습니다 /</small></a>
                 <a href="/coffeeorderproject/userMyPage/logout" class="text-white"><small class="text-white ms-2">Log out</small></a>
                </c:when>
                </c:choose>

            </div>
        </div>
    </div>
    <div class="container px-0">
        <nav class="navbar navbar-light bg-white navbar-expand-xl">
            <a href="/coffeeorderproject/home" class="navbar-brand"><h1 class="text-primary display-6">HollysCoffee</h1></a>
            <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="fa fa-bars text-primary"></span>
            </button>
            <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                 <div class="navbar-nav mx-auto">
                    <a href="/coffeeorderproject/home" class="nav-item nav-link active">Home</a>
                    <%-- Product Zone --%>
                    <a href="/coffeeorderproject/hollysProduct/shop?page=1&select=0" class="nav-item nav-link">Menu</a>
                    <%-- ------------ --%>
                    <div class="nav-item dropdown">
                    </div>
                    <a href="/coffeeorderproject/board/review" class="nav-item nav-link">Review</a>
                    <a class="nav-item nav-link contact-seller">Contact Seller</a>                    
                    <a href="/coffeeorderproject/announcement" class="nav-item nav-link">Notice</a>
                    
                     <%-- session으로 로그인 확인 후 Admin 계정이라면 판매자모드 사용 가능 조건문으로 jsp 적기 --%>
                     <%-- admin로그인 된 상태 : admin-home 로 이동 --%>
                     <%-- ==================수정================== --%>
                     <%-- loginUser session에서 userAdmin(boolean) 값으로 확인 --%>
                    
                </div>
                <div class="d-flex m-3 me-0">
                	<c:if test="${ loginUser.userAdmin == true }">
                    <a href="/coffeeorderproject/admin-home" class="nav-item nav-link">AdminPage</a> <!-- yoona -->
                    </c:if>
                	<c:choose>
                    <c:when test="${ not empty loginUser }">
                    <a href="/coffeeorderproject/hollysProduct/cart-product" class="position-relative me-4 my-auto">
                        <i class="fa fa-shopping-bag fa-2x"></i>
                        <span class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1" style="top: -5px; left: 15px; height: 20px; min-width: 20px;">
                        ${ appUserCart.size() }
                        </span>
                    </a>
                    </c:when>
                    </c:choose>
                    <%-- session으로 로그인 확인 후 조건문으로 jsp 적기 --%>
                    <%-- 로그인 안된 상태 : login page로 이동 --%>
                    <c:choose>
                     <c:when test="${ not empty loginUser }">
                     <a href="/coffeeorderproject/userMyPage/mypage" class="my-auto">
                     <i class="fas fa-user fa-2x"></i> 
                     </a>
                     </c:when>
                      <%-- 로그인 된 상태 : my page로 이동 --%>
                     <c:otherwise>
            		 <a href="/coffeeorderproject/userAccount/login" class="my-auto">
            		 <i class="fas fa-user fa-2x"></i> 
            		 </a>
            		 </c:otherwise>
                     </c:choose>
                      
                </div>
            </div>
        </nav>
    </div>
</div>
<script src="http://code.jquery.com/jquery-3.7.1.js"></script>
	<script type="text/javascript">
		
	$(function() {
	
		// contact seller
    	$('.contact-seller').on('click', function(event) {
    		event.preventDefault();
    		if (${loginUser == null}) {
 		        alert('로그인이 필요한 서비스 입니다.');
 		        return;
			}else {
				location.href="/coffeeorderproject/inquiry1on1"; 
				
			}
		});
	});
	</script>
<!-- Navbar End -->