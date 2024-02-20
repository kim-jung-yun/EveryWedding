<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리웨딩</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/resource/home.css" />

</head>
<body>
	<!-- Header -->
	<header id="header">
		<c:import url="header.jsp"></c:import>
	</header>
	
	<!-- nav -->
	<nav id="nav">
		<ul>
			<li><a href="${pageContext.servletContext.contextPath }/reservation">예약</a></li>
			<li><a href="${pageContext.servletContext.contextPath }/estimation">셀프견적내기</a></li>
			<li><a href="${pageContext.servletContext.contextPath }/community">커뮤니티</a></li>
		</ul>
	</nav>
	
	
	<!-- section -->
	<section id="section">
		<div style="position: absolute;top: 320px; left: 40px;">
			<p style="font-size: 20px;">결혼 전 필수 가입!</p>
			<p style="font-size: 60px; font-family: 'Giants-Bold';">2023 웨딩 바이블</p>
			<p style="font-family: 'JeonjuCraftGoR'; font-size: 30px;">Every Wedding</p>
			<p>부담되는 플래너 비용 고민, <br> 가입만 하면 웨딩 가이드와 무료 웨딩플래닝 제공</p>
		</div>
	</section>
	
	
	<section  id="section">
	<div id="section-div">
		<span>
		<form action="${pageContext.servletContext.contextPath }/check-list" method="post">
			<button type="submit" id="icon-button">
			<img src="/resources/resource/checklist.png" alt="Image"  width="108"><br>
			<span>체크리스트</span>
			</button>
		</form>
		</span>
		
		<span>
		<form action="${pageContext.servletContext.contextPath }/search" method="post">
			<button type="submit" id="icon-button">
			<img src="/resources/resource/search.png" alt="Image"  width="100"><br>
			<span>통합검색</span>
			</button>
		</form>
		</span>
		
		<span>
		<form action="${pageContext.servletContext.contextPath }/chatting" method="post">
			<button type="submit" id="icon-button">
			<img src="/resources/resource/chatting.png" alt="Image"  width="100"><br>
			<span>채팅목록</span>
			</button>
		</form>
		</span>
		
		<span>
		<form action="${pageContext.servletContext.contextPath }/cart" method="post">
			<button type="submit" id="icon-button" >
			<img src="/resources/resource/cart.png" alt="Image"  width="100"><br>
			<span>장바구니</span>
			</button>
		</form>
		</span>
	</div>
	</section>

	<!-- footer  -->
	<c:import url="footer.jsp"></c:import>
	

</body>
</html>