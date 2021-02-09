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
<link href="<c:url value="../resources/css/board/boardWrite.css" />" rel="stylesheet">

</head>

<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>

<body id="main_color">

<img alt="" src="../resources/img/main/banner1.png" />

<div class="site_size">
<div class="site_max_size">

<jsp:include page="../common/left_menu.jsp"></jsp:include>

	<form id="frm" name="frm" enctype="multipart/form-data">
		
		<section id="bo_write">
			<table id="bo_write_table">
				
				<colgroup>
					<col width="*" />
				</colgroup>
				
				<caption>게시글 작성</caption>
				
				<tbody>
					
					<tr>
						<th class="title">
							<input type="text" id="TITLE" name="TITLE" placeholder="제목을 입력해주세요." />
						</th>
					</tr>
					
					<tr>
						<td>
							닉네임 : <input type="text" id="NICK_NM" name="NICK_NM" value="Unknown" readonly="readonly" />
						</td>
					</tr>
					
					<tr>
						<td class="view_text">
							<textarea title="내용" id="CONTENTS" name="CONTENTS"></textarea>
						</td>
					</tr>
					
					<tr>
						<td>
							<div id="fileDiv">	
								<p>
									<input type="file" name="file" name="file_0" />
									<a href="#this" id="delete" name="delete">삭제</a>
								</p>
							</div>
						</td>
					</tr>
					
				</tbody>
			</table>
		</section>
		
		<section id="bo_write">
			<a href="#this" id="addFile" class="btn btn_green" style="float: left;">
				파일 추가
			</a>
			<a href="#this" id="list" class="btn btn_green">
				목록
				<input type="hidden" id="PCODE" value="${pcode }">
				<input type="hidden" id="PTYPE" value="${ptype }">
			</a>			
			<a href="#this" id="write" class="btn btn_blue">
				작성
				<input type="hidden" id="PCODE" value="${pcode }">
				<input type="hidden" id="PTYPE" value="${ptype }">
			</a>
		</section>
	</form>
	
	<%@ include file="/WEB-INF/jsp/common/commonForm.jsp" %>
	
	<script type="text/javascript">
		
		var file_count = 1;
	
		$(document).ready(function(){			
			//목록 버튼 클릭 시 fn_openBoardList를 찾음
			$("#list").on("click", function(e){
				e.preventDefault();
				fn_openBoardList($(this));
			});
		});
		
		$(document).ready(function(){
			//작성 버튼 클릭 시 fn_insertBoard를 찾음
			$("#write").on("click", function(e){
				e.preventDefault();
				fn_insertBoard($(this));
			});
		});
		
		$(document).ready(function(){	
			//파일 추가 버튼 클릭 시 fn_addFile를 찾음 
			$("#addFile").on("click", function(e){
				e.preventDefault();
				fn_addFile();
			});
		});
		
		$(document).ready(function(){
			//파일 추가 버튼 클릭 시 fn_deleteFile를 찾음
			$("a[name='delete']").on("click", function(e){
				e.preventDefault();
				fn_deleteFile($(this));
			});
		});
		
		//목록 버튼 클릭 시 해당 url로 이동
		function fn_openBoardList(obj){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/openBoardMain.do' />");
			comSubmit.addParam("PCODE", obj.parent().find("#PCODE").val());
			comSubmit.addParam("PTYPE", obj.parent().find("#PTYPE").val());
			comSubmit.submit();
		}
		
		//작성 버튼 클릭 시 해당 url로 값을 가지고 이동
		function fn_insertBoard(obj){
			
			//값이 비어있는지 체크
			if(document.frm.TITLE.value == "" || document.frm.TITLE.value == null){
				alert("제목을 입력해주세요. \n" + "Please enter the subject.");
				document.frm.TITLE.focus();
				
				return false;
			} /* else if(document.frm.CONTENTS.value == "" || document.frm.CONTENTS.value == null){
				alert("내용을 입력해주세요. \n" + "Please enter your details.");
				document.frm.CONTENTS.focus();
				
				return false;
			} */
			
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/board/insertBoard.do' />");
			comSubmit.addParam("PCODE", obj.parent().find("#PCODE").val());
			comSubmit.addParam("PTYPE", obj.parent().find("#PTYPE").val());
			comSubmit.submit();
		}
		
		//파일 추가 버튼 클릭 시
		function fn_addFile(){
			
			if(file_count > 4){
				alert("파일은 총 5개까지만 업로드 할 수 있습니다.");
				return;
			}
			
			var str = "<p><input type='file' name='file_"+(file_count++)+"' /><a href='#this' id='delete' name='delete'>삭제</a></p>";
			$("#fileDiv").append(str);
			
			$("a[name='delete']").on("click", function(e){
				e.preventDefault();
				fn_deleteFile($(this));
			});
		}
		
		//(파일)삭제 버튼 클릭 시
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

</div>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>