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
	
	<c:when test="${pcode eq 'loginF' || pcode eq 'memFind'}">
	
	<div id="left_menu">
		<h2 >로그인</h2>
		
		<ul>
			<li><a href="/member/memberInfo.do?pcode=loginF">로그인</a></li>
			<li><a href="/member/memberInfo.do?pcode=memFind">아이디/비밀번호 찾기</a></li>
		</ul>
	</div>

	</c:when>
	
	<c:when test="${pcode eq 'join'}">
	
	<div id="left_menu">
		<h2 >회원가입</h2>
		
		<ul>
			<li><a href="/member/memberInfo.do?pcode=join">회원가입</a></li>
		</ul>
	</div>

	</c:when>	

</c:choose>
	


</body>
</html>