<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
	<head>
		<title>Home</title>
		<link rel="stylesheet" href="resources/css/form.css"/>
		<script type="text/javascript">
			function aIframSize() {
				var iframe = document.querySelector("#iframe");
				var pagehome = document.querySelector("#pagehome");
				iframe.style.width = "600px";
				iframe.style.height = "400px";
				pagehome.style.margin = "-200px 0 0 -300px";
			}
			function bIframSize() {
				var iframe = document.querySelector("#iframe");
				var pagehome = document.querySelector("#pagehome");
				iframe.style.width =  "800px";
				iframe.style.height = "500px";
				pagehome.style.margin = "-250px 0 0 -400px";
			}
			function cIframSize() {
				var iframe = document.querySelector("#iframe");
				var pagehome = document.querySelector("#pagehome");
				iframe.style.width =  "1200px";
				iframe.style.height = "700px";
				pagehome.style.margin = "-350px 0 0 -600px";
			}
		</script>
	</head>
	
	<body>
		<div id="pagehome">
			<div id="content">
				
					<iframe id="iframe" name="iframe" src="member/login" height="100%" width="100%"></iframe>
				
			</div>
		</div>
	</body>
	
</html>
