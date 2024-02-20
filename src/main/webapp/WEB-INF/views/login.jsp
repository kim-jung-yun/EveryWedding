<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에브리웨딩 로그인</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/resource/home.css" />
<script>
	function check() {


	}
		
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
	
	function checkUserType(){
		let result = false;
		const user_type = document.getElementById("user_type");
        const user_id = document.querySelector("#user_id");
        const user_pw = document.querySelector("#user_pw");
        //alert("user_id:" + user_id);
        //event.preventDefault();
        
        if(user_id.value == '' && user_pw.value=='') {
        	console.log("id, pw null");
        	alert("아이디 및 비번을 입력하세요!");
        	result = false;
        	event.preventDefault();
        } else if (user_id.value == ''){
        	console.log("id null");
        	alert("아이디를 입력하세요!");
        	result = false;
        	event.preventDefault();
        } else if (user_pw.value==''){
        	console.log("pw null");
        	alert("비밀번호를 입력하세요!");
        	result = false;
        	event.preventDefault();
        } 
        
		if( user_type.value =='' ){
			alert('사용자나 업체를 선택하세요!');
			result = false;
		}else{
			console.log('포스');
			result = true;
		}
		return result;
	}
</script>
<style>
	.custom-btn {
	  width: 130px;
	  height: 40px;
	  color: #fff;
	  border-radius: 5px;
	  padding: 10px 25px;
	  font-family: 'Lato', sans-serif;
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
	/* 6 */
	.btn-6 {
	  background: rgb(247,150,192);
	background: radial-gradient(circle, rgba(247,150,192,1) 0%, rgba(118,174,241,1) 100%);
	  line-height: 42px;
	  padding: 0;
	  border: none;
	}
	.btn-6 span {
	  position: relative;
	  display: block;
	  width: 100%;
	  height: 100%;
	}
	.btn-6:before,
	.btn-6:after {
	  position: absolute;
	  content: "";
	  height: 0%;
	  width: 1px;
	 box-shadow:
	   -1px -1px 20px 0px rgba(255,255,255,1),
	   -4px -4px 5px 0px rgba(255,255,255,1),
	   7px 7px 20px 0px rgba(0,0,0,.4),
	   4px 4px 5px 0px rgba(0,0,0,.3);
	}
	.btn-6:before {
	  right: 0;
	  top: 0;
	  transition: all 500ms ease;
	}
	.btn-6:after {
	  left: 0;
	  bottom: 0;
	  transition: all 500ms ease;
	}
	.btn-6:hover{
	  background: transparent;
	  color: #76aef1;
	  box-shadow: none;
	}
	.btn-6:hover:before {
	  transition: all 500ms ease;
	  height: 100%;
	}
	.btn-6:hover:after {
	  transition: all 500ms ease;
	  height: 100%;
	}
	.btn-6 span:before,
	.btn-6 span:after {
	  position: absolute;
	  content: "";
	  box-shadow:
	   -1px -1px 20px 0px rgba(255,255,255,1),
	   -4px -4px 5px 0px rgba(255,255,255,1),
	   7px 7px 20px 0px rgba(0,0,0,.4),
	   4px 4px 5px 0px rgba(0,0,0,.3);
	}
	.btn-6 span:before {
	  left: 0;
	  top: 0;
	  width: 0%;
	  height: .5px;
	  transition: all 500ms ease;
	}
	.btn-6 span:after {
	  right: 0;
	  bottom: 0;
	  width: 0%;
	  height: .5px;
	  transition: all 500ms ease;
	}
	.btn-6 span:hover:before {
	  width: 100%;
	}
	.btn-6 span:hover:after {
	  width: 100%;
	}

</style>
</head>
<body>
	<!-- Header -->
	<header id="header">
		<c:import url="header.jsp"></c:import>
	</header>
	
	<h1>로그인</h1>
	
	<section>
	
				<div  id="div-center-style">
				<table>
					<tr>
						<td><button onclick="userDivShow()"  class="custom-btn btn-6"><span>사용자</span></button></td>
						<td><button onclick="entDivShow()" class="custom-btn btn-6"><span>업체</span></button></td>
					</tr>
				</table>
				</div>
	
	
		<div id="div-style1">

			<form action="${pageContext.servletContext.contextPath }/EveryWedding/login_complete" method="post">	
				<div id="user-div" style="display:none;">사용자로 로그인</div>
				<div id="ent-div" style="display:none;">업체로 로그인</div>
				<input type="hidden" name="user_type" id="user_type" value="">
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
						<td><input type="text" name="user_id" class="input-text-style1" id="user_id" value=""></td>
					</tr>
					<tr>
						<td><label>pw</label></td>
						<td><input type="password" name="user_pw"  class="input-text-style1" id="user_pw" value=""></td>
					</tr>
					<tr>
						<td colspan="2">
						<div id="div-center-style"><button type="submit" id="button-style1" onclick="return checkUserType();">로그인</button></div>
						</td>
					</tr>
					</table>
				</form>

				
				<form action="${pageContext.servletContext.contextPath }/EveryWedding/join" method="get">
					<div id="div-center-style"><button type="submit" id="button-style1">회원가입</button></div>
				</form>

				<form action="${pageContext.servletContext.contextPath }/EveryWedding//find" method="get">
					<div id="div-center-style"><button type="submit" id="button-style1">아이디/비밀번호찾기</button></div>
				</form>
		</div>
	</section>
</body>
</html>