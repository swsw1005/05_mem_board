<%@page import="member.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%
	//자바 구문
	request.setCharacterEncoding("UTF-8");
	System.out.println("------confirmId.jsp");
%>

<%
	String id = request.getParameter("id");//ajax에서 보내준 id
	System.out.println(id);

	MemberDAO dao = MemberDAO.getInstance();//객체얻기 
	int check = dao.confirmId(id);//1 또는 -1
	System.out.println("check=" + check);
%>
{ "check":<%=check%>
}
