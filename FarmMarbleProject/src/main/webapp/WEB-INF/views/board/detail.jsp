<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!DOCTYPE html>
<html>
   <head>
      <title>Board</title>
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/formboard.css"/>
      <link href='https://fonts.googleapis.com/css?family=Righteous' rel='stylesheet' type='text/css'>
      <script src="${pageContext.request.contextPath}/resources/js/boarddetail.js"></script>
     
   
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
         
         <div id="pagewrapper">
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
		           
		         </div>
		         
		         <div id="part1_2">
		            <img id="scshot" src="../resources/uploadfiles/${board.board_file_system_name}" height="150px" onError="this.style.display='none';"/>
		         </div>
		        
		      </div>
		      
		      <div id="part2">
		         <pre>${board.board_content}</pre>
		      </div>
	      
		      <div id="part3">
			     
			     <div id="part3-1">
			     	<table border="1" id="commentTable">            
		               <c:forEach var="comment" items="${clist}">
		               		
		                  <tr>
		                  	
		                     <td>${comment.writer}</td>
		                     <td id="commentContents">${comment.content}
		                     <a class="samewtuse${comment.writer}" style="display:none;" href="${pageContext.request.contextPath}/comment/deleteComment/${comment.no}?boardNo=${board.board_no}">삭제</a> 
		                     
		                     </td>                     
		                     <td id="date">${comment.date}</td>
		                       
                                              
		                  </tr>
		                  <script type="text/javascript">deleteShow()</script> 
		                  
		               </c:forEach>         
			         </table>
			     </div>   
		         
		         <div id="part3-2">
		            <form id="comment" name="comment" method="post" action="../comment/writeComment">
		               <input id="boardNo" type="hidden" name="boardNo" value="${board.board_no}"/><br/>
		               <input id="writer" type="hidden" name="writer" value="${memberId}"/><br/>
		               <input id="content" type="text" name="content" placeholder="댓글을 작성하세요" width="400px" maxlength="40"/>
		               <a href="javascript:sendcomment()" id="insert">입력</a>                           
		            </form>            
		         </div>
		              
		    </div>
		    
	      </div>
	      
	      <div id="detailButtonGroup">
	         <a href="list?pageNo=${i}">목록</a>
	         <div id="sameiduse" name="sameiduse">
		         <a href="updateForm?bno=${board.board_no}">수정</a>
		         <a href="delete/${board.board_no}">삭제</a>
	         </div>
	      </div>
      
      </div>  
   </body>
</html>