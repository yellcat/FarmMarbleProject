<%@ page contentType="text/html; charset=UTF-8"%>
	
<!DOCTYPE html>
<html>
	<head>
		<title>Board</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/formboard.css"/>
		<link href='https://fonts.googleapis.com/css?family=Righteous' rel='stylesheet' type='text/css'>
		<title>Insert title here</title>
		<style type="text/css">
			body {
				font-family: "돋움";
				font-size: 12px;
				color: white;
			}
			span {
				display: inline-block;
				margin: 2px 10px;
			}
			
			span.title {
				margin: 2px 10px;
				border: 1px solid darkgray;
				background: lightgray;
				width: 70px;
				text-align: center;
				color: black;
			}
			
			pre {
				margin: 10px;
				border: 1px solid darkgray;
				padding: 10px;
				width: 90%;
				height: 100px;
				font-size: 12px;
			}
			
			#part1 {
				display: flex;
			}
			#part1_1 {
				flex: 1;
			}
			#part1_2 {
				width: 120;
				margin-right: 10px;
				text-align: center;
			}
			#part1_2 img {
				display: block;
				padding: 10px;
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
		</style>
	</head>
	<script type="text/javascript">
	function idcheck() {
		var wid=$("#board_writer").val();
		var mid=$("#memberId").val();
		if(wid==mid){
			$("#sameiduse").show();
		}
	}
	idcheck();
	</script>
	
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
			<a id="sameiduse" href="updateForm?bno=${board.board_no}">수정</a>
			<a id="sameiduse" href="delete/${board.board_no}">삭제</a>
		</div>		
	</body>
</html>







