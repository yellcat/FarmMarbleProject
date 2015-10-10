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
				background-color:rgba(255,255,255,0.4);
				padding: 10px;
				border-radius: 15px				
			}
			
			#content {				
				display: flex;
				flex-direction: row;
				height:650px;
			}
						
			#userInfo {				
				/* height: 700px;	 */			
				border: 0.2px solid black;
				flex: 1;				
			}
			
			.player {
				height: 150px;
				margin-right:10px;				
				/*border: 1px solid black;*/
			}
			
			.txt {
				position: absolute;
				margin-top: -130px;
				margin-left: 20px;				
			}
			
			h3 {
				color: white;
			}
			
			#game {
				/* height: 700px;	 */			
				/*border: 1px solid black;*/
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
				margin-top:10px;
									
			}
			
			.box {
				width: 78px;
				height: 78px;				
				/*border: 1px solid black;*/				
				background-color:yellowgreen;							
			}
			
			.non {
				width:80px;
				height:80px;
				border : none;
				background-color:rgba(0,0,0,0);				
			}
			
			.img {
				width: 50px;
				height: 50px;
				position:absolute;
				margin-top:-25px;
				margin-left:10px;
				display:inline-block;
			}
			
			.dice{
				position:absolute;
			}
			
			.card{
				position:absolute;
				margin-top:30px;
				margin-left:-30px;
			}
			
			.gold{
				background-color:gold;
			}
			
			.event{
				background-color:brown;
			}
			
			#chatting {
				/* height: 700px;		 */		
				/*border: 1px solid black;*/
				flex: 1;				
			}			
			
			#btnGroup{
				display:float;
				height:50px;
			}
			
			.cancle{
				width:30px;
				height:30px;
				float:right;
				margin-right:5px;
			}
			
			#chat{
				margin-left:10px;
			}
			
		</style>
	</head>
	
	<body>
		
		<div id="page-wrapper">
			<div id=btnGroup>
					<img class="cancle" src="${pageContext.request.contextPath}/resources/image/character/X.png"/>
					<img class="cancle" src="${pageContext.request.contextPath}/resources/image/character/Q.png"/>
				</div>
			<div id="content">						
				<aside id="userInfo">
					<div id="p1" class="player">
						<img class="user" width=100% height=100% src="${pageContext.request.contextPath}/resources/image/character/player1.jpg"/>
						<div class="txt">
							<h3>PLAYER1</h3><br/>
							<h4>USER: </h4><br/>
							<h4>MONEY: </h4>
						</div>
					</div>
					<div id="p2" class="player">
						<img class="user" width=100% height=100% src="${pageContext.request.contextPath}/resources/image/character/player2.jpg"/>
						<div class="txt">
							<h3>PLAYER2</h3><br/>
							<h4>USER: </h4><br/>
							<h4>MONEY: </h4>
						</div>
					</div>
					<div id="p3" class="player">
						<img class="user" width=100% height=100% src="${pageContext.request.contextPath}/resources/image/character/player3.jpg"/>
						<div class="txt">
							<h3>PLAYER3</h3><br/>
							<h4>USER: </h4><br/>
							<h4>MONEY: </h4>
						</div>
					</div>
					<div id="p4" class="player">
						<img class="user" width=100% height=100% src="${pageContext.request.contextPath}/resources/image/character/player4.jpg"/>
						<div class="txt">
							<h3>PLAYER4</h3><br/>
							<h4>USER: </h4><br/>
							<h4>MONEY: </h4>
						</div>
					</div>
				</aside>
				
				<section id="game">
							<div id="inner">
								<table id="map">
									<tr id="line1">
										<td id="0" class="box">
											<p>START</p>											
											<%-- <img class="img S1" src="${pageContext.request.contextPath}/resources/image/character/S1.png"/>
											<img class="img S2" src="${pageContext.request.contextPath}/resources/image/character/S2.png"/>
											<img class="img S3" src="${pageContext.request.contextPath}/resources/image/character/S3.png"/>
											<img class="img P1" src="${pageContext.request.contextPath}/resources/image/character/P1.png"/>
											<img class="img P2" src="${pageContext.request.contextPath}/resources/image/character/P2.png"/>
											<img class="img P3" src="${pageContext.request.contextPath}/resources/image/character/P3.png"/>
											<img class="img P4" src="${pageContext.request.contextPath}/resources/image/character/P4.png"/>	 --%>							
										</td>
										<td id="1" class="box">
											<img class="img S1" src="${pageContext.request.contextPath}/resources/image/character/S1.png"/>
											<img class="img S2" src="${pageContext.request.contextPath}/resources/image/character/S2.png"/>
											<img class="img S3" src="${pageContext.request.contextPath}/resources/image/character/S3.png"/>
											<img class="img P1" src="${pageContext.request.contextPath}/resources/image/character/P1.png"/>
											<img class="img P2" src="${pageContext.request.contextPath}/resources/image/character/P2.png"/>
											<img class="img P3" src="${pageContext.request.contextPath}/resources/image/character/P3.png"/>
											<img class="img P4" src="${pageContext.request.contextPath}/resources/image/character/P4.png"/>
										</td>
										<td id="2" class="box">
											<img class="img S1" src="${pageContext.request.contextPath}/resources/image/character/S1.png"/>
											<img class="img S2" src="${pageContext.request.contextPath}/resources/image/character/S2.png"/>
											<img class="img S3" src="${pageContext.request.contextPath}/resources/image/character/S3.png"/>
											<img class="img P1" src="${pageContext.request.contextPath}/resources/image/character/P1.png"/>
											<img class="img P2" src="${pageContext.request.contextPath}/resources/image/character/P2.png"/>
											<img class="img P3" src="${pageContext.request.contextPath}/resources/image/character/P3.png"/>
											<img class="img P4" src="${pageContext.request.contextPath}/resources/image/character/P4.png"/>
										</td>
										<td id="3" class="box gold">
											<img class="img P1" src="${pageContext.request.contextPath}/resources/image/character/P1.png"/>
											<img class="img P2" src="${pageContext.request.contextPath}/resources/image/character/P2.png"/>
											<img class="img P3" src="${pageContext.request.contextPath}/resources/image/character/P3.png"/>
											<img class="img P4" src="${pageContext.request.contextPath}/resources/image/character/P4.png"/>
										</td>
										<td id="4" class="box">
											<img class="img S1" src="${pageContext.request.contextPath}/resources/image/character/S1.png"/>
											<img class="img S2" src="${pageContext.request.contextPath}/resources/image/character/S2.png"/>
											<img class="img S3" src="${pageContext.request.contextPath}/resources/image/character/S3.png"/>
											<img class="img P1" src="${pageContext.request.contextPath}/resources/image/character/P1.png"/>
											<img class="img P2" src="${pageContext.request.contextPath}/resources/image/character/P2.png"/>
											<img class="img P3" src="${pageContext.request.contextPath}/resources/image/character/P3.png"/>
											<img class="img P4" src="${pageContext.request.contextPath}/resources/image/character/P4.png"/>
										</td>
										<td id="5" class="box">
											<img class="img S1" src="${pageContext.request.contextPath}/resources/image/character/S1.png"/>
											<img class="img S2" src="${pageContext.request.contextPath}/resources/image/character/S2.png"/>
											<img class="img S3" src="${pageContext.request.contextPath}/resources/image/character/S3.png"/>
											<img class="img P1" src="${pageContext.request.contextPath}/resources/image/character/P1.png"/>
											<img class="img P2" src="${pageContext.request.contextPath}/resources/image/character/P2.png"/>
											<img class="img P3" src="${pageContext.request.contextPath}/resources/image/character/P3.png"/>
											<img class="img P4" src="${pageContext.request.contextPath}/resources/image/character/P4.png"/>
										</td>
										<td id="6" class="box event">
											<img class="img S1" src="${pageContext.request.contextPath}/resources/image/character/S1.png"/>
											<img class="img S2" src="${pageContext.request.contextPath}/resources/image/character/S2.png"/>
											<img class="img S3" src="${pageContext.request.contextPath}/resources/image/character/S3.png"/>
											<img class="img P1" src="${pageContext.request.contextPath}/resources/image/character/P1.png"/>
											<img class="img P2" src="${pageContext.request.contextPath}/resources/image/character/P2.png"/>
											<img class="img P3" src="${pageContext.request.contextPath}/resources/image/character/P3.png"/>
											<img class="img P4" src="${pageContext.request.contextPath}/resources/image/character/P4.png"/>
										</td>
									</tr>
									<tr id="line2">
										<td id="23"class="box">
											<img class="img S1" src="${pageContext.request.contextPath}/resources/image/character/S1.png"/>
											<img class="img S2" src="${pageContext.request.contextPath}/resources/image/character/S2.png"/>
											<img class="img S3" src="${pageContext.request.contextPath}/resources/image/character/S3.png"/>
											<img class="img P1" src="${pageContext.request.contextPath}/resources/image/character/P1.png"/>
											<img class="img P2" src="${pageContext.request.contextPath}/resources/image/character/P2.png"/>
											<img class="img P3" src="${pageContext.request.contextPath}/resources/image/character/P3.png"/>
											<img class="img P4" src="${pageContext.request.contextPath}/resources/image/character/P4.png"/>
										</td>
										<td class="box non"></td>
										<td class="box non"></td>
										<td class="box non">
										<img width=130px height=150px id="c0" class="card" src="${pageContext.request.contextPath}/resources/image/character/C0.png"/>
										<img width=130px height=150px id="c1" class="card" src="${pageContext.request.contextPath}/resources/image/character/C1.png"/>
										<img width=130px height=150px id="c2" class="card" src="${pageContext.request.contextPath}/resources/image/character/C2.png"/>
										<img width=130px height=150px id="c3" class="card" src="${pageContext.request.contextPath}/resources/image/character/C3.png"/>
										<img width=130px height=150px id="c4" class="card" src="${pageContext.request.contextPath}/resources/image/character/C4.png"/>
										<img width=130px height=150px id="c5" class="card" src="${pageContext.request.contextPath}/resources/image/character/C5.png"/>
										</td>
										<td class="box non"></td>
										<td class="box non"></td>
										<td id="7" class="box">
											<img class="img S1" src="${pageContext.request.contextPath}/resources/image/character/S1.png"/>
											<img class="img S2" src="${pageContext.request.contextPath}/resources/image/character/S2.png"/>
											<img class="img S3" src="${pageContext.request.contextPath}/resources/image/character/S3.png"/>
											<img class="img P1" src="${pageContext.request.contextPath}/resources/image/character/P1.png"/>
											<img class="img P2" src="${pageContext.request.contextPath}/resources/image/character/P2.png"/>
											<img class="img P3" src="${pageContext.request.contextPath}/resources/image/character/P3.png"/>
											<img class="img P4" src="${pageContext.request.contextPath}/resources/image/character/P4.png"/>
										</td>
									</tr>
									<tr id="line3">
										<td id="22" class="box">
											<img class="img S1" src="${pageContext.request.contextPath}/resources/image/character/S1.png"/>
											<img class="img S2" src="${pageContext.request.contextPath}/resources/image/character/S2.png"/>
											<img class="img S3" src="${pageContext.request.contextPath}/resources/image/character/S3.png"/>
											<img class="img P1" src="${pageContext.request.contextPath}/resources/image/character/P1.png"/>
											<img class="img P2" src="${pageContext.request.contextPath}/resources/image/character/P2.png"/>
											<img class="img P3" src="${pageContext.request.contextPath}/resources/image/character/P3.png"/>
											<img class="img P4" src="${pageContext.request.contextPath}/resources/image/character/P4.png"/>
										</td>
										<td class="box non"></td>
										<td class="box non"></td>
										<td class="box non"></td>
										<td class="box non"></td>
										<td class="box non"></td>
										<td id="8" class="box">
											<img class="img S1" src="${pageContext.request.contextPath}/resources/image/character/S1.png"/>
											<img class="img S2" src="${pageContext.request.contextPath}/resources/image/character/S2.png"/>
											<img class="img S3" src="${pageContext.request.contextPath}/resources/image/character/S3.png"/>
											<img class="img P1" src="${pageContext.request.contextPath}/resources/image/character/P1.png"/>
											<img class="img P2" src="${pageContext.request.contextPath}/resources/image/character/P2.png"/>
											<img class="img P3" src="${pageContext.request.contextPath}/resources/image/character/P3.png"/>
											<img class="img P4" src="${pageContext.request.contextPath}/resources/image/character/P4.png"/>
										</td>
									</tr>
									<tr id="line4">
										<td id="21" class="box gold">
											<img class="img P1" src="${pageContext.request.contextPath}/resources/image/character/P1.png"/>
											<img class="img P2" src="${pageContext.request.contextPath}/resources/image/character/P2.png"/>
											<img class="img P3" src="${pageContext.request.contextPath}/resources/image/character/P3.png"/>
											<img class="img P4" src="${pageContext.request.contextPath}/resources/image/character/P4.png"/>
										</td>
										<td class="box non"></td>
										<td class="box non"></td>
										<td class="box non"></td>
										<td class="box non"></td>
										<td class="box non"></td>
										<td id="9" class="box gold">
											<img class="img P1" src="${pageContext.request.contextPath}/resources/image/character/P1.png"/>
											<img class="img P2" src="${pageContext.request.contextPath}/resources/image/character/P2.png"/>
											<img class="img P3" src="${pageContext.request.contextPath}/resources/image/character/P3.png"/>
											<img class="img P4" src="${pageContext.request.contextPath}/resources/image/character/P4.png"/>
										</td>
									</tr>
									<tr id="line5">
										<td id="20" class="box">
											<img class="img S1" src="${pageContext.request.contextPath}/resources/image/character/S1.png"/>
											<img class="img S2" src="${pageContext.request.contextPath}/resources/image/character/S2.png"/>
											<img class="img S3" src="${pageContext.request.contextPath}/resources/image/character/S3.png"/>
											<img class="img P1" src="${pageContext.request.contextPath}/resources/image/character/P1.png"/>
											<img class="img P2" src="${pageContext.request.contextPath}/resources/image/character/P2.png"/>
											<img class="img P3" src="${pageContext.request.contextPath}/resources/image/character/P3.png"/>
											<img class="img P4" src="${pageContext.request.contextPath}/resources/image/character/P4.png"/>
										</td>
										<td class="box non"></td>
										<td class="box non"></td>
										<td class="box non">
											<img width=78px height=78px id="d1" class="dice" src="${pageContext.request.contextPath}/resources/image/character/D1.png"/>
											<img width=78px height=78px id="d2" class="dice" src="${pageContext.request.contextPath}/resources/image/character/D2.png"/>
											<img width=78px height=78px id="d3" class="dice" src="${pageContext.request.contextPath}/resources/image/character/D3.png"/>
											<img width=78px height=78px id="d4" class="dice" src="${pageContext.request.contextPath}/resources/image/character/D4.png"/>
											<img width=78px height=78px id="d5" class="dice" src="${pageContext.request.contextPath}/resources/image/character/D5.png"/>
											<img width=78px height=78px id="d6" class="dice" src="${pageContext.request.contextPath}/resources/image/character/D6.png"/>					
										
										</td>
										<td class="box non"></td>
										<td class="box non"></td>
										<td id="10" class="box">
											<img class="img S1" src="${pageContext.request.contextPath}/resources/image/character/S1.png"/>
											<img class="img S2" src="${pageContext.request.contextPath}/resources/image/character/S2.png"/>
											<img class="img S3" src="${pageContext.request.contextPath}/resources/image/character/S3.png"/>
											<img class="img P1" src="${pageContext.request.contextPath}/resources/image/character/P1.png"/>
											<img class="img P2" src="${pageContext.request.contextPath}/resources/image/character/P2.png"/>
											<img class="img P3" src="${pageContext.request.contextPath}/resources/image/character/P3.png"/>
											<img class="img P4" src="${pageContext.request.contextPath}/resources/image/character/P4.png"/>
										</td>
									</tr>
									<tr id="line6">
										<td id="19" class="box">
											<img class="img S1" src="${pageContext.request.contextPath}/resources/image/character/S1.png"/>
											<img class="img S2" src="${pageContext.request.contextPath}/resources/image/character/S2.png"/>
											<img class="img S3" src="${pageContext.request.contextPath}/resources/image/character/S3.png"/>
											<img class="img P1" src="${pageContext.request.contextPath}/resources/image/character/P1.png"/>
											<img class="img P2" src="${pageContext.request.contextPath}/resources/image/character/P2.png"/>
											<img class="img P3" src="${pageContext.request.contextPath}/resources/image/character/P3.png"/>
											<img class="img P4" src="${pageContext.request.contextPath}/resources/image/character/P4.png"/>
										</td>
										<td class="box non"></td>
										<td class="box non"></td>
										<td class="box non"></td>
										<td class="box non"></td>
										<td class="box non"></td>
										<td id="11" class="box">
											<img class="img S1" src="${pageContext.request.contextPath}/resources/image/character/S1.png"/>
											<img class="img S2" src="${pageContext.request.contextPath}/resources/image/character/S2.png"/>
											<img class="img S3" src="${pageContext.request.contextPath}/resources/image/character/S3.png"/>
											<img class="img P1" src="${pageContext.request.contextPath}/resources/image/character/P1.png"/>
											<img class="img P2" src="${pageContext.request.contextPath}/resources/image/character/P2.png"/>
											<img class="img P3" src="${pageContext.request.contextPath}/resources/image/character/P3.png"/>
											<img class="img P4" src="${pageContext.request.contextPath}/resources/image/character/P4.png"/>
										</td>
									</tr>
									<tr id="line7">
										<td id="18" class="box event">
											<img class="img P1" src="${pageContext.request.contextPath}/resources/image/character/P1.png"/>
											<img class="img P2" src="${pageContext.request.contextPath}/resources/image/character/P2.png"/>
											<img class="img P3" src="${pageContext.request.contextPath}/resources/image/character/P3.png"/>
											<img class="img P4" src="${pageContext.request.contextPath}/resources/image/character/P4.png"/>
										</td>
										<td id="17" class="box">
											<img class="img S1" src="${pageContext.request.contextPath}/resources/image/character/S1.png"/>
											<img class="img S2" src="${pageContext.request.contextPath}/resources/image/character/S2.png"/>
											<img class="img S3" src="${pageContext.request.contextPath}/resources/image/character/S3.png"/>
											<img class="img P1" src="${pageContext.request.contextPath}/resources/image/character/P1.png"/>
											<img class="img P2" src="${pageContext.request.contextPath}/resources/image/character/P2.png"/>
											<img class="img P3" src="${pageContext.request.contextPath}/resources/image/character/P3.png"/>
											<img class="img P4" src="${pageContext.request.contextPath}/resources/image/character/P4.png"/>
										</td>
										<td id="16" class="box">
											<img class="img S1" src="${pageContext.request.contextPath}/resources/image/character/S1.png"/>
											<img class="img S2" src="${pageContext.request.contextPath}/resources/image/character/S2.png"/>
											<img class="img S3" src="${pageContext.request.contextPath}/resources/image/character/S3.png"/>
											<img class="img P1" src="${pageContext.request.contextPath}/resources/image/character/P1.png"/>
											<img class="img P2" src="${pageContext.request.contextPath}/resources/image/character/P2.png"/>
											<img class="img P3" src="${pageContext.request.contextPath}/resources/image/character/P3.png"/>
											<img class="img P4" src="${pageContext.request.contextPath}/resources/image/character/P4.png"/>
										</td>
										<td id="15" class="box gold">
											<img class="img P1" src="${pageContext.request.contextPath}/resources/image/character/P1.png"/>
											<img class="img P2" src="${pageContext.request.contextPath}/resources/image/character/P2.png"/>
											<img class="img P3" src="${pageContext.request.contextPath}/resources/image/character/P3.png"/>
											<img class="img P4" src="${pageContext.request.contextPath}/resources/image/character/P4.png"/>
										</td>
										<td id="14" class="box">
											<img class="img S1" src="${pageContext.request.contextPath}/resources/image/character/S1.png"/>
											<img class="img S2" src="${pageContext.request.contextPath}/resources/image/character/S2.png"/>
											<img class="img S3" src="${pageContext.request.contextPath}/resources/image/character/S3.png"/>
											<img class="img P1" src="${pageContext.request.contextPath}/resources/image/character/P1.png"/>
											<img class="img P2" src="${pageContext.request.contextPath}/resources/image/character/P2.png"/>
											<img class="img P3" src="${pageContext.request.contextPath}/resources/image/character/P3.png"/>
											<img class="img P4" src="${pageContext.request.contextPath}/resources/image/character/P4.png"/>
										</td>
										<td id="13" class="box">
											<img class="img S1" src="${pageContext.request.contextPath}/resources/image/character/S1.png"/>
											<img class="img S2" src="${pageContext.request.contextPath}/resources/image/character/S2.png"/>
											<img class="img S3" src="${pageContext.request.contextPath}/resources/image/character/S3.png"/>
											<img class="img P1" src="${pageContext.request.contextPath}/resources/image/character/P1.png"/>
											<img class="img P2" src="${pageContext.request.contextPath}/resources/image/character/P2.png"/>
											<img class="img P3" src="${pageContext.request.contextPath}/resources/image/character/P3.png"/>
											<img class="img P4" src="${pageContext.request.contextPath}/resources/image/character/P4.png"/>
										</td>
										<td id="12" class="box event">
											<img class="img P1" src="${pageContext.request.contextPath}/resources/image/character/P1.png"/>
											<img class="img P2" src="${pageContext.request.contextPath}/resources/image/character/P2.png"/>
											<img class="img P3" src="${pageContext.request.contextPath}/resources/image/character/P3.png"/>
											<img class="img P4" src="${pageContext.request.contextPath}/resources/image/character/P4.png"/>
										</td>
									</tr>									
								</table>
					</div>
				</section>
				
				<aside id="chatting">
					<div id="chatGroup">
						<div id="chat">
							<img width=100% height=600px; src="${pageContext.request.contextPath}/resources/image/character/chat.png"/>
						</div>
						<div>
							<input type="text" width=100px;/>
							<img height=30px src="${pageContext.request.contextPath}/resources/image/character/chatbtn.jpg"/>
						</div>
					</div>
				</aside>
			</div>
		</div>
	</body>
</html>