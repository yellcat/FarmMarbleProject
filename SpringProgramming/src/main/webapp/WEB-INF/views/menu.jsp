<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
	<head>
		<title>Menu</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/formdetail.css"/>
		<script type="text/javascript">
		parent.aIframSize();
		</script>
	</head>
	<body>
		<div id="menu">
					<ul>
						<li><a href="${pageContext.request.contextPath}/member/mypage" onclick="parent.bIframSize()">MY PAGE</a></li>
						<li><a href="${pageContext.request.contextPath}/game/game" onclick="parent.cIframSize()">GAME</a></li>
						<li><a href="${pageContext.request.contextPath}/board/list" onclick="parent.bIframSize()">COMUNNITY</a></li>
						<li><a href="${pageContext.request.contextPath}/information" onclick="parent.aIframSize()">INFORMATION</a></li>
						<li id="logout"><a href="${pageContext.request.contextPath}/member/logout">LOGOUT</a></li>
					</ul>
				</div>
	</body>
</html>
