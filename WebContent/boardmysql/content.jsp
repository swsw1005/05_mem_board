<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.sql.*"%>
 
<%
request.setCharacterEncoding("UTF-8");
System.out.println("------ content.jsp --- ");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title> content.jsp  </title>

<!-- CDN - W3CSS -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- CDN - Font Awesome 4 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- CDN OFFLINE- sw_topNav.css -->
<link rel="stylesheet" href="../sw_css/sw-1.0.0.css">


<style>
 * { margin: 0px;   padding: 0px;  } 
 
</style>
<script>
// 스크립트
  
</script>
</head>
<body>
<!-- 내용 -->
<%
 
%>
 
  
  
  <!-- responsive template by SW ----------------------------------------------------------- -->
  <!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
  <div class="sw-topnav-margin">
  &nbsp;
  </div>
  
  <!-- CONTENT ------------------------------------------------------------------------------------ -->
  <div class="sw-center">
  
  <!-- 가로복1100제한 ---------------------------------------------------------------------------------->
  <div class="sw-container-600">
  <div class="w3-container">
  <!-- 3 main content start here!!!----------------------------------------------------------- -->
  <!-- 2 main content start here!!!----------------------------------------------------------- -->
  <!-- 1 main content start here!!!----------------------------------------------------------- -->
<h2> content.jsp </h2><br>
  
  <strong><%  out.println(request.getParameter("no"));  %></strong>
  
  <!-- main content end----------------------------------------------------------------------- -->
  </div>
  </div>
  </div>
  
  
	<%-- 사이트 공통 부분 Include - topnav --%>
	<jsp:include page="topnav.html" />

  
 
</body>
</html>