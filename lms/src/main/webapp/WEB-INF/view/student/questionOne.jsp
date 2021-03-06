<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath}"/>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- 위의 사이트 아이콘 -->
<link rel="icon" type="image/png" sizes="16x16"
	href="${path}/assets/images/favicon.png">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="${path}/assets/extra-libs/c3/c3.min.css" rel="stylesheet">
<link href="${path}/assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
<link href="${path}/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
<link href="${path}/dist/css/style.min.css" rel="stylesheet">
<link href="${path}/dist/css/lmsStyle.css" rel="stylesheet">
</head>
<body>
	<div class="preloader">
		<div class="lds-ripple">
			<div class="lds-pos"></div>
			<div class="lds-pos"></div>
		</div>
	</div>
	
	<div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">
	
		<jsp:include page="/WEB-INF/view/student/inc/logoMenu.jsp" flush="false"></jsp:include>
		<jsp:include page="/WEB-INF/view/student/inc/navbarMenu.jsp" flush="false"></jsp:include>
		
		<div class="page-wrapper">
			<div class="page-breadcrumb">
				<div class="row">
					<div class="col-7 align-self-center">
						<h2 class="page-title text-truncate text-dark font-weight-medium mb-1">질문 자세히 보기</h2>
						<form action="${path}/student/questionRemove/${studentId}/${question.questionNo}" name="form">
							<span id="delUp"></span>
						</form>
					</div>
				</div>
			</div>	
			<br>
			
			<div class="container-fluid">
				<div id="add"></div> 
				<div id="password"></div>
				<br><div id="list"></div>
				<div id="view"></div>
				<div id="tab">
					<div class="row">
						<div class="col-lg-6 col-md-6">
							<div class="card" id="cardStyle">
								<div class="card-body">
									<div class="table-responsive">
										<table id="questionOneTable" class="table table" style="margin-top: 20px; table-layout:fixed; word-break:break-all;">
											<tr>
												<td style="width:140px" class="border-0 font-14 font-weight-medium text-muted px-2">강의</td>
												<td class="font-weight-medium text-dark border-top-0 px-2">
													<div class="d-flex no-block align-items-center">
														${question.lecture.lectureName}
													</div>
												</td>
											</tr>
											<tr>
												<td class="border-0 font-14 font-weight-medium text-muted px-2">작성자</td>
												<td class="font-weight-medium text-dark border-top-0 px-2">
													<div class="d-flex no-block align-items-center">
														${question.questionWriter}(${question.accountId}) 
													</div>
													<input type="hidden" id="accountId" value="${question.accountId}">
													<input type="hidden" id="studentId" value="${studentId}">
												</td>	
											</tr>
											<tr>
												<td class="border-0 font-14 font-weight-medium text-muted px-2">제목</td>
												<td class="font-weight-medium text-dark border-top-0 px-2">
													<div class="d-flex no-block align-items-center">
														${question.questionTitle }
													</div>
												</td>
											</tr>
											<tr>
												<td class="border-0 font-14 font-weight-medium text-muted px-2">내용</td>
												<td class="font-weight-medium text-dark border-top-0 px-2">
													<div class="d-flex no-block align-items-center">
														${question.questionContent }
													</div>
												</td>
											</tr>
											<tr>
												<td class="border-0 font-14 font-weight-medium text-muted px-2">작성일</td>
												<td class="font-weight-medium text-dark border-top-0 px-2">
													<div class="d-flex no-block align-items-center">
														${question.questionCreatedate }
													</div>
												</td>
											</tr>
											<tr>
												<td class="border-0 font-14 font-weight-medium text-muted px-2">수정일</td>
												<td class="font-weight-medium text-dark border-top-0 px-2">
													<div class="d-flex no-block align-items-center">
														${question.questionUpdatedate }
													</div>	
												</td>
											</tr>
											<tr>
												<td class="border-0 font-14 font-weight-medium text-muted px-2">첨부파일</td>
												
												<c:forEach var="qf" items="${question.questionfile}">
													<c:if test="${!empty qf.questionFileUuid}">	
															
														<tr>
														<td class="border-0 font-14 font-weight-medium text-muted px-2"></td>
															<td class="font-weight-medium text-dark border-top-0 px-2 py-4">
																<div class="d-flex no-block align-items-center">
																	<a href="${path}/student/questionFileCount/${qf.questionFileUuid}">${qf.questionFileOriginal}</a>
																	&emsp;(다운로드 횟수: &nbsp; ${qf.questionFileCount})
																</div>
															</td>
														</tr>
													</c:if>	
												
													<c:if test="${empty qf.questionFileUuid}">
															<td class="font-weight-medium text-dark border-top-0 px-2">
																<div class="d-flex no-block align-items-center">
																	등록된 첨부파일이 없습니다.
																</div>
															</td>
														
													</c:if>
												</c:forEach>
											</tr>
											
											<tr>
												<td class="border-0 font-14 font-weight-medium text-muted px-2">
													<a type="button" class="btn btn-outline-secondary" href="${path}/student/questionList/${studentId}/1">이전 페이지</a>
												</td>
											</tr>
								
										</table>
									</div>
								</div>
							</div>
						</div>
								
							<input type="hidden" id="questionPassword" value="${question.questionPassword}">
					
						<div class="col-lg-6 col-md-6">
	                        <div class="card" id="cardStyle">
	                            <div class="card-body">
	                                <h4 class="card-title">댓글</h4>
									<table id="questionCommentTable" class="table table" style="margin-top: 20px; table-layout:fixed; word-break:break-all;">
											<c:if test="${!empty questionCommet}">
												<thead>
													<tr class="border-0">
														<th style="width:15%;"class="border-0 font-14 font-weight-medium text-muted px-2">작성자</th>
														<th style="width:30%;" class="border-0 font-14 font-weight-medium text-muted px-2">내용</th>
														<th style="width:30%;" class="border-0 font-14 font-weight-medium text-muted px-2">작성일</th>
													</tr>
												</thead>
											</c:if>
											<tbody>
									
											<c:forEach var="qc" items="${questionCommet}">
												
													<tr>
														<td class="font-weight-medium text-dark border-top-0 px-2 py-4 align-self-center">
															<div class="d-flex no-block align-items-center">
																<h5 class="text-dark mb-0 font-14 font-weight-medium">${qc.questionCommentWriter}</h5>
															</div>
														</td>
														<td class="font-weight-medium text-dark border-top-0 px-2 py-4 align-self-center">
															<div class="d-flex no-block align-items-center">
																<h5 class="text-dark mb-0 font-14 font-weight-medium">${qc.questionCommentContent}</h5>
															</div>
														</td>
														<td class="font-weight-medium text-dark border-top-0 px-2 py-4 align-self-center">
															<div class="d-flex no-block align-items-center">
																<h5 class="text-dark mb-0 font-14 font-weight-medium">${qc.questionCommentCreatedate}</h5>
															</div>
														</td>
														<c:if test="${qc.accountId == studentId}">
															<td class="font-weight-medium text-dark border-top-0 px-2 py-4 align-self-center">
																<div class="d-flex no-block align-items-center">
													
																	<a href="${path}/student/questionCommentRemove/${question.questionNo}/${qc.questionCommentNo}/${studentId}" type="button" class="btn btn-outline-danger btn-default btn-sm" onclick="return confirm('댓글을 삭제하시겠습니까?');">삭제</a>
																	&emsp;<a type="button" class="btn btn-outline-success btn-default btn-sm" href="${path}/student/questionCommentModify/${question.questionNo}/${qc.questionCommentNo}/${studentId}">수정</a>
																</div>
															</td>
														</c:if>
													</tr>
												
											</c:forEach>
												<c:if test="${empty questionCommet}">
													<tr>
														<td class="font-weight-medium text-dark border-top-0 px-2 py-4 align-self-center">
															
															<h5>아직 댓글이 작성되지 않았습니다.</h5>
															
														</td>
													</tr>
												</c:if>
											</tbody>
											
											
									</table>
										
										<form method="post" action="${path}/student/questionCommentAdd/${question.questionNo}/${studentId}">
											<table id="questionCommentTable" class="table table" style="margin-top: 20px;">
												<tr>
													<td class="font-weight-medium text-dark border-top-0 px-2 py-4 align-self-center">
														<textarea id="questionComment" class="form-control" style="width:100%;" rows="2" name="questionCommentContent"></textarea>
													</td>
													<td class="font-weight-medium text-dark border-top-0 px-2 py-4 align-self-center">
														<button id="insert" class="btn btn-outline-success" type="submit">댓글 작성</button>
													</td>
												</tr>
											</table>
											<input type="hidden" name="accountId" value="${studentId}">
											<input type="hidden" name="questionNo" value="${question.questionNo}">
											<input type="hidden" name="questionCommentWriter" value="${student.studentName}">
										</form>
										
										
										<div id="paging" style="text-align: center; padding: 7px;">
											<c:if test="${commentCurrentPage>1}">
												<a href="${path}/student/questionOne/${question.questionNo}/${studentId}/${commentCurrentPage-1}">이전</a>
											</c:if>
											<div class="btn-group me-2" role="group" aria-label="First group">
												<c:forEach var="c" begin="${commentUnderFirstPage}" end="${commentUnderLastPage}">
													<c:if test="${c<=lastCommentPage && commentCurrentPage == c}">
														<a id="pagingStyle" class="bg-secondary font-18" href="${path}/student/questionOne/${question.questionNo}/${studentId}/${c}">${c}</a>
													</c:if>
													<c:if test="${c<=lastCommentPage && commentCurrentPage != c}">
														<a class="font-18" href="${path}/student/questionOne/${question.questionNo}/${studentId}/${c}">${c}</a>
													</c:if>
												</c:forEach>
											</div>
											<c:if test="${commentCurrentPage<lastCommentPage}">
												<a href="${path}/student/questionOne/${question.questionNo}/${studentId}/${commentCurrentPage+1}">다음</a>
											</c:if>
									
										
										
									</div>
								</div>
							</div>
						</div>					
					</div>	
				</div>
			</div>
		</div>	
	</div>		
