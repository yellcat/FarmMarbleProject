<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<title>Board</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/formboard.css"/>
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








