<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<title>Board</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/formboard.css"/>
		<link href='https://fonts.googleapis.com/css?family=Righteous' rel='stylesheet' type='text/css'>
		<script type="text/javascript"
		src='${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js'></script>
		<script src="//code.jquery.com/jquery-1.10.2.js"></script>
		<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
		<script>
		$(function() {
			// Variable to store your files
			var files;
			// Add events
			$('#attach').on('change', prepareUpload);
			// Grab the files and set them to our variable
			function prepareUpload(event) {
				files = event.target.files;
			 
				var data = new FormData();
				$.each(files, function(key, value) {
				    data.append("attach", value);
				});
			  	console.log("실행 되나");
				$.ajax({
				      url: 'preaddPhoto',
				      type: 'POST',
				      data: data,
				      cache: false,
				      dataType: 'json',
				      processData: false, 
				      contentType: false,
				      success: function(data) {
				          $("#photo").attr("src", "/FarmMarbleProject/resources/uploadfiles/photo_download.jsp?fileName="+data.fileName);
				      },
				      error: function(jqXHR, textStatus, errorThrown) {
				          alert("error");
				      }
				});
				
			}
			
			
		});
		
		function notnull(){
			var write=document.write;
			
			
			var board_title=document.write.board_title;
			
			var memberid=document.write.board_writer;
			var board_content=document.write.board_content;
			if(memberid.value==""){
				alert("세션이 만료되었습니다. 다시 로그인해주세요!");
				return;
			}
			if(board_title.value==""||board_content.value==""){
				alert("제목과 내용은 있어야함");
				return;
			}
			write.submit();
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
			<h3>W R I T E</h3></br>
			
			<form method="post" action="write" enctype="multipart/form-data" name="write">
				<div id="container">
					<span class="writeTitle">WRITER</span>
					<span class="content">${memberId}<input type="hidden" value="${memberId}" name="board_writer"/></span>
					</br>
					<span class="writeTitle">TITLE</span>
					<span class="content"><input type="text" name="board_title"/></span>
					</br>
					<span class="writeTitle">CONTENT</span>
					<span class="content"><textarea name="board_content" rows="5" cols="50"></textarea></span>
					<span class="imgfile"><img id="photo" width="200px"/><input type="file" name="attach" id="attach"  value="사진등록"/></span>
					
					<br/>
					
					<div id="writeButtonGroup">
						<a href="javascript:notnull()">WRITE</a>
						
						<input type="reset" value="RESET"/>
						<a href="list?pageNo=${i}">BACK</a>
					</div>
					
				</div>
			</form>
		</div>
	</body>
</html>
