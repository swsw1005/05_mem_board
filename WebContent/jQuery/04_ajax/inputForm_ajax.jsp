<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--inputForm_ajax.jsp--%>
<html>
<head>
<script src="//code.jquery.com/jquery-3.2.1.min.js">
</script>

<script type="text/javascript">
$(function(){
	$("#btn").on("click",function(){
		//alert("ID중복체크");
		 if($('#id').val()==''){
			 alert("ID를 입력 하시요");
		 }else{
			 //alert("당신의 id는 "+$('#id').val());
			 //Ajax사용
			 $.ajax({
				 type : 'POST',
				 url : 'confirmId2.jsp',
				 data : "id="+$('#id').val(),
				 dataType:'JSON',
				 //cache : false,
				 //async : true,
				 success : function(data){//서버가 보내준 데이터를 클라이언트 반영
						//alert(data);
						//alert(data.check);
				
						 if(data.check==1){
							 alert("사용중인 id");
							 $("#id").val('').focus();
						 }else{
							 alert("사용가능한 id" );
							 $("#passwd").focus();

						 }//else---

				 }

			 });
		 }//else
	});
});

</script>
</head>

<body> 
<form name="inputForm" action="">
<table border="1">

<tr>
<td>ID</td>
<td>
<input type="text" name="id" id="id" size=20>
<input type="button" id="btn" value="ID중복체크">
</td>
</tr>

<tr>
<td>PWD</td>
<td>
<input type="password" name="passwd" id="passwd" size=20>
</td>
</tr>

</table>

</form>
 </body>
</html>