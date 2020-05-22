<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	System.out.println("------ deleteForm.jsp --- ");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>deleteForm.jsp</title>
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
</style>
<script>
	// 스크립트
</script>
</head>
<body>
	<!-- 내용 -->
	<h2>deleteForm.jsp</h2>
	<br>
	<%
		String id = request.getParameter("id");
	%>

	<div class="sw-topnav-margin">&nbsp;</div>

	<!-- CONTENT ------------------------------------------------------------------------------------ -->
	<div class="sw-center">

		<!-- 가로복1100제한 ---------------------------------------------------------------------------------->
		<div class="sw-container">
			<div class="w3-container">
				<!-- 3 main content start here!!!----------------------------------------------------------- -->
				<!-- 2 main content start here!!!----------------------------------------------------------- -->
				<!-- 1 main content start here!!!----------------------------------------------------------- -->

				<form name="deleteForm" action="deletePro.jsp" method="post">
					<div class="w3-row-padding w3-section">
						<label><strong><%=id%></strong></label>
					</div>

					<!-- 라벨 / 인풋  기본형 -->
					<div class="w3-row-padding w3-section">
						<label><strong>비밀번호</strong></label>
						<!--..................................................................-->
						<input id="id" name="id" class="w3-input" type="hidden"
							value="<%=id%>" />
						<!--..................................................................-->
						<input id="passwd" name="passwd" class="w3-input" type="password"
							required />
					</div>

					<div class="w3-row-padding w3-section">
						<label>정말로 삭제하시겠습니까?</label>
						<button class="w3-button w3-red">YES</button>
						<button onclick="no()" type="button" class="w3-button w3-green">NO</button>
					</div>
				</form>
				<!-- main content end----------------------------------------------------------- -->
			</div>
		</div>
	</div>

	<script>
		function no() {
			location.href = "main.jsp";
		}
	</script>




	<!-- HEAD ------------------------------------------------------------------------------------ -->
	<!-- head가 맨 나중?나중에 나온 요소가 레이어 맨위로... ---------------------------------------->
	<header class="topnav w3-card" id="topNav">
		<a href="AAAAAA" class="active">AAAAAA</a> <a href="BBBBBB">BBBBBB</a>
		<a href="CCCCCC">CCCCCC</a> <a href="DDDDDD">DDDDDD</a> <a
			href="EEEEEE">EEEEEE</a> <a href="javascript:void(0);" class="icon"
			onclick="responsiveMenuPopUp()"> <i class="fa fa-bars"></i>
		</a>
	</header>

	<script>
		/* Toggle between adding and removing the "responsive" class to topnav when the user clicks on the icon */
		function responsiveMenuPopUp() {
			var x = document.getElementById("topNav");
			if (x.className === "topnav") {
				x.className += " responsive";
			} else {
				x.className = "topnav";
			}
		}
	</script>




</body>
</html>