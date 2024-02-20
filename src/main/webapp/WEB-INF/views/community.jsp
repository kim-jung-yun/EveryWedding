<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script>
$(window).on("load resize ", function() {
	  var scrollWidth = $('.tbl-content').width() - $('.tbl-content table').width();
	  $('.tbl-header').css({'padding-right':scrollWidth});
	}).resize();
</script>
<style type="text/css">
	h1{
	  font-size: 30px;
	  color: #000;
	  text-transform: uppercase;
	  font-weight: 300;
	  text-align: center;
	  margin-bottom: 15px;
	}
	table{
	  width:100%;
	  table-layout: fixed;
	}
	.tbl-header{
	  background-color: rgba(234, 199, 204,0.3);
	 }
	.tbl-content{
	  height:300px;
	  overflow-x:auto;
	  margin-top: 0px;
	  border: 1px solid rgba(234, 199, 204,0.3);
	}
	
	th{
	  padding: 20px 15px;
	  text-align: center;
	  font-weight: 500;
	  font-size: 15px;
	  color: #b07f86;
	  text-transform: uppercase;
	}
	td{
	  padding: 15px;
	  text-align: left;
	  vertical-align:middle;
	  font-weight: 300;
	  font-size: 13px;
	  color: #000;
	  border-bottom: solid 1px rgba(255,255,255,0.1);
	}
	
	
	/* demo styles */
	
	@import url(https://fonts.googleapis.com/css?family=Roboto:400,500,300,700);
	body{
	  background: -webkit-linear-gradient(left, #25c481, #25b7c4);
	  background: linear-gradient(to right, #ffffff, #fff0fe );
	  font-family: 'Roboto', sans-serif;
	}
	section{
	  
	  margin: 50px;
	}
	
	
	/* follow me template */
	.made-with-love {
	  margin-top: 40px;
	  padding: 10px;
	  clear: left;
	  text-align: center;
	  font-size: 10px;
	  font-family: arial;
	  color: #000;
	}
	.made-with-love i {
	  font-style: normal;
	  color: #F50057;
	  font-size: 14px;
	  position: relative;
	  top: 2px;
	}
	.made-with-love a {
	  color: #000;
	  text-decoration: none;
	}
	.made-with-love a:hover {
	  text-decoration: underline;
	}
	
	
	/* for custom scrollbar for webkit browser*/
	
	::-webkit-scrollbar {
	    width: 6px;
	} 
	::-webkit-scrollbar-track {
	    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
	} 
	::-webkit-scrollbar-thumb {
	    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
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
	<section>
	  <!--for demo wrap-->
	  <h1>커뮤니티</h1>
	  <div class="tbl-header">
	    <table cellpadding="0" cellspacing="0" border="0">
	      <thead>
	        <tr>
	          <th style="width: 80px;">글번호</th>
	          <th style="width: 180px;">제목</th>
	          <th>내용</th>
	          <th style="width: 120px;">글쓴이</th>
	        </tr>
	      </thead>
	    </table>
	  </div>
	  <div class="tbl-content">
	    <table cellpadding="0" cellspacing="0" border="0">
	      <tbody>
	      <c:forEach var="item" items="${cList}">
	      	<tr>
	          <td style="width: 50px;">${item.getCommunity_seq() }</td>
	          <td style="width: 300px;">${item.getCommunity_name() }</td>
	          <td>${item.getCommunity_content() }</td>
	          <td style="width: 120px;">${item.getUser_id() }</td>
	        </tr>
	      </c:forEach>

	      </tbody>
	    </table>
	  </div>
	</section>
	
	
	<!-- follow me template -->
	<div class="made-with-love">
	  Made with
	  <i>♥</i> by
	  <a target="_blank" href="https://codepen.io/nikhil8krishnan">Nikhil Krishnan</a>
	</div>


</body>
</html>