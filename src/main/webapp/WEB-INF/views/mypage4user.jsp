<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous">
</script>
<script>
$(window).ready(function() {
	  var typingBool = false;
	  var typingIdx = 0;
	  var typingTxt = $(".typing-txt").text(); // 타이핑될 텍스트를 가져온다
	  typingTxt = typingTxt.split(""); // 한글자씩 자른다.
	  if (typingBool == false) {
	    // 타이핑이 진행되지 않았다면
	    typingBool = true;

	    var tyInt = setInterval(typing, 100); // 반복동작
	  }

	  function typing() {
	    if (typingIdx < typingTxt.length) {
	      // 타이핑될 텍스트 길이만큼 반복
	      $(".typing").append(typingTxt[typingIdx]); // 한글자씩 이어준다.
	      typingIdx++;
	    } else {
	      clearInterval(tyInt); //끝나면 반복종료
	    }
	  }
	});
</script>
<style>
	@charset "utf-8";
	
	p.typing-txt {
	  display: none;
	}
	
	.typing {
	  /*       position: absolute;*/
	  display: inline-block;
	  animation-name: cursor;
	  animation-duration: 0.3s;
	  animation-iteration-count: infinite;
	  border-right: 1px solid #ccc;
	}
	
	@keyframes cursor {
	  0% {
	    border-right: 1px solid #fff;
	  }
	  50% {
	    border-right: 1px solid #000;
	  }
	  100% {
	    border-right: 1px solid #fff;
	  }
	}

</style>
</head>
</head>

<body>

	<p class="typing-txt">안녕하세요.</p> 
	<p class="typing"></p> 
	  
</body>
</html>


