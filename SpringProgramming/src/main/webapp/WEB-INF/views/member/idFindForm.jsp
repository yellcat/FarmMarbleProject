<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/formdetail.css"/>
	<script src="${pageContext.request.contextPath}/resources/js/submit.js"></script>
	<body>
		<div id="bar">
			<div id="part"><h4>ID FIND</h4></div>
		</div>
		<form:form name="form" commandName="member">
			<div class="title">NAME</div>
			<form:input path="name" size="20"/><br/>
			<span class="title">E-mail</span>
			<form:input path="email" size="20"/><br/>

			<div id="btnGroup">
				<a href="javascript:sendData()">FIND</a>
				<a id="btnCancle" href="selectFind">CANCLE</a>
			</div>
			<br/>
			<form:errors path="email"/>
		</form:form>
	</body>
</html>