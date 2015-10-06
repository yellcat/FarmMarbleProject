<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>
	<head>
		<meta charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<div id="pager">			
			<a href="list?pageNo=1">[처음]</a>
			
			<c:if test="${groupNo>1}">
				<a href="list?pageNo=${startPageNo-pagesPerGroup}">[이전]</a>	
			</c:if>					
			
			<c:forEach var="i" begin="${startPageNo}" end="${endPageNo}">
				<a class="pageNo <c:if test="${pageNo==i}">selected</c:if>" href="list?pageNo=${i}">${i}</a>
			</c:forEach>			
			
			<c:if test="${groupNo<totalGroupNo}">
				<a href="list?pageNo=${endPageNo+1}">[다음]</a>	
			</c:if>	
					
			<a href="list?pageNo=${totalPageNo}">[맨끝]</a>
		</div>
		
		<table border="1">			
			<c:forEach var="comment" items="${list}">
				<tr>									
					<td style="width:50px">${comment.writer}</td>					
					<td>${comment.content}</td>
					<td style="width:70px">${comment.date}</td>
				</tr>
			</c:forEach>
		</table>
		
		<form method="post" action="comment.jsp">
			<table border="1">
				<tr>
					<td>${member.nickName}</td>
					<td><input type="text" name="comment"></td>
					<td><input type="submit" name="btn" value="쓰기"></td>
				</tr>
			</table>		
		</form>
	</body>
</html>