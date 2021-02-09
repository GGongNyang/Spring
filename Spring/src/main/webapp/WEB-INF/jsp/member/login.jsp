<!-- 
file name	로그인 페이지
made by		정기홍
date		2021-02-09
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>Spring</title>

<!-- css 파일 -->
<link href="<c:url value="../resources/css/board/board2.css" />" rel="stylesheet">

</head>

<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>

<body id="main_color">

<img alt="" id="bo2_img" src="../resources/img/main/banner1.png" />

<div class="site_size">
	<div class="site_max_size">

	<jsp:include page="../common/left_menu.jsp"></jsp:include>

	

	</div>
</div>


</body>

<jsp:include page="../common/footer.jsp"></jsp:include>

<%@ include file="/WEB-INF/jsp/common/commonForm.jsp" %>
	
	<script type="text/javascript"> 
	
	$(document).ready(function(){
		$("#write").on("click", function(e){
			//글쓰기 버튼 
			e.preventDefault();
			fn_openBoardWrite($(this));
			});
		
		$("a[name='title']").on("click", function(e){
			//제목 
			e.preventDefault(); 
			fn_openBoardDetail($(this)); 
			}); 
		}); 
	
	function fn_openBoardWrite(obj){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/board/openBoardWrite.do' />");
		comSubmit.addParam("PCODE", obj.parent().find("#PCODE").val());
		comSubmit.addParam("PTYPE", obj.parent().find("#PTYPE").val());
		comSubmit.submit(); 
		} 
	
	function fn_openBoardDetail(obj){ 
		var comSubmit = new ComSubmit(); 
		comSubmit.setUrl("<c:url value='/board/openBoardView.do' />"); 
		comSubmit.addParam("BNO", obj.parent().find("#BNO").val());
		comSubmit.addParam("SUB_BNO", obj.parent().find("#SUB_BNO").val());
		comSubmit.addParam("PCODE", obj.parent().find("#PCODE").val());
		comSubmit.addParam("PTYPE", obj.parent().find("#PTYPE").val());
		comSubmit.submit(); 
	}
</script>

</html>

