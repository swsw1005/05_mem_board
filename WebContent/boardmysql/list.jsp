<%--  태그를 이용해서 제어문 처리하도록 하는 설정  --%>
<%@page import="boardmysql.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	System.out.println("------ list.jsp --- ");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>list.jsp</title>
<!-- CDN - W3CSS -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- CDN - Font Awesome 4 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- CDN OFFLINE- sw_topNav.css -->
<link rel="stylesheet" href="../sw_css/sw-1.0.0.css">

<style>
* {
	margin: 0px;
	padding: 0px;
}

#currentPage {
	font-style: BOLD;
	text-decoration: underline;
}
</style>
<script>
	// 스크립트
	$(function() {
		$(".dataRow").click(function() {
			console.log("row click");
			var a1 = this;
			console.log(a1);
			//var a2 = ;
			//console.log(a2);

			//var no = this.childNodes[0].nextElementSibling.innerText.trim();
			//console.log(no);
			//location.href = "View.jsp?no=" + no;
			console.log("----");
		});
	});

	function list() {
		document.listForm.action = "List.jsp";
		document.listForm.submit();//서버로 전송
	}//list() end

	function read(value1) {//value1 글번호
		document.readForm.action = "content.jsp";//글내용 보기 
		document.readForm.no.value = value1;//글번호값 넣기
		document.readForm.submit();
	}
