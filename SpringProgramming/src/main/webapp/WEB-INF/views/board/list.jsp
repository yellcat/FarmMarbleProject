<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
			body {
				color: white;
				text-align: center;
			}
			h3{
				width: 900px;
				line-height: 30px;
				text-decoration: none;
				font-size: medium;
				border: none;
				border-radius: 20px;
				background-color: rgb(136,101,57);
				font-weight: bold;
			}
			h4{
				color:rgb(174,162,44);
				font-size: medium;
				font-weight: bold;
			}
			
			table {
				color: rgb(136,101,57);
				width: 100%;
				border-collapse: collapse;
				font-size: small;
			}
			table, th, td {
				border: 1px solid white;
			}
			th {
				background-color: orange;
				color: black;
			}
			
			#buttonGroup {
				margin: 10px;
				text-align: center;
			}
			
			#buttonGroup a {
				display:inline-block;
				width: 70px;
				line-height: 30px;
				text-decoration: none;
				font-size: small;
				color: white;
				border: 1px solid darkgray;
				background-color: gray;
				font-weight: bold;
			}
			
			#buttonGroup a:hover {
				color: black;
				background-color: lightgray;
			}
			
			#pager {
				margin-top: 5px;
				text-align: center;
				font-size: small;
			}
			
			#pager a {
				text-decoration: none;
				color: white;
			}
			
			#pager a:hover {
				color: orange;
			}
			
			#pager a.pageNo {
				margin-left: 5px;
				margin-right: 5px;
			}
			
			#pager a.pageNo.selected {
				color: aqua;
			}
			
			.title {
				text-decoration: none;
				color: white;
			}	
			.title:hover {
				color: orange;
			}
		</style>
	</head>
	
	<body>
		<h3>FARM'S COMMUNITY</h3>
		
		<h4>LIST</h4>
		
		<table>
			<tr>
				<th style="width:50px">NO</th>
				<th>TITLE</th>
				<th style="width:60px">WRITER</th>
				<th style="width:80px">DATE</th>
				<th style="width:60px">VIEW</th>
			</tr>
			
			<c:forEach var="board" items="${list}">
				<tr>
					<td>${board.no}</td>
					<td><a class="title" href="detail?boardNo=${board.no}">${board.title}</a></td>
					<td>${board.writer}</td>
					<td>${board.date}</td>
					<td>${board.hitcount}</td>
				</tr>
			</c:forEach>
		</table>
		
		<div id="pager">
			<a href="list?pageNo=1">[FIRST]</a>
			
			<c:if test="${groupNo>1}">
				<a href="list?pageNo=${startPageNo-pagesPerGroup}">[previous]</a>
			</c:if>
			
			<c:forEach var="i" begin="${startPageNo}" end="${endPageNo}">
				<a class="pageNo <c:if test="${pageNo==i}">selected</c:if>" 
				   href="list?pageNo=${i}">${i}</a>
			</c:forEach>
			
			<c:if test="${groupNo<totalGroupNo}">
				<a href="list?pageNo=${endPageNo+1}">[NEXT]</a>
			</c:if>		
	
			<a href="list?pageNo=${totalPageNo}">[LAST]</a>
		</div>		
		
		<div id="buttonGroup">
			<a href="write">WRITE</a>
		</div>
	</body>
</html>








