<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
	<head>
		<title>Menu</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/form.css"/>
	</head>
	
	<body>
		<div id="menu">
					<ul>
						<li><a href="member/mypage">MY PAGE</a></li>
						<li><a href="game/game">GAME</a></li>
						<li><a href="board/list">COMUNNITY</a></li>
						<li><a href="game/information">INFORMATION</a></li>
						<li><a id="logout" href="member/logout">LOGOUT</a></li>
					</ul>
				</div>
	</body>
</html>
