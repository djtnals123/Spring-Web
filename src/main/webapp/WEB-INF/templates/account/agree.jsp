<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/logo.png">
<title>Sumin Lecture</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/normalize.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/join.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font.css">

<script type="text/javascript">
</script>
<style type="text/css">
	#joinFrm label.error {
		color: #ff0000;
		display: none;
	}
</style>
<title>Sumin Lecture</title>
</head>
<body>
	<!-- wrap :s -->
	<div id="wrap">
		<!-- header :s -->
		<jsp:include page="../include/header/header_main.jsp" flush="false"/>
		<!-- header :e -->

		<!-- container :s -->
		<div id="container">
			<div id="content1">
				<h4>개인정보처리취급방침</h4>
				<fieldset class="text_area" style="letter-spacing:0.1em;word-spacing: 0.2em;line-height: 1.5">
				가나다라마바사아자차카타파하
				
				</fieldset>
				<form action="${pageContext.request.contextPath}/account/agree" id="agreeFrm" name="agreeFrm" method="post">
					<label for="agree">동의합니다.</label>
					<input id="agree" name="agree" type="checkbox">
					<fieldset class="login_form">
						<input id="cancelBtn" type="button" title="취소" alt="취소" value="취소" class="btn_cancel" 
							onclick="location.href='${pageContext.request.contextPath}/login'">
						<input id="agreeBtn" type="submit" title="전송" alt="전송" value="전송" class="btn_login">
					</fieldset>
					<s:csrfInput /> 
				</form>
			</div>
		</div>
		<!-- container :e -->

		<!-- footer :s -->
		<jsp:include page="../include/footer/footer_main.jsp" flush="false"/>
		<!-- footer :e	 -->

	

	</div>
<!-- wrap :e -->
</body>
</html>