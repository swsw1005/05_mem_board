<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%
	//자바 구문
	request.setCharacterEncoding("UTF-8");
	System.out.println("------modify.jsp");
%>

<jsp:useBean id="dto" class="member.MemberDTO">
	<jsp:setProperty name="dto" property="*" />
</jsp:useBean>

<%
	MemberDAO dao = MemberDAO.getInstance();
	dao.updateMember(dto);
%>
<script>
	window.onload = function() {
		alert('당신의 정보. 수정되었다.');
		location.href = 'main.jsp';
	}
</script>
