<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복확인</title>
<link rel="stylesheet" href="/resources/resource/home.css" />
<script>
	function sendID() {
		var parentIdField = opener.document.getElementsByName("user_id")[0];
   		var childIdField = document.getElementsByName("id")[0];
    	
   		if (parentIdField && childIdField) {
   	        parentIdField.value = childIdField.value;
   	    } else {
   	        console.error("Error: Couldn't find the necessary elements in the parent or child window.");
   	    }
		window.close();
	}
</script>
</head>
<body>
	<form action="${pageContext.servletContext.contextPath }/duplication_check" method="get">
		<input type="text" name="id"  id="input-text-style1" value="${id}" <c:if test="${result==0 }"> disabled</c:if> >
		<button type="submit" onclick="id_check()"  id="button-style1">중복확인</button>
	</form>
	
	<div id="div-center-style">
			<c:choose>
				<c:when test="${result>0 }">
					사용할 수 없는 아이디 
				</c:when>
				<c:when test="${result==0 }">
					<input type="hidden" value="${id }" id="available_id">
					사용가능한 아이디
					<button id="button-style1" onclick="sendID()">사용하기</button>
				</c:when>
				<c:otherwise>
					
				</c:otherwise>
			</c:choose>
	</div>
</body>
</html>