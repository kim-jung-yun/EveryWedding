<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인증</title>
</head>
<body>
	<!-- Header -->
	<header id="header">
		<c:import url="header.jsp"></c:import>
	</header>
	
	<!-- nav -->
	<nav id="nav" style="background-image:  url('resource/banner2.jpg'); height: 250px; ">
		<ul>
			<li><a href="${pageContext.servletContext.contextPath }/reservation">예약</a></li>
			<li><a href="${pageContext.servletContext.contextPath }/estimation">셀프견적내기</a></li>
			<li><a href="${pageContext.servletContext.contextPath }/community">커뮤니티</a></li>
		</ul>
	</nav>
	<h1>인증</h1>
</body>
</html>