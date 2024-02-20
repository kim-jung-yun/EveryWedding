
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/resource/home.css" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

</head>
<body>
	<nav id="nav" style="background-image:  url('/resources/resource/banner2.jpg'); height: 250px; ">    
		<ul>
			<li><a href="${pageContext.servletContext.contextPath }/EveryWedding/reservation">예약</a></li>
			<li><a href="${pageContext.servletContext.contextPath }/EveryWedding/estimation">셀프견적내기</a></li>
			<li><a href="${pageContext.servletContext.contextPath }/EveryWedding/community">커뮤니티</a></li>
		</ul>
	</nav>
</body>
</html>
