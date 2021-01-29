<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<html>
<head>
<link rel="stylesheet" href="${conPath }/css/login.css" type="text/css" />
<title>Toptalk</title>
</head>
<div class="login">
	<img src="${conPath }/css/logo.png" style="width: 700px ' ' height:300px'">
	<form action="${conPath }/watingRoom" method="get">
		<div id=in>
			<input type="text" name="id" placeholder="대화명 입력" class=input>
		</div>
		<div>
			<button id="btn" type="submit">입장</button>
		</div>
	</form>
</div>
</html>
s
