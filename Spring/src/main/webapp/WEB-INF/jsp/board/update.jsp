<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

<script src="https://cdn.tiny.cloud/1/bjb7px3518nlbrfho0drq0qjgzajhm1va595yekcvwjnosu8/tinymce/5/tinymce.min.js" 
		referrerpolicy="origin"/></script>
<script src="../js/lang/ko_KR.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css 파일 -->
<link href="<c:url value="../resources/css/board/boardUpdate.css" />" rel="stylesheet">

</head>

<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>

<body id="main_color">

<img alt="" id="bo2_img" src="../resources/img/main/banner1.png" />

<div class="site_size">
<div class="site_max_size">

<jsp:include page="../common/left_menu.jsp"></jsp:include>

	<form id="frm" name="frm" enctype="multipart/form-data">
	
	<input type="hidden" id="BNO" name="BNO" value="${map.BNO }">
	<input type="hidden" id="SUB_BNO" name="SUB_BNO" value="${map.SUB_BNO }">
	
	<section id="bo_update">
		<table id="bo_update_table">
		
			<colgroup>
				<col width="*" />
			</colgroup>
			
			<caption>게시글 수정</caption>
			
			<tbody>
			
				<tr>
					<th class="title">
						<input type="text" id="TITLE" name="TITLE" placeholder="제목을 입력해주세요." value="${map.BTITLE }" />
					</th>
				</tr>
				
				<tr>
					<td>
						닉네임 : <input type="text" id="NICK_NM" name="NICK_NM" value="Unknown" readonly="readonly" />
					</td>
				</tr>
				
				<tr>
					<td class="view_text">
						<textarea title="내용" id="CONTENT" name="CONTENT">${map.BCONTENT }</textarea>
					</td>
				</tr>
				
				<tr>
					<td>
						<div id="fileDiv">
							<c:forEach var="row" items="${list }" varStatus="var">
								<p>
									<c:choose>
										<c:when test="${not empty row.ORIGINAL_FILE_NAME }">
											<input type="hidden" id="BNO" name="BNO_${var.index }" value="${row.BNO }" />
											<input type="hidden" id="FNO" name="FNO_${var.index }" value="${row.FNO }" />
												<input type="text" id="upload_${var.index}" class="upload" value="${row.ORIGINAL_FILE_NAME }" disabled="disabled" />
												<label for="file_${var.index}">업로드</label>
												<input type="file" id="file_${var.index}" name="file_${var.index }" />
												<a href="#this" id="deleteFile_${var.index}" name="deleteFile_${var.index }">삭제</a>
										</c:when>
										
										<c:otherwise>
											<input type="file" id="file_${var.index}" name="file_${var.index }" />
											<a href="#this" id="deleteFile_${var.index}" name="deleteFile_${var.index}">삭제</a>
										</c:otherwise>
									</c:choose>
								</p>
							</c:forEach>
						</div>
					</td>
				</tr>
				
			</tbody>
		</table>
	</section>
	
	<section id="bo_update">
		<a href="#this" id="addFile" class="btn btn_green" style="float: left;">
			파일 추가
		</a>
		
		<a href="#this" id="list" class="btn btn_green">
			목록
			<input type="hidden" id="PCODE" value="${pcode }">
			<input type="hidden" id="PTYPE" value="${ptype }">	
		</a>
		<a href="#this" id="update" class="btn btn_blue">
			작성
			<input type="hidden" id="PCODE" value="${pcode }">
			<input type="hidden" id="PTYPE" value="${ptype }">	
		</a>
		<a href="#this" id="delete" class="btn btn_red">
			삭제
			<input type="hidden" id="PCODE" value="${pcode }">
			<input type="hidden" id="PTYPE" value="${ptype }">	
		</a>
	</section>
	</form>
	
	

</div>
</div>

</body>

<jsp:include page="../common/footer.jsp"></jsp:include>

<%@ include file="/WEB-INF/jsp/common/commonForm.jsp" %>
	
