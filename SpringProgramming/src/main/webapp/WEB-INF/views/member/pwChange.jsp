<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<script type="text/javascript">
		function sendData(){
			document.update.submit();
		}
	</script>
	<body>
		<div id="bar">
			<h4>Password Change</h4><a href="mypage" id="btnCancle"><img id="cancle" src="${pageContext.request.contextPath}/resources/image/character/X.png"></a>
		</div>
		<form:form name="update" commandName="member">
	      <div id="part">
				<span class="title">Current</span>
				<span class="content">
					<form:password id="pw" path="pw" size="20"/>
					<form:errors path="pw"/>
				</span><br/>
				<span class="title">Change</span>
				<span class="content">
					<form:password id="pwChanage" path="pwChange" size="20"/>
					<form:errors path="pwChange"/>
				</span><br/>
				<span class="title">Check</span>
				<span class="content">
					<form:password id="pwCheck" path="pwCheck" size="20"/>
					<form:errors path="pwCheck"/>
				</span><br/>
	      </div>
      </form:form>
      <div id="btnGroup">
      	<a href="javascript:sendData()">SAVE</a>
      </div>
	</body>
</html>