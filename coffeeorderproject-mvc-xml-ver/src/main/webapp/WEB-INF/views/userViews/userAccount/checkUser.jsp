<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib prefix="c" uri="jakarta.tags.core" %>
 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>HOLLYS - 사용자 인증</title>	
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
	<link href="/coffeeorderproject/resources/userAssets/css/register.css" rel="stylesheet">
	<style>
		.email-submit-btn {
			font-size: 1.2rem;
			background: green;
			color: white;
			padding: 5px;
			border: 1px solid black;
			border-radius: 5px;
			transition: all 0.4s;
			cursor: pointer;
		}
		
		.email-submit-btn:hover {
			box-shadow: 3px 3px 0px rgba(0, 0, 0, 0.5);
		    background-color: white;
		    color: green;
		}
	</style>
</head>
<body>
	<%-- Header Start --%>
    <jsp:include page="/WEB-INF/views/userViews/modules/header-nav.jsp" />
	<%-- Header End --%>
	
	<%-- Main Start --%>
	<div class="container-fluid py-5 mb-5">
    	<div class="container py-5">
		    <main>
			    <div class="main-container">
			      <div class="main-name">
			        <h5>ID 확인</h5>
			      </div>
			
			      <form action="sendMail" method="POST">
			        <div class="register-container">
			          <ul>
			            <li>
			              <label for="id">
			                아이디<br>
			                <c:choose>
			                	<c:when test="${ not empty param.userId }">
			                		<input class="id-input" name="userId" type="text" value="${param.userId}">
			                	</c:when>
			            		<c:otherwise>
			            			<input class="id-input" name="userId" type="text">
			            		</c:otherwise>
			                </c:choose>
			              </label>
			              <p class="id-msg"></p>
			              <button type="button" class="id-check-btn">아이디 확인</button>
			              <c:choose>
			              	<c:when test="${ empty param.userId }">
		                		<span class="idcheck-content"></span>
		                	</c:when>
			              	<c:when test="${ isHaveId == false }">
			              		<span class="idcheck-content">등록된 아이디가 없습니다</span>
			              	</c:when>
			              	<c:otherwise>
			              		<span class="idcheck-content" value="확인">확인되었습니다</span>
			              	</c:otherwise>
			              </c:choose>
			            </li>
			            <li>
			              <input type="submit" class="email-submit-btn" value="보내기" />
			            </li>
			            <li>
			            	<input type="button" class="cancel-btn" value="취소" />
			            </li>
			          </ul>
			        </div>
			      </form>
			    </div>
			</main>
		</div>
	</div>
	<%-- Main End --%>

	<%-- Footer Start --%>
    <jsp:include page="/WEB-INF/views/userViews/modules/footer.jsp" />
	<%-- Footer End --%>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/coffeeorderproject/resources/userAssets/lib/easing/easing.min.js"></script>
    <script src="/coffeeorderproject/resources/userAssets/lib/waypoints/waypoints.min.js"></script>
    <script src="/coffeeorderproject/resources/userAssets/lib/lightbox/js/lightbox.min.js"></script>
    <script src="/coffeeorderproject/resources/userAssets/lib/owlcarousel/owl.carousel.min.js"></script>
    <script>
    
	 	// 사용자 ID 인증
	    $('.id-check-btn').on('click', (e) => {
	    	const id = $('.id-input').val();
	    	location.href = `checkUser?userId=\${id}`;
	    });
	 	
	 	$('.email-submit-btn').on('click', (e) => {
	 		const idCheck = $('.idcheck-content').attr("value");
	 		
	 		if (!(idCheck == "확인")) {
	 			e.preventDefault();
	 			window.alert("아이디를 다시 확인해주세요");
	 		}
	 		
	 	});
	 	
	    $('.cancel-btn').on('click', () => {
	    	location.href = "/coffeeorderproject/userAccount/login";
	    });
    </script>
</body>
</html>