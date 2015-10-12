<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
				<a href="../menu"><img id="cancle" src="${pageContext.request.contextPath}/resources/image/character/X.png"></a>
			</div>
		<h3>L I S T</h3></br>
		
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
					<td>${board.board_no}</td>
					<td><a class="contenttitle" href="detail?boardNo=${board.board_no}">${board.board_title}</a></td>
					<td>${board.board_writer}</td>
					<td>${board.board_date}</td>
					<td>${board.board_hitcount}</td>
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
		</div>
		
	</body>
</html>








