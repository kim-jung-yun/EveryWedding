<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리웨딩 회원가입</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/resource/home.css" />
<script type="text/javascript">
	window.onload = function() {
	}
	function show() {
		alert("가입완료. 로그인화면으로 이동합니다.");
	};
	
	function idCheck() {
        window.name = "parentForm";
		let openWin = window.open("http://localhost:8080/EveryWedding/id_check","childForm", "toolbar=yes,scrollbars=yes,resizable=yes,top=250,left=500,width=400,height=400");
	};
	
</script>
	
</head>
<body>
	<!-- Header -->
	<header id="header">
		<c:import url="header.jsp"></c:import>
	</header>	
	
	<h1>회원가입</h1>
	
	<section>
		<div id="div-style1">
			<form action="${pageContext.servletContext.contextPath }/EveryWedding/join_complete" method="post">
			<table>
				<tr>
					<td  colspan="2">
						<div id="div-center-style">
						<label id="label-style1"></label>
						</div>
					</td>
				</tr>
				<tr>
					<td><label>아이디</label></td>
					<td><input type="text" name="user_id"  class="input-text-style1" id="user_id"></td>
					<td>
						<button type="button" id="button-style1" onclick="idCheck()">중복확인</button>
					</td>
				</tr>
				<tr>
					<td><label>비밀번호</label></td>
					<td><input type="password" name="user_pw"  id="input-text-style1"></td>
				</tr>
				<tr>
					<td><label>이름</label></td>
					<td><input type="text" name="user_name"  id="input-text-style1"></td>
				</tr>
				<tr>
					<td><label>연락처</label></td>
					<td><input type="text" name="phone"  id="input-text-style1"></td>
				</tr>
				<tr>
					<td><label>이메일</label></td>
					<td><input type="text" name="email"  id="input-text-style1"></td>
				</tr>
				<tr>
					<td colspan="3">
					<div id="div-center-style">
						<button type="submit" id="button-style1" onclick="show()">회원가입</button>
					</div>
					</td>
				</tr>
			</table>
			</form>
		</div>
	</section>
</body>
</html>