<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@page import="member.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	System.out.println("------ modifyForm.jsp --- ");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>modifyForm.jsp</title>
<!-- bootstrap 3.4.1 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- jquery 3.4.1 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>



<!-- daum주소 API -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
	//DAUM 주소 openAPI
	function openDaumPostcode() {

		new daum.Postcode({
			oncomplete : function(data) {
				document.getElementById('zipcode').value = data.zonecode;
				document.getElementById('addr').value = data.address;
			}
		}).open();
	}//openDaumPostcode()---
</script>



<style>
* {
	margin: 0px;
	padding: 0px;
}
</style>
<script>
	// 스크립트
	function back() {
		history.back();
	}
</script>
</head>
<body>
	<!-- 내용 -->
	<%
		String id = request.getParameter("id");
		MemberDAO dao = MemberDAO.getInstance();
		MemberDTO dto = dao.getMember(id);
		
		  System.out.println(dto.toString());
		
	%>


	<div id="body">

		<!-- bootstrap form start////////////////////////////////////////////// -->
		<div class="container">
			<h2>inputForm</h2>
			<form name="userForm" action="modify.jsp" method="POST">
				<!-- ////////////////////////////////////////////// -->
				<div class="form-group">
					<label for="id">ID</label>
					<div class="row">
						<!-- ----------------------------------------------------------------------------- -->
						<div class="col-sm-4">
							<input name="id" id="id" placeholder="Input id" type="text"
								class="form-control" value="<%=dto.getId()%>" readonly>
						</div>
						<!-- ----------------------------------------------------------------------------- -->
					</div>
					<!-- ////////////////////////////////////////////// -->
					<div class="form-group">
						<div class="row">
							<!-- ----------------------------------------------------------------------------- -->
							<div class="col-sm-3">
								<label for="passwd">암호</label>
							</div>
							<!-- ----------------------------------------------------------------------------- -->
							<div class="col-sm-5">
								<input name="passwd" id="passwd" placeholder="Input password"
									type="password" class="form-control" required="required">
							</div>
							<!-- ----------------------------------------------------------------------------- -->
						</div>
					</div>
					<!-- ////////////////////////////////////////////// -->
					<div class="form-group">
						<div class="row">
							<!-- ----------------------------------------------------------------------------- -->
							<div class="col-sm-3">
								<label for="passwd2">암호확인</label>
							</div>
							<!-- ----------------------------------------------------------------------------- -->
							<div class="col-sm-5">
								<input name="passwd2" id="passwd2"
									placeholder="Input password again" type="password"
									class="form-control" required="required"
									onkeypress="checkPwd()" onkeyup="checkPwd()"
									onfocusout="checkPwd()">
							</div>
							<!-- ----------------------------------------------------------------------------- -->
						</div>
						<!-- ----------------------------------------------------------------------------- -->
						<div class="row" id="checkPwd"></div>
						<!-- ----------------------------------------------------------------------------- -->
					</div>
					<!-- ////////////////////////////////////////////// -->
					<div class="form-group">
						<label for="name">이름</label>
						<!-- ----------------------------------------------------------------------------- -->

						<div class="row">
							<div class="col-sm-8">
								<input name="name" id="name" placeholder="Input name"
									type="text" class="form-control" value="<%=dto.getName()%>"
									required="required">
							</div>
						</div>

					</div>
					<!-- ////////////////////////////////////////////// -->
					<div class="form-group">
						<label for="jumin">주민등록번호</label>
						<div class="row">
							<!-- ----------------------------------------------------------------------------- -->
							<div class="col-sm-4">
								<input name="jumin1" id="jumin1" type="text"
									class="form-control" required="required"
									value="<%=dto.getJumin1()%>" placeholder="앞자리" maxlength="6"
									onkeyUp="if(this.value.length==6)  userForm.jumin2.focus()">
							</div>
							<!-- ----------------------------------------------------------------------------- -->
							<div class="col-sm-4">
								<input name="jumin2" id="jumin2" type="password"
									class="form-control" required="required"
									value="<%=dto.getJumin2()%>" placeholder="뒷자리" maxlength="7"
									onkeyUp="if(this.value.length==7)  userForm.email.focus()">
							</div>

						</div>
					</div>
					<!-- ////////////////////////////////////////////// -->

					<div class="form-group">
						<label for="email">email</label>
						<div class="row">
							<!-- ----------------------------------------------------------------------------- -->
							<div class="col-sm-8">
								<input name="email" id="email" type="email"
									value="<%=dto.getEmail()%>" class="form-control"
									required="required" placeholder="abc@def.com">
							</div>
							<!-- ----------------------------------------------------------------------------- -->
						</div>
					</div>

					<!-- ////////////////////////////////////////////// -->
					<div class="form-group">
						<label for="zipcode">"zipcode"</label>
						<div class="row">
							<!-- ----------------------------------------------------------------------------- -->
							<div class="col-sm-4">
								<input onClick="openDaumPostcode()"
									value="<%=dto.getZipcode()%>" name="zipcode" id="zipcode"
									type="text" class="form-control" required="required" readonly>
							</div>
						</div>
					</div>
					<!-- ////////////////////////////////////////////// -->
					<div class="form-group">
						<label for="addr">"addr"</label>
						<div class="row">
							<div class="col-sm-8">

								<!-- ----------------------------------------------------------------------------- -->
								<input onClick="openDaumPostcode()" value="<%=dto.getAddr()%>"
									name="addr" id="addr" type="text" class="form-control" readonly>
							</div>
						</div>
					</div>
					<!-- ////////////////////////////////////////////// -->
					<div class="form-group">
						<label for="job">job</label>
						<div class="row">
							<!-- ----------------------------------------------------------------------------- -->
							<div class="col-sm-8">
								<select name="job" id="job" class="form-control"
									value="<%=dto.getJob()%>">
									<option value="0">선택하세요</option>
									<option value="회사원">회사원</option>
									<option value="공무원">공무원</option>
									<option value="교수학생">교수학생</option>
									<option value="법조인">법조인</option>
									<option value="기타">기타</option>
								</select>
							</div>
							<!-- ----------------------------------------------------------------------------- -->
						</div>
					</div>
					<!-- ////////////////////////////////////////////// -->
					<div class="form-group">
						<div class="btn-group">
							<!-- ----------------------------------------------------------------------------- -->
							<input type="submit" value="정보변경" class="btn btn-success" />
							<!-- ----------------------------------------------------------------------------- -->
							<input type="reset" value="내용 지우기" class="btn btn-default" />
							<!-- ----------------------------------------------------------------------------- -->
							<button type="button" class="btn btn-default cancelBtn"
								onclick="back()">뒤로가기</button>
						</div>
					</div>
					<!-- ////////////////////////////////////////////// -->
			</form>
		</div>
		<!-- bootstrap form end ////////////////////////////////////////////// -->
	</div>




</body>
</html>