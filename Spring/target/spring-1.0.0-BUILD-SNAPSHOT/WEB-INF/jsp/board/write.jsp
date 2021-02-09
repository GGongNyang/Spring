<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css 파일 -->
<link href="<c:url value="../resources/css/board/boardWrite.css" />" rel="stylesheet">

</head>

<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>
<%-- <jsp:include page="../board/title.jsp"></jsp:include> --%>

<body>
<div class="size">
<div class="sub_size">

	<form id="frm">
		<table class="board_write">
			
			<colgroup>
				<col width="15%" />
				<col width="*" />
			</colgroup>
			
			<caption>게시글 작성</caption>
			
			<tbody>
				
				<tr>
					<th>제목</th>
					<td>
						<input type="text" id="TITLE" name="TITLE" class="wdp_90" />
					</td>
				</tr>
				
				<tr>
					<th>닉네임</th>
					<td>
						<input type="text" id="NICK_NM" name="NICK_NM" class="wdp_90" />
					</td>
				</tr>
				
				<tr>
					<td colspan="2" class="view_text">
						<textarea rows="20" cols="100" title="내용" id="CONTENTS" name="CONTENTS"></textarea>
					</td>
				</tr>
				
			</tbody>
		</table>
		
		<a href="#this" class="btn" id="write">작성하기</a>
		<a href="#this" class="btn" id="list">목록으로</a>
		
	</form>
	
	<%@ include file="/WEB-INF/jsp/common/commonForm.jsp" %>
	
	<script type="text/javascript">
		//목록 버튼 클릭 시 fn_openBoardList를 찾음
		$(document).ready(function(){
			$("#list").on("click", function(e){
				e.preventDefault();
				fn_openBoardList();
			});
		});
		
		//작성 버튼 클릭 시 fn_insertBoard를 찾음
		$(document).ready(function(){
			$("#write").on("click", function(e){
				e.preventDefault();
				fn_insertBoard();
			});
		});
		
		//목록 버튼 클릭 시 해당 url로 이동
		function fn_openBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/openBoardMain.do' />");
			comSubmit.submit();
		}
		//작성 버튼 클릭 시 해당 url로 값을 가지고 이동
		function fn_insertBoard(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/board/insertBoard.do' />");
			comSubmit.submit();
		}
	</script>

</div>
</div>

</body>
</html>