<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	<div id="bar">
      <h4>ranking</h4><a href="mypage" id="btnCancle"><img id="cancle" src="${pageContext.request.contextPath}/resources/image/character/X.png"></a>
    </div>
      <div id="part">
        <span class="title">WIN</span>
        <span class="content">${member.win}</span><br/>
		<span class="title">LOSE</span>
        <span class="content">${member.lose}</span><br/>
        <span class="title">winningRATE</span>
        <span class="content">${member.rate}</span><br/>
      </div>
	</body>
</html>