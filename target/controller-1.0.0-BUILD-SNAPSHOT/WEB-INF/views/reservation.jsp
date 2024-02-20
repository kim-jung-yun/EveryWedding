<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리웨딩 예약</title>
<link rel="stylesheet" href="/resources/resource/home.css" />
<script>
	  function openCloseToc() {
	    if(document.getElementById('toc-content').style.display === 'block') {
	      document.getElementById('toc-content').style.display = 'none';
	    } else {
	      document.getElementById('toc-content').style.display = 'block';
	    }
	  }
</script>
</head>
<body>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }"></c:set>


	<!-- Header -->
	<header id="header">
		<c:import url="header.jsp"></c:import>
	</header>
	
	<!-- nav -->
	<nav id="nav" style="background-image:  url('/resources/resource/banner2.jpg'); height: 250px; ">
		<ul>
			<li><a href="${pageContext.servletContext.contextPath }/reservation">예약</a></li>
			<li><a href="${pageContext.servletContext.contextPath }/estimation">셀프견적내기</a></li>
			<li><a href="${pageContext.servletContext.contextPath }/community">커뮤니티</a></li>
		</ul>
	</nav>
	
	<h1>예약</h1>
	
	<section>
	<div id="div-search">
	<form action="${pageContext.servletContext.contextPath }/total_search" method="post" accept-charset="UTF-8">
		<label id="label-style1">검색어</label>
		<input type="text" id="input-text-style1" name="search_word">
		<button type="submit" id="button-style1">검색</button>
		</form>
	</div><br>
	
	<button type="button" id="button-style1" onclick="openCloseToc()">상세검색</button>
	
	<form action="${pageContext.servletContext.contextPath }/detail_search" method="post" accept-charset="UTF-8">
	<div id="toc-content">
	  <table style="border-collapse: collapse; border: none;">
	  	
	  		<tr>
	  			<td><label id="label-style1">지역</label></td>
	  			<td><input type="text" id="input-text-style1" name="region"></td>
	  		</tr>
	  		
	  		<tr>
	  			<td><label id="label-style1">시즌가격</label></td>
	  			<td>	  		
		  			<select name="season" id="select-style1">
		  				<option value="-1">선택하세요</option>
						<option value="peak">성수기(3월~5월, 9월~11월)</option>
						<option value="off">비수기(12월~2월,6월~8월)</option>
					</select>
				</td>
				<td>
					<input type="text" placeholder="최저가" id="input-text-style1" name="min">~
					<input type="text" placeholder="최고가" id="input-text-style1" name="max">
				</td>
	  		</tr>
	  		<tr>
	  			<td><label id="label-style1">업종</label></td>
	  			<td>
	  				<select name="ent_code" id="select-style1">
		  				<option value="-1">선택하세요</option>
						<option value="hall">웨딩홀</option>
						<option value="studio">스튜디오</option>
						<option value="salon">헤어샵</option>
						<option value="makeup">메이크업샵</option>
						<option value="bouquet">부케</option>
						<option value="appliance">가전</option>
						<option value="furniture">가구</option>
					</select>
	  			</td>
	  			<td>	  		
	  				<input type="hidden" value="" name="detail">
	  				<button type="submit" id="button-style1">검색</button>
	  			</td>
	  		</tr>
	  </table>
	</div>
	</form>
	</section>
	
	<hr>
	
	
	<section>
		<p>홀목록</p>
		<table id="ent-view-table">
			<c:forEach var="ent" items="${entList}" varStatus="status">
				<tr>
					<td style="position: relative;">
						<img alt="업체이미지" src="/resources/resource/ent/${ent.getEnt_id()}-1.jpg" id="main-img">
							<a href="${pageContext.servletContext.contextPath }/detail?id=${ent.getEnt_id()}">
							<button type="submit" id="button-detail">
								<img alt="상세보기" src="/resources/resource/detail.png" id="icon"></img>
							</button>	
							</a>
					</td>
					<td>
					<h2>${ent.getEnt_name() }(${ent.getEnt_id()})</h2>
					<h3>${ent.getRegion() }</h3>
					<h4>비수기 : ~ ${ent.getOff() }만원</h4>
					<h4>성수기 : ~ ${ent.getPeak() }만원</h4>
					</td>
				</tr>
			</c:forEach>
		</table>
	</section>
</body>
</html>