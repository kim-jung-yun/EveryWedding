<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인증</title>
<script>
	window.onload = function() {
		var certification = document.getElementById("certification");
		certification.style.display = "none";
	}
	function showCertification(){
		var certification = document.getElementById("certification");
		certification.style.display = "block";
	}
	
	function showMsg() {
		alert(`${msg}`);
	}
</script>
</head>
<body>
	<!-- Header -->
	<header id="header">
		<c:import url="header.jsp"></c:import>
	</header>
	
	<!-- nav -->
	<c:import url="navigation.jsp"></c:import>
	
	<h1>인증</h1>

	
	<form action="${pageContext.servletContext.contextPath }/EveryWedding/certification" method="get">
			<input type="text" name="toNumber"   id="input-text-style1">
			<button type="submit" onclick="showCertification();"  id="button-style1">인증번호 받기</button>
	</form>
	

	
	<div id="certification">
	<form action="${pageContext.servletContext.contextPath }/EveryWedding/certification-complete" method="get">
		<input type="hidden" name="randomNumber" value="${randomNumber }"   id="input-text-style1">
		<input type="text" name="number" placeholder="인증번호 입력"   id="input-text-style1">
		<label></label>
		<button type="submit" onclick="showMsg()"  id="button-style1">인증확인</button>
	</form>
	</div>
</body>
</html>