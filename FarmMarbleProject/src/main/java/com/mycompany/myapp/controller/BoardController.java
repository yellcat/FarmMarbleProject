package com.mycompany.myapp.controller;

import java.io.*;
import java.net.URLEncoder;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.myapp.dto.*;
import com.mycompany.myapp.service.*;

@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private CommentService commentService;
	@Autowired
	ServletContext servletContext;
	
	
	@RequestMapping(value="/board/write",method=RequestMethod.GET)
	public String writeForm() {
		return "board/writeForm";
	}
	
	@RequestMapping(value="/board/write",method=RequestMethod.POST)	
	public String write(Board board, HttpSession session) {	
		logger.info("write()");
		
		//파일 정보 얻기
		ServletContext application = session.getServletContext();
		String dirPath = application.getRealPath("/resources/uploadfiles");
		if(board.getAttach() != null) {
			String originalFilename = board.getAttach().getOriginalFilename();
			String filesystemName = System.currentTimeMillis() + "-" + originalFilename;
			String contentType = board.getAttach().getContentType();
			if(!board.getAttach().isEmpty()) {	
				//파일에 저장하기
				try {
					logger.info("write()kkk");
					board.getAttach().transferTo(new File(dirPath + "/" + filesystemName));
				} catch (Exception e) { e.printStackTrace(); }
			}
			board.setBoard_original_file_name(originalFilename);
			board.setBoard_file_system_name(filesystemName);
			board.setBoard_content_type(contentType);
		}
		boardService.add(board);
		
		return "redirect:/board/list";
	}
	
	@RequestMapping(value="/board/preaddPhoto",method=RequestMethod.POST)
	public String PhotoReg(MultipartFile attach, Model model, HttpServletRequest request) throws IOException {
		
		String originalFilename = attach.getOriginalFilename();
		logger.info("되나?1");
		String saveFilename= request.getRealPath("/resources/uploadfiles/"+originalFilename);
		logger.info("되나?2");
		FileOutputStream fos = new FileOutputStream(saveFilename);
		logger.info("되나?3");
		InputStream is = attach.getInputStream();
		logger.info("되나?4");
		int byteNo;
		byte[] data = new byte[1024];
		while((byteNo = is.read(data)) != -1) {
			fos.write(data, 0, byteNo);
		}
		fos.flush();
		fos.close();

		model.addAttribute("fileName", originalFilename);
		
		return "/board/photoReg";
	}
	
	@RequestMapping("/board/fileDownload")
	public void fileDownload(int boardNo, HttpServletRequest request, HttpServletResponse response) throws IOException{
		//응답 헤더(3개: 1>순수파일이름, 2>파일타입, 3>파일크기)
		Board board = boardService.getBoard(boardNo);
		String originalFilename=board.getBoard_original_file_name();
		
		String saveFilename=board.getBoard_file_system_name() ;
		
		String fileType=board.getBoard_content_type();
		File file=new File(saveFilename);
		long fileSize=file.length();
		
		//1>순수 파일 이름 설정
		String userAgent=request.getHeader("User-Agent");//요청하는 유저 브라우저의 종류
		if(userAgent.indexOf("MSIE")!=-1){
			originalFilename=URLEncoder.encode(originalFilename,"UTF-8");
		}else{
			originalFilename=new String(
					originalFilename.getBytes("UTF-8"),
					"ISO-8859-1"
					);
		}
		
		response.setHeader("Content-Disposition","attachment; filename=\""+originalFilename+"\";");
		//2>파일 타입
		response.setContentType(fileType);
		//3>파일 크기
		response.setContentLengthLong(fileSize);
		
		//응답 본문(파일의 데이터)
		response.setHeader("Content-Transfer-Encoding","binary");
		FileInputStream fis=new FileInputStream(file);
		OutputStream os=response.getOutputStream();
		
		/*//how1
		byte[] data= new byte[1024];
		int byteNum;
		while((byteNum=fis.read(data))!=-1){
			os.write(data,0,byteNum);
		}
		os.flush();
		os.close();
		fis.close();*/
		
		//how2=스프링제공
		FileCopyUtils.copy(fis, os);
		os.flush();
		os.close();
		fis.close();
	}
	
	@RequestMapping("/board/list")
	public String list(
			@RequestParam(value="pageNo", defaultValue="1") int pageNo, 
			Model model, 
			HttpSession session) {
		logger.info("pageNo: " + pageNo);
		
		session.setAttribute("pageNo", pageNo);
		
		int rowsPerPage = 10;
		int pagesPerGroup = 5;
				
		//�쟾泥� 寃뚯떆臾� �닔
		int totalBoardNo = boardService.getTotalBoardNo();
		
		//�쟾泥� �럹�씠吏� �닔
		int totalPageNo = totalBoardNo/rowsPerPage;
		if(totalBoardNo%rowsPerPage != 0) { totalPageNo++; }
		
		//�쟾泥� 洹몃９ �닔
		int totalGroupNo = totalPageNo / pagesPerGroup;
		if(totalPageNo%pagesPerGroup != 0) { totalGroupNo++; }
		
		//�쁽�옱 洹몃９踰덊샇, �떆�옉�럹�씠吏�踰덊샇, �걹�럹�씠吏�踰덊샇
		int groupNo = (pageNo-1)/pagesPerGroup + 1;
		int startPageNo = (groupNo-1)*pagesPerGroup + 1;
		int endPageNo = startPageNo + pagesPerGroup - 1;
		if(groupNo==totalGroupNo) { endPageNo = totalPageNo; }
		
		//�쁽�옱 �럹�씠吏� 寃뚯떆臾� 由ъ뒪�듃
		List<Board> list = boardService.getPage(pageNo, rowsPerPage);
		
		
		
		
		//View濡� �꽆湲� �뜲�씠�꽣
		model.addAttribute("pagesPerGroup", pagesPerGroup);
		model.addAttribute("totalPageNo", totalPageNo);
		model.addAttribute("totalGroupNo", totalGroupNo);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("list", list);
	
		
		return "board/list";
	}

	@RequestMapping("/board/detail")
	public String detail(int boardNo, Model model) {
		boardService.addHitcount(boardNo);
		Board board = boardService.getBoard(boardNo);
		List<Comment> clist = commentService.getComment(boardNo);
		
		model.addAttribute("board", board);		
		model.addAttribute("clist", clist);		
		
		return "board/detail";
	}
	
	@RequestMapping("/board/updateForm")
	public String updateForm(@RequestParam("bno") int boardNo, Model model) {
		Board board = boardService.getBoard(boardNo);
		model.addAttribute("board", board);
		return "board/updateForm";
	}
	
	@RequestMapping("/board/update")
	public String update(Board board) {
		boardService.modify(board);
		return "redirect:/board/detail?boardNo="+board.getBoard_no();
	}
	
	@RequestMapping("/board/delete/{boardNo}")
	public String delete(@PathVariable int boardNo) {
		boardService.remove(boardNo);
		return "redirect:/board/list";
	}
	

}










