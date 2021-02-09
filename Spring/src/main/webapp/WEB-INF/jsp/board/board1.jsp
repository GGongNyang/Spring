<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>Spring</title>

<c:set var="ptype" value="gongji" />

<!-- css 파일 -->
<link href="<c:url value="../resources/css/board/board.css" />" rel="stylesheet">

</head>

<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>

<body id="main_color">

<img alt="" src="../resources/img/main/banner1.png" />

<div class="site_size">
<div class="site_max_size">

<h2>공지사항</h2>
	
	<section id="bo">	
		<select class="selectBox">
			<option value="" selected="selected">제목 + 작성자</option>
			<option value="">제목</option>
			<option value="">작성자</option>
		</select>
		<input type="text" class="seBox" id="search" name="search" value="" />
		<input type="submit" class="seButton" id="se_button" name="se_button" value="search" />
	</section>
	
	<jsp:include page="../common/left_menu.jsp"></jsp:include>
	
	<table id="bo_table">
		<colgroup>
			<col width="10%" />
			<col width="1%" />
			<col width="*%" />
			<col width="1%" />
			<col width="15%" />
			<col width="1%" />
			<col width="15%" />
			<col width="1%" />
			<col width="10%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">글번호</th>
				<th scope="col" class="small">|</th>
				<th scope="col">제목</th>
				<th scope="col" class="small">|</th>
				<th scope="col">작성자</th>
				<th scope="col" class="small">|</th>
				<th scope="col">작성일</th>
				<th scope="col" class="small">|</th>
				<th scope="col">조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list }" var="row">
						<tr>
							<td>${row.SUB_BNO }</td>
								<c:set var="SUB_BNO1" value="${row.SUB_BNO}"></c:set>
							<td scope="col"><strong>|</strong></td>
							
							<td class="title">
								<a href="#this" name="title" class="text_cut">${row.BTITLE }</a>
								<input type="hidden" id="BNO" value="${row.BNO }">
								<input type="hidden" id="PCODE" value="${pcode }">
								<input type="hidden" id="PTYPE" value="${ptype }">
							</td>
							
							<td scope="col"><strong>|</strong></td>
							
							<td>${row.BREG_NICK_NM }</td>
							
							<td scope="col"><strong>|</strong></td>
							
							<td>${row.BREG_DT }</td>
							
							<td scope="col"><strong>|</strong></td>
							
							<td>${row.BHIT }</td>
						</tr>
					</c:forEach>
				</c:when>
				
				<c:otherwise>
					<tr>
						<td colspan="9" style="text-align: center;">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
				
			</c:choose>
		</tbody>
		
	</table>
	
</div>
</div>

</html>

