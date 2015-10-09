<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
			* {
				margin: 0; 
				padding: 0;
			}		
			
			body {				
				margin: 0 auto;
				background-image: url('${pageContext.request.contextPath}/resources/image/gameBG.jpg');
				background-size:  100%;
			}
			
			#page-wrapper {
				width: 960px;
				margin-top: 50px;
				margin-left: 150px;				
			}
			
			#content {				
				display: flex;
				flex-direction: row;
				
			}
						
			#userInfo {				
				height: 800px;				
				border: 1px solid black;
				flex: 1;				
			}
			
			.player {
				height: 200px;
				border: 1px solid black;
			}
			
			#game {
				height: 800px;				
				border: 1px solid black;
				width: 560px;
				font-size: 0;
				display: table;
			}
			
			#inner{
				display:table-cell;
				vertical-align:middle;
			}
			
			#map{
				width:560px;
				height:560px;
				position: relative;
				display:inline-block;
			}
			
			.box {
				width: 78px;
				height: 78px;
				display: inline-block;
				border: 1px solid black;
				background-color:yellowgreen;
			}
			
			.non {
				width:80px;
				height:80px;
				border : none;
				background-color:rgba(0,0,0,0);
			}
			
			.gold{
				background-color:gold;
			}
			
			.event{
				background-color:brown;
			}
			
			#chatting {
				height: 800px;				
				border: 1px solid black;
				flex: 1;
				
			}
			
		</style>
	</head>
	
	<body>
		
		<div id="page-wrapper">
			<div id="content">
				<aside id="userInfo">
					<div id="p1" class="player"></div>
					<div id="p2" class="player"></div>
					<div id="p3" class="player"></div>
					<div id="p4" class="player"></div>
				</aside>
				
				<section id="game">
							<div id="inner">
						<div id="map">
							<div id="0" class="box"></div>
							<div id="1" class="box"></div>
							<div id="2" class="box"></div>
							<div id="3" class="box gold"></div>
							<div id="4" class="box"></div>
							<div id="5" class="box"></div>
							<div id="6" class="box event"></div>
							<div id="23" class="box"></div>
							<div class="box non"></div>
							<div class="box non"></div>
							<div class="box non"></div>
							<div class="box non"></div>
							<div class="box non"></div>
							<div id="7" class="box"></div>
							<div id="22" class="box"></div>
							<div class="box non"></div>
							<div class="box non"></div>
							<div class="box non"></div>
							<div class="box non"></div>
							<div class="box non"></div>
							<div id="8" class="box"></div>
							<div id="21" class="box gold"></div>
							<div class="box non"></div>
							<div class="box non"></div>
							<div class="box non"></div>
							<div class="box non"></div>
							<div class="box non"></div>
							<div id="9" class="box gold"></div>
							<div id="20" class="box"></div>
							<div class="box non"></div>
							<div class="box non"></div>
							<div class="box non"></div>
							<div class="box non"></div>
							<div class="box non"></div>
							<div id="10" class="box"></div>
							<div id="19" class="box"></div>
							<div class="box non"></div>
							<div class="box non"></div>
							<div class="box non"></div>
							<div class="box non"></div>
							<div class="box non"></div>
							<div id="11" class="box"></div>
							<div id="18" class="box event"></div>
							<div id="17" class="box"></div>
							<div id="16" class="box"></div>
							<div id="15" class="box gold"></div>
							<div id="14" class="box"></div>
							<div id="13" class="box"></div>
							<div id="12" class="box event"></div>
						</div>
					</div>
				</section>
				
				<aside id="chatting">
				
				</aside>
			</div>
		</div>
	</body>
</html>