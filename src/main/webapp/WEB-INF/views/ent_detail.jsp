<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<link rel="stylesheet" href="/resources/resource/home.css" />
</head>
<body>
	<!-- Header -->
	<header id="header">
		<c:import url="header.jsp"></c:import>
	</header>
	
	<!-- section -->
	<section>
		<h1>상세페이지</h1>	
				
		<table id="ent-view-table">

			<tr>
				<td>
					<p id="p-style">${entDto.getEnt_name() }</p>
					<p>성수기 : ~${entDto.getPeak() }만원</p>
					<p>비수기 : ~${entDto.getOff() }만원</p>
					
				</td>
			</tr>
			<tr>
			<td>
				<p><img src="/resources/resource/icon-phone.png" id="mini-icon">${entDto.getPhone() }</p>
				<p><img src="/resources/resource/icon-location.png" id="mini-icon">${entDto.getAddress() }</p>
			</td>
			</tr>
			<c:forEach begin="1" end="${imgTotal }"  varStatus="status">
				<tr><td  id="detail-img">
					<img alt="업체이미지" src="/resources/resource/ent/${entDto.getEnt_id() }-${status.count }.jpg" id="detail-img">
				</td></tr>
			</c:forEach>
		</table>
		<a href="${pageContext.servletContext.contextPath }/EveryWedding/cart_add?id=${entDto.getEnt_id()}" >
			<button type="submit" id="fixed-button">
				<img src="/resources/resource/icon-cart.png" id="icon">
			</button>
		</a>
		
	</section>


</body>
</html>