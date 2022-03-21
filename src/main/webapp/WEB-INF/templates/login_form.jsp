<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/logo.png">
<title>Sumin Lecture</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/normalize.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/signIn.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font.css">

<script>
if(window.location.search.search("error") > 0){
	alert("로그인이 실패하였습니다.");
	history.replaceState({}, null, location.pathname);
}
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
				<form action="${pageContext.request.contextPath}/login-processing" method="post">
					<fieldset class="findif_form">
						<legend class="blind">Sign In</legend>

						<label for="id" class="error"></label>
						<div class="input_row" id="id_area">
							<span class="input_box">
								<label for="id" id="label_id_area" class="lbl">ID</label>
								<input type="text" id="id" name="id"  placeholder="ID" class="int" maxlength="30" value="">
							</span>
						</div>
						<label for="pw" class="error"></label>
						<div class="input_row" id="pw_area">
							<span class="input_box">
								<label for="pw" id="label_pw_area" class="lbl">Password</label>
								<input type="password" id="password" name="password"  placeholder="Password" class="int" maxlength="30" >
							</span>
						</div>
						
						<div class="login_check">
							<span class="login_check_box">
								<input type="checkbox" id="login_chk" name="nvlong" class="" tabindex="9" value="off" onchange="savedLong(this);nclks_chk('login_chk', 'log.keepon', 'log.keepoff',this,event)" onclick="msieblur(this);">
								<label for="login_chk" id="label_login_chk" class="sp">아이디 저장</label>
							</span>
						</div>

						<input type="submit" id="btn_login" title="로그인" alt="로그인" value="로그인" class="btn_login" onclick=" ">
						
						<div class="find_info">
							<ul>
								<li><a href="${pageContext.request.contextPath}/account/agree">회원가입</a></li>
							</ul>
						</div>
					</fieldset>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
				</form>
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