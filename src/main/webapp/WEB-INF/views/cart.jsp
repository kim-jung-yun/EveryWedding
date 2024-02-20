<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/resource/home.css" />
<style>

</style>
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
		<h1>장바구니 목록</h1>	
			<table id="ent-view-table">
			<c:forEach var="ent" items="${cartList}" varStatus="status">
				<tr>
					<td><input type="checkbox" id="checkbox-style">

					</td>
					<td style="position: relative;">
						<img src="/resources/resource/ent/${ent.getEnt_id()}-1.jpg" id="main-img">
							<a href="${pageContext.servletContext.contextPath }/EveryWedding/request?id=${ent.getEnt_id()}">
							<button type="submit" id="button-detail">
								<img src="/resources/resource/date-icon2.png" id="icon"></img>
							</button>	
							</a>
							
							<a href="${pageContext.servletContext.contextPath }/EveryWedding/booking?id=${ent.getEnt_id()}">
							<button type="submit" id="button-detail" style="right: 120px;">
								<img src="/resources/resource/message-icon.png" id="icon"></img>
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