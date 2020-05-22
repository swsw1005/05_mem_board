<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	System.out.println("------ loginForm.jsp --- ");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>loginForm.jsp</title>
<!-- CDN - W3CSS -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- CDN - Font Awesome 4 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- CDN OFFLINE- sw_topNav.css -->
<link rel="stylesheet" href="../sw_css/sw-1.0.0.css">

<script>
	// 스크립트
</script>
</head>
<body>
	<form name="inForm" action="loginPro.jsp" method="POST">

		<div class="w3-col w3-red m4 l4 w3-hide-small">
			<div class="w3-section">&nbsp;</div>
		</div>

		<div class="w3-col  s3 m1 l1 w3-center">
			<div class="w3-section">ID</div>
		</div>

		<div class="w3-col w3-blue s6 m3 l2">
			<input id="id" name="id" class="w3-input" type="text"
				placeholder="ID" tabindex="1" />
		</div>

		<div class="w3-col s3 w3-center w3-hide-large w3-hide-medium">
			<div class="w3-section">
				<button class="w3-button w3-pink" style="width: 78px" tabindex="3">로그인</button>
			</div>
		</div>

		<div class="w3-col s3 m1 l1 w3-center">
			<div class="w3-section">PW</div>
		</div>

		<div class="w3-col w3-yellow  s6 m3 l2">
			<input id="passwd" name="passwd" class="w3-input" type="password"
				placeholder="Password" tabindex="2" />
		</div>

		<div class="w3-col w3-pink m8 w3-hide-large w3-hide-small">
			<div class="w3-section">&nbsp;</div>
		</div>

		<div class="w3-col m2 l1  w3-center w3-hide-small">
			<button class="w3-button w3-blue" style="width: 78px" tabindex="3">로그인</button>
		</div>

		<div class="w3-col s3 m2 l1 w3-center">
			<a href="inputForm.jsp" class="w3-button w3-green"
				style="width: 78px" tabindex="4">JOIN</a>
		</div>

	</form>




</body>
</html>