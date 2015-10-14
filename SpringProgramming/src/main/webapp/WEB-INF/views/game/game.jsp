<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>FarmMarble</title>
	</head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/form_game.css" />
	<script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/gameSet.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/dice.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/dialogue.js" type="text/javascript"></script>
	<body>
		<div id="page-wrapper">
			<div id=btnGroup>
				<button id="connect" onclick="connect()">START</button>
				<button id="disconnect" onclick="disconnect()" disabled="disabled">READY</button>
				<a href="../menu"><img class="cancle"
					src="${pageContext.request.contextPath}/resources/image/character/X.png" /></a>
				<img id="q" class="cancle"
					src="${pageContext.request.contextPath}/resources/image/character/Q.png" />
				<div id="dialog" title="HELP">
					<p>게임 방법<br/>
						1. START 버튼을 눌러주세요<br/>
						(4명이 모여야 게임이 시작됩니다)<br/>
						2. 순서에 따라 주사위를 CLICK 해주세요<br/>
						3. 황금카드 설명<br/>
						4. 이벤트 설명<br/>
						5. 나머지 플레이어가 파산하면 게임이 종료됩니다<br/>
					</p>
				</div>
			</div>
			<div id="content">
				<aside id="userInfo">
					<div id="p1" class="player">
						<img class="user" width=100% height=100%
							src="${pageContext.request.contextPath}/resources/image/character/player1.jpg" />
						<div class="txt">
							<h3>PLAYER1</h3>
							<br />
							<h4>USER:</h4>
							<br />
							<h4>MONEY:</h4>
						</div>
					</div>
					<div id="p2" class="player">
						<img class="user" width=100% height=100%
							src="${pageContext.request.contextPath}/resources/image/character/player2.jpg" />
						<div class="txt">
							<h3>PLAYER2</h3>
							<br />
							<h4>USER:</h4>
							<br />
							<h4>MONEY:</h4>
						</div>
					</div>
					<div id="p3" class="player">
						<img class="user" width=100% height=100%
							src="${pageContext.request.contextPath}/resources/image/character/player3.jpg" />
						<div class="txt">
							<h3>PLAYER3</h3>
							<br />
							<h4>USER:</h4>
							<br />
							<h4>MONEY:</h4>
						</div>
					</div>
					<div id="p4" class="player">
						<img class="user" width=100% height=100%
							src="${pageContext.request.contextPath}/resources/image/character/player4.jpg" />
						<div class="txt">
							<h3>PLAYER4</h3>
							<br />
							<h4>USER:</h4>
							<br />
							<h4>MONEY:</h4>
						</div>
					</div>
				</aside>
	
				<section id="game">
					<div id="inner">
						<table id="map">
							<tr id="line1">
								<td id="0" class="box">
									<p>START</p> <img class="img S1"
									src="${pageContext.request.contextPath}/resources/image/character/S1.png" />
									<img class="img S2"
									src="${pageContext.request.contextPath}/resources/image/character/S2.png" />
									<img class="img S3"
									src="${pageContext.request.contextPath}/resources/image/character/S3.png" />
									<img class="img P1"
									src="${pageContext.request.contextPath}/resources/image/character/P1.png" />
									<img class="img P2"
									src="${pageContext.request.contextPath}/resources/image/character/P2.png" />
									<img class="img P3"
									src="${pageContext.request.contextPath}/resources/image/character/P3.png" />
									<img class="img P4"
									src="${pageContext.request.contextPath}/resources/image/character/P4.png" />
								</td>
								<td id="1" class="box">
									<p>이천</p> <img class="img S1"
									src="${pageContext.request.contextPath}/resources/image/character/S1.png" />
									<img class="img S2"
									src="${pageContext.request.contextPath}/resources/image/character/S2.png" />
									<img class="img S3"
									src="${pageContext.request.contextPath}/resources/image/character/S3.png" />
									<img class="img P1"
									src="${pageContext.request.contextPath}/resources/image/character/P1.png" />
									<img class="img P2"
									src="${pageContext.request.contextPath}/resources/image/character/P2.png" />
									<img class="img P3"
									src="${pageContext.request.contextPath}/resources/image/character/P3.png" />
									<img class="img P4"
									src="${pageContext.request.contextPath}/resources/image/character/P4.png" />
								</td>
								<td id="2" class="box">
									<p>서귀포</p> <img class="img S1"
									src="${pageContext.request.contextPath}/resources/image/character/S1.png" />
									<img class="img S2"
									src="${pageContext.request.contextPath}/resources/image/character/S2.png" />
									<img class="img S3"
									src="${pageContext.request.contextPath}/resources/image/character/S3.png" />
									<img class="img P1"
									src="${pageContext.request.contextPath}/resources/image/character/P1.png" />
									<img class="img P2"
									src="${pageContext.request.contextPath}/resources/image/character/P2.png" />
									<img class="img P3"
									src="${pageContext.request.contextPath}/resources/image/character/P3.png" />
									<img class="img P4"
									src="${pageContext.request.contextPath}/resources/image/character/P4.png" />
								</td>
								<td id="3" class="box gold">
									<p>황금카드</p> <img class="img P1"
									src="${pageContext.request.contextPath}/resources/image/character/P1.png" />
									<img class="img P2"
									src="${pageContext.request.contextPath}/resources/image/character/P2.png" />
									<img class="img P3"
									src="${pageContext.request.contextPath}/resources/image/character/P3.png" />
									<img class="img P4"
									src="${pageContext.request.contextPath}/resources/image/character/P4.png" />
								</td>
								<td id="4" class="box">
									<p>오키나와</p> <img class="img S1"
									src="${pageContext.request.contextPath}/resources/image/character/S1.png" />
									<img class="img S2"
									src="${pageContext.request.contextPath}/resources/image/character/S2.png" />
									<img class="img S3"
									src="${pageContext.request.contextPath}/resources/image/character/S3.png" />
									<img class="img P1"
									src="${pageContext.request.contextPath}/resources/image/character/P1.png" />
									<img class="img P2"
									src="${pageContext.request.contextPath}/resources/image/character/P2.png" />
									<img class="img P3"
									src="${pageContext.request.contextPath}/resources/image/character/P3.png" />
									<img class="img P4"
									src="${pageContext.request.contextPath}/resources/image/character/P4.png" />
								</td>
								<td id="5" class="box">
									<p>방콕</p> <img class="img S1"
									src="${pageContext.request.contextPath}/resources/image/character/S1.png" />
									<img class="img S2"
									src="${pageContext.request.contextPath}/resources/image/character/S2.png" />
									<img class="img S3"
									src="${pageContext.request.contextPath}/resources/image/character/S3.png" />
									<img class="img P1"
									src="${pageContext.request.contextPath}/resources/image/character/P1.png" />
									<img class="img P2"
									src="${pageContext.request.contextPath}/resources/image/character/P2.png" />
									<img class="img P3"
									src="${pageContext.request.contextPath}/resources/image/character/P3.png" />
									<img class="img P4"
									src="${pageContext.request.contextPath}/resources/image/character/P4.png" />
								</td>
								<td id="6" class="box event">
									<p>비행기</p> <img class="img S1"
									src="${pageContext.request.contextPath}/resources/image/character/S1.png" />
									<img class="img S2"
									src="${pageContext.request.contextPath}/resources/image/character/S2.png" />
									<img class="img S3"
									src="${pageContext.request.contextPath}/resources/image/character/S3.png" />
									<img class="img P1"
									src="${pageContext.request.contextPath}/resources/image/character/P1.png" />
									<img class="img P2"
									src="${pageContext.request.contextPath}/resources/image/character/P2.png" />
									<img class="img P3"
									src="${pageContext.request.contextPath}/resources/image/character/P3.png" />
									<img class="img P4"
									src="${pageContext.request.contextPath}/resources/image/character/P4.png" />
								</td>
							</tr>
							<tr id="line2">
								<td id="23" class="box">
									<p>
										멕시코 <br />시티
									</p> <img class="img S1"
									src="${pageContext.request.contextPath}/resources/image/character/S1.png" />
									<img class="img S2"
									src="${pageContext.request.contextPath}/resources/image/character/S2.png" />
									<img class="img S3"
									src="${pageContext.request.contextPath}/resources/image/character/S3.png" />
									<img class="img P1"
									src="${pageContext.request.contextPath}/resources/image/character/P1.png" />
									<img class="img P2"
									src="${pageContext.request.contextPath}/resources/image/character/P2.png" />
									<img class="img P3"
									src="${pageContext.request.contextPath}/resources/image/character/P3.png" />
									<img class="img P4"
									src="${pageContext.request.contextPath}/resources/image/character/P4.png" />
								</td>
								<td class="box non"></td>
								<td class="box non"></td>
								<td class="box non">
									<img width=130px height=150px id="c0" class="card"
									src="${pageContext.request.contextPath}/resources/image/character/C0.png" />
									<img width=130px height=150px id="c1" class="card ocard"
									src="${pageContext.request.contextPath}/resources/image/character/C1.png" />
									<img width=130px height=150px id="c2" class="card ocard"
									src="${pageContext.request.contextPath}/resources/image/character/C2.png" />
									<img width=130px height=150px id="c3" class="card ocard"
									src="${pageContext.request.contextPath}/resources/image/character/C3.png" />
									<img width=130px height=150px id="c4" class="card ocard"
									src="${pageContext.request.contextPath}/resources/image/character/C4.png" />
									<img width=130px height=150px id="c5" class="card ocard"
									src="${pageContext.request.contextPath}/resources/image/character/C5.png" />
								</td>
								<td class="box non"></td>
								<td class="box non"></td>
								<td id="7" class="box">
									<p>발리</p> <img class="img S1"
									src="${pageContext.request.contextPath}/resources/image/character/S1.png" />
									<img class="img S2"
									src="${pageContext.request.contextPath}/resources/image/character/S2.png" />
									<img class="img S3"
									src="${pageContext.request.contextPath}/resources/image/character/S3.png" />
									<img class="img P1"
									src="${pageContext.request.contextPath}/resources/image/character/P1.png" />
									<img class="img P2"
									src="${pageContext.request.contextPath}/resources/image/character/P2.png" />
									<img class="img P3"
									src="${pageContext.request.contextPath}/resources/image/character/P3.png" />
									<img class="img P4"
									src="${pageContext.request.contextPath}/resources/image/character/P4.png" />
								</td>
							</tr>
							<tr id="line3">
								<td id="22" class="box">
									<p>칠레</p> <img class="img S1"
									src="${pageContext.request.contextPath}/resources/image/character/S1.png" />
									<img class="img S2"
									src="${pageContext.request.contextPath}/resources/image/character/S2.png" />
									<img class="img S3"
									src="${pageContext.request.contextPath}/resources/image/character/S3.png" />
									<img class="img P1"
									src="${pageContext.request.contextPath}/resources/image/character/P1.png" />
									<img class="img P2"
									src="${pageContext.request.contextPath}/resources/image/character/P2.png" />
									<img class="img P3"
									src="${pageContext.request.contextPath}/resources/image/character/P3.png" />
									<img class="img P4"
									src="${pageContext.request.contextPath}/resources/image/character/P4.png" />
								</td>
								<td class="box non"></td>
								<td class="box non"></td>
								<td class="box non"></td>
								<td class="box non"></td>
								<td class="box non"></td>
								<td id="8" class="box">
									<p>두바이</p> <img class="img S1"
									src="${pageContext.request.contextPath}/resources/image/character/S1.png" />
									<img class="img S2"
									src="${pageContext.request.contextPath}/resources/image/character/S2.png" />
									<img class="img S3"
									src="${pageContext.request.contextPath}/resources/image/character/S3.png" />
									<img class="img P1"
									src="${pageContext.request.contextPath}/resources/image/character/P1.png" />
									<img class="img P2"
									src="${pageContext.request.contextPath}/resources/image/character/P2.png" />
									<img class="img P3"
									src="${pageContext.request.contextPath}/resources/image/character/P3.png" />
									<img class="img P4"
									src="${pageContext.request.contextPath}/resources/image/character/P4.png" />
								</td>
							</tr>
							<tr id="line4">
								<td id="21" class="box gold">
									<p>황금카드</p> <img class="img P1"
									src="${pageContext.request.contextPath}/resources/image/character/P1.png" />
									<img class="img P2"
									src="${pageContext.request.contextPath}/resources/image/character/P2.png" />
									<img class="img P3"
									src="${pageContext.request.contextPath}/resources/image/character/P3.png" />
									<img class="img P4"
									src="${pageContext.request.contextPath}/resources/image/character/P4.png" />
								</td>
								<td class="box non"></td>
								<td class="box non"></td>
								<td class="box non"></td>
								<td class="box non"></td>
								<td class="box non"></td>
								<td id="9" class="box gold">
									<p>황금카드</p> <img class="img P1"
									src="${pageContext.request.contextPath}/resources/image/character/P1.png" />
									<img class="img P2"
									src="${pageContext.request.contextPath}/resources/image/character/P2.png" />
									<img class="img P3"
									src="${pageContext.request.contextPath}/resources/image/character/P3.png" />
									<img class="img P4"
									src="${pageContext.request.contextPath}/resources/image/character/P4.png" />
								</td>
							</tr>
							<tr id="line5">
								<td id="20" class="box">
									<p>상파울로</p> <img class="img S1"
									src="${pageContext.request.contextPath}/resources/image/character/S1.png" />
									<img class="img S2"
									src="${pageContext.request.contextPath}/resources/image/character/S2.png" />
									<img class="img S3"
									src="${pageContext.request.contextPath}/resources/image/character/S3.png" />
									<img class="img P1"
									src="${pageContext.request.contextPath}/resources/image/character/P1.png" />
									<img class="img P2"
									src="${pageContext.request.contextPath}/resources/image/character/P2.png" />
									<img class="img P3"
									src="${pageContext.request.contextPath}/resources/image/character/P3.png" />
									<img class="img P4"
									src="${pageContext.request.contextPath}/resources/image/character/P4.png" />
								</td>
								<td class="box non"></td>
								<td class="box non"></td>
								<td class="box non"><img width=78px height=78px id="d1"
									class="dice"
									src="${pageContext.request.contextPath}/resources/image/character/D1.png" />
									<img width=78px height=78px id="d2" class="dice"
									src="${pageContext.request.contextPath}/resources/image/character/D2.png" />
									<img width=78px height=78px id="d3" class="dice"
									src="${pageContext.request.contextPath}/resources/image/character/D3.png" />
									<img width=78px height=78px id="d4" class="dice"
									src="${pageContext.request.contextPath}/resources/image/character/D4.png" />
									<img width=78px height=78px id="d5" class="dice"
									src="${pageContext.request.contextPath}/resources/image/character/D5.png" />
									<img width=78px height=78px id="d6" class="dice"
									src="${pageContext.request.contextPath}/resources/image/character/D6.png" />
	
								</td>
								<td class="box non"></td>
								<td class="box non"></td>
								<td id="10" class="box">
									<p>카이로</p> <img class="img S1"
									src="${pageContext.request.contextPath}/resources/image/character/S1.png" />
									<img class="img S2"
									src="${pageContext.request.contextPath}/resources/image/character/S2.png" />
									<img class="img S3"
									src="${pageContext.request.contextPath}/resources/image/character/S3.png" />
									<img class="img P1"
									src="${pageContext.request.contextPath}/resources/image/character/P1.png" />
									<img class="img P2"
									src="${pageContext.request.contextPath}/resources/image/character/P2.png" />
									<img class="img P3"
									src="${pageContext.request.contextPath}/resources/image/character/P3.png" />
									<img class="img P4"
									src="${pageContext.request.contextPath}/resources/image/character/P4.png" />
								</td>
							</tr>
							<tr id="line6">
								<td id="19" class="box">
									<p>하와이</p> <img class="img S1"
									src="${pageContext.request.contextPath}/resources/image/character/S1.png" />
									<img class="img S2"
									src="${pageContext.request.contextPath}/resources/image/character/S2.png" />
									<img class="img S3"
									src="${pageContext.request.contextPath}/resources/image/character/S3.png" />
									<img class="img P1"
									src="${pageContext.request.contextPath}/resources/image/character/P1.png" />
									<img class="img P2"
									src="${pageContext.request.contextPath}/resources/image/character/P2.png" />
									<img class="img P3"
									src="${pageContext.request.contextPath}/resources/image/character/P3.png" />
									<img class="img P4"
									src="${pageContext.request.contextPath}/resources/image/character/P4.png" />
								</td>
								<td class="box non"></td>
								<td class="box non"></td>
								<td class="box non">
									<button id="roll" onclick="roll();" disabled="disabled">CLICK</button>
								</td>
								<td class="box non"></td>
								<td class="box non"></td>
								<td id="11" class="box">
									<p>파리</p> <img class="img S1"
									src="${pageContext.request.contextPath}/resources/image/character/S1.png" />
									<img class="img S2"
									src="${pageContext.request.contextPath}/resources/image/character/S2.png" />
									<img class="img S3"
									src="${pageContext.request.contextPath}/resources/image/character/S3.png" />
									<img class="img P1"
									src="${pageContext.request.contextPath}/resources/image/character/P1.png" />
									<img class="img P2"
									src="${pageContext.request.contextPath}/resources/image/character/P2.png" />
									<img class="img P3"
									src="${pageContext.request.contextPath}/resources/image/character/P3.png" />
									<img class="img P4"
									src="${pageContext.request.contextPath}/resources/image/character/P4.png" />
								</td>
							</tr>
							<tr id="line7">
								<td id="18" class="box event">
									<p>고비사막</p> <img class="img P1"
									src="${pageContext.request.contextPath}/resources/image/character/P1.png" />
									<img class="img P2"
									src="${pageContext.request.contextPath}/resources/image/character/P2.png" />
									<img class="img P3"
									src="${pageContext.request.contextPath}/resources/image/character/P3.png" />
									<img class="img P4"
									src="${pageContext.request.contextPath}/resources/image/character/P4.png" />
								</td>
								<td id="17" class="box">
									<p>몬트리올</p> <img class="img S1"
									src="${pageContext.request.contextPath}/resources/image/character/S1.png" />
									<img class="img S2"
									src="${pageContext.request.contextPath}/resources/image/character/S2.png" />
									<img class="img S3"
									src="${pageContext.request.contextPath}/resources/image/character/S3.png" />
									<img class="img P1"
									src="${pageContext.request.contextPath}/resources/image/character/P1.png" />
									<img class="img P2"
									src="${pageContext.request.contextPath}/resources/image/character/P2.png" />
									<img class="img P3"
									src="${pageContext.request.contextPath}/resources/image/character/P3.png" />
									<img class="img P4"
									src="${pageContext.request.contextPath}/resources/image/character/P4.png" />
								</td>
								<td id="16" class="box">
									<p>리스본</p> <img class="img S1"
									src="${pageContext.request.contextPath}/resources/image/character/S1.png" />
									<img class="img S2"
									src="${pageContext.request.contextPath}/resources/image/character/S2.png" />
									<img class="img S3"
									src="${pageContext.request.contextPath}/resources/image/character/S3.png" />
									<img class="img P1"
									src="${pageContext.request.contextPath}/resources/image/character/P1.png" />
									<img class="img P2"
									src="${pageContext.request.contextPath}/resources/image/character/P2.png" />
									<img class="img P3"
									src="${pageContext.request.contextPath}/resources/image/character/P3.png" />
									<img class="img P4"
									src="${pageContext.request.contextPath}/resources/image/character/P4.png" />
								</td>
								<td id="15" class="box gold">
									<p>황금카드</p> <img class="img P1"
									src="${pageContext.request.contextPath}/resources/image/character/P1.png" />
									<img class="img P2"
									src="${pageContext.request.contextPath}/resources/image/character/P2.png" />
									<img class="img P3"
									src="${pageContext.request.contextPath}/resources/image/character/P3.png" />
									<img class="img P4"
									src="${pageContext.request.contextPath}/resources/image/character/P4.png" />
								</td>
								<td id="14" class="box">
									<p>마드리드</p> <img class="img S1"
									src="${pageContext.request.contextPath}/resources/image/character/S1.png" />
									<img class="img S2"
									src="${pageContext.request.contextPath}/resources/image/character/S2.png" />
									<img class="img S3"
									src="${pageContext.request.contextPath}/resources/image/character/S3.png" />
									<img class="img P1"
									src="${pageContext.request.contextPath}/resources/image/character/P1.png" />
									<img class="img P2"
									src="${pageContext.request.contextPath}/resources/image/character/P2.png" />
									<img class="img P3"
									src="${pageContext.request.contextPath}/resources/image/character/P3.png" />
									<img class="img P4"
									src="${pageContext.request.contextPath}/resources/image/character/P4.png" />
								</td>
								<td id="13" class="box">
									<p>로마</p> <img class="img S1"
									src="${pageContext.request.contextPath}/resources/image/character/S1.png" />
									<img class="img S2"
									src="${pageContext.request.contextPath}/resources/image/character/S2.png" />
									<img class="img S3"
									src="${pageContext.request.contextPath}/resources/image/character/S3.png" />
									<img class="img P1"
									src="${pageContext.request.contextPath}/resources/image/character/P1.png" />
									<img class="img P2"
									src="${pageContext.request.contextPath}/resources/image/character/P2.png" />
									<img class="img P3"
									src="${pageContext.request.contextPath}/resources/image/character/P3.png" />
									<img class="img P4"
									src="${pageContext.request.contextPath}/resources/image/character/P4.png" />
								</td>
								<td id="12" class="box event">
									<p>수확제</p> <img class="img P1"
									src="${pageContext.request.contextPath}/resources/image/character/P1.png" />
									<img class="img P2"
									src="${pageContext.request.contextPath}/resources/image/character/P2.png" />
									<img class="img P3"
									src="${pageContext.request.contextPath}/resources/image/character/P3.png" />
									<img class="img P4"
									src="${pageContext.request.contextPath}/resources/image/character/P4.png" />
								</td>
							</tr>
						</table>
					</div>
				</section>
	
				<aside id="chatting">
					<div id="chatGroup">
						<div id="chat">
							<img width=100% height=550px;
								src="${pageContext.request.contextPath}/resources/image/character/chat.png" />
						</div>
						<div style="height:30px;">
							<input id="in" type="text"/>
							<img id="chatbtn"
								src="${pageContext.request.contextPath}/resources/image/character/chatbtn.png" />
						</div>
					</div>
				</aside>
			</div>
		</div>
	</body>
</html>