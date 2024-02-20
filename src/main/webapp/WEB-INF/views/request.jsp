<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약문의</title>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script>
	  function openCloseToc() {
		    if(document.getElementById('toc-content').style.display === 'block') {
		      document.getElementById('toc-content').style.display = 'none';
		    } else {
		      document.getElementById('toc-content').style.display = 'block';
		    }
		  }
	  
        $(document).ready(function() {
            var typingBool = false;
            var typingIdx = 0;
            var liIndex = 0;
            var liLength = $(".typing-txt>ul>li").length;

            var typingTxt = $(".typing-txt>ul>li").eq(liIndex).text();
            typingTxt = typingTxt.split("");

            if (typingBool == false) {
                typingBool = true;
                var tyInt = setInterval(typing, 100);
            }

            function typing() {
                $(".typing ul li").removeClass("on");
                $(".typing ul li").eq(liIndex).addClass("on");

                if (typingIdx < typingTxt.length) {
                    $(".typing ul li").eq(liIndex).append(typingTxt[typingIdx]);
                    typingIdx++;
                } else {
                    if (liIndex < liLength - 1) {
                        liIndex++;
                        typingIdx = 0;
                        typingTxt = $(".typing-txt>ul>li").eq(liIndex).text();
                    } else if (liIndex == liLength - 1) {
                        clearInterval(tyInt);
                        typingBool = false;
                    }
                }
            }
        });
    </script>
    <style>
        .typing-txt { 
			display: none;
        }
        .typing {
         	background-image:  url('/resources/resource/bubble.png');
         	width: 700px;
         	height: 500px;
         	background-repeat: no-repeat;
         	background-attachment: absolute;
  			background-position: center;

        }
        ul { list-style: none; }
        .typing ul li.on {  
            display: inline-block; 
            animation-name: cursor; 
            animation-duration: 0.3s; 
            animation-iteration-count: infinite; 
        } 
        @keyframes cursor { 
            0%{border-right: 1px solid #fff} 
            50%{border-right: 1px solid #000} 
            100%{border-right: 1px solid #fff} 
        }
        
        #toc-content {
        	
        }
  
		.center {
		  margin-left: auto;
		  margin-right: auto;
		}
		
		div.table-title {
   display: block;
  margin: auto;
  max-width: 600px;
  padding:5px;
  width: 100%;
}

.table-title h3 {
   color: #1a1a1a;
   font-size: 30px;
   font-weight: 400;
   font-style:normal;
   text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
   text-transform:uppercase;
}


/*** Table Styles **/

.table-fill {
  background: white;
  border-radius:3px;
  border-collapse: collapse;
  height: 320px;
  margin: auto;
  max-width: 600px;
  padding:5px;
  width: 100%;
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
  animation: float 5s infinite;
}
 
th {
  color:#fff5fc;;
  background:#fab9e6;
  border-bottom:4px solid #9ea7af;
  border-right: 1px solid #343a45;
  font-size:23px;
  font-weight: 100;
  padding:24px;
  text-align:left;
  text-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
  vertical-align:middle;
}

th:first-child {
  border-top-left-radius:3px;
}
 
th:last-child {
  border-top-right-radius:3px;
  border-right:none;
}
  
tr {
  border-top: 1px solid #C1C3D1;
  border-bottom-: 1px solid #C1C3D1;
  color:#666B85;
  font-size:16px;
  font-weight:normal;
  text-shadow: 0 1px 1px rgba(256, 256, 256, 0.1);
}
 
tr:hover td {
  background:#d6b4d4;
  color:#FFFFFF;
  border-top: 1px solid #22262e;
}
 
tr:first-child {
  border-top:none;
}

tr:last-child {
  border-bottom:none;
}
 
tr:nth-child(odd) td {
  background:#EBEBEB;
}
 
tr:nth-child(odd):hover td {
  background:#ffa1ff;
}

tr:last-child td:first-child {
  border-bottom-left-radius:3px;
}
 
tr:last-child td:last-child {
  border-bottom-right-radius:3px;
}
 
td {
  background:#FFFFFF;
  padding:20px;
  text-align:left;
  vertical-align:middle;
  font-weight:300;
  font-size:18px;
  text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
  border-right: 1px solid #C1C3D1;
}

td:last-child {
  border-right: 0px;
}

th.text-left {
  text-align: left;
}

th.text-center {
  text-align: center;
}

th.text-right {
  text-align: right;
}

td.text-left {
  text-align: left;
}

td.text-center {
  text-align: center;
}

td.text-right {
  text-align: right;
}

.frame {
  width: 90%;
  margin: 40px auto;
  text-align: center;
}
button {
  margin: 20px;
}
.custom-btn {
  width: 130px;
  height: 40px;
  color: #fff;
  border-radius: 5px;
  padding: 10px 25px;
  font-weight: 500;
  background: transparent;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  display: inline-block;
   box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  outline: none;
}

/* 11 */
.btn-11 {
  border: none;
  background: rgb(251,33,117);
    background: linear-gradient(0deg, rgba(251,33,117,1) 0%, rgba(234,76,137,1) 100%);
    color: #fff;
    overflow: hidden;
}
.btn-11:hover {
    text-decoration: none;
    color: #fff;
}
.btn-11:before {
    position: absolute;
    content: '';
    display: inline-block;
    top: -180px;
    left: 0;
    width: 30px;
    height: 100%;
    background-color: #fff;
    animation: shiny-btn1 3s ease-in-out infinite;
}
.btn-11:hover{
  opacity: .7;
}
.btn-11:active{
  box-shadow:  4px 4px 6px 0 rgba(255,255,255,.3),
              -4px -4px 6px 0 rgba(116, 125, 136, .2), 
    inset -4px -4px 6px 0 rgba(255,255,255,.2),
    inset 4px 4px 6px 0 rgba(0, 0, 0, .2);
}


@-webkit-keyframes shiny-btn1 {
    0% { -webkit-transform: scale(0) rotate(45deg); opacity: 0; }
    80% { -webkit-transform: scale(0) rotate(45deg); opacity: 0.5; }
    81% { -webkit-transform: scale(4) rotate(45deg); opacity: 1; }
    100% { -webkit-transform: scale(50) rotate(45deg); opacity: 0; }
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
	
	
	<h1>문의하기</h1>
	
	<c:choose>
		<c:when test="${code_id eq 'hall'}">
			<c:set var="fund" value="${estDto.getHall()}" />
			<c:set var="code_name" value="웨딩홀" />
		</c:when>
		<c:when test="${code_id eq 'dress'}">
			<c:set var="fund" value="${estDto.getDress()}" />
			<c:set var="code_name" value="드레스샵" />
		</c:when>
		<c:when test="${code_id eq 'studio'}">
			<c:set var="fund" value="${estDto.getStudio()}" />
			<c:set var="code_name" value="스튜디오" />			
		</c:when>
		<c:when test="${code_id eq 'makeup'}">
			<c:set var="fund" value="${estDto.getMakeup()}" />
			<c:set var="code_name" value="메이크업샵" />		
		</c:when>
		<c:when test="${code_id eq 'salon'}">
			<c:set var="fund" value="${estDto.getSalon()}" />
			<c:set var="code_name" value="미용실" />		
		</c:when>
		<c:when test="${code_id eq 'bouquet'}">
			<c:set var="fund" value="${estDto.getBouquet()}" />
			<c:set var="code_name" value="부케" />		
		</c:when>
	</c:choose>
	<c:if test="${season_price <= fund }">
		<c:set var="check" value="예산 범위 내 입니다." />
	</c:if>
	<c:if test="${season_price > fund }">
		<c:set var="check" value="예약이 어려울 수 있습니다." />
	</c:if>
    <div class="typing-txt"> 
        <ul>
            <li>${loginDto.getUser_name() }님의 총예산 : ${infoDto.getBudget() }만원 </li>
            <li>${code_name } 예산 : ${fund }만원</li>
            <li>결혼예정일 : ${infoDto.getDate() } ( ${season} )</li>
            <li>${code_name } '${entDto.getEnt_name() }'의  ${season} 금액 : ${season_price }만원</li>
            <li>${check } </li>
			<li>위 내용을 토대로 예약신청을 넣을까요?</li>
        </ul>
    </div> 
    <div class="typing"  id="div-center-style" style="width: 100%;">
        <ul>
			<li></li>
			<li></li>
			<li></li>
			<li></li>	
			<li></li>
			<li></li>
        </ul>
  	 </div> 
  	 
  	<div id="div-center-style" style="width: 100%; ">
		<button type="button" id="button-style1" onclick="openCloseToc()">예약신청하기</button>
	</div>
	
		<div id="toc-content" class="div-center-style"  style="width: 100%; background-color : #ffedff;">
			<div class="table-title"><h3>예약신청</h3></div>
			<form action="${pageContext.servletContext.contextPath }/EveryWedding/request-add" method="post">
			<table class="table-fill" id="center">
			<thead>
				<tr>
					<th class="text-center">내용</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><div class="div-center-style"><label>날짜</label><input type="date"  id="input-text-style1"  value="${infoDto.getDate() }" name="date"></div></td>
				</tr>
				<tr>
					<td><div class="div-center-style"><label>예약금</label><input type="text"  id="input-text-style1" value="${season_price }" name="fund">만원</div></td>
				</tr>
				<tr>
					<td><div class="div-center-style"><label>시간대</label>
						<select name="time" id="select-style1">
			  				<option value="-1">선택하세요</option>
							<option value="10">10시~11시</option>
							<option value="11">11시~12시</option>
							<option value="12">12시~13시</option>							
							<option value="13">13시~14시</option>
							<option value="14">14시~15시</option>							
							<option value="15">15시~16시</option>
							<option value="16">16~17시</option>
							<option value="17">17~18시</option>
							<option value="18">18~19시</option>
							<option value="19">19~20시</option>
						</select>
					</div>
					</td>
				</tr>	
				<tr>
					<td>
						<div class="div-center-style"><label>인원</label>
						<select name="count" id="select-style1">
			  				<option value="-1">선택하세요</option>
							<option value="50">~50명</option>
							<option value="50_10">50~100명</option>
							<option value="100_200">100명~200명</option>							
							<option value="200_300">200~300명</option>
							<option value="300">300명~</option>							
						</select>
						</div>
					</td>
				</tr>
				<tr>
					<td><div class="div-center-style"><label>전달사항</label><input type="text"  id="input-text-style1"  name="content"></div></td>
				</tr>
			</tbody>
			</table>
			<br>
				<input type="hidden" name="user_id" value="${loginDto.getUser_id() }">
				<input type="hidden" name="ent_id" value="${entDto.getEnt_id() }">
				<div class="frame" id="div-center-style" type="submit" ><button class="custom-btn btn-11">완료<div class="dot"></div></button>
			</form>
			<br><br><br>
		</div>
		
</body>
</html>

