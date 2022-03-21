<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="sec"
    uri="http://www.springframework.org/security/tags"%>
		<div id="headerWrap">
			<div id="header">
	
				<h1 id="logo"><a href="#"><img src="${pageContext.request.contextPath}/img/layout/logo.png" alt="병원" /></a></h1>
				
				<!-- gnbWrap :s -->
				<div id="gnbWrap">	
					<div id="gnb">
						<ul class="menu">
							<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_MEMBER')">
								<li><a href="#">사용자 관리</a>
									<ul class="sub">
										<li><a href="${pageContext.request.contextPath}/admin/user_list">계정 관리</a></li>
									</ul>
								</li>
							</sec:authorize>
							<li><a href="#">게시판</a>
								<ul class="sub">
									<li><a href="#">공지사항</a></li>
									<li><a href="${pageContext.request.contextPath}/board/list">자유게시판</a></li>
								</ul>
							</li>
						</ul>
					 </div>	
			 	</div>	
				<!-- gnbWrap :e -->
				
				<div id="globalWrap">
					<ul class="global">
						<sec:authentication property="principal" var="user" />
						<li>안녕하세요. ${user.username }님</li>
						<li><a href="${pageContext.request.contextPath}/account/modify"> 회원정보수정</a></li>
						<li><a href="${pageContext.request.contextPath}/logout"> 로그아웃</a></li>
					</ul>
				</div>
			</div>
		</div>