<script type="text/javascript">
	
	var file_count = '${fn:length(list)+1}';
	
	$(document).ready(function(){

		$("#list").on("click", function(e){
			//목록으로 버튼
			e.preventDefault();
			fn_openBoardList($(this));
		}); 
		
		$("#update").on("click", function(e){
			//저장하기 버튼
			e.preventDefault();
			fn_updateBoard($(this)); 
			}); 
		
		$("#delete").on("click", function(e){
			//삭제하기 버튼 
			e.preventDefault(); 
			fn_deleteBoard($(this));
		});
		
		$("#addFile").on("click", function(e){
			//파일 추가 버튼
			e.preventDefault();
			fn_addFile();
		});
	
		$("a[name^='deleteFile']").on("click", function(e){
			//삭제 버튼 클릭
			e.preventDefault();
			fn_deleteFile($(this));
		});
		
		// 파일 업로드 시 .update 텍스트 값을 변경
		var fileTarget = $('#fileDiv input[type=file]');
		var fileTarget2 = $('#fileDiv input[type=text]');
		
		fileTarget.change(function(){
			var fileId		= $(this).attr('id');
			var fileName	= $(this).val();
		    var fileCount	= $(this).get(0).files.length;
		    var number		= fileId.substr(5, 5);
		    alert("끼요오옷" + fileId + "/" + fileTarget2 + "/" + fileName + "/" +fileCount + "/" + number);
		    if(fileCount == 1){
		    	$('#fileDiv #upload_'+number).attr('value', fileName);
		    } else {
		    	$(fileId).attr('value', '파일을 선택해주세요.');
		    }
		});
	}); 
	
	function fn_openBoardList(obj){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/board/openBoardMain.do' />");
		comSubmit.addParam("PCODE", obj.parent().find("#PCODE").val());
		comSubmit.addParam("PTYPE", obj.parent().find("#PTYPE").val());
		comSubmit.submit(); 
	} 
	
	function fn_updateBoard(obj){
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/board/updateBoard.do' />");
		comSubmit.addParam("PCODE", obj.parent().find("#PCODE").val());
		comSubmit.addParam("PTYPE", obj.parent().find("#PTYPE").val());
		comSubmit.submit(); 
	} 
	function fn_deleteBoard(obj){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/board/deleteBoard.do' />");
		comSubmit.addParam("BNO", $("#BNO").val());
		comSubmit.addParam("SUB_BNO", $("#SUB_BNO").val());
		comSubmit.addParam("PCODE", obj.parent().find("#PCODE").val());
		comSubmit.addParam("PTYPE", obj.parent().find("#PTYPE").val());
		comSubmit.submit(); 
	} 
	
	function fn_addFile(){
		
		if(file_count > 5){
			alert("파일은 총 5개까지만 업로드 할 수 있습니다.");
			return;
		}
		
		var str = "<p>" 
			+ "<input type='file' id='file_"+(file_count)+"' name='file_"+(file_count)+"'>"
			+ "<a href='#this' class='btn' id='deleteFile_"+(file_count)+"' name='deleteFile_"+(file_count)+"'>삭제</a>"
			+ "</p>";
		
		$("#fileDiv").append(str);
		$("#deleteFile_"+(file_count++)).on("click", function(e){
			e.preventDefault();
			fn_deleteFile($(this));
		});
	}
	
	function fn_deleteFile(obj){
		obj.parent().remove();
	}
	
	tinymce.init({
	      selector: 'textarea',
	      language: 'ko_KR',
	      plugins: 'a11ychecker advcode casechange formatpainter linkchecker autolink lists checklist media mediaembed pageembed permanentpen powerpaste table advtable tinycomments tinymcespellchecker',
	      toolbar: 'a11ycheck addcomment showcomments casechange checklist code formatpainter pageembed permanentpen table',
	      toolbar_mode: 'floating',
	      tinycomments_mode: 'embedded',
	      tinycomments_author: 'Author name',
	      height : "500"
	    });
	
</script>

</html>

