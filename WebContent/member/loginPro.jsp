<%@page import="member.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
 
<%
//자바 구문
request.setCharacterEncoding("UTF-8");
System.out.println("------loginPro.jsp");
%>

<%  String id=request.getParameter("id");
String passwd=request.getParameter("passwd");

System.out.println(id+"+"+passwd);

MemberDAO dao=MemberDAO.getInstance();//dao객체 얻기 
//dao메서드 호출 
int check = dao.login(id, passwd);
System.out.println(check);

switch (check){

case 1:
	//로그인 성공
	session.setAttribute("memId", id);
	response.sendRedirect("main.jsp");
break;
	
case 0:
	//로그인 실패
	%>
<script>
alert('비밀번호 오류입니다.');
history.back();
</script>
	<%
break;
	
case -1:
	//error
		%>
<script>
alert('ID 오류입니다.');
history.back();
</script>
	<%
break;

}
 %>