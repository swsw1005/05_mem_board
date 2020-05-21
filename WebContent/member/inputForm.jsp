<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	System.out.println("------ inputForm.jsp --- ");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>inputForm.jsp</title>
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

<!-- font awesome -->
<script src="https://kit.fontawesome.com/8fb683b25a.js"
	crossorigin="anonymous"></script>

<style>
* {
	margin: 0px;
	padding: 0px;
}

#body {
	max-width: 700px;
	margin: auto;
	border: 1px solid violet;
}
</style>


<script>
	$(function() {


		$("#confirmIdBtn").click(function() {
			confirmIdCheck();
		});

	});

	//DAUM 주소 openAPI
	function openDaumPostcode() {

		new daum.Postcode({
			oncomplete : function(data) {
				document.getElementById('zipcode').value = data.zonecode;
				document.getElementById('addr').value = data.address;
			}

		}).open();
	}//openDaumPostcode()---

	// ID중복체크
	function confirmIdCheck() {
		console.log("111");
		var id = $("#id");
		console.log("id : " + id);
		console.log("id val : " + id.val());

		if (id.val() == '') {
			alert('id를 입력하세요');
			id.focus();
		} else {
			//AJAX 시작
			$.ajax({
				type : "POST",
				url : "confirmId.jsp",
				data : "id=" + id.val(),
				dataType : "JSON",
				success : function(data) {
					if (data.check == 1) {
						//alert('사용중인 ID입니다.');
						idUseNO();
						id.val("");
					} else if (data.check == -1) {
						//alert('사용가능한 ID입니다.');
						idUseOK();
						$("#passwd").focus();
					} else {
						alert('조회 불가능');
					}
				}
			});

		}

	}

	function idUseOK() {
		//var target = $("#confirmIdResult");
		var target = document.getElementById("confirmIdResult");
		var msg = '<div class="alert alert-success">'
				+ '<strong>Success!</strong>' + ' 사용가능한 ID입니다.</div>';
		console.log("msg---" + msg);
		var imsg = '<i class="far fa-check-circle"></i>';
		target.innerHTML = msg;
		idUseClear();
	}

	function idUseNO() {
		//var target = $("#confirmIdResult");
		var target = document.getElementById("confirmIdResult");
		var msg = '<div class="alert alert-danger">' + '<strong>NO!</strong>'
				+ ' 사용중인 ID.</div>';
		console.log("msg---" + msg);
		var imsg = '<i class="fas fa-exclamation-triangle"></i>';
		target.innerHTML = msg;
		idUseClear();
	}

	function idUseClear() {
		//var target = $("#confirmIdResult");
		var target = document.getElementById("confirmIdResult");
		var msg = '';
		console.log("msg---" + msg);
		setTimeout(function() {
			target.innerHTML = msg;
		}, 2000);
	}

	function checkPwd() {
		console.log("keypress");
		var pw1 = $("#passwd").val();
		var pw2 = $("#passwd2").val();
		if (pw1 != pw2) {
			document.getElementById('checkPwd').style.color = "red";
			document.getElementById('checkPwd').innerHTML = "비밀번호 불일치";
		} else if (pw1 == pw2) {
			document.getElementById('checkPwd').style.color = "green";
			document.getElementById('checkPwd').innerHTML = "";
		}
	}
</script>


</head>
<body>
	<!-- 내용 -->
	<%
		
	%>

	<div id="body">

		<!-- bootstrap form start////////////////////////////////////////////// -->
		<div class="container">
			<h2>inputForm</h2>
			<form name="userForm" action="inputPro.jsp" method="POST">
				<!-- ////////////////////////////////////////////// -->
				<div class="form-group">
					<label for="id">ID</label>
					<div class="row">
						<!-- ----------------------------------------------------------------------------- -->
						<div class="col-sm-4">
							<input name="id" id="id" placeholder="Input id" type="text"
								class="form-control" required="required">
						</div>
						<!-- ----------------------------------------------------------------------------- -->
						<div class="col-sm-2">
							<button id="confirmIdBtn" class="btn btn-default" type="button">ID체크</button>
						</div>
					</div>
					<!-- ----------------------------------------------------------------------------- -->
					<div class="row">
						<div id="confirmIdResult" class="col-sm-10"></div>
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
								class="form-control" required="required" onkeypress="checkPwd()"
								onkeyup="checkPwd()" onfocusout="checkPwd()">
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
							<input name="name" id="name" placeholder="Input name" type="text"
								class="form-control" required="required">
						</div>
					</div>

				</div>
				<!-- ////////////////////////////////////////////// -->
				<div class="form-group">
					<label for="jumin">주민등록번호</label>
					<div class="row">
						<!-- ----------------------------------------------------------------------------- -->
						<div class="col-sm-4">
							<input name="jumin1" id="jumin1" type="text" class="form-control"
								required="required" placeholder="앞자리" maxlength="6"
								onkeyUp="if(this.value.length==6)  userForm.jumin2.focus()">
						</div>
						<!-- ----------------------------------------------------------------------------- -->
						<div class="col-sm-4">
							<input name="jumin2" id="jumin2" type="password"
								class="form-control" required="required" placeholder="뒷자리"
								maxlength="7"
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
							<input name="email" id="email" type="email" class="form-control"
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
							<input onClick="openDaumPostcode()" name="zipcode" id="zipcode"
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
							<input onClick="openDaumPostcode()" name="addr" id="addr"
								type="text" class="form-control" readonly>
						</div>
					</div>
				</div>
				<!-- ////////////////////////////////////////////// -->
				<div class="form-group">
					<label for="job">job</label>
					<div class="row">
						<!-- ----------------------------------------------------------------------------- -->
						<div class="col-sm-8">
							<select name="job" id="job" class="form-control">
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
						<input type="submit" value="저장&쓰기" class="btn btn-success" />
						<!-- ----------------------------------------------------------------------------- -->
						<input type="reset" value="내용 지우기" class="btn btn-default" />
						<!-- ----------------------------------------------------------------------------- -->
						<a href="List.jsp" class="btn btn-default cancelBtn">목록으로</a>
					</div>
				</div>
				<!-- ////////////////////////////////////////////// -->
				<div class="form-group">
					<div class="btn-group">
						<!-- ----------------------------------------------------------------------------- -->
						<input type="button" value="가입안함" class="btn btn-warning"
							onClick="javaScript:window.location='main.jsp'">
						<!-- ----------------------------------------------------------------------------- -->
						<input type="button" value="가입안함" class="btn btn-warning"
							onClick="javaScript:location='main.jsp'">
						<!-- ----------------------------------------------------------------------------- -->
						<input type="button" value="가입안함" class="btn btn-warning"
							onClick="window.location='main.jsp'">
						<!-- ----------------------------------------------------------------------------- -->
						<input type="button" value="가입안함" class="btn btn-warning"
							onClick="location='main.jsp'">
					</div>
				</div>
<!-- ////////////////////////////////////////////// -->
			</form>
		</div>
		<!-- bootstrap form end ////////////////////////////////////////////// -->
	</div>



</body>
</html>


