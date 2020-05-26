<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	System.out.println("------ writeForm.jsp --- ");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>writeForm.jsp</title>

<!-- CDN - jquery 3.4.1 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- CDN - Font Awesome 4 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- CDN - W3CSS -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- CDN OFFLINE- sw_topNav.css -->
<link rel="stylesheet" href="../sw_css/sw-1.0.0.css">

<script src="./script.js"></script>



<style>
* {
	margin: 0px;
	padding: 0px;
}
</style>
<script>
	// 스크립트
	function writeSave2() {
		console.log("1111");
	}
</script>
</head>
<body>

	<%
		int no = 0;
		int ref = 1;
		int re_step = 0;
		int re_level = 0;
		String regdate = "";

		if (request.getParameter("no") != null) {
			no = Integer.parseInt(request.getParameter("no"));
			ref = Integer.parseInt(request.getParameter("ref"));
			re_step = Integer.parseInt(request.getParameter("re_step"));
			re_level = Integer.parseInt(request.getParameter("re_level"));
		}
	%>


	<!-- responsive template by SW ----------------------------------------------------------- -->
	<!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
	<div class="sw-topnav-margin">&nbsp;</div>

	<!-- CONTENT ------------------------------------------------------------------------------------ -->
	<div class="sw-center">

		<!-- 가로복1100제한 ---------------------------------------------------------------------------------->
		<div class="sw-container-600">
			<div class="w3-container">
				<!-- 3 main content start here!!!----------------------------------------------------------- -->
				<!-- 2 main content start here!!!----------------------------------------------------------- -->
				<!-- 1 main content start here!!!----------------------------------------------------------- -->



				<form method="post" name="writeForm" action="writePro.jsp">
					<%-- .............................................................................................................. --%>
					<input type="text" name="no" value="<%=no%>">
					<%-- .............................................................................................................. --%>
					<input type="text" name="ref" value="<%=ref%>">
					<%-- .............................................................................................................. --%>
					<input type="text" name="re_step" value="<%=re_step%>">
					<%-- .............................................................................................................. --%>
					<input type="text" name="re_level" value="<%=re_level%>">

					<table>
						<tr>
							<td class="w3-center"><label>작성자</label></td>
							<td><input type="text" id="writer" name="writer"
								class="w3-input w3-border" /></td>
						</tr>
						<tr>
							<td class="w3-center"><label>글제목</label></td>
							<td>
								<%
									if (request.getParameter("num") == null) {
										//원글
								%> <input type="text" name="title" id="title" size="40"
								class="w3-input w3-border"> <%
 	} else {
 		//답글
 %> <input type="text" name="title" id="title" size="40"
								value="[답글]" class="w3-input w3-border"> <%
 	}//else end
 %>
							</td>
						</tr>
						<tr>
							<td class="w3-center"><label>내용</label></td>
							<td><textarea id="content" name="content"
									class="w3-input w3-border" rows="10" style="resize: none;"></textarea></td>
						</tr>
						<tr>
							<td class="w3-center"><label>이메일</label></td>
							<td><input type="email" id="email" name="email"
								class="w3-input w3-border" /></td>
						</tr>
						<tr>
							<td class="w3-center"><label>암호</label></td>
							<td><input type="password" id="password" name="password"
								class="w3-input w3-border" /></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<%-- .............................................................................................................. --%>
								<%
									if (request.getParameter("num") == null) {
								%> <%-- .............................................................................................................. --%>
								<input type="submit" value="글쓰기" class="w3-button w3-red">
								<%-- .............................................................................................................. --%>
								<%
									} else {//답글
								%> <%-- .............................................................................................................. --%>
								<input type="submit" value="답글 쓰기" class="w3-button w3-red">
								<%-- .............................................................................................................. --%>
								<%
									}//else end
								%> <%-- .............................................................................................................. --%>
								<input type="reset" value="다시쓰기" class="w3-button w3-red">
								<%-- .............................................................................................................. --%>
								<input type="button" value="글목록"
								onClick="window.location='list.jsp'" class="w3-button w3-red">
								<%-- .............................................................................................................. --%>
							</td>
						</tr>

					</table>

				</form>


				<!-- main content end----------------------------------------------------------------------- -->
			</div>
		</div>
	</div>

<%-- 사이트 공통 부분 Include - topnav --%>
	<jsp:include page="topnav.html" />




</body>
</html>