<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html>
	<head>
		<title>Board</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/formboard.css"/>
		<link href='https://fonts.googleapis.com/css?family=Righteous' rel='stylesheet' type='text/css'>
		<script type="text/javascript">
	window.onload=function() {
		var wid=document.querySelector("#board_writer");
		var mid=document.querySelector("#memberId");
		if(wid.value!=mid.value){
			document.querySelector("#sameiduse").style.display = "none";
		}
	}
	
	function sendcomment() {		
		document.comment.submit();
	}
	</script>
	
	</head>
	
	<body>
		<div id="pagedetail">
			<div id="bar">
				<div id="part">
					<h2>FARM'S COMMUNITY</h2>
				</div>
				<a href="list?pageNo=${i}"><img id="cancle" src="${pageContext.request.contextPath}/resources/image/character/X.png"></a>
			</div>
		<h3>${board.board_title}</h3></br>
		<div id="part1">
			<div id="part1_1">	
				<span class="title">번호:</span> 
				<span class="content">${board.board_no}</span> <br/>
				
				<span class="title">제목:</span> 
				<span class="content">${board.board_title}</span> <br/>
				
				<span class="title">글쓴이:</span> 
				<span class="content">${board.board_writer}</span> <br/>
				<input type="hidden" value="${board.board_writer}" id="board_writer" name="board_writer"/>
				<input type="hidden" value="${memberId}" id="memberId" name="memberId"/>
				
				<span class="title">날짜:</span> 
				<span class="content">${board.board_date}</span> <br/>
				
				<span class="title">조회수:</span> 
				<span class="content">${board.board_hitcount}</span> <br/>
				
				<span class="title">첨부:</span> 
				<span class="content">${board.board_original_file_name}</span> <br/>
			</div>
			
			<div id="part1_2">
				<img src="${pageContext.request.contextPath}/resources/uploadfiles/${board.board_file_system_name}" width="100px" height="100px"/>
				<button>다운로드</button>
			</div>
		</div>
		
		<div id="part2">
			<span class="title">내용:</span> <br/>
			<pre>${board.board_content}</pre>
		</div>
		
		<div id="part3-1">
			<table border="1">				
					<tr>
						<th style="width:60px">WRITER</th>
						<th>CONTENT</th>
						<th style="width:80px">DATE</th>						
					</tr>				
					
					<c:forEach var="comment" items="${list}">
						<tr>
							<td>${comment.writer}</td>
							<td>${comment.content}</td>							
							<td>${comment.date}</td>							
						</tr>
					</c:forEach>			
			</table>
			
			<div id="part3-2">
				<form id="comment" name="comment" method="post" action="../comment/writeComment">
					<input id="cmcontent" type="text" name="cmcontent" placeholder="댓글을 작성하세요" width="100px" size="20"/><br/>
					<input id="boardNo" type="hidden" name="boardNo" value="${board.board_no}"/><br/>				
				</form>				
				<a href="javascript:sendcomment()">SAVE</a>
			</div>
		</div>		
		
		<div id="buttonGroup">
			<a href="list?pageNo=${i}">목록</a>
			<div id="sameiduse" name="sameiduse">
			<a href="updateForm?bno=${board.board_no}">수정</a>
			<a href="delete/${board.board_no}">삭제</a>
			</div>
		</div>		
	</body>
</html>







