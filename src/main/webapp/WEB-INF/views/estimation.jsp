<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>셀프견적내기</title>
<script type="text/javascript">
	window.onload = function () {

		
		const hall_rate = document.getElementById("hall").value;
		const dress_rate = document.getElementById("dress").value;
		const makeup_rate = document.getElementById("makeup").value;
		const studio_rate = document.getElementById("studio").value;
		const salon_rate = document.getElementById("salon").value;
		const bouquet_rate = document.getElementById("bouquet").value;
	}

	function resultSet() {

	}
</script>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script>
	$(window).ready(function(){
	    const hall_rate = parseFloat($("#hall").val());
	    const dress_rate = parseFloat($("#dress").val());
	    const makeup_rate = parseFloat($("#makeup").val());
	    const studio_rate = parseFloat($("#studio").val());
	    const salon_rate = parseFloat($("#salon").val());
	    const bouquet_rate = parseFloat($("#bouquet").val());
	    
	    const hall_rate_value = isNaN(hall_rate) ? 0 : hall_rate;
	    const studio_rate_value = isNaN(studio_rate) ? 0 : studio_rate;
	    const dress_rate_value = isNaN(dress_rate) ? 0 : dress_rate;
	    const makeup_rate_value = isNaN(makeup_rate) ? 0 : makeup_rate;
	    const salon_rate_value = isNaN(salon_rate) ? 0 : salon_rate;
	    const bouquet_rate_value = isNaN(bouquet_rate) ? 0 : bouquet_rate;

	    console.log(hall_rate_value);
	    console.log(studio_rate_value);
	    console.log(dress_rate_value);
	    console.log(makeup_rate_value);
	    console.log(salon_rate_value);
	    console.log(bouquet_rate_value);

	    console.log("-------------------");

	    var intArray = [];
	    intArray.push(hall_rate_value);
	    intArray.push(studio_rate_value);
	    intArray.push(dress_rate_value);
	    intArray.push(makeup_rate_value);
	    intArray.push(salon_rate_value);
	    intArray.push(bouquet_rate_value);

		estimation(intArray);

	});
	
	function result() {

	}

	function estimation(intArray) {
		
		var jsHashMap = {};
	    var jQueryVariable = jsHashMap;
	    	    
	    var result = [];
		for(var i=0; i<intArray.length; i++){
			console.log("intArray:"+intArray[i]);
			if(i==0) {
				result.push(intArray[i]);
			} else {
				result.push(result[i-1]+intArray[i]);
			}
		}
		console.log("sum:"+result[5]);
		if(result[5] == 0) {
			$("#estimation-div-style").hide();
		} else {
			$("#estimation-div-style").show();
		}
		var max = 0;
		var temp = 0;
		
		if(result[5] < 100 ) {
			for(var i=0; i<result.length; i++){
				if(intArray[i] > 0 ){
					temp = i;
					if(max < temp) {
						max = temp;
					}
				}
			}
			console.log("max:"+max);
			for(var i=max; i<result.length; i++) {
				result[i]=100;
			}
		}

		for(var i=0; i<intArray.length; i++){
			console.log(i+":"+result[i]);
		}

	    var i=0;
	    var func1 = setInterval(function(){
	        if(i<result[0]){
	            color1(i);
	            i++;
	        } else if(i<=result[1]){
	            color2(i,result[0]);
	            i++;
	        } else if(i<=result[2]){
	            color3(i,result[0], result[1]);
	            i++;
	        } else if(i<=result[3]) {
	        	color4(i,result[0],result[1],result[2]);
	            i++;
	        } else if(i<=result[4]) {
	        	color5(i,result[0],result[1],result[2],result[3]);
	            i++;
	        }  else if(i<=result[5]) {
	        	color6(i,result[0],result[1],result[2],result[3],result[4],result[5]);
	            i++;
	        } else if (i<=102){
	            clearInterval(func1);
	        }
	        
	   
	    },20);
	}

    
	function color1(i){
	    $(".pie-chart1").css({
	        "background":"conic-gradient(#8b22ff 0% "+i+"%, #ffffff "+i+"% 100%)"
	        });
	    $("#color1-text").text("Text for color1");
	}
	function color2(i, value1){
	    $(".pie-chart1").css({
	        "background":"conic-gradient(#8b22ff 0% "+value1+"%, #ffc33b "+value1+"% "+i+"%, #ffffff "+i+"% 100%)"
	        });
	     
	}
	function color3(i, value1, value2){
	    $(".pie-chart1").css({
	        "background":"conic-gradient(#8b22ff 0% "+value1+"%, #ffc33b "+value1+"% "+value2+"%, #21f3d6 "+value2+"% "+i+"%, #ffffff "+i+"% 100%)"
	        });
	}
	function color4(i, value1, value2, value3){
	    $(".pie-chart1").css({
	        "background":"conic-gradient(#8b22ff 0% "+value1+"%, #ffc33b "+value1+"% "+value2+"%, #21f3d6 "+value2+"% "+value3+"%, #ee3488 "+value3+"% "+i+"% , #ffffff "+i+"% 100%)"
	        });
	}
	function color5(i, value1, value2, value3, value4){
	    $(".pie-chart1").css({
	        "background":"conic-gradient(#8b22ff 0% "+value1+"%, #ffc33b "+value1+"% "+value2+"%, #21f3d6 "+value2+"% "+value3+"%, #ee3488 "+value3+"% "+value4+"% , #23009f "+value4+"% "+i+"%  , #ffffff "+i+"% 100%)"
	        });
	}
	function color6(i,value1, value2, value3, value4, value5,value6){
	    $(".pie-chart1").css({
	        "background":"conic-gradient(#8b22ff 0% "+value1+"%, #ffc33b "+value1+"% "+value2+"%, #21f3d6 "+value2+"% "+value3+"%, #ee3488 "+value3+"% "+value4+"% , #23009f "+value4+"% "+value5+"% , #ff99ca  "+value5+"% "+i+"%)"
	        });
	}
	function test(){
		//alert('test()');
		
		
		return true;
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

	
	.percent {
	  color: white;
	  padding: 10px 2px;
	  text-shadow: 0 0 1px black;
	  text-align: center;
	}
	.choice {
	  padding-bottom: 10px;
	  margin: 10px;
	}
	
	.hall {
	  background-color: #8b22ff;
	}
	.studio {
	  background: #ffc33b;
	}
	.dress {
	  background: #21f3d6;
	}
	.makeup {
	  background: #ee3488;
	}
	.salon {
	  background: #23009f;
	}
	.bouquet {
	  background: #ff99ca;
	}
	
	* {
	  box-sizing: border-box;
	}
	#list {
	    margin-top: 30px; /* 위쪽 간격 조절 */
	    margin-bottom: 30px; /* 아래쪽 간격 조절 */
	}
    label {
		width: 200px; /* Example width */
		height: 40px; /* Example height */
		font-size: 16px; /* Example font size */
     }
     ul {
     list-style: none;
     }
     
     td {
     	text-align: center; /* Center-align the content inside the table cell */
	}
