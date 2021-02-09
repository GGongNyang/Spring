<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css 파일 -->
<link href="<c:url value="../resources/css/common.css" />" rel="stylesheet">
<link href="<c:url value="../resources/css/common/header.css" />" rel="stylesheet">
<link href="<c:url value="../resources/css/common/nav.css" />" rel="stylesheet">

<!-- jQuery --> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> 
<script src="<c:url value='../js/common.js'/>" charset="utf-8"></script>

</head>
<body>

<div class="he_size">
	<div class="he_sub_size">
		
		<!-- 왼쪽 -->
		<a href="/board/openBoardMain.do">	
			<img style="float: left;" alt="logo" href="/board/openBoardMain.do" src="<c:url value='../resources/img/header/logo.png' />">
		</a>
		<%-- 
		<!-- 오른쪽 -->
		<!-- 트위치 -->
		<a href="">
			<img class="he_r_img" alt="twitch" src="<c:url value='../resources/img/header/twitch.png' />">
		</a>
		<!-- 트게더 -->
		<a href="">
			<img class="he_r_img"alt="Tgeder" src="<c:url value='../resources/img/header/Tgeder.png' />">
		</a>
		<!-- 유튜브 -->
		<a href="https://youtube.com">
			<img class="he_r_img" alt="youtube" src="<c:url value='../resources/img/header/youtube.png' />">
		</a>
		 --%>
		<p style="float: right;">로그인</p>
	</div>
</div>

</body>
</html>