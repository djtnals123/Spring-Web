<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="sec"
    uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/logo.png">
<title>Sumin</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/normalize.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/layout.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font.css">
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="${pageContext.request.contextPath}/js/submenu.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var encodedURI = encodeURI($('#download').attr('href'));
	$('#download').attr('href', encodedURI);
});
</script>
</head>

<body>
<!-- wrap :s -->
	<div id="wrapper">

		<!-- header :s -->
		<jsp:include page="../include/header/header.jsp" flush="false"/>
		<!-- header :e -->


		<!-- contentsWrap :s -->
		<div id="contentsWrap">

			<!-- lnbWrap :s -->
			<div id="lnbWrap">
				<div id="lnb_title">
					<h2>게시판</h2>
				</div>			
				<ul id="lnb">
					<li class="on"><a href="#">공지사항</a></li>
					<li ><a href="#">자유게시판</a></li>
				</ul>
			</div>
			<!-- lnbWrap :e -->

			<!-- container :s -->
			<div id="container">

				<div class="location">
					<span class="home"><a href="#"><img src="${pageContext.request.contextPath}/img/layout/ico_home.png" alt="홈"></a></span>
					<span class="arrow">&gt;</span>
					<a href="#"> <span class="first">게시판</span></a>
					<span class="arrow">&gt;</span>
					<a href="#"> <span>게시판 작성</span></a>
				</div>

				<h3 id="contTi">게시판 작성</h3>

				<!-- 컨텐츠영역 txt :s -->
				<div id="txt">
					
					<h4>게시판 작성</h4>
					<!-- table :s -->
					<table class="tbl_basic" style="table-layout:fixed;">
			            <caption>
			                <strong>게시판 작성</strong>
			                <details>
			                    <summary>게시판 내용</summary>
			                </details>
			            </caption>
		                <tbody>
							<tr>
								<td class="trw" width="200">제목</td>
								<td>${board.title}</td>
							</tr>
							<tr>
								<td class="trw" width="200">작성자</td>
								<td>${board.writer}</td>
							</tr>
							
							<tr>
								<c:if test="${board.originalFileName != null}">
									<td class="trw" width="200">첨부파일</td>
									<td>
										<a href="${pageContext.request.contextPath}/board/download?filename=${board.attachment}",
											id="download">${board.originalFileName}</a>
									</td>
								</c:if>
							</tr>
							
							<tr>
								<td class="trw" width="200" height="400">내용</td>
								<td style="text-align: left; vertical-align: top;">${board.content}</td>
							</tr>
		                </tbody>
		            </table>
		            <!-- table :e -->
					
		            <!-- paging & search :s -->
					<sec:authentication property="principal" var="user" />
		            <c:if test="${board.writer eq user.username}">
						<input type="button" value="수정"  class="subbtn3"
							onclick="location.href='${pageContext.request.contextPath}/board/modify?bid=${board.boardID}'">
						<input type="button" value="삭제" class="subbtn3"
							onclick="location.href='${pageContext.request.contextPath}/board/delete?bid=${board.boardID}'">
		            </c:if>
					<span class="rightButton" >
						<button type="button" id="prescriptionFinish" class="mainbtn" 
							onclick="location.href='${pageContext.request.contextPath}/board/list'">목록</button>
					</span>
		            <!-- paging & search :e -->
				</div>
				<!-- 컨텐츠영역 txt :e -->

			</div>
			<!-- container :e -->

		</div>
		<!-- contentsWrap :e -->

		
		<!-- footerWrap :s -->
		<jsp:include page="../include/footer/footer.jsp" flush="false"/>
		<!-- footerWrap :e -->
	</div>
</body>
</html>