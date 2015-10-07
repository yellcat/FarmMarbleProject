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
			<h4>mypage</h4><a href="mypage" id="btnCancle"><img id="cancle" src="${pageContext.request.contextPath}/resources/image/character/X.png"></a>
		</div>
		<form:form name="update" commandName="member">
	      <div id="part1">
		        <span class="title">ID</span>
		        <span class="content">
		        	<form:input path="id" size="20"/>
				</span><br/>
				<span class="title">NAME</span>
				<span class="content">
					<form:input path="name" size="20"/>
				</span><br/>
				<span class="title">NICKNAME</span>
				<span class="content">
					<form:input path="nickName" size="20"/>
				</span><br/>
				<span class="title">TEL</span>
				<span class="content">
					<form:input path="tel" size="20"/>
				</span><br/>
				<span class="title">Email</span>
	            <span class="content">
					<form:input path="email" size="20"/>
				</span><br/>
	      </div>
      </form:form>
      <div id="btnGroup">
      	<a href="javascript:sendData()">SAVE</a>
      </div>
	</body>
</html>