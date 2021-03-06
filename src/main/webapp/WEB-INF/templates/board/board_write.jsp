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
<title>Sumin</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/normalize.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/layout.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font.css">
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="${pageContext.request.contextPath}/js/submenu.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script>
$(document).ready(function () {
	$("#submit").on('click', function() {
		write();
	})
});
	
function write() {
	if(location.pathname.indexOf('modify') == -1)
		url = "${pageContext.request.contextPath}/board/write";
	else 
		url = "${pageContext.request.contextPath}/board/modify";
    $.ajax({
        url: url,
        type: "POST",
        data: new FormData($("#writeFrm")[0]),
		processData: false,
		contentType: false,
        beforeSend : function(xhr){
        	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
    	},
        success: function(data){
        	if(data.isSuccess)
                location.href="${pageContext.request.contextPath}/board/list";
        	else alert(data.msg);
        },
        error: function(){
            alert("Error");
        }
  	});
}
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
					<h2>?????????</h2>
				</div>			
				<ul id="lnb">
					<li class="on"><a href="#">????????????</a></li>
					<li ><a href="${pageContext.request.contextPath}/board/list">???????????????</a></li>
				</ul>
			</div>
			<!-- lnbWrap :e -->

			<!-- container :s -->
			<div id="container">

				<div class="location">
					<span class="home"><a href="#"><img src="${pageContext.request.contextPath}/img/layout/ico_home.png" alt="???"></a></span>
					<span class="arrow">&gt;</span>
					<a href="#"> <span class="first">?????????</span></a>
					<span class="arrow">&gt;</span>
					<a href="#"> <span>????????? ??????</span></a>
				</div>

				<h3 id="contTi">????????? ??????</h3>

				<!-- ??????????????? txt :s -->
				<div id="txt">
					<form id="writeFrm" enctype="multipart/form-data" method="post">
						<h4>????????? ??????</h4>
						<!-- table :s -->
						<table class="tbl_basic" style="table-layout:fixed;">
				            <caption>
				                <strong>????????? ??????</strong>
				                <details>
				                    <summary>????????? ??????</summary>
				                </details>
				            </caption>
			                <tbody>
								<tr>
									<td class="trw" width="200">??????</td>
									<td>
										<input class="inputText2" type="text" name="title" style="width:100%" value="${board.title}">
									</td>
								</tr>
								<tr>
									<td class="trw" width="200">?????????</td>
									<td style="text-align: left;">${board.writer}</td>
								</tr>
								<tr>
									<td class="trw" width="200">??????</td>
									<td style="text-align: left;">
										<input class="inputText2" type="file" name="file" style="width:100%" >
									</td>
								</tr>
								<tr>
									<td class="trw" width="200">??????</td>
									<td>
										<textarea rows="30" cols="100" name="content">${board.title}</textarea>
									</td>
								</tr>
			                </tbody>
			                <input type="hidden" name="boardID" value="${bid}">
			            </table>
			            <!-- table :e -->
						
			            <!-- paging & search :s -->
						<input type="button" value="??????"  class="subbtn3"
							onclick="location.href='${pageContext.request.contextPath}/board/list'">
						<input type="reset" value="????????????" class="subbtn3">
						<span class="rightButton" >
							<button type="button" id="submit" class="mainbtn">????????????</button>
						</span>
						<s:csrfInput /> 
					</form>
		            <!-- paging & search :e -->
				</div>
				<!-- ??????????????? txt :e -->

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