</script>
</head>
<body>
	<!-- 내용 -->
	<%
		final int numPerPage = 3;//페이지 당 글 갯수
		final int pagePerBlock = 3;//블럭당 페이지 수 10개

		int nowPage = 0;//현재페이지
		int nowBlock = 0;//현재블럭

		int totalRecord = 0;//전체 글 갯수
		int totalPage = 0;//전체 페이지 수

		int totalBlock = 0;//전체 블럭 갯수 

		int beginPerPage = 0;//시작 페이지 ( 페이지의 시작 )    57

		String keyField = "";//키 필드 
		String keyWord = "";//검색 단어 
		List<BoardDTO> list = null;

		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		if (request.getParameter("keyWord") != null) {
			//검색어가 있을때
			keyField = request.getParameter("keyField");
			keyWord = request.getParameter("keyWord");
		}

		if (request.getParameter("reload") != null) {
			//전체글 리스트 
			if (request.getParameter("reload").equals("true")) {
				keyField = "";//키 필드 
				keyWord = "";//검색 단어 
			}
		}

		BoardDAO dao = new BoardDAO();
		list = dao.getList();//dao메서드호출
		totalRecord = list.size();//총 글갯수

		// num기준으로 글 찾기 ********************************************
		if (request.getParameter("num") != null) {

			String num_ = request.getParameter("num");
			int num__ = Integer.parseInt(num_);

			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).getNo() == num__) {

					nowPage = i / numPerPage;
					nowBlock = nowPage / pagePerBlock;
					break;
				}
			}
		}
		//////////////////////////////////////////////

		if (request.getParameter("page") != null) {
			nowPage = Integer.parseInt(request.getParameter("page"));
		}//if

		beginPerPage = nowPage * numPerPage;//시작 페이지 계산
		//             0 * 10 = 0   ( 0~9)
		//             1 * 10 = 10  (10~19)
		//             2 * 10 = 20  (20~29)
		//             3 * 10 = 30  (30~39)
		//             4 * 10 = 40  (40~49)

		totalPage = (int) (Math.ceil((double) totalRecord / numPerPage));//올림값,전체페이지
		totalBlock = (int) (Math.ceil((double) totalPage / pagePerBlock));//전체 블럭계산

		if (request.getParameter("nowBlock") != null) {
			nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
		}
	%>


	<!-- responsive template by SW ----------------------------------------------------------- -->
	<!-- Need   W3CSS  +  FONT AS4  +  sw+topnav offline ------------------------------------- -->
	<div class="sw-topnav-margin">&nbsp;</div>

	<!-- CONTENT ------------------------------------------------------------------------------------ -->
	<div class="sw-center">

		<!-- 가로복1100제한 ---------------------------------------------------------------------------------->
		<div class="sw-container-600">
			<div class="w3-container">
				<!-- 3 main content start here!!!----------------------------------------------------------- -->
				<!-- 2 main content start here!!!----------------------------------------------------------- -->
				<!-- 1 main content start here!!!----------------------------------------------------------- -->
				<%-- request객체에 담기 --%>
				<%
					request.setAttribute("list", dao.getList());
				%>


				<div class="container">
					<h2 onclick="list_home()">List.jsp</h2>


					<div class="pull-right">
						Total:<%=totalRecord%>&nbsp;&nbsp; (<font color="blue"><%=nowPage + 1%>/<%=totalPage%></font>)


					</div>
					<div class="table">
						<%
							if (list.isEmpty()) {
								out.println("등록된 글이 없습니다 ");
							} else {
						%>
						<table class="w3-table w3-bordered">

							<tr>
								<th>번호</th>
								<th>글제목</th>
								<th>글쓴이</th>
								<th>날짜</th>
								<th>조횟수</th>
							</tr>



							<%
								System.out.print("beginPerPage " + beginPerPage + "  =  ");

									System.out.print("nowPage " + nowPage + "  *  ");
									System.out.print("numPerPage " + numPerPage + "\t  \t");
									System.out.print("nowBlock " + nowBlock + "\t");
									System.out.print("pagePerBlock " + pagePerBlock + "\t");
									System.out.print("totalPage " + totalPage + "\t");
									System.out.println("totalBlock " + totalBlock + "\t");

									for (int i = beginPerPage; i < beginPerPage + numPerPage; i++) {
										if (i == totalRecord) {
											break;
										}//for 탈출
										System.out.println(i + " " + list.size());
										BoardDTO dto = list.get(i);

										String writer = dto.getWriter();
										String title = dto.getTitle();
										String email = dto.getEmail();
										String regdate = dto.getRegdate() + "";

										int ref = dto.getRef();
										int no = dto.getNo();
										int re_step = dto.getRe_step();
										int re_level = dto.getRe_level();
										int readcount = dto.getReadcount();
							%>


							<tr class="dataRow">
								<!-- 글번호 -->
								<!-- <td><%=totalRecord - i%> </td>  -->
								<td><%=totalRecord - i%></td>

								<!-- 글제목 -->
								<td>
									<%
										//답글 들여쓰기 
												int wid = 0;//변수
												if (re_level > 0) {//답글이면
													wid = 5 * (re_level);
									%> <img src="../imgs/level.gif" width="<%=wid%>" height="16">
									<img src="../imgs/re.gif"> <%
 	} else {
 				//원글
 %> <img src="../imgs/level.gif" width="<%=wid%>" height="16"> <%
 	}
 %> <a href="javaScript:read('<%=no%>')"><%=title%></a>
								</td>

								<!-- 이름을 클릭하면 메일보내기 -->
								<td><a href="mailto:<%=email%>"><%=writer%></a></td>

								<td><%=regdate%></td>
								<td><%=readcount%> <%=re_step%> <%=no%></td>

							</tr>
							<%
								}//for end
							%>

							<!-- 페이지 처리 start .................................................................. -->
							<tr>
								<td colspan="5" style="text-align: center">

									<div class="w3-bar">
										<!-- 1. 이전 n개 -->
										<!-- ----이전 n개 start------------------------- -->
										<%
											if (totalRecord != 0) {// 글이 존재하면
													if (nowBlock > 0) {// 이전 블럭
										%>
										<%-- 이전블럭 -----------------------------------------------------------------------------------------------------%>
										<a
											href="list.jsp?nowBlock=<%=nowBlock - 1%>&page=<%=(nowBlock * pagePerBlock - 1)%>&keyField=<%=keyField%>&keyWord=<%=keyWord%>"
											class="w3-button"> <%=pagePerBlock%>◀
										</a>
										<%
											}//if
										%>
										<!-- ----이전 n개 end-------------------------------------------------------------------------------------------------------- -->

										<!-- 2. 탭 목록 -->
										<%
											//페이지 처리
													for (int i = 0; i < pagePerBlock; i++) {
														System.out.println("page " + (nowBlock * pagePerBlock)
																+ i + 1);
										%>
										<!---------------------------------------------------------------------------------------------------------------------->
										<a
											href="list.jsp?nowBlock=<%=nowBlock%>&page=<%=(nowBlock * pagePerBlock) + i%>&keyField=<%=keyField%>&keyWord=<%=keyWord%>"
											class="w3-button"> <%
 	if ((nowPage + 1) == ((nowBlock * pagePerBlock) + i + 1)) {
 %> <!-- 페이지 번호 일치하면 --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
											<strong> &nbsp;<%=(nowBlock * pagePerBlock) + i + 1%>&nbsp;
										</strong> <!---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
											<%
												} else {
											%> <!---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
											<%=(nowBlock * pagePerBlock) + i + 1%> <!---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
											<%
												}
											%>

										</a>
										<!------------------------------------------------------------------------------------------------------------>
										<%
											if (((nowBlock * pagePerBlock) + i + 1) == totalPage) {
															//3*10=30+4+1==35
															//마지막 페이지 인가
															break;//for 탈출 
														}//if
													}//for
										%>

										<!-- 3. 다음 n개  -->
										<!-- ----다음 n개 start----- -->
										<%
											//다음블럭  
													if (totalBlock > nowBlock + 1) {
										%>
										<!-- -------------------------------------------------------------------- -->
										<a
											href="list.jsp?nowBlock=<%=nowBlock + 1%>&page=<%=(nowBlock + 1) * pagePerBlock%>&keyField=<%=keyField%>&keyWord=<%=keyWord%>"
											class="w3-button"> ▶<%=pagePerBlock%>
										</a>
										<%
											}//if 다음블럭 end
												}//if end
										%>
										<!-- ----다음 n개 end----- -->

									</div> <!-- 페이지 카운터 end............ -->
								</td>
							</tr>
							<!-- 페이지 처리 end ...........................페이지 처리 end ........................... -->

							<tr>
								<td colspan="5">
									<div class="w3-center">
										<!-- -------------------------------------------------------------------- -->
										<a href="writeForm.jsp" class="w3-button">글쓰기</a>
										<!-- -------------------------------------------------------------------- -->
										<a href="javaScript:list()" class="w3-button">리스트 처음으로</a>
										<!-- -------------------------------------------------------------------- -->
									</div>
								</td>
							</tr>
						</table>
						<%
							}//else end
						%>




						<!-- searchform -->
						<div id="search">
							<form name="searchForm" action="List.jsp" method="post"
								class="w3-row">

								<div class="w3-col s2">
									<select name="keyField" id="keyField" class="form-control">
										<option value="title">글제목</option>
										<option value="writer">글쓴이</option>
										<option value="content">글내용</option>
									</select>
								</div>

								<div class="w3-col s6">
									<input type="text" name="keyWord" size="20"
										class="form-control">
								</div>

								<div class="w3-col s2">
									<button type="button" onClick="check()" class="btn btn-success">검색</button>
								</div>

								<input type="hidden" name="page" value="0">


							</form>
						</div>
						<!-- searchform  end -->


					</div>
					<!--  class="table" end-->
				</div>
				<!-- class="container" end-->

				<!-- main content end----------------------------------------------------------------------- -->
			</div>
		</div>
	</div>


	<%-- 사이트 공통 부분 Include - topnav --%>
	<jsp:include page="topnav.html" />


	<%--listForm  자바스크립트를 함께 사용 --%>
	<form name="listForm" method="post">
		<!--  -->
		<input type="hidden" name="reload" value="true">
		<!--  -->
		<input type="hidden" name="nowPage" value="0">
		<!--  -->
		<input type="hidden" name="nowBlock" value="0">
		<!--  -->
	</form>

	<%--readForm  자바스크립트를 함께 사용 --%>
	<form name="readForm" method="post">
		<!-- num값은 javascript 에서 넣었음 -->
		<input type="hidden" name="no" value="0">
		<!--  -->
		<input type="hidden" name="nowBlock" value="<%=nowBlock%>">
		<!--  -->
		<input type="hidden" name="nowPage" value="<%=nowPage%>">
		<!--  -->
		<input type="hidden" name="keyField" value="<%=keyField%>">
		<!--  -->
		<input type="hidden" name="keyWord" value="<%=keyWord%>">
		<!--  -->
	</form>




</body>
</html>