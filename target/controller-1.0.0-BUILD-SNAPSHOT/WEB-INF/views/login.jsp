<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리웨딩 로그인</title>
<link rel="stylesheet" href="resource/home.css" />
<script>
	window.onload = function() {
	    document.getElementById("user-div").style.display = "block";
	    document.getElementById("ent-div").style.display = "block";		
	}
	
	function userDivShow() {
	    document.getElementById("user-div").style.display = "block";
	    document.getElementById("ent-div").style.display = "none";
	    document.getElementById("user_type").value = 1;
	    const user_type = document.getElementById("user_type").value;
	    console.log(user_type);
	}
	
	function entDivShow() {
	    document.getElementById("user-div").style.display = "none";
	    document.getElementById("ent-div").style.display = "block";
	    document.getElementById("user_type").value = 0;
	    const user_type = document.getElementById("user_type").value;
	    console.log(user_type);
	}
</script>
</head>
<body>
	<!-- Header -->
	<header id="header">
		<c:import url="header.jsp"></c:import>
	</header>
	
	<h1>로그인</h1>
	
	<section>
		<div id="div-style1">
		<button onclick="userDivShow()">사용자</button>
		<button onclick="entDivShow()">업체</button>
			<form action="${pageContext.servletContext.contextPath }/login_complete" method="post">	
			<div id="user-div">사용자로 로그인</div>
			<div id="ent-div">업체로 로그인</div>
			<input type="hidden" name="user_type" id="user_type">
			<table>
				<tr>
					<td  colspan="2">
						<div id="div-center-style">
						<label id="label-style1"></label>
						</div>
					</td>
				</tr>
				<tr>
					<td><label>id</label></td>
					<td><input type="text" name="user_id"  id="input-text-style1"></td>
				</tr>
				<tr>
					<td><label>pw</label></td>
					<td><input type="password" name="user_pw"  id="input-text-style1"></td>
				</tr>
				<tr>
					<td colspan="2">
					<div id="div-center-style"><button type="submit" id="button-style1">로그인</button></div>
					</td>
				</table>
				</form>
				
				<form action="${pageContext.servletContext.contextPath }/join" method="get">
					<div id="div-center-style"><button type="submit" id="button-style1">회원가입</button></div>
				</form>

				<form action="${pageContext.servletContext.contextPath }/find" method="get">
					<div id="div-center-style"><button type="submit" id="button-style1">아이디/비밀번호찾기</button></div>
				</form>
		</div>
	</section>
</body>
</html>