<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%Map<String, String> pcode = new HashMap<String, String>(); %>

<c:set target="<%= pcode %>" property="pcode" value="${pcode }" />

<% String real_pcode = pcode.get("pcode"); 

System.out.println("real_pcode >>>>>>" + real_pcode);

%>

<c:choose>

	<c:when test="${pcode eq '000201' || pcode eq '000202' || pcode eq '000203' }">
	
	<div id="left_menu">
		<h2 >게시판</h2>
		
		<ul>
			<li><a href="/board/openBoardMain.do?pcode=000201">공지사항</a></li>
			<li><a href="/board/openBoardMain.do?pcode=000202">자유 게시판</a></li>
			<li><a href="/board/openBoardMain.do?pcode=000203">이미지 게시판</a></li>
		</ul>
	</div>

	</c:when>	

</c:choose>
	


</body>
</html>