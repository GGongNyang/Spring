<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>

<!-- css 파일 -->
<link href="<c:url value="../resources/css/main/main.css" />" rel="stylesheet">

</head>

<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>

<script language="JavaScript">

/* $(document).ready(function() {
		var $banner = $(".banner").find("ul");

		var $bannerWidth = $banner.children().outerWidth();//이미지의 폭
		var $bannerHeight = $banner.children().outerHeight(); // 높이
		var $length = $banner.children().length;//이미지의 갯수
		var rollingId;

		//정해진 초마다 함수 실행
		rollingId = setInterval(function() { rollingStart(); }, 5000);//다음 이미지로 롤링 애니메이션 할 시간차
    
		function rollingStart() {
			$banner.css("width", $bannerWidth * $length + "px");
			$banner.css("height", $bannerHeight + "px");
			//배너의 좌측 위치를 옮겨 준다.
			$banner.animate({left: - $bannerWidth + "px"}, 3000, function() { //숫자는 롤링 진행되는 시간이다.
				//첫번째 이미지를 마지막 끝에 복사(이동이 아니라 복사)해서 추가한다.
				$(this).append("<li>" + $(this).find("li:first").html() + "</li>");
				//뒤로 복사된 첫번재 이미지는 필요 없으니 삭제한다.
				$(this).find("li:first").remove();
				//다음 움직임을 위해서 배너 좌측의 위치값을 초기화 한다.
				$(this).css("left", 0);
				//이 과정을 반복하면서 계속 롤링하는 배너를 만들 수 있다.
			});
		}
	});  */
</script>

<body id="main_color" class="banner">

<div class="main" class="contents">
	<div class="sub_main">
		
		<!-- 메인 배너 왼쪽 텍스트 -->
		<section>
			<p>
			This Wallpapers..<br> 
			<span class="main_font">GALAXY<br>WALLPAPERS</span><br>
			This wallpaper is a photo taken by<br>searching for a dreamy wallpaper<br>on Google, so it may be copyrighted.<br>Please be careful.
			
			</p>
		</section>	
			
		<!-- 메인 오른쪽 네이버 rss -->
		<section style="float: right;">	
		
			<c:catch var="err">
				<c:import var="vwNaver" url="http://blog.rss.naver.com/blogRssForDomain.nhn?rss=2.0&domainUrl=wjdrlghd09.blog.me"/>
			
				<!-- xml 파싱하기 -->      
				<x:parse var="vwNaver" xml="${vwNaver}" />
				
				<h1 class="naver_blog">NAVER BLOG</h1>
								
				<table class="inner" id="banner_naver">  
					<x:forEach select="$vwNaver/rss/channel/item" begin="0" end="7">
						<tr>    
							<td>※</td>      
							<td>
								<a href="<x:out select="./link"/>"  target="_blank" >
								<x:out select="./title" />   <br/>
								</a>
							</td>
						</tr>
					</x:forEach>
				</table>
			</c:catch>
			
			<c:if test="${err!=null}">
				${err}
			</c:if> 
		</section>
	</div>
</div>

<div class="main">
	<div class="sub_main">
		 
	</div>
</div>

<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>