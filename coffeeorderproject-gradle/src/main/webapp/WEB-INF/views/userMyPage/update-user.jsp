<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원정보 수정</title>	
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
	<link href="/coffeeorderproject/userAssets/css/updateUser.css" rel="stylesheet">
</head>
<body>
	<%-- Header Start --%>
    <jsp:include page="/WEB-INF/userViews/modules/header-nav.jsp" />
	<%-- Header End --%>
	
	<%-- Main Start --%>
	<div class="container-fluid py-5 mb-5 hero-header">
    	<div class="container py-5">
		    <main>
			    <div class="main-container">
			      <div class="main-name">
			        <h5>Update User Infomation</h5>
			      </div>
			
			      <div class="introduction">
			        <span class="hello">Hello,</span><p>We're Hollys Coffee. Thank you visit for us.</p><span class="cursor"></span>
			      </div>
			
			      <form action="/coffeeorderproject/userMyPage/update-user" method="POST">
			        <div class="modify-container">
			          <ul>
			            <li>
			              <label for="id">
			                아이디<br>
			             <input class="id-input" name="userId" type="text" value="${ loginUser.userId }" readonly>
			             </label>
			              <p class="id-msg"></p>
			            </li>
			            <li>
			              <label for="password">
			                비밀번호<br>
			                <input class="pw-input" name="userPw" type="password">
			              </label>
			              <p class="pw-msg"></p>
			            </li>
			            <li>
			              <label for="confirm-password">
			                비밀번호 확인<br>
			                <input class="cfpw-input" name="checkPw" type="password">
			              </label>
			              <p class="pw-msg"></p>
			            </li>
				         <li>
						  <label for="nickname">
						    별명<br>
						    <input class="nickname-input" id="nickname" name="userNickname" type="text" value="${ loginUser.userNickname }" readonly>
						  </label>
						  <p class="nickname-msg"></p>
						  <button class="editButton" value=".nickname-input" >수정</button>
						</li>						
			            <li>
			              <label for="phone">
			                전화번호<br>
			                <input class="phone-input" name="userPhone" type="text" value="${ loginUser.userPhone }" readonly>
			              </label>
			              <p class="phone-msg"></p>
			              <button class="editButton" value=".phone-input" >수정</button>
			            </li>
			            <li>
			              <label for="email">
			                이메일<br>
			                <input class="email-input" name="userEmail" type="text" value="${ loginUser.userEmail }" readonly>
			              </label>
			              <p class="email-msg"></p>
			              <button class="editButton" value=".email-input" >수정</button>
			            </li>
			            <li>
			              <input type="submit" class="update-btn" value="회원정보 변경" />
			            </li>
			            <li>
			            	<input type="button" class="cancel-btn" value="취소" />
			            </li>
			            
			            <c:if test="${loginUser != null}">
						    <li >
						        <a href="#" onclick="deleteUser();" class="btn border border-secondary rounded-pill px-3 text-primary delete-user">
						            <i class="fa fa-times text-danger"><span>회원 탈퇴하기</span></i> 
						        </a>
						    </li>
						</c:if>
						
			          </ul>
			        </div>
			      </form>
			    </div>
			</main>
		</div>
	</div>
	<%-- Main End --%>

	<%-- Footer Start --%>
    <jsp:include page="/WEB-INF/userViews/modules/footer.jsp" />
	<%-- Footer End --%>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/coffeeorderproject/userAssets/lib/easing/easing.min.js"></script>
    <script src="/coffeeorderproject/userAssets/lib/waypoints/waypoints.min.js"></script>
    <script src="/coffeeorderproject/userAssets/lib/lightbox/js/lightbox.min.js"></script>
    <script src="/coffeeorderproject/userAssets/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="/coffeeorderproject/userAssets/js/updateUser.js"></script>  
    <script>
		function deleteUser() {
			var userId = "${loginUser.userId}";
		    const ok = confirm("계정 " + userId + " 를(을) 삭제할까요?");
		    if (ok) {
		        location.href = `/coffeeorderproject/userMyPage/deleteUser?userId=${loginUser.userId}`;
		    }
		}
		
		$('.editButton').on('click', function(e) {
			event.preventDefault();
			
			
			console.log(e.target.value);
		   
			
			$(e.target.value).attr('readonly', false); // or false
		   });
		
	     	
	     	  
		</script>
		
			            
</body>
</html>