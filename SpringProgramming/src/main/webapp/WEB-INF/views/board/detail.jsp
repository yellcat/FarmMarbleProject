<%@ page contentType="text/html; charset=UTF-8"%>
	
<!DOCTYPE html>
<html>
	<head>
		<title>Board</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/formboard.css"/>
		<link href='https://fonts.googleapis.com/css?family=Righteous' rel='stylesheet' type='text/css'>
		<script type="text/javascript">
	window.onload=function() {
		var wid=document.getElementById("#board_writer").value;
		var mid=document.getElementById("#memberId").value;
		if(wid==mid){
			document.getElementById("#sameiduse").style.display = "none";
		}
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
		
		<div id="buttonGroup">
			<a href="list?pageNo=${i}">목록</a>
			<div id="sameiduse" name="sameiduse">
			<a href="updateForm?bno=${board.board_no}">수정</a>
			<a href="delete/${board.board_no}">삭제</a>
			</div>
		</div>		
	</body>
</html>







