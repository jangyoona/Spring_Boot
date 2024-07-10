<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>HOLLYS - 회원가입</title>	
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
		.register-cancel-btn {
		  font-size: 1.2rem;
		  background: green;
		  color: white;
		  padding: 5px;
		  border: 1px solid black;
		  border-radius: 5px;
		  transition: all 0.4s;
		  cursor: pointer;
		}
		
		.register-cancel-btn:hover {
		  box-shadow: 3px 3px 0px rgba(0, 0, 0, 0.5);
		  background-color: white;
		  color:green;
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
			        <h5>Sign Up</h5>
			      </div>
			
			      <div class="introduction">
			        <span class="hello">Hello,</span><p>We're Hollys Coffee. Thank you for signing up.</p><span class="cursor"></span>
			      </div>
			
			      <form:form action="/coffeeorderproject/userAccount/register" method="POST" modelAttribute="user">
			        <div class="register-container">
			          <ul>
			            <li>
			              <form:label path="userId">
			                아이디<br>
			                <c:choose>
			                	<c:when test="${ isHaveId == true }">
			                		<form:input class="id-input" path="userId" type="text" />
			                	</c:when>
			            		<c:otherwise>
			            			<form:input class="id-input" path="userId" type="text" />
			            			<form:errors path="userId" cssClass="error"/>
			            		</c:otherwise>
			                </c:choose>
			              </form:label>
			              <p class="id-msg"></p>
			              <button type="button" class="id-check-btn">아이디 중복 검사</button>
			              <c:choose>
			              	<c:when test="${ empty user.userId }">
		                		<span class="idcheck-content"></span>
		                	</c:when>
			              	<c:when test="${ isHaveId == false }">
			              		<span class="idcheck-content">사용 가능한 아이디입니다</span>
			              	</c:when>
			              	<c:otherwise>
			              		<span class="idcheck-content">중복된 아이디입니다</span>
			              	</c:otherwise>
			              </c:choose>
			            </li>
			            <li>
			              <form:label path="userPw">
			                비밀번호<br>
			                <form:input class="pw-input" path="userPw" type="password" />
			                <br>
			                <form:errors path="userPw" cssClass="error"/>
			              </form:label>
			              <p class="pw-msg"></p>
			            </li>
			            <li>
			              <form:label path="userName">
			                이름<br>
			                <form:input class="name-input" path="userName" type="text" />
			                <form:errors path="userName" cssClass="error"/>
			              </form:label>
			              <p class="name-msg"></p>
			            </li>
			            <li>
			              <form:label path="userNickname">
			                별명<br>
			                <form:input class="nickname-input" path="userNickname" type="text" />
			                <form:errors path="userNickname" cssClass="error"/>
			              </form:label>
			              <p class="nickname-msg"></p>
			            </li>
			            <li>
			              <form:label path="userPhone">
			                휴대폰 번호<br>
			                <form:input class="phone-input" path="userPhone" type="text" />
			                <form:errors path="userPhone" cssClass="error"/>
			              </form:label>
			              <p class="phone-msg"></p>
			            </li>
			            <li>
			              <form:label path="userEmail">
			                이메일<br>
			                <form:input class="email-input" path="userEmail" type="text" />
			                <form:errors path="userEmail" cssClass="error"/>
			              </form:label>
			              <p class="email-msg"></p>
			            </li>
			            <li>
			              <input type="submit" class="register-btn" value="가입하기" />
			            </li>
			            <li>
			            	<input type="button" class="register-cancel-btn" value="취소" />
			            </li>
			          </ul>
			        </div>
			      </form:form>
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
    <script src="/coffeeorderproject/resources/userAssets/js/register.js"></script>
    <script>
	 	// Cancel Btn 기능 (home 화면으로 이동)
	    $('.register-cancel-btn').on('click', () => {
	    	location.href = "/coffeeorderproject/userAccount/login";
	    });
	 	
	 	/* $('.id-check-btn').on('click', function() {
	 		event.stopPropagation();
			event.preventDefault();
			
	 		let userId = $('.id-input').val();
			
			if (userId.length == 0) {
				alert("아이디를 입력하세요");
				return;
			}
	 		
	 		$('.id-input').val(userId);
	 	}); */
	 	
    </script>
    
</body>
</html>