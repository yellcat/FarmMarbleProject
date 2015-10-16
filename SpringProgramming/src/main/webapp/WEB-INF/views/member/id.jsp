<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Login</title>
	</head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/formdetail.css"/>
	
	<body>
		<div id="pagewrapper">
			<div id="bar">
				<div id="part">
				<h4>ID</h4></div>
			</div>
			<div class="title">memberId : ${id}</div>
			 <br/>
			<div id="btnGroup">
				<a href="login">LOGIN</a>
				<a href="pwFind">Find PW</a>
			</div>
		</div>
	</body>
</html>