</body>
	<script src="${path}/assets/libs/jquery/dist/jquery.min.js"></script>
	<script src="${path}/assets/libs/popper.js/dist/umd/popper.min.js"></script>
	<script src="${path}/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="${path}/dist/js/app-style-switcher.js"></script>
	<script src="${path}/dist/js/feather.min.js"></script>
	<script src="${path}/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
	<script src="${path}/dist/js/sidebarmenu.js"></script>
	<script src="${path}/dist/js/custom.min.js"></script>
	<script src="${path}/assets/extra-libs/c3/d3.min.js"></script>
	<script src="${path}/assets/extra-libs/c3/c3.min.js"></script>
	<script src="${path}/assets/libs/chartist/dist/chartist.min.js"></script>
	<script src="${path}/assets/libs/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
	<script src="${path}/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.min.js"></script>
	<script src="${path}/assets/extra-libs/jvector/jquery-jvectormap-world-mill-en.js"></script>
	<script src="${path}/dist/js/pages/dashboards/dashboard1.min.js"></script>
<script>
	$('#accountId').each(function(index, item){
		let htmlDelete = '&nbsp&nbsp<input type="button" class="btn btn-outline-danger" value="질문 삭제" onclick="button_event();">'
		let htmlUpdate = '<a type="button" class="btn btn-outline-success" href="${path}/student/questionModify/${studentId}/${question.questionNo}">질문 수정</a>'
		let html = '<span>게시글의 수정과 삭제는 작성자만 할 수 있습니다.</span>'
		if($(item).val()==$('#studentId').val()){
				$('#delUp').append(htmlUpdate);
				$('#delUp').append(htmlDelete);
			}
		if($(item).val()!=$('#studentId').val()){
				$('#add').append(html);
			}
	});
	
	function button_event(){
		if (confirm("정말 삭제하시겠습니까??") == true){ // 확인   
		    document.form.submit();
		}else{   //취소
		    return;
		}
	}

	
</script>
</html>