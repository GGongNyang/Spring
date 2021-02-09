<!-- 
file name	자유게시판
made by		정기홍
date		2021-02-09
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="ptype" value="board" />

<img alt="" id="bo2_img" src="../resources/img/main/banner1.png" />

<div class="site_size">
<div class="site_max_size">

<!-- <div style="background-color: #99FF66; height: 20px;">
	<p style="float: right;">메인 > 게시판 > 자유 게시판</p>
</div> -->

<jsp:include page="../common/left_menu.jsp"></jsp:include>

	<h2 id="h2">자유 게시판</h2>

	<section id="bo">
		<select class="selectBox">
			<option value="" selected="selected">제목 + 작성자</option>
			<option value="">제목</option>
			<option value="">작성자</option>
		</select>
		<input type="text" class="seBox" id="search" name="search" value="" />
		<input type="submit" class="seButton" id="se_button" name="se_button" value="search" />
	</section>
	
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
								<c:set var="SUB_BNO" value="${row.SUB_BNO}"></c:set>
							<td scope="col"><strong>|</strong></td>
							
							<td class="title">
								<a href="#this" name="title" class="text_cut">${row.BTITLE }</a>
								<input type="hidden" id="BNO" value="${row.BNO }" />
								<input type="hidden" id="SUB_BNO" value="${row.SUB_BNO }" />
								<input type="hidden" id="PCODE" value="${pcode }" />
								<input type="hidden" id="PTYPE" value="${ptype }" />
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
	
	<section id=" btn_place">	
		<a href="#this" class="btn btn_green" id="write">
			글쓰기
			<input type="hidden" id="PCODE" value="${pcode }">
			<input type="hidden" id="PTYPE" value="${ptype }">
		</a>
		
	</section>
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