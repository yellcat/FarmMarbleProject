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
			alert("비밀번호가 일치하지 않습니다");
			return;
		}
		$("#join").submit();
	}
	</script>
	<body>
		<h4>JOIN</h4>
		<hr/>
		<form:form id="join" commandName="member">
			ID
			<form:input path="id" id="id" size="20"/><a href="javascript:idCheck()">ID중복체크</a><br/>
			<form:errors path="id"/> <br/>
			Name
			<form:input path="name" size="20"/> <br/>
			<form:errors path="name"/> <br/>
			PW(4~12자)
			<form:password id = "pw" path="pw" size="20"/> <br/>
			<form:errors path="pw"/> <br/>
			PW check
			<form:password id = "pwCheck" path="pw" size="20"/> <br/>

			<div id="btnGroup">
				<a href="javascript:sendData()">JOIN</a>
				<a id="btnCancle" href="login">CANCLE</a>
			</div>

		</form:form>
		
	</body>
</html>