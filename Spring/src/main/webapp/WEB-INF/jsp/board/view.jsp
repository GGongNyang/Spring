<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css 파일 -->
<link href="<c:url value="../resources/css/board/boardView.css" />" rel="stylesheet">

</head>

<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>

<body id="main_color">

<img alt="" src="../resources/img/main/banner1.png" />

<div class="site_size">
<div class="site_max_size">

<jsp:include page="../common/left_menu.jsp"></jsp:include>

	<section id="bo_view">
		<table id="bo_view_table">
		
			<colgroup>
				<col width="*" />
			</colgroup>
			
			<caption>게시글 상세</caption>
			
			<tbody>
				
				<!-- 제목 -->
				<tr>
					<th class="title">${map.BTITLE }</th>
				</tr>
				
				<!-- 작성자 | 작성일 | 조회수 -->
				
				<tr>
					<td class="additional">${map.BREG_NICK_NM }<span style="color: #999999;"> | ${map.BREG_DT } | ${map.BHIT }조회</span></td>
				</tr>
				
				<tr>
					<td>
						<hr>
							<c:forEach var="row" items="${list }">
								<img alt="" src="../resources/img/common/file_download.png" height="20px" width="20px" />
								<input type="hidden" id="FILE_BNO" value="${row.BNO }" />
								<a href="#this" name="file">${row.ORIGINAL_FILE_NAME }</a>
								(${row.FILE_SIZE }kb) <br>
							</c:forEach>
						<hr>
					</td>
				</tr>
				
				<tr>
					<td style="padding:10px 0 10px 0">${map.BCONTENT }</td>
				</tr>
				
			</tbody>
		</table>
	</section>
	
	<section id="bo_view">
	
		<a href="#this" class="btn btn_green" id="list">
			목록
			<input type="hidden" id="PCODE" value="${pcode }">
			<input type="hidden" id="PTYPE" value="${ptype }">	
		</a>
		<a href="#this" class="btn btn_blue" id="update">
			수정
			<input type="hidden" id="BNO" value="${map.BNO }" />
			<input type="hidden" id="SUB_BNO" value="${map.SUB_BNO }" />
			<input type="hidden" id="PCODE" value="${pcode }">
			<input type="hidden" id="PTYPE" value="${ptype }">
		</a>
	</section>

</div>
</div>
	
	<%@ include file="/WEB-INF/jsp/common/commonForm.jsp" %>
	
	<script type="text/javascript">
	
	$(document).ready(function(){ 
		
		//목록으로 버튼
		$("#list").on("click", function(e){
			e.preventDefault(); 
			fn_openBoardList($(this)); 
		}); 
		
		//수정 버튼
		$("#update").on("click", function(e){
			e.preventDefault(); 
			fn_openBoardUpdate($(this)); 
		}); 
		
		//파일 이름
		$("a[name='file']").on("click", function(e){
			e.preventDefault();
			fn_downloadFile($(this));
		});
	});
	
	function fn_openBoardList(obj){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/board/openBoardMain.do' />");
		comSubmit.addParam("PCODE", obj.parent().find("#PCODE").val());
		comSubmit.addParam("PTYPE", obj.parent().find("#PTYPE").val());
		comSubmit.submit(); 
	} 
	
	function fn_openBoardUpdate(obj){ 
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/board/openBoardUpdate.do' />");
		comSubmit.addParam("BNO", obj.parent().find("#BNO").val());
		comSubmit.addParam("SUB_BNO", obj.parent().find("#SUB_BNO").val());
		comSubmit.addParam("PCODE", obj.parent().find("#PCODE").val());
		comSubmit.addParam("PTYPE", obj.parent().find("#PTYPE").val());
		comSubmit.submit(); 
	}
	
	function fn_downloadFile(obj){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/common/downloadFile.do' />");
		comSubmit.addParam("BNO", obj.parent().find("#FILE_BNO").val());
		comSubmit.submit();
	}
	
	</script>
</body>
</html>

