<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/logo.png">
<title>ADRM</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/normalize.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/join.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font.css">

<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script>
$(document).ready(function () {
	if(location.pathname.indexOf('modify') == -1)
		url = "${pageContext.request.contextPath}/account/register/";
	else {
		url = "${pageContext.request.contextPath}/account/modify";
		$("#id").attr("disabled",true);
		
		if('${user.auth}'.indexOf('USER') != -1)
			$("input:checkbox[id='role1']").prop("checked", true);
		if('${user.auth}'.indexOf('MEM') != -1)
			$("input:checkbox[id='role2']").prop("checked", true);
	}
	$("#submit").on('click', function() {
		submit(url);
	})
});
	
function submit(url) {

    $.ajax({
        url: url,
        type: "POST",
        data: $('#joinFrm').serialize(),
        beforeSend : function(xhr){
        	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
    	},
        success: function(data){
        	if(data.isSuccess)
                location.href="${pageContext.request.contextPath}/login";
        	else alert(data.msg);
        },
        error: function(){
            alert("Error");
        }
  	});
}
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
			<div id="content">
				<h4>회원가입</h4>
				<form id="joinFrm" name="joinFrm" target="_top" method="post">
					<table class="tbl_basic center">
						<tbody>
							<tr>
								<td class="trw1" >ID</td>
								<td class="trw" >
									<div class="join_input_row">
										<span class="input_box">
											<label for="id" id="label_id_area" class="lbl">ID</label>
											<input type="text" id="id" name="id" class="int" maxlength="30" value="${user.id}">
										</span>
									</div>
									<label for="id" class="error"></label>
								</td>
							</tr>
							<tr>
								<td class="trw1" >비밀번호</td>
								<td class="trw" >
									<div class="join_input_row">
										<span class="input_box">
											<label for="pw" id="label_pw_area" class="lbl">Password</label>
											<input type="password" id="pw" name="pw" class="int" maxlength="30" >
										</span>
									</div>
									<label for="pw" class="error"></label>
								</td>
							</tr>
							<tr>
								<td class="trw1" >비밀번호 확인</td>
								<td class="trw" >
									<div class="join_input_row">
										<span class="input_box">
											<label for="pw" id="label_pw_area" class="lbl">Password</label>
											<input type="password" id="confirm_pw" name="confirm_pw" class="int" maxlength="30" >
										</span>
									</div>
									<label for="confirm_pw" class="error"></label>
								</td>
							</tr>
							<tr>
								<td class="trw1" >E-MAIL</td>
								<td class="trw" >
									<div class="join_input_row">
										<span class="input_box">
											<label for="id" id="label_id_area" class="lbl">ID</label>
											<input type="text" id="email" name="email" class="int" maxlength="30" value="${user.email}">
										</span>
									</div>
									<label for="email" class="error"></label>
								</td>
							</tr>
							<tr>
								<td class="trw1" >이름</td>
								<td class="trw" >
									<div class="join_input_row">
										<span class="input_box">
											<label for="id" id="label_id_area" class="lbl">ID</label>
											<input type="text" id="name" name="name" class="int" maxlength="30" value="${user.name}">
										</span>
									</div>
									<label for="name" class="error"></label>
								</td>
							</tr>
							<tr>
								<td class="trw1" >병원선택</td>
								<td class="trw" >
									<select id="hospital" name="hospital" class="select_box">
										<option value="S" 
											<c:if test="${user.hospital == 'S'}">selected='selected'</c:if>>
												서울대학교 병원
										</option>
										<option value="K" 
											<c:if test="${user.hospital == 'K'}">selected='selected'</c:if>>
												고려대학교 병원
										</option>
									</select>
								</td>
							</tr>
							<tr>
								<td class="trw1" >회원형태</td>
								<td class="trw" >
									<div class="none_input_row" id="select_roll">
										<span class="chkbox_area">
											<input id="role1" type="checkbox" name="roles" value="1" tabindex="9" class="chkbox" 
												<c:if test="${fn:contains(user.auth, 'ROLE_PATIENT')}"> 
													checked 
												</c:if>>환자
										</span>
										<span class="chkbox_area">
											<input id="role2" type="checkbox" name="roles" value="2" tabindex="9" class="chkbox" 
												<c:if test="${fn:contains(user.auth, 'ROLE_DOCTOR')}"> 
													checked 
												</c:if>>의사
										</span>
									</div>
									<label for="roles" class="error"></label>
								</td>
							</tr>
						</tbody>
					</table>
					<fieldset class="login_form">
						<input id= "submit" type="button" title="회원가입" alt="회원가입" value="회원가입" class="btn_login">
						<input id="cancelBtn" type="button" title="취소" alt="취소" value="취소" class="btn_cancel">
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