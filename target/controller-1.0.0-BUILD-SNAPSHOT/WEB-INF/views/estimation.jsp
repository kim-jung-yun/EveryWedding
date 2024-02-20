<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>셀프견적내기</title>
<script type="text/javascript">
	var jsHashMap = {};
	
	<c:forEach var="rate" items="${rateMap}">
	    var key = "${key}";
	    var value = "${value}";
	    jsHashMap[key] = value;
	</c:forEach>
	
    var jQueryVariable = jsHashMap;

</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>


	$(window).ready(function(){
		var value1, value2, value3;

		var i = 1; 
		for (var key in jQueryVariable) {
		    var value = jQueryVariable[key];

		    if (i === 1) {
		        value1 = value;
		        console.log(value);
		    } else if (i === 2) {
		        value2 += value1+value;
		        console.log(value);

		    } else if (i === 3) {
		        value3 += value2+value;
		        console.log(value);
		    }
		    
		    i++; 
		}
		
	    var value1=26;
	    var value2=70;
	    var value3=101;
	    
	    var i=1;

	    var func1 = setInterval(function(){
	        if(i<value1){
	            color1(i);
	            i++;
	        } else if(i<value2){
	            color2(i);
	            i++;
	        } else if(i<value3){
	            color3(i);
	            i++;
	        } else {
	            clearInterval(func1);
	        }
	    },10);
	});
	
	
	function color1(i){
	    $(".pie-chart1").css({
	        "background":"conic-gradient(#8b22ff 0% "+i+"%, #ffffff "+i+"% 100%)"
	        });
	    
	}
	function color2(i){
	    $(".pie-chart1").css({
	        "background":"conic-gradient(#8b22ff 0% 25%, #ffc33b 25% "+i+"%, #ffffff "+i+"% 100%)"
	        });
	     
	}
	function color3(i){
	    $(".pie-chart1").css({
	        "background":"conic-gradient(#8b22ff 0% 25%, #ffc33b 25% 70%, #21f3d6 70% "+i+"%, #ffffff "+i+"% 100%)"
	        });
	}
	function color4(i){
	    $(".pie-chart1").css({
	        "background":"conic-gradient(#8b22ff 0% 25%, #ffc33b 25% 70%, #21f3d6 70% "+i+"%, #ffffff "+i+"% 100%)"
	        });
	}
	function color5(i){
	    $(".pie-chart1").css({
	        "background":"conic-gradient(#8b22ff 0% 25%, #ffc33b 25% 70%, #21f3d6 70% "+i+"%, #ffffff "+i+"% 100%)"
	        });
	}
	function color6(i){
	    $(".pie-chart1").css({
	        "background":"conic-gradient(#8b22ff 0% 25%, #ffc33b 25% 70%, #21f3d6 70% "+i+"%, #ffffff "+i+"% 100%)"
	        });
	}
</script>
<style>
	.pie-chart1 {
	  display:inline-block;
	  width: 300px;
	  height: 300px;
	  border-radius: 50%;
	  transition: 0.3s;
	}

</style>
</head>
<body>
	<!-- Header -->
	<header id="header">
		<c:import url="header.jsp"></c:import>
	</header>
	
	<!-- nav -->
	<nav id="nav" style="background-image:  url('/resources/resource/banner2.jpg'); height: 250px; ">
		<ul>
			<li><a href="${pageContext.servletContext.contextPath }/reservation">예약</a></li>
			<li><a href="${pageContext.servletContext.contextPath }/estimation">셀프견적내기</a></li>
			<li><a href="${pageContext.servletContext.contextPath }/community">커뮤니티</a></li>
		</ul>
	</nav>
	
	<h1>셀프견적</h1>
	
	<section>

		<div id="div-style1">
			<form action="${pageContext.servletContext.contextPath }/estimation" method="post">	
			<table>
				<tr>
					<td  colspan="2">
						<div id="div-center-style">
						<img alt="" src="/resources/resource/pen.png" id="icon">
						<label id="label-style1">플래닝 전 사전정보를 입력해주세요!</label>
						</div>
					</td>
				</tr>
				<tr>
					<td><label>결혼 예정일을 입력해주세요</label></td>
					<td><input type="date" id="input-text-style1" name="date"></td>
				</tr>
				<tr>
					<td><label>결혼 준비자금을 입력해주세요.</label></td>
					<td><input type="text" id="input-text-style1" name="budget"></td>
				</tr>
				<tr>
					<td><label>사시는 곳을 입력해 주세요.</label></td>
					<td><input type="text" id="input-text-style1" name="region"></td>
				</tr>
				<tr>
					<td colspan="2"><label>준비하실 목록을 체크해주세요.</label></td>
				</tr>
				<tr>
					<td  colspan="2">
					홀예약<input type="checkbox" id="checkbox-style" name="hall" value="hall">
					스튜디오<input type="checkbox" id="checkbox-style" name="studio" value="studio">
					메이크업<input type="checkbox" id="checkbox-style" name="makeup" value="makeup">
					헤어<input type="checkbox" id="checkbox-style" name="salon" value="salon">
					부케<input type="checkbox" id="checkbox-style" name="bouquet" value="bouquet">
					드레스<input type="checkbox" id="checkbox-style" name="dress" value="dress">
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="hidden" name="info" value="">
					<div id="div-center-style"><button type="submit" id="button-style1">결과보기</button></div>
					</td>
				</tr>
			</table>
			</form>
		</div>
	</section>

	<c:forEach var="rate" items="${rateMap}">
	    <c:out value="${rate.key}" /> : <c:out value="${rate.value} %" /> <br>
	    <c:set var="key" value="${rate.key}" />
	   	<c:set var="value" value="${rate.value}" />
	</c:forEach>

	<section>
		<div class="pie-chart1"></div>
	</section>
	

</body>
</html>