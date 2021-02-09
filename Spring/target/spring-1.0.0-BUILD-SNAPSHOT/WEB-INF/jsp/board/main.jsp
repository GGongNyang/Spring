<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>Spring</title>

<!-- css 파일 -->
<link href="<c:url value="../resources/css/board/boardMain.css" />" rel="stylesheet">

</head>

<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>
<%-- <jsp:include page="../board/title.jsp"></jsp:include> --%>

<body id="main_color">

	<h2>게시판 목록</h2>
	<table style="border: 1px solid #ccc">
		<colgroup>
			<col width="5%" />
			<col width="*" />
			<col width="15%" />
			<col width="15%" />
			<col width="15%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">글번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list }" var="row">
						<tr>
							<td>${row.BNO }</td>
							<td>${row.BTITLE }</td>
							<td>${row.BREG_NICK_NM }</td>
							<td>${row.BREG_DT }</td>
							<td>${row.BHIT }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</body>
</html>

