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
		<jsp:include page="../include/header/header.jsp" flush="false"/>
		<!-- header :e -->


		<!-- contentsWrap :s -->
		<div id="contentsWrap">

			<!-- lnbWrap :s -->
			<div id="lnbWrap">
				<div id="lnb_title">
					<h2>사용자 관리</h2>
				</div>			
				<ul id="lnb">
					<li class="on"><a href="#">계정 관리</a></li>
				</ul>
			</div>
			<!-- lnbWrap :e -->

			<!-- container :s -->
			<div id="container">

				<div class="location">
					<span class="home"><a href="#"><img src="${pageContext.request.contextPath}/img/layout/ico_home.png" alt="홈"></a></span>
					<span class="arrow">&gt;</span>
					<a href="#"> <span class="first">사용자 관리</span></a>
					<span class="arrow">&gt;</span>
					<a href="#"> <span>계정 관리</span></a>
				</div>

				<h3 id="contTi">계정 관리</h3>

				<!-- 컨텐츠영역 txt :s -->
				<div id="txt">
					
					<h4>계정 목록</h4>
					<!-- table :s -->
					<table class="tbl_basic" style="table-layout:fixed;">
			            <caption>
			                <strong>계정목록</strong>
			                <details>
			                    <summary>계정 목록</summary>
			                </details>
			            </caption>
		                <thead>
		                    <tr>
		                        <th class="trw" width=30>No</th>
		                        <th class="trw" width=120>아이디</th>
		                        <th class="trw" width=100>이름</th>
		                        <th class="trw" width=100>계정<br>유형</th>
		                        <th class="trw" width=120>병원</th>
		                        <th class="trw" width="120">E-Mail</th>
		                        <th class="trw" >가입 날짜</th>
		                    </tr>
		                </thead>
		                <tbody>
		                	<c:forEach var="user" items="${list}">
								<tr>
									<td>1</td>
									<td>${user.id}</td>
									<td>${user.name}</td>
									<td>${user.auth}</td>
									<td>${user.hospital}</td>
									<td>${user.email}</td>
									<td>${user.createdDate}</td>
								</tr>
							</c:forEach>
		                </tbody>
		            </table>
		            <!-- table :e -->
					
		            <!-- paging :s -->
		            <ul class="paginate">
						<c:if test="${pageMaker.prev}">
							<li class="dir prev">
								<a href="${pageContext.request.contextPath}/admin/user_list${pageMaker.cri.makeQueryString(pageMaker.startPage-1)}" 
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
									<li><a href="${pageContext.request.contextPath}/admin/user_list${pageMaker.cri.makeQueryString(index)}"
										 title="${index}페이지">${index}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${pageMaker.next}">
	            			<li class="dir next">
	            				<a href="${pageContext.request.contextPath}/admin/user_list${pageMaker.cri.makeQueryString(pageMaker.endPage+1)}" 
	            					title="다음페이지로 이동">»</a>
	            			</li>
						</c:if>

					</ul>
		            <!-- paging :e -->
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