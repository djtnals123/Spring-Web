<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
    uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/logo.png">
<title>Sumin Lecture</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/normalize.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/choose_func.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font.css">
<script type="text/javascript">	
</script>
</head>
<body>          
<!-- wrap :s -->
	<div id="wrap">
		<!-- header :s -->
		<jsp:include page="./include/header/header_main.jsp" flush="false"/>
		<!-- header :e -->

		<!-- container :s -->
		<div id="container">
			<div id="content">
				<h4 class="hide">기능 선택</h4>
				<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_DOCTOR')">
					<a class="btn_wrap2" href="${pageContext.request.contextPath}/board/list">
						<span class="horizontal_align">
							<p><img src="${pageContext.request.contextPath}/img/doctor.png"></p>의사<b>Doctor</b>
						</span>
					</a>
				</sec:authorize>
				<sec:authorize access="hasAnyRole('ROLE_USER','ROLE_PATIENT')">
					<a class="btn_wrap" onclick="alert('준비중입니다.')">
						<span class="horizontal_align">
							<p><img src="${pageContext.request.contextPath}/img/medicine.png"></p>환자<b>Patient</b>
						</span>
					</a>
				</sec:authorize>
			</div>
			
		</div>
		<!-- container :e -->

		<!-- footer :s -->
		<jsp:include page="./include/footer/footer_main.jsp" flush="false"/>
		<!-- footer :e	 -->

	

	</div>
<!-- wrap :e -->

</body>
</html>