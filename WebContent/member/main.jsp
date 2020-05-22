<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	System.out.println("------ main.jsp --- ");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>main.jsp</title>
<!-- bootstrap 3.4.1 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- jquery 3.4.1 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- CDN - W3CSS -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- CDN OFFLINE- sw_topNav.css -->
<link rel="stylesheet" href="../sw_css/sw-1.0.0.css">
<!-- CDN - Font Awesome 4 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">



<style>
* {
	margin: 0px;
	padding: 0px;
}

#login {
	margin: auto;
	max-width: 700px;
}
</style>
<script>
	// 스크립트

	function toUpdate() {
		var form = document.getElementById("update");
		var id_ = form.valueOf(id);
		console.log(id_);
		form.action = "modifyForm.jsp"
		form.submit();
	}
	function toDelete() {
		var form = document.getElementById("update");
		var id_ = form.valueOf(id);
		console.log(id_);
		form.action = "deleteForm.jsp"
		form.submit();
	}

	function logout() {
		location.href = "logout.jsp";
	}
</script>
</head>
<body>
	<!-- 내용 -->
	<br>

	<%
		String memId = "";
	%>
	<!-- responsive template by SW ----------------------------------------------------------- -->
	<!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
	<div class="sw-topnav-margin">&nbsp;</div>

	<div class="sw-center">

		<!-- 가로복1100제한 ---------------------------------------------------------------------------------->
		<div class="sw-container-1100">
			<div class="w3-container">

				<%
					if (session.getAttribute("memId") == null) {
						//로그인 안된 상태
				%>
				<%-- <a href="loginForm.jsp" class="w3-button w3-blue">로그인</a> --%>
				<jsp:include page="loginForm.jsp" />

				<%
					} else {
						//로그인된 상태
						memId = (String) session.getAttribute("memId");
				%>

				<span><strong><%=memId%></strong>님 환영합니다.</span>

				<!-- ----------------------------------------------------------------------------- -->
				<button type="button" onclick="logout()" class="w3-button w3-red">로그아웃</button>
				<!-- ----------------------------------------------------------------------------- -->

				<div class="w3-dropdown-click">
					<button type="button" onclick="dropmenu01()"
						class="w3-button w3-black">회원관리</button>
					<div id="dropmenu01"
						class="w3-dropdown-content w3-bar-block w3-border">
						<button type="button" onclick="toUpdate()"
							class="w3-bar-item w3-button">회원정보변경</button>
						<button type="button" onclick="toDelete()"
							class="w3-bar-item w3-button w3-red">회원탈퇴</button>
					</div>
				</div>

				<script>
					function dropmenu01() {
						var x = document.getElementById("dropmenu01");
						console.log("11");
						if (x.className.indexOf("w3-show") == -1) {
							console.log("22");
							x.className += " w3-show";
							console.log("33");
						} else {
							console.log("44");
							x.className = x.className.replace(" w3-show", "");
						}
					}
				</script>
				<%
					}
				%>
				<!-- /////////////////////////////////////////////////////// -->
				<form id="update" action="modifyForm.jsp" method="post"
					style="display: none;">
					<input type="hidden" name="id" id="id" value="<%=memId%>">
				</form>


			</div>
		</div>

		<div class="sw-container-1100">
			<div class="w3-container">

				<div class="w3-col s12 m6 l4 w3-red">
					<div class="w3-section">Section_A</div>
				</div>
				<div class="w3-col s12 m6 l4 w3-blue">
					<div class="w3-section">Section_B</div>
				</div>
				<div class="w3-col s12 m6 l4 w3-green">
					<div class="w3-section">Section_C</div>
				</div>

				<!-- main content end----------------------------------------------------------------------- -->
			</div>
		</div>
	</div>






<%-- 사이트 공통 부분 Include - topnav --%>
	<jsp:include page="topnav.html" />









</body>
</html>