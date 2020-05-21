<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--confirmId2.jsp--%>
<%
String id=request.getParameter("id");
//member.LoginDao dao=member.LoginDao.getInstance();//객체얻기
//int check=dao.confirmId(id);// 1: 사용중 , -1:사용가능 
int check=-1;
%>

{
 "check":<%=check%>
}