</style>
</head>
<body>
	<!-- Header -->
	<header id="header">
		<c:import url="header.jsp"></c:import>
	</header>
	
	<!-- nav -->
	<c:import url="navigation.jsp"></c:import>

	
	<h1>셀프견적</h1>
	
	<section>

		<div id="div-style1">
			<form id="estimation-form" action="${pageContext.servletContext.contextPath }/EveryWedding/estimation_result" method="post">	
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
						<td><input type="date" id="input-text-style1" name="date" value="${weddingInfoDto.getDate() }"></td>
					</tr>
					<tr>
						<td><label>결혼 준비자금을 입력해주세요.</label></td>
						<td><input type="text" id="input-text-style1" name="budget" value="${weddingInfoDto.getBudget() }" placeholder="만원"></td>
					</tr>
					<tr>
						<td><label>사시는 곳을 입력해 주세요.</label></td>
						<td><input type="text" id="input-text-style1" name="region" value="${weddingInfoDto.getRegion() }"></td>
					</tr>
					<tr>
						<td colspan="2"><label>준비하실 목록을 체크해주세요.</label></td>
					</tr>
					<tr>
						<td  colspan="2">
						홀예약<input type="checkbox" id="checkbox-style" name="hall" value="hall" <c:if test="${checkList.getHall() != null}">checked</c:if> >
						스튜디오<input type="checkbox" id="checkbox-style" name="studio" value="studio" <c:if test="${checkList.getStudio() != null}">checked</c:if> >
						드레스<input type="checkbox" id="checkbox-style" name="dress" value="dress" <c:if test="${checkList.getDress() != null}">checked</c:if> >
						메이크업<input type="checkbox" id="checkbox-style" name="makeup" value="makeup" <c:if test="${checkList.getMakeup() != null}">checked</c:if> >
						헤어<input type="checkbox" id="checkbox-style" name="salon" value="salon" <c:if test="${checkList.getSalon() != null}">checked</c:if> >
						부케<input type="checkbox" id="checkbox-style" name="bouquet" value="bouquet" <c:if test="${checkList.getBouquet() != null}">checked</c:if> >
						</td>
					</tr>
					<tr>
						<td colspan="2">
						<input type="hidden" name="info" value="">
						<div id="div-center-style"><button type="submit" id="button-style1" onclick="return test();">결과보기</button></div>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</section>


	
	<section>
	<div id="estimation-div-style" class="div-style1">
		<table>
			<tr colspan="4" >
				<td colspan="4"><h3>결혼예정일 : ${weddingInfoDto.getDate() } </h3>
					<h3>D${d_day}</h3>
					<h3>예산 : ${weddingInfoDto.getBudget() }만원</h3>
					<h3>지역 : ${weddingInfoDto.getRegion() }</h3>
				</td>
			</tr>
			<tr>
				<td><div class="pie-chart1" id="div-center-style"></div></td>
				<td  style="text-align: left;">
					<ul class="key">
					<c:forEach var="rate" items="${rateMap}">
						  <li id="list">
						    <strong class="percent ${rate.key}">${rate.value}%</strong>
						    <span class="choice">
						    	<c:choose>
									<c:when test="${rate.key =='hall'}">예식홀, ${estimationDto.getHall() }만원</c:when>
									<c:when test="${rate.key =='studio'}">스튜디오, ${estimationDto.getStudio() }만원</c:when>
									<c:when test="${rate.key =='dress'}">드레스샵, ${estimationDto.getDress() }만원</c:when>
									<c:when test="${rate.key =='makeup'}">메이크업샵, ${estimationDto.getMakeup() }만원</c:when>
									<c:when test="${rate.key =='salon'}">미용실, ${estimationDto.getSalon() }만원</c:when>
									<c:when test="${rate.key =='bouquet'}">부케, ${estimationDto.getBouquet() }만원</c:when>
								</c:choose>
						    </span>
						  </li>
					</c:forEach>
	
					</ul>
				</td>
			</tr>
			<tr colspan="4">
				<td>
				<form action="${pageContext.servletContext.contextPath }/EveryWedding/estimation_complete" method="post">
					<div>
					<c:forEach var="rate" items="${rateMap}">
						<br>
						<label><c:out value="${rate.key}" /></label><input type="text" class="input-text-style1" id="<c:out value="${rate.key}" />" value="<c:out value="${rate.value}" />" style="width:60px">%		
						<c:set var="key" value="${rate.key}" />
						<c:choose>
							<c:when test="${rate.key =='hall'}"><input type="text" value="${estimationDto.getHall() }" class="input-text-style1" name="hall">만원</c:when>
							<c:when test="${rate.key =='studio'}"><input type="text" value="${estimationDto.getStudio() }" class="input-text-style1" name="studio">만원</c:when>
							<c:when test="${rate.key =='dress'}"><input type="text" value="${estimationDto.getDress() }" class="input-text-style1" name="dress">만원</c:when>
							<c:when test="${rate.key =='makeup'}"><input type="text" value="${estimationDto.getMakeup() }" class="input-text-style1" name="makeup">만원</c:when>
							<c:when test="${rate.key =='salon'}"><input type="text" value="${estimationDto.getSalon() }" class="input-text-style1" name="salon">만원</c:when>
							<c:when test="${rate.key =='bouquet'}"><input type="text" value="${estimationDto.getBouquet() }" class="input-text-style1" name="bouquet">만원</c:when>
						</c:choose>
					</c:forEach>
				</div>
				<h3>이렇게 예산을 확정지을까요? </h3>
				<button type="submit" id="button-style1">확정</button>
				</form>
				</td>
			</tr>
		</table>

		</div>
	</section>
	

</body>
</html>