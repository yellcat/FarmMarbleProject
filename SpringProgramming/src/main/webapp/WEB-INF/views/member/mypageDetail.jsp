<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/formdetail.css"/>
	<body>
		<div id="bar">
     		<h4>mypage</h4><a href="../menu" id="btnCancle"><img id="cancle" src="${pageContext.request.contextPath}/resources/image/character/X.png"></a>
     	 </div>
      <div id="part">
        <span class="title">ID</span>
        <span class="content">${member.id}</span><br/>
		<span class="title">NAME</span>
        <span class="content">${member.name}</span><br/>
        <span class="title">NICKNAME</span>
        <span class="content">${member.nickName}</span><br/>
        <span class="title">TEL</span>
        <span class="content">${member.tel}</span><br/>
        <span class="title">Email</span>
        <span class="content">${member.email}</span><br/>
      </div>
      <div id="btnGroup">
	     <a href="ranking">RANKING</a>
     	 <a href="mypageUpdate">UPDATE</a>
     	 <a href="pwChange">PW Change</a>
      </div>
	</body>
</html>