<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</script>
</head>

<body>
<!-- wrap :s -->
	<div id="wrapper">

		<!-- header :s -->
<%@ include file="../include/header/header.jsp" %>
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
					<a href="#"> <span>공지사항</span></a>
				</div>

				<h3 id="contTi">공지 사항</h3>

				<!-- 컨텐츠영역 txt :s -->
				<div id="txt">
					
					<h4>공지사항</h4>
					<!-- table :s -->
					<table class="tbl_basic" style="table-layout:fixed;">
			            <caption>
			                <strong>공지사항</strong>
			                <details>
			                    <summary>공지사항</summary>
			                </details>
			            </caption>
		                <thead>
		                    <tr>
		                        <th class="trw" width=30>No</th>
		                        <th class="trw">제목</th>
		                        <th class="trw" width=100>작성자</th>
		                        <th class="trw" width=120>작성일</th>
		                    </tr>
		                </thead>
		                <tbody>
		                	<c:forEach var="board" items="${list}">
								<tr>
									<td>${board.boardID}</td>
									<td><a href="${pageContext.request.contextPath}/board/read?bid=${board.boardID}">${board.title}</a></td>
									<td>${board.writer}</td>
									<td>${board.createdDate}</td>
								</tr>
		                	</c:forEach>
		                </tbody>
		            </table>
		            <!-- table :e -->
					
		            <!-- paging & search :s -->
		            <ul class="paginate">
						<c:if test="${pageMaker.prev}">
							<li class="dir prev">
								<a href="${pageContext.request.contextPath}/board/list${pageMaker.cri.makeQueryString(pageMaker.startPage-1)}" 
									title="이전페이지로 이동">«</a>
							</li>
						</c:if>
						<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="index">
							<c:choose>
								<c:when test="${index eq pageMaker.cri.page}">
			            			<li class="active">
		            					<a href="#" title="${index}페이지">${index}</a>
		     						</li>
								</c:when>
								<c:otherwise>
									<li><a href="${pageContext.request.contextPath}/board/list${pageMaker.cri.makeQueryString(index)}"
										 title="${index}페이지">${index}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${pageMaker.next}">
	            			<li class="dir next">
	            				<a href="${pageContext.request.contextPath}/board/list${pageMaker.cri.makeQueryString(pageMaker.endPage+1)}" 
	            					title="다음페이지로 이동">»</a>
	            			</li>
						</c:if>
					</ul>
					<div id="searchtab">
					<form class="search_info" style="background: #ffffff">
					<li>
						<select name="option" class="searchOption">
							<option value="title" 
								<c:if test="${pageMaker.cri.option=='title'}">selected='selected'</c:if>>
									제목
							</option>
							<option value="content" 
								<c:if test="${pageMaker.cri.option=='content'}">selected='selected'</c:if>>
									내용
							</option>
							<option value="title+content" 
								<c:if test="${pageMaker.cri.option=='title+content'}">selected='selected'</c:if>>
									제목+내용
							</option>
							<option value="writer" 
								<c:if test="${pageMaker.cri.option=='writer'}">selected='selected'</c:if>>
									작성자
							</option>
						</select>
						<input type="text" name="keyword" class="inputText" value="${pageMaker.cri.keyword}" class="inputText" placeholder="조건 입력"/>
						<input type="submit" id="searchButton" class="submitbtn" value="검색" class="searchBtn"/>
						<input type="hidden" name="perPage" value="${pageMaker.cri.perPage}"/>
					</li>
					</form>
					</div>
		            <!-- paging & search :e -->
					<span class="rightButton" >
						<button type="button" class="mainbtn" 
							onclick="location.href='${pageContext.request.contextPath}/board/write'">게시판 작성</button>
					</span>
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