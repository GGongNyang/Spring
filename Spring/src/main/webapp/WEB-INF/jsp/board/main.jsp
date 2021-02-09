<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<body>

	<%
	String att_pcode = "";
	
	if(request.getAttribute("att_pcode") == null || request.getAttribute("att_pcode").equals("")){
		
	} else {
		att_pcode = request.getAttribute("att_pcode").toString();		
	}
	
	System.out.println("PCODE >>>>>>>>" + att_pcode);
	
	%>
	
	<c:set var="pcode" value="${pcode }" />
	<c:set var="ptype" value="${ptype }" />
	<c:set var="type" value="${type }" />
	<c:set var="bno" value="${BNO }" />
	
	<c:choose>
	
		<c:when test="${pcode eq '000201' && ptype eq 'gongji' && type eq 'list' }">
			<jsp:include page="../board/board1.jsp"></jsp:include>
		</c:when>	
		
		<c:when test="${pcode eq '000202' && ptype eq 'board' && type eq 'list' }">
			<jsp:include page="../board/board2.jsp"></jsp:include>
		</c:when>
		
		<c:when test="${pcode eq '000203' && ptype eq 'image' && type eq 'list' }">
			<jsp:include page="../board/board3.jsp"></jsp:include>
		</c:when>
		
		<c:when test="${pcode eq '000201' || pcode eq '000202' && type eq 'write' }">
			<jsp:include page="../board/write.jsp"></jsp:include>
		</c:when>
		
		<c:when test="${pcode eq '000201' || pcode eq '000202' && type eq 'write_ok' }">
			<% response.sendRedirect("/board/openBoardMain.do?pcode="+att_pcode); %>
		</c:when>
		
		<c:when test="${pcode eq '000201' || pcode eq '000202' && type eq 'view' }">
			<jsp:include page="../board/view.jsp"></jsp:include>
		</c:when>
		
		<c:when test="${pcode eq '000201' || pcode eq '000202' && type eq 'update' }">
			<jsp:include page="../board/update.jsp"></jsp:include>
		</c:when>
		
		<c:when test="${pcode eq '000201' || pcode eq '000202' && type eq 'update_ok' }">
			<% response.sendRedirect("/board/openBoardMain.do?pcode="+att_pcode); %>
		</c:when>
		
		<c:when test="${pcode eq '000201' || pcode eq '000202' && type eq 'delete' }">
			<% response.sendRedirect("/board/openBoardMain.do?pcode="+att_pcode); %>
		</c:when>
		
		<c:otherwise>
			에러페이지
		</c:otherwise>
	
	</c:choose>
</body>
</html>

