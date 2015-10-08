<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
	<head>
		<title>Home</title>
		<link rel="stylesheet" href="resources/css/form.css"/>
		<script type="text/javascript">
			function changIframSize(width, height) {
				var iframe = document.querySelector("#iframe");
				iframe.style.width = width + "px";
				iframe.style.height = height + "px";
				
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
