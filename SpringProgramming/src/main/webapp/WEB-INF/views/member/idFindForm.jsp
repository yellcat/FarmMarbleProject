<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript">
		function sendData(){
			$("#Find").submit();
		}
    </script>
	<body>
		<div id="bar">
			<h4>ID FIND</h4>
		</div>
		<form:form id="Find" commandName="member">
			NAME
			<form:input path="name" size="20"/>
			<form:errors path="name"/> <br/>
			E-mail
			<form:input path="email" size="20"/>
			<form:errors path="email"/> <br/>

			<div id="btnGroup">
			<a href="javascript:sendData()">FIND</a>
			<a id="btnCancle" href="selectFind">CANCLE</a>
		</div>
		</form:form>
	</body>
</html>