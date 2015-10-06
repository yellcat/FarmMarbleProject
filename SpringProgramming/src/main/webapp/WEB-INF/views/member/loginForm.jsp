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
			$.ajax({
				url:"loginCheck",
				method:"POST",
				data:{"id": id, "pw":pw},
				success:function(data){
					console.log(data);
					var result = data.trim();
					if(result == "wrong_id"){
						alert("id가 존재하지 않습니다");
						$("#login").reset();
					}else if(result=="wrong_pw"){
						alert("비밀번호가 틀렸습니다");
						$("#login").reset();
					}else if(result=="success"){
						$("#login").submit();
					}
				}
			});
		}
    </script>
	<body>
		<h4>LOGIN</h4>
		<hr/>
		<form:form id="login" commandName="member">
			ID
			<form:input path="id" size="20"/>
			<form:errors path="id"/> <br/>
			PW
			<form:password path="pw" size="20"/>
			<form:errors path="pw"/> <br/>

			<div id="btnGroup">
				 <a href="javascript:sendData()">LOGIN</a>
				 <a href="join">JOIN</a>
				 <a href="selectFind">FIND</a>
			</div>
		</form:form>
	</body>
</html>