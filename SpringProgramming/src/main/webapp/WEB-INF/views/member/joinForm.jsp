<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/formdetail.css"/>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript">
	function idCheck(){
		var id = $("#id").val();
		console.log(id);
		$.ajax({
			url:"idCheck",
			method:"POST",
			data:{"id":id},
			success:function(data){
				console.log(data);
				var result = data.trim();
				if(result == "able"){
					alert("사용 가능한 ID입니다");
				}else if(result=="unable"){
					alert("사용 불가능한 ID입니다");
					$("#join")[0].reset();
				}
			}
		});
	};
	function sendData(){
		if($("#pw").val()!=$("#pwCheck").val()){
			alert("Password is not correct.");
			return;
		}
		$("#join").submit();
	}
	</script>
	<body>
		<div id="bar">
			<div id="part">
				<h4>JOIN</h4>
			</div>
		</div>
		<form:form id="join" commandName="member">
			<div class="title">
				<h4>ID</h4>
			</div>
			<form:input path="id" id="id" size="20"/><form:errors path="id"/>
			<a id="button" href="javascript:idCheck()">ID중복체크</a> <br/><br/>
			<span class="title"><h4>NAME</h4></span> <br/>
			<form:input path="name" size="20"/> <br/>
			<form:errors path="name"/> <br/>
			<span class="title"><h4>PW</h4></span><br/>
			<form:password id = "pw" path="pw" size="20"/> (4~12)<br/>
			<form:errors path="pw"/> <br/>
			<span class="title"><h4>PW check</h4></span><br/>
			<input type="password" id = "pwCheck" path="pw" size="20"/> <br/>

			<div id="btnGroup">
				<a href="javascript:sendData()">JOIN</a>
				<a id="btnCancle" href="login">CANCLE</a>
			</div>

		</form:form>
		
	</body>
</html>