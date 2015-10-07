<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/form_basic.css"/>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript">
	function sendData(){
		var id = $("#id").val();
		var pw = $("#pw").val();
		$.ajax({
			url:"loginCheck",
			method:"POST",
			data:{"id":id, "pw":pw},
			success:function(data){
				console.log(data);
				var result = data.trim();
				if(result == "success"){
					$("#login").submit();
				}else if(result=="wrong_id"){
					alert("Non id");
				}else if(result=="wrong_pw"){
					alert("Non password");
				}
			}
		});
	}
	</script>
	<body>
	<div id="bar">
		<h4>LOGIN</h4>
	</div>
		<form:form id="login" commandName="member">
			ID
			<form:input path="id" size="20"/><br/>
			<form:errors path="id"/> <br/>
			PW
			<form:password path="pw" size="20"/><br/>
			<form:errors path="pw"/> <br/>

			<div id="btnGroup">
				 <a href="javascript:sendData()">LOGIN</a>
				 <a href="join">JOIN</a>
				 <a href="selectFind">FIND</a>
			</div>
		</form:form>
	</body>
</html>