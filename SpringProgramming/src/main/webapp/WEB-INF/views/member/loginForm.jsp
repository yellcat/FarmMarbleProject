<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/formboard.css"/>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/login.js"></script>
	<body>
		<div id="bar">
			<div id="part">
				<h4>LOGIN</h4>
			</div>
		</div>
		<form:form id="login" commandName="member">
			<div id=form>
				<span class="title">ID</span>
				<form:input path="id" size="20"/><br/>
				<form:errors path="id"/> <br/>
				<span class="title">PW></span>
				<form:password path="pw" size="20"/><br/>
				<form:errors path="pw"/> <br/>
			</div>
			<div id="btnGroup">
				 <a href="javascript:sendData()">LOGIN</a>
				 <a href="join">JOIN</a>
				 <a href="selectFind">FIND</a>
			</div>
		</form:form>
	</body>
</html>