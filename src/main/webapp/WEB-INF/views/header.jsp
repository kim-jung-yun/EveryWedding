
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/resource/home.css" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
	#icon-button {
	  background-color: transparent;
	  border: none; 
	  color: #000; 
	  cursor: pointer;
	  
	}
</style>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script>
const CONTEXT_PATH = `${pageContext.request.contextPath}`

window.onload = function () {
    var logoutDiv = document.getElementById("logout-div");
    var loginDiv = document.getElementById("login-div");

    ajaxReceiveStatus();
    ajaxReceiveInfo();
    
    function ajaxReceiveStatus() {
		
	    $.ajax({
	        url:  CONTEXT_PATH + "/EveryWedding/login_status",
	        method: "POST",
	        headers: { "Content-Type": "application/json;charset=UTF-8"},
	        dataType: "text",
	        success: function (data, textStatus, jqXHR) {
	            var jsonData = JSON.parse(data);
	            var loginNow = jsonData.loginNow;
	            console.log("login status:"+loginNow);
	            updateLoginStatus(loginNow);
	        },
	        error: function (jqXHR, textStatus, errorThrown) {
	            console.error("Error fetching login status:", errorThrown);
	        }
	    });
	}
    
    function updateLoginStatus(loginNow) {
	    if (loginNow) {
	        loginDiv.style.display = "block";
	        logoutDiv.style.display = "none";
	    } else if (!loginNow){
	        loginDiv.style.display = "none";
	        logoutDiv.style.display = "block";
	    } else{
	        loginDiv.style.display = "block";
	        logoutDiv.style.display = "none";
	    }
	}
    
	function ajaxReceiveInfo() {
		$.ajax({
			
			url: CONTEXT_PATH + "/EveryWedding/login_info"
			, method: "POST"
			, headers: { "Content-Type": "application/json;charset=UTF-8"}			
			, dataType:"text"
			, success : function(data, textStatus, jqXHR ){
				var jsonData = JSON.parse(data);
				var loginDto = jsonData;  
				console.log("login_id:"+loginDto.user_id);
				updateLoginInfo(loginDto.user_id,loginDto.user_name )
			} 
			, error:function( jqXHR, textStatus, errorThrown ){
	
			}
			
		});
		
	}
	
    function updateLoginInfo(user_id, user_name ) {
		document.getElementById("login-info").value= user_name + "님 (" + user_id + ")";
	}
    

}
	

	

</script>
</head>
<body>    
	<a href="${pageContext.servletContext.contextPath }/EveryWedding/home">
		<img src="/resources/resource/logo2.png" alt="Image"  width="400">
	</a><br>
	
	<!--  -->
	<div id="logout-div">
	
	<form action="${pageContext.servletContext.contextPath }/EveryWedding/login" method="get">
		<button type="submit" id="icon-login">로그인</button>
	</form>
	
		<div class ="main-nav-left"> 
			<a href="#" class="top-menu"><img src="/resources/resource/icon_list.png" alt="Image"  width="60"></a>
			<div class = "sub-menu">
				<ul class = "sub-menu-list">
					<li>
						<div class ="menu">
						<form action="${pageContext.servletContext.contextPath }/EveryWedding/login_complete" method="post">
							아이디<br><input type="text" name="user_id"><br>
							비밀번호<br><input type="password" name="user_pw"><br>
							<input type="hidden" value="1" name="user_type">
							<button type="submit" id="button-style2" >로그인</button>
						</form>
						</div>
						
					</li>
					<li>
					</li>
					<li><a href="${pageContext.servletContext.contextPath }/EveryWedding/authentification">
							
							<span class = "menu">인증</span>
						</a></li>
					<li><a href="${pageContext.servletContext.contextPath }/EveryWedding/mypage">
							<span class = "menu">마이페이지</span>
						</a></li>
				</ul>
			</div>
		</div>
		</div>
		
		
		<div id="login-div" >
		
		<form action="${pageContext.servletContext.contextPath }/EveryWedding/logout" method="post">
			<input type="hidden" name="logout-info" value=""> 
			<button type="submit" id="icon-login">로그아웃</button>
		</form>
	
	
		<div class ="main-nav-left"> 
			<a href="#" class="top-menu"><img src="/resources/resource/icon_list.png" alt="Image"  width="60"></a>
			<div class = "sub-menu">
				<ul class = "sub-menu-list">
					<li>
						<input type="text" id="login-info" disabled>
					</li>
					<li>
					</li>
					<li><a href="${pageContext.servletContext.contextPath }/EveryWedding/authentification">
							<span class = "menu">인증</span>
						</a></li>
					<li><a href="${pageContext.servletContext.contextPath }/EveryWedding/mypage">
							<span class = "menu">마이페이지</span>
						</a></li>
				</ul>
			</div>
		</div>
		</div>
		

</body>
</html>
