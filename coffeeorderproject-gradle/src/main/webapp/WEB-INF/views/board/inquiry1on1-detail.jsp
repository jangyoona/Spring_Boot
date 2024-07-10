<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- <%@ taglib prefix="c" uri="jakarta.tags.core"%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 라이브러리 -->
<%-- <%@ taglib prefix="c" uri="jakarta.tags.core"%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!-- 라이브러리 --> 

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>HOLLYS-Contact Seller</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
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
	href="/coffeeorderproject/userAssets/lib/lightbox/css/lightbox.min.css"
	rel="stylesheet">
<link
	href="/coffeeorderproject/userAssets/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">


<!-- Customized Bootstrap Stylesheet -->
<link href="/coffeeorderproject/userAssets/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Template Stylesheet -->

<link href="/coffeeorderproject/userAssets/css/style.css"
	rel="stylesheet">
</head>

<body>

	<!-- Spinner Start -->
	<div id="spinner"
		class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
		<div class="spinner-grow text-primary" role="status"></div>
	</div>
	<!-- Spinner End -->

	<%-- Header Start --%>
	<jsp:include page="/WEB-INF/resources/userViews/modules/header-nav.jsp" />
	<%-- Header End --%>

	<!-- Modal Search Start -->
	<div class="modal fade" id="searchModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-fullscreen">
			<div class="modal-content rounded-0">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Search by
						keyword</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body d-flex align-items-center">
					<div class="input-group w-75 mx-auto d-flex">
						<input type="search" class="form-control p-3"
							placeholder="keywords" aria-describedby="search-icon-1">
						<span id="search-icon-1" class="input-group-text p-3"><i
							class="fa fa-search"></i></span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal Search End -->


	<!-- Single Page Header start -->
	<div class="container-fluid page-header py-5">
		<h1 class="text-center text-white display-6">1:1 문의</h1>
		<ol class="breadcrumb justify-content-center mb-0">
			<li class="breadcrumb-item"><a href="/coffeeorderproject/home">Home</a></li>
			<li class="breadcrumb-item active text-white">Contact Seller</li>
		</ol>
	</div>
	<!-- Single Page Header End -->


	<!-- Tastimonial Start -->


		<div class="container py-5">
			<div class="testimonial-header text-center">
				<h4 style="text-align: center;">제목: ${board.boardTitle}</h4>
				<hr style="border: 2px solid;">
				<h6 style="text-align: center;">작성자: ${board.userId}</h6>
			</div>
			<div class="testimonial-item img-border-radius bg-light rounded p-4">
				<div class="position-relative">
					<i class="fa fa-quote-right fa-2x text-secondary position-absolute"
						style="bottom: 0px; right: 0;"></i>

					<div class="d-flex align-items-center flex-nowrap">
						<div>
							<h6>첨부 파일</h6>
							<c:forEach var="attach" items="${ board.attachments }">
								<a href="download?attachno=${ attach.fileNo }"> ${ attach.userfilename }
								</a>
								
							</c:forEach>
							</div>
						</div>
						
					</div>
					<div class="mb-4 pb-4 border-bottom border-secondary">
					<br>
							<hr>
							
					<h6>-작성 내용-</h6>
						<p class="mb-0">${ board.boardContent }</p>
					</div>


					
					<c:if
						test="${loginUser != null && (loginUser.userId == board.userId || loginUser.userAdmin)}">


						<c:if
							test="${loginUser != null && loginUser.userId  == board.userId }">
							<input type="button" id="edit_button" value="편집"
								style="height: 25px"
								class="btn border-secondary rounded-pill px-4 py-1 text-primary" />
						</c:if>
						<c:if
							test="${loginUser != null && (loginUser.userId == board.userId || loginUser.userAdmin)}">
							<input type="button" id="delete_button" value="삭제"
								style="height: 25px"
								class="btn border-secondary rounded-pill px-4 py-1 text-primary" />
						</c:if>



					</c:if>


			
					<input type="button" id="tolist_button" value="돌아가기"
						style="height: 25px"
						class="btn border-secondary rounded-pill px-4 py-1 text-primary" />
				</div>

			</div>

		<!-- ///////////////////////////////////////////////////////////////////////////// -->
			
			
					<!-- write comment area -->
					<c:if test="${loginUser.userAdmin}">
			<form id="commentform" action="1on1-write-comment" method="post">
				<input type="hidden" name="boardno" value="${ board.boardNo }" /> <input
					type="hidden" name="pageNo" value="${ pageNo }" /> <input
					type="hidden" name="userId" value="${ loginUser.userId }" />
				<table style="width: 800px; border: solid 1px; margin: 0 auto">
					<tr>
						<td style="width: 750px"><textarea id="comment_content"
								name="content" style="width: 100%; resize: none;" rows="3"></textarea>
						</td>
						<td style="width: 50px; vertical-align: middle">
						<c:choose>
								<c:when test="${loginUser != null}">
									<a id="1on1-write-comment-lnk" href="javascript:void(0);"
										style="text-decoration: none">댓글<br />등록
									</a>
								</c:when>
								<c:otherwise>
									<a id="offuser-write-comment-lnk" href="javascript:void(0);"
										style="text-decoration: none">댓글<br />등록
									</a>
								</c:otherwise>
							</c:choose>
						</td>
						
					</tr>
				</table>
			</form>
			</c:if>
			<!-- end of write comment area -->

			<br>
			<hr style="width: 800px; margin: 0 auto">
			<br>

			<!-- comment list area -->
			<table id="comment-list"
				style="width: 800px; border: solid 1px; margin: 0 auto">
				<c:forEach var="comment" items="${ board.comments }">
					<tr>
						<td
							style="text-align: left; margin: 5px; border-bottom: solid 1px;">
							<table>
								<tr>
									<td><c:forEach begin="0" end="${ comment.replylocation }">
									&nbsp;&nbsp;
								</c:forEach> <c:if test="${ comment.replylocation > 0 }">
											<img src="/coffeeorderproject/image/re.gif">
										</c:if></td>
									<td>
										<div id="comment-view-area-${ comment.commentNo }">
											<c:choose>
												<c:when test="${ comment.commentActive }">
													<br>
													<br>
													<span style='color: gray'>삭제된 글입니다.</span>
													<br>
													<br>
												</c:when>
												<c:otherwise>
									<span style="color: rgb(0, 138, 0);">관리자</span>: ${ comment.userId } &nbsp;&nbsp; [<fmt:formatDate
														value="${ comment.commentDate }"
														pattern="yyyy-MM-dd hh:mm:ss" />]
								    <br />
													<br />
													<span>${ fn:replace(comment.commentContent, enter, "<br>") }</span>
													<br />
													<br />
													<br />
													<span style="color: rgb(0, 138, 0);">전화 문의 : <span style="color: green; font-weight: bold; font-size: 15px;">02-3481-1006</span></span>
													<br />
													<div
														style='float:left; display:${ (not empty loginUser and loginUser.userId == comment.userId) ? "block" : "none" }'>
														<a class="1on1-edit-comment"
															data-comment-no="${ comment.commentNo }"
															href="javascript:">편집</a> &nbsp; <a
															class="1on1-delete-comment"
															data-comment-no="${ comment.commentNo }"
															href="javascript:">삭제</a> &nbsp;&nbsp;
													</div>
													<div 
														style='float:left; display:${ (not empty loginUser and loginUser.userId == comment.userId) ? "block" : "none" }'>
														<a class="1on1-write-recomment"
															data-comment-no="${ comment.commentNo }"
															href="javascript:">댓글쓰기</a>
													</div>
													<span style="clear: both"></span>
												</c:otherwise>
											</c:choose>
										</div>
										<div id="comment-edit-area-${ comment.commentNo }"
											style="display: none">
											${ comment.userId } &nbsp;&nbsp; [${ comment.commentDate }] <br />
											<br />
											<form action="1on1-edit-comment" method="post">
												<input type="hidden" name="boardno"value="${ board.boardNo }" /> 
												<input type="hidden" name="commentno"value="${ comment.commentNo }" /> 		
												<textarea name="content" style="width: 99%; resize: none" rows="3" cols="120">${ comment.commentContent }</textarea>
											</form>
											<br />
											<div>
												<a class="modify-comment"
													data-comment-no="${ comment.commentNo }" href="javascript:">수정</a>
												&nbsp; <a class="cancel-1on1-edit-comment"
													data-comment-no="${ comment.commentNo }" href="javascript:">취소</a>
											</div>
										</div>

									</td>

								</tr>
							</table>
						</td>
					</tr>
				</c:forEach>
			</table>
			<!-- end of comment list area -->
			<!-- Modal -->
	<div class="modal fade" id="recomment-modal" tabindex="-1" aria-labelledby="recomment-modal-label" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="recomment-modal-label">댓글 쓰기</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <form id="recommentform" action="1on1-write-recomment" method="post">
	        	<input type="hidden" name="boardno" value="${ board.boardNo }" />
				<input type="hidden" name="commentno" value="" />
				<input type="hidden" name="userId" value="${ loginUser.userId }" />
				
				<textarea id="recomment-content" name="content" class="form-control" style="resize: none;" rows="3"></textarea>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-primary" id="1on1-write-recomment-btn">댓글 쓰기</button>
	      </div>
	    </div>
	  </div>
	</div>
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
			<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
			<script type="text/javascript">
			$(function() {
				
				$('#delete_button').on('click', function(event) {
					const ok = confirm( "글을 삭제하시겠습니까?");
					if (ok) {
						location.href = 'inquiry1on1delete?boardno=${ board.boardNo }';
					}
				});
				
				$('#edit_button').on('click', function(event) {
					location.href = 'inquiry1on1edit?boardno=${ board.boardNo }';
				});
				
				
				// 댓글쓰기
				$('#1on1-write-comment-lnk').on('click', function(event) {
					event.preventDefault();
					if ($('#comment_content').val().length == 0) {
						alert('댓글 내용을 작성하세요');
						$('#comment_content').focus();
						return;
					}
					
					$('#commentform').submit(); 
				});
				
				
				$('#offuser-write-comment-lnk').on('click', function(event) {
					event.preventDefault();
					
					if(${ loginUser == null } ){
						alert('로그인이 필요합니다.');
						$('#comment_content').focus();
						return;
					}
				
				});
				
				
				
				// 댓  삭제
				$('.1on1-delete-comment').on('click', function(event) {
					const commentNo = $(this).data('comment-no'); 
					const ok = confirm(commentNo + "에 작성한 댓글을 삭제할까요?");
					if (ok) {
						location.href = '1on1-delete-comment?boardno=${ board.boardNo }&commentno=' + commentNo;
					}
					
				});
				
				
				let currentEditCommentNo = null;
				
				$('.1on1-edit-comment').on('click', function(event) { 
					if (currentEditCommentNo != null) {
						changeCommentEditMode(currentEditCommentNo, false);		
					}
					const commentNo = $(this).data('comment-no'); 
					changeCommentEditMode(commentNo, true);
					currentEditCommentNo = commentNo;
				});
				$('.cancel-1on1-edit-comment').on('click', function(event) {
					const commentNo = $(this).data('comment-no'); 
					changeCommentEditMode(commentNo, false);
					currentEditCommentNo = null;
				});
				
				$('.modify-comment').on('click', function(event) {
					const commentNo = $(this).data('comment-no');
					$('#comment-edit-area-' + commentNo + ' form').submit();
				});
				
				
				$('.1on1-write-recomment').on('click', function(event) {
					
					$('#recommentform')[0].reset(); // form 초기화
					
					const commentNo = $(this).data('comment-no'); 
					$('#recommentform input[name=commentno]').val(commentNo);
					
					$('#recomment-modal').modal('show'); 
				});
				
			
				$('#1on1-write-recomment-btn').on('click', function(event) {
					
					$('#recommentform').submit();
				});
				
				
				$('#tolist_button').on('click', function(event) {
					location.href = 'inquiry1on1?pageNo=${ pageNo }';
				});

			});
			
			function changeCommentEditMode(commentNo, isCommentMode) {
				$('#comment-view-area-' + commentNo).css({'display': isCommentMode ? 'none' : '' });
				$('#comment-edit-area-' + commentNo).css({'display': isCommentMode ? '' : 'none' });
			}
	</script>

	<!-- Tastimonial End -->


	<%-- Footer Start --%>
	<jsp:include page="/WEB-INF/resources/userViews/modules/footer.jsp" />
	<%-- Footer End --%>


	<!-- Back to Top -->
	<a href="#"
		class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
		class="fa fa-arrow-up"></i></a>


	<!-- JavaScript Libraries -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/coffeeorderproject/userAssets/lib/easing/easing.min.js"></script>
	<script
		src="/coffeeorderproject/userAssets/lib/waypoints/waypoints.min.js"></script>
	<script
		src="/coffeeorderproject/userAssets/lib/lightbox/js/lightbox.min.js"></script>
	<script
		src="/coffeeorderproject/userAssets/lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Template Javascript -->
	<script src="/coffeeorderproject/userAssets/js/main.js"></script>
</body>

</html>