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
		<div id="part"><h4>PW FIND</h4></div>	
	</div>
		<form:form id="Find" commandName="member">
			<div class="title">ID</div>
			<form:input path="id" size="20"/>
			<br/>
			<div class="title">E-mail</div>
			<form:input path="email" size="20"/>
			<br/>
			
			<div id="btnGroup">
				<a href="javascript:sendData()">FIND</a>
				<a id="btnCancle" href="selectFind">CANCLE</a>
			<br/>
			</div>
			
			<form:errors path="email"/>
		</form:form>
	</body>
</html>