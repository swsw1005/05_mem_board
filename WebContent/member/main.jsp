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
	
	function toUpdate(){
		var form = document.getElementById("update");
		var id_ = form.valueOf(id);
		console.log(id_);
		form.submit();
	}
</script>
</head>
<body>
	<!-- 내용 -->
	<br>
	
	<%
	String memId="";
	%>
	<%
		if (session.getAttribute("memId") == null) {
			//로그인 안된 상태
	%>

	<div id="login">
		<!-- bootstrap form start////////////////////////////////////////////////////////////////////////////////////////////////////// -->
		<div class="container">
			<form name="inForm" action="loginPro.jsp" method="POST">
				<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////// -->
					<h2>main.jsp</h2>
				<div class="form-group">
					<div class="row">
						<!-- ----------------------------------------------------------------------------- -->
						<div class="col-sm-3">
							<label for="id">id</label>
						</div>
						<!-- ----------------------------------------------------------------------------- -->
						<div class="col-sm-5">
							<input name="id" id="id" placeholder="Input id" type="text"
								class="form-control" required="required">
						</div>
						<!-- ----------------------------------------------------------------------------- -->
					</div>
				</div>
				<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////// -->
				<div class="form-group">
					<div class="row">
						<!-- ----------------------------------------------------------------------------- -->
						<div class="col-sm-3">
							<label for="password">password</label>
						</div>
						<!-- ----------------------------------------------------------------------------- -->
						<div class="col-sm-5">
							<input name="password" id="password" placeholder="Input password"
								type="password" class="form-control" required="required">
						</div>
						<!-- ----------------------------------------------------------------------------- -->
					</div>
					<!-- ----------------------------------------------------------------------------- -->
				</div>
				<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////// -->
				<div class="form-group">
					<div class="btn-group">
						<!-- ----------------------------------------------------------------------------- -->
						<button type="submit" class="btn btn-success">로그인</button>
						<!-- ----------------------------------------------------------------------------- -->
						<input type="reset" value="reset" class="btn btn-default" />
						<!-- ----------------------------------------------------------------------------- -->
						<a href="inputForm.jsp" class="btn btn-default cancelBtn">JOIN</a>
					</div>
				</div>
				<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////// -->
			</form>
		</div>
		<!-- bootstrap form end ////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	</div>
	<%
		} else {
			//로그인된 상태
			memId = (String)session.getAttribute("memId");
			  %>
		<div id="login">
		<!-- bootstrap form start////////////////////////////////////////////////////////////////////////////////////////////////////// -->
		<div class="container">
			<form name="inForm" action="logout.jsp" method="POST">
				<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////// -->
				<div class="form-group">
				<h6><strong><%= memId %></strong>님 환영합니다.</h6>
				</div>
				
				<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////// -->
				<div class="form-group">
					<div class="btn-group">
						<!-- ----------------------------------------------------------------------------- -->
						<button type="submit" class="btn btn-success">로그아웃</button>
						<!-- ----------------------------------------------------------------------------- -->
						<button type="button" onclick="toUpdate()"   class="btn btn-default">회원정보변경 </button>
						<!-- ----------------------------------------------------------------------------- -->
						<%-- <a href="inputForm.jsp" class="btn btn-default cancelBtn">JOIN</a> --%>
					</div>
				</div>
				<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////// -->
			</form>
		</div>
		<!-- bootstrap form end ////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	</div>
	
	
	
	<!-- /////////////////////////////////////////////////////// -->
    <form id="update" action="modifyForm.jsp" method="post" style="display: none;">
        <input type="hidden" name="id" id="id" value="<%=memId %>">
    </form>
	
	
	
		
		
		
			<%  
		}
	%>



</body>
</html>