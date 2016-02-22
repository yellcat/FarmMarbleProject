<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/formboard.css"/>
		<link href='https://fonts.googleapis.com/css?family=Righteous' rel='stylesheet' type='text/css'>
	</head>
	
	<body>
		<div id="pagedetail">
			<div id="bar">
	            <div id="part">
	               <h2>게시글 수정하기</h2>
	            </div>
            	<a href="detail?boardNo=${board.board_no}"><img id="cancle" src="${pageContext.request.contextPath}/resources/image/character/X.png"></a>
            </div>
			
			<div id="pagewrapper">
				<form id="modifyForm" name="modifyForm" method="post" action="update">		
					<span class="title">번호:</span> 
					<span class="content">${board.board_no}</span> 
					<input type="hidden" name="board_no" value="${board.board_no}"/><br/>
					
					<span class="title">제목:</span> 
					<input id="title" type="text" name="board_title" value="${board.board_title}"/> <br/>
					
					<span class="title">글쓴이:</span> 
					<span class="content">${board.board_writer}</span> <br/>
					
					<span class="title">날짜:</span> 
					<span class="content">${board.board_date}</span> <br/>
					
					<span class="title">조회수:</span> 
					<span class="content">${board.board_hitcount}</span> <br/>
					
					<span class="title">첨부파일:</span>
					<div id="part1_2">
				            <img src="../resources/uploadfiles/${board.board_file_system_name}" height="150px"/>
				    </div>
							
					<span class="title">내용:</span> <br/>
					<textarea name="board_content" cols="80" rows="5" >${board.board_content}</textarea>
	
				</form>
			</div>
			<div id="detailButtonGroup">
				<a href="javascript:sendData()">수정</a>
			</div>
		</div>		
	</body>
</html>
