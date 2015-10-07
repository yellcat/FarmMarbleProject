<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
	<head>
		<title>Menu</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/formdetail.css"/>
		<link href='https://fonts.googleapis.com/css?family=Righteous' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
	</head>
	<style>
		#info{
			text-align: center;
			font-family: 'Righteous', cursive;
		}
		#developer{
			font-family: 'Kaushan Script', cursive;
		}
		#type{
			font-weight:700;
		}
	</style>
	<body>
			<div id=info>
				<div id="bar">
				<h4>information</h4> <a href="menu">X</a>
				<hr/>
				</div>
				<div id="logo">
					<br/>
					<br/>
					<p><h1>Farm
					<img height="30px" width="30px" src="${pageContext.request.contextPath}/resources/image/character/logo.png">
					Marble</h1></p>
					<p>Created By Team5</p>
					<br/>
				</div>
				<div id="developer">
					<p>Egg_kim, Jamong_Jang, DamiC, Jyoung_Ahn</p>
					<br/>
					<br/>
				</div>
				<div id="type">
					<p>Version 0.0</p>
					<p>Update Date: 2015.10.07</p>
				</div>
			</div>
	</body>
</html>
