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
		#pagewrapper]{
			text-align: center;
			font-family: 'Righteous', cursive;
		}
		#bar{
			display:flex;
			margin: 40px;
			border: none;
			border-radius: 15px;
			background-color: rgb(136,101,57);
		}
		#part{
			display:inline-block;
			flex:1;
			color:white;
		}
		#cancle{
			height:30px;
			width:30px;
		}
		#developer{
			font-family: 'Kaushan Script', cursive;
		}
		#type{
			font-weight:700;
		}
	</style>
	<body>
		<div id=pagewrapper>
			<div id="bar">
				<div id="part">
					<h2>information</h4>
				</div>
				<a href="menu"><img id="cancle" src="${pageContext.request.contextPath}/resources/image/character/X.png"></a>
			</div>
			<div id="logo">
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
