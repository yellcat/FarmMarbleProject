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
				<a href="menu"><img id="cancle" src="${pageContext.request.contextPath}/resources/image/character/X.png"></a>
			</div>
		<h3>W R I T E</h3></br>
		
		<form method="post" action="write" enctype="multipart/form-data">
			<table>
				<tr>
					<td>WRITER</td>
					<td>${member.nickName}</td>
				</tr>
				<tr>
					<td>TITLE</td>
					<td><input type="text" name="title"/></td>
				</tr>
				<tr>
					<td>CONTENT</td>
					<td><textarea name="content" rows="5" cols="50"></textarea></td>
				</tr>
				<tr>
					<td>첨부파일</td>
					<td><input type="file" name="attach" value="첨부파일"/></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<br/>
						<input type="submit" value="SAVE"/>
						<input type="reset" value="RESET"/>
						<a href="list?pageNo=${i}">BACK</a>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
