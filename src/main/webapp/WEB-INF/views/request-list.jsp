<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의</title>
</head>
<body>
	<!-- Header -->
	<header id="header">
		<c:import url="header.jsp"></c:import>
	</header>
	
	<!-- nav -->
	<c:import url="navigation.jsp"></c:import>
	
	
	<!-- section -->
	<section>
	<h1>문의목록</h1>
			<table id="ent-view-table">
			<c:forEach var="ent" items="${cartList}" varStatus="status">
				<tr>
					
				</tr>
			</c:forEach>
		</table>
	</section>
	
	
</body>
</html>