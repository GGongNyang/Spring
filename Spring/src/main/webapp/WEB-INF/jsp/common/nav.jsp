<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="na_size">
	<div class="na_sub_size">
		
		<div id="na_menu">
		
		<ul>
			<li><a href="/main/openMain.do">메인</a></li>
			<li><a href="#">소개</a>
				<ul class="sub">
					<li><a href="#">제작자 소개</a></li>
					<li><a href="#">마뫄 소개</a></li>
					<li><a href="#">응삼이 소개</a></li>
				</ul>
			</li>
			<li><a href="/board/openBoardMain.do?pcode=000202">게시판</a>
				<ul class="sub">
					<li><a href="/board/openBoardMain.do?pcode=000201">공지사항</a></li>
					<li><a href="/board/openBoardMain.do?pcode=000202">자유 게시판</a></li>
					<li><a href="/board/openBoardMain.do?pcode=000203">이미지 게시판</a></li>
				</ul>
			</li>
			<li><a href="#">메뉴4</a></li>
			<li><a href="#">메뉴5</a></li>
		</ul>
		
		</div>
		
	</div>
</div>

</body>
</html>