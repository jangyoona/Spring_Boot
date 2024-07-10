<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- <%@ taglib prefix="c" uri="jakarta.tags.core"%>  --%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>HOLLYS-Review</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">


<!-- 대댓글 컨펌 -->
<!-- 		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"> -->

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
	href="/coffeeorderproject/resources/userAssets/lib/lightbox/css/lightbox.min.css"
	rel="stylesheet">
<link
	href="/coffeeorderproject/resources/userAssets/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">


<!-- Customized Bootstrap Stylesheet -->
<link href="/coffeeorderproject/resources/userAssets/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Template Stylesheet -->

<link href="/coffeeorderproject/resources/userAssets/css/style.css"
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
	<jsp:include page="/WEB-INF/views/userViews/modules/header-nav.jsp" />
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
		<h1 class="text-center text-white display-6">리뷰</h1>
		<ol class="breadcrumb justify-content-center mb-0">
			<li class="breadcrumb-item"><a href="/coffeeorderproject/home">Home</a></li>
			<li class="breadcrumb-item active text-white">ReviewDetail</li>
		</ol>
	</div>
	<!-- Single Page Header End -->


	<!-- Tastimonial Start -->


		<div class="container py-5">
			<div class="testimonial-header text-center">
				<h3 style="text-align: center;">리뷰: ${board.prodName}</h3>

				<hr style="border: 2px solid;">

				<h4 style="text-align: center;">제목: ${board.boardTitle}</h4>
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
								<a href="download?attachNo=${ attach.fileNo }"> ${ attach.userfilename }
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


			<!-- ////////////////////////////////////////////////////////////////////// -->
			<!-- write comment area -->
			<form id="commentform" action="write-comment" method="post">
				<input type="hidden" name="boardNo" value="${ board.boardNo }" />
				<input type="hidden" name="pageNo" value="${ pageNo }" />
				<input type="hidden" name="userId" value="${ loginUser.userId }" />
				<table style="width: 800px; border: solid 1px; margin: 0 auto">
					<tr>
						<td style="width: 750px"><textarea id="comment_content"
								name="commentContent" style="width: 100%; resize: none;" rows="3"></textarea>
						</td>
						<td style="width: 50px; vertical-align: middle">
							
							<!-- 댓글 버튼 -->
							<c:choose>
								<c:when test="${loginUser != null}">
									<a id="write-comment-lnk" href="javascript:void(0);"
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
			<!-- end of write comment area -->

			<br>
			<hr style="width: 800px; margin: 0 auto">
			<br>

			<!-- comment list area -->
			<table id="comment-list" style="width: 800px; border: solid 1px; margin: 0 auto">
				
			</table>
			<!-- end of comment list area -->
			<br><br><br><br><br>
			
			<!-- Modal -->
			<div class="modal fade" id="recomment-modal" tabindex="-1"
				aria-labelledby="recomment-modal-label" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="recomment-modal-label">댓글
								쓰기</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form id="recommentform" action="write-recomment" method="post">
								<input type="hidden" name="boardNo" value="${ board.boardNo }" />
								<input type="hidden" name="commentNo" value="" />
								<input type="hidden" name="userId" value="${ loginUser.userId }" />

								<textarea id="recomment-content" name="content"
									class="form-control" style="resize: none;" rows="3"></textarea>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary"
								id="write-recomment-btn">댓글 쓰기</button>
						</div>
					</div>
				</div>
			</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script type="text/javascript">
	$(function() {
		$('#delete_button').on('click', function(event) {
			const ok = confirm("${ board.boardNo }번 글을 삭제할까요?");
			if (ok) {
				location.href = 'delete?boardNo=${ board.boardNo }';
			}
		});

		$('#edit_button').on('click', function(event) {
			location.href = 'edit?boardno=${ board.boardNo }';
		});

		$('#tolist_button').on('click', function(event) {
			location.href = 'review?pageNo=${ pageNo }';
		});
		
		
		// 댓글 목록 보여주기 (Get방식)
		$('#comment-list').load('comment-list', "boardNo=${ board.boardNo }");
		
		// 댓글쓰기
		$('#write-comment-lnk').on('click', function(event) {
/* 			if ($('#comment_content').val().length == 0 && ${loginUser != null} ) {
				alert('댓글 내용을 작성하세요');
				$('#comment_content').focus();
				return; 
			}*/
			
			// $('#commentform').submit();
			const commentForm = $('#commentform');
			const data = commentForm.serialize();
			
			$.ajax({
				"url" : commentForm.attr('action'),
				"method" : commentForm.attr('method'),
				"data" : data,
				"dataType" : "text",
				"success" : function(data, status, xhr) {
					$('#comment-list').load('comment-list?boardNo=${ board.boardNo }');
				},
				"error" : function(xhr, status, err) {
					alert(err);
				}							
			});
			if($('#comment_content') != ""){
				$('#comment_content').val("");
			}
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
		$('#comment-list').on('click', '.delete-comment', function(event) {
			const commentNo = $(this).data('comment-no');
			const ok = confirm(commentNo+ "에 작성한 댓글을 삭제할까요?");
			if (ok) {
				// location.href = 'delete-comment?boardNo=${ board.boardNo }&commentno=' + commentNo;
				
				$.ajax({
					'url' : 'delete-comment',
					'data' : 'commentNo=' + commentNo,
					'method' : 'GET',
					'success' : function(result, status, xhr) {
						if(result === 'success') {
							$('#comment-list').load('comment-list', "boardNo=${ board.boardNo }");
						} else {
							alert('댓글 삭제 실패1')
						}
					},
					'error' : function(xhr, status, err) {
						alert("댓글 삭제 실패2");
					}
					
					
				});
				
			}

		});
		
		
		// 댓글 수정 0 - 공통 변수 및 함수 선언
		let currentEditCommentNo = null;
		
		$('#comment-list').on('click', '.edit-comment', function(event) {
			if (currentEditCommentNo != null) {
				changeCommentEditMode(currentEditCommentNo, false);
			}
			const commentNo = $(this).data('comment-no');
			changeCommentEditMode(commentNo, true);
			currentEditCommentNo = commentNo;
		});
		$('#comment-list').on('click', '.cancel-edit-comment', function(event) {
			const commentNo = $(this).data('comment-no');
			changeCommentEditMode(commentNo, false);
			currentEditCommentNo = null;
		});

		$('#comment-list').on('click', '.modify-comment', function(event) {
					const commentNo = $(this).data('comment-no');
					$('#comment-edit-area-' + commentNo + ' form')
							.submit();
				});

		$('.write-recomment').on('click', function(event) {

			$('#recommentform')[0].reset(); // form 초기화

			const commentNo = $(this).data('comment-no');
			$('#recommentform input[name=commentno]').val(
					commentNo);

			$('#recomment-modal').modal('show');
		});

		$('#write-recomment-btn').on('click', function(event) {

			$('#recommentform').submit();

		});
	});

	function changeCommentEditMode(commentNo, isCommentMode) {
		$('#comment-view-area-' + commentNo).css({
			'display' : isCommentMode ? 'none' : ''
		});
		$('#comment-edit-area-' + commentNo).css({
			'display' : isCommentMode ? '' : 'none'
		});
	}
	

	
	
</script>

<!-- Tastimonial End -->


<!-- Footer Start -->
<jsp:include page="/WEB-INF/views/userViews/modules/footer.jsp" />
<!-- Footer End -->


<!-- Back to Top -->
<a href="#"
	class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
	class="fa fa-arrow-up"></i></a>


<!-- JavaScript Libraries -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="/coffeeorderproject/resources/userAssets/lib/easing/easing.min.js"></script>
<script src="/coffeeorderproject/resources/userAssets/lib/waypoints/waypoints.min.js"></script>
<script src="/coffeeorderproject/resources/userAssets/lib/lightbox/js/lightbox.min.js"></script>
<script src="/coffeeorderproject/resources/userAssets/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Template Javascript -->
<script src="/coffeeorderproject/resources/userAssets/js/main.js"></script>
</body>

</html>