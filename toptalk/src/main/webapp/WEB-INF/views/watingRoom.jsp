<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>wat</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
	
<script>
	$(function(){
		$("#btn1").click(function(){
			location.href="${conPath}/createRoom?id=${param.id}";
			/* $.ajax({
				url : "${conPath}/createRoom",
				success : function(rs){
					var list = rs;
					$("#result").children().remove();
					for( i = 0 ; i < list.length ; i++) {
						var button1 = "<button onclick='location.href=\"${conPath}/enterRoom?roomNumber="+list[i]+"\"'>입장하기</button>"
						var button2 = "<button onclick='javascript:$(this).parent().remove()'>방삭제</button>";
						//var button2 = "<button onclick='location.href=\"${conPath}/deleteRoom?roomNumber="+list[i]+"\"'>입장하기</button>"
						//; location.href=\"${conPath}/deleteRoom?roomNumber="+i+"\"'
						var text = "<li>" + list[i] + "번방 "+ button1 + button2 +" </li>"; 
						$("#result").append(text);
					}
				}
			}) */
		})
		$("#btn2").click(function(){
			if ( ${roomList.size() != 0} ) {
				location.href="${conPath}/deleteRoom?roomNumber=${roomList.size()}&id=${param.id}";
			} else {
				alert("현재개설된방이없습니다"); 
			}
		});
	}) 
</script>
</head>
<body>

	<div>
		<h1>대기실</h1>
		<hr>
	</div>
	<div>
		<button id="btn1">방생성</button>
		<button id="btn2">방삭제</button>
	</div>
	<div id="room">
		<ul id="result">
		<c:if test="${roomList.size() == 0 }">
			<li>현재 개설된 방이 없습니다</li>
		</c:if>
		<c:if test="${rommList.size() != 0 }">
			<c:forEach var="room" items="${roomList }">
				<li> 
				${room}번방  <button onclick="location.href='${conPath}/enterRoom?roomNumber=${room }'" >입장하기</button> 
				</li>
			</c:forEach>
		</c:if>
		</ul>
	</div>
</body>
</html>