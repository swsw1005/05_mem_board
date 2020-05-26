<%@page import="boardmysql.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%
	//자바 구문
	request.setCharacterEncoding("UTF-8");
	System.out.println("------writePro.jsp");
%>

<jsp:useBean id="dto" class="boardmysql.BoardDTO">
	<jsp:setProperty name="dto" property="*" />
	<%-- 값 전체를 한방에 가져온다 --%>
</jsp:useBean>

<%
	dto.setIp(request.getRemoteAddr());

	BoardDAO dao = new BoardDAO();
	dao.insertArticle(dto);
	response.sendRedirect("list.jsp");
%>