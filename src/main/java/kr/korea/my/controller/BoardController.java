package kr.korea.my.controller;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import kr.korea.my.pagination.Criteria;
import kr.korea.my.pagination.PageMaker;
import kr.korea.my.service.BoardService;
import kr.korea.my.service.MemberService;
import kr.korea.my.utils.UploadFileUtils;
import kr.korea.my.vo.BoardVO;
import kr.korea.my.vo.MemberVO;


@Controller
@RequestMapping(value="/board/")
public class BoardController {

	@Autowired
	BoardService boardService;
	
	@Resource
	String uploadPath;
	
	
	  @RequestMapping(value = "/mainList", method = RequestMethod.GET)
	 	public String boardMainListGet(Model model){
		 
		  return "board/mainList";
 		}
		  
	  
	  @RequestMapping(value = "/list", method = RequestMethod.GET)
	   	public String boardListGet(Model model, Criteria cri){
//	   		logger.info("게시판 리스트");
		  	
		  	//cri.setPerPageNum(8);
		  	//현재 화면에 보여지는 페이지
		  	
		  	ArrayList<BoardVO> boardList = boardService.getBoardList(cri);
	   		PageMaker pm = new PageMaker();
	   		
	   		
	   		
	   		pm.setCriteria(cri);
	   		pm.setDisplayPageNum(10);
	   		
	   		
	   		int totalCount = boardService.getTotalCount(cri); 
	   		pm.setTotalCount(totalCount);
	   		model.addAttribute("pageMaker", pm);
	   		model.addAttribute("list", boardList);
	   		
	   		return "board/list";
	   		}
	  
	  
	  
	  @RequestMapping(value = "/display", method = RequestMethod.GET)
	   	public String boardDisplayGet(Model model, Integer num){

		  	// 여기서 조회수 증가 작업을 해야한다.
		  	boardService.updateView(num);
		  
		    BoardVO bVo = boardService.getBoard(num);
		    //하나의 게시판 번호를 클릭하면 하나의 게시판 페이지를 보여준다.
 	
		  	model.addAttribute("board", bVo);
		  	return "board/display";
	   		}
	  
	  
	    // 게시판 수정에 관한 메서드
	  @RequestMapping(value = "/modify", method = RequestMethod.GET)
	   	public String boardModifyGet(Model model, Integer num, HttpServletRequest r){
	   		if(boardService.isWriter(num,r)) {
	   			return "ridirect:/board/list";
	   		}
	   			
		  	BoardVO bVo = boardService.getBoard(num);
		  	model.addAttribute("board", bVo);
		  
	   		return "board/modify";
	   		}
	  
	  
	  @RequestMapping(value = "/modify", method = RequestMethod.POST)
	   	public String boardModifyPost(Model model, BoardVO bVo, HttpServletRequest r){
		  
		  	boardService.updateBoard(bVo, r);
		   	
		  	model.addAttribute("num",bVo.getNum());
	   		return "redirect:/board/display";
	  }
	  	  
	  
   //게시판 등록 하는법
	  @RequestMapping(value="register", method=RequestMethod.GET)
		public String boardRegisterGet() {
			return "board/register";
		}
	  
	  @RequestMapping(value="register", method=RequestMethod.POST)
		public String boardRegisterPost(BoardVO boardVo) {
			System.out.println(boardVo);
			boardService.registerBoard(boardVo);
			return "redirect:/board/register";
		}
				
	//작성자가 맞으면 삭제하게 해주고 작성자가 아니면 삭제를 못하게 함
		@RequestMapping(value="delete", method=RequestMethod.GET)
		public String boardDeleteGet(Integer num, HttpServletRequest r) {
			if(boardService.isWriter(num,r)) {
			boardService.deleteBoard(num);
			}
			return "redirect:/board/list";
		}
		
	

	
}   