<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<title>Board</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/formboard.css"/>
		<link href='https://fonts.googleapis.com/css?family=Righteous' rel='stylesheet' type='text/css'>
	</head>
	<body>
		<div id="pagedetail">
			<div id="bar">
				<div id="part">
					<h2>FARM'S COMMUNITY</h2>
				</div>
				<a href="list?pageNo=${i}"><img id="cancle" src="${pageContext.request.contextPath}/resources/image/character/X.png"></a>
			</div>
		<h3>W R I T E</h3></br>
		</div>
		
		<form method="post" action="write" enctype="multipart/form-data">
			<div>
				
					<span class="title">WRITER</span>
					<span class="content">${memberId}<input type="hidden" value="${memberId}" name="board_writer"/></span>
					</br>
					<span class="title">TITLE</span>
					<span class="content"><input type="text" name="board_title"/></span>
					</br>
					<span class="title">CONTENT</span>
					</br>
					<span class="content"><textarea name="board_content" rows="5" cols="50"></textarea></span>
					
					
					
				<br/>
					<div id="buttonGroup">
						
						<input type="submit" value="SAVE"/>
						<input type="reset" value="RESET"/>
						<a href="list?pageNo=${i}">BACK</a>
					</div>
				
			</div>
		</form>
	</body>
</html>
