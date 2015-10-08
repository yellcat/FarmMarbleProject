<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
	<head>
		<title>Menu</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/formdetail.css"/>
	</head>
	<body>
		<div id="menu">
					<ul>
						<li><a href="${pageContext.request.contextPath}/member/mypage" onclick="parent.changIframSize(1000, 800)">MY PAGE</a></li>
						<li><a href="${pageContext.request.contextPath}/game/game">GAME</a></li>
						<li><a href="${pageContext.request.contextPath}/board/list" onclick="parent.changIframSize(1000, 800)">COMUNNITY</a></li>
						<li><a href="${pageContext.request.contextPath}/information">INFORMATION</a></li>
						<li id="logout"><a href="${pageContext.request.contextPath}/member/logout">LOGOUT</a></li>
					</ul>
				</div>
	</body>
</html>
