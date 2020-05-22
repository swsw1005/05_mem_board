<%@page import="member.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%
	//자바 구문
	request.setCharacterEncoding("UTF-8");
	System.out.println("------deletePro.jsp");
%>

<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");

	System.out.println(id);
	System.out.println(passwd);

	MemberDTO dto = new MemberDTO();
	MemberDAO dao = MemberDAO.getInstance();

	dto.setId(id);
	dto.setPasswd(passwd);

	System.out.println(dto.toString());

	int a = dao.deleteMember(dto);

	if (a == 1) {
		System.out.println("삭제성공");
		session.invalidate();
%>
<script>
	alert("삭제 되었다!");
	location.href = "main.jsp";
</script>
<%
	} else {
		System.out.println("삭제실패");
%>
<script>
	alert("삭제 실패");
	history.back();
</script>
<%
	}
%>