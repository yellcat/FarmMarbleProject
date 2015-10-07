<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
      <h4>mypage</h4><a href="../menu" id="btnCancle">X</a>
      <div id="part1">
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
	</body>
</html>