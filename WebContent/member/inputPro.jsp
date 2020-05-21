<%@page import="member.*"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%
	//자바 구문
	request.setCharacterEncoding("UTF-8");
	System.out.println("------inputPro.jsp");
%>

<jsp:useBean id="dto" class="member.MemberDTO">
	<jsp:setProperty name="dto" property="*" />
</jsp:useBean>

<%
	System.out.println("jsp-"+dto.toString());
	dto.setRegdate(new Timestamp(System.currentTimeMillis()));
	MemberDAO dao = MemberDAO.getInstance();//dao객체 얻기 
	dao.insertMember(dto);//dao메서드 호출
	response.sendRedirect("main.jsp");
%>