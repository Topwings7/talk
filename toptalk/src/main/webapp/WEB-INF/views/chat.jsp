<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<html>
<head>
<link rel="stylesheet" href="${conPath }/css/chat.css" type="text/css" />
</head>
<body>
	<div id="contentWrap">
		<div id="messages"></div>
		<div class="insert">
			<input type="text" id="sender" value="${sessionScope.id}" style="display: none;"> 
			<input type="text" id="messageinput" placeholder="메세지를 입력하세요" onKeypress="javascript:if(event.keyCode==13){ send(); }"/>
			<button type="button" id="sendBtn" onclick="out()">나가기</button>
		</div>
	</div>
	<script src="${conPath }/js/socketAtion.js"></script>
</body>
</html>