package com.spring.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.board.domain.PageMaker;
import com.spring.board.domain.ReplyVo;
import com.spring.board.domain.SearchCriteria;
import com.spring.board.service.BoardService;
import com.spring.board.service.LikeService;
import com.spring.board.service.ReplyService;
import com.spring.board.vo.BoardVo;
import com.spring.menu.service.MenuService;
import com.spring.menu.vo.MenuVo;
import com.spring.notice.service.NoticeService;
import com.spring.notice.vo.NoticeVo;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;

	@Autowired
	private MenuService menuService;
	
	@Autowired
	private ReplyService  replyService;
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private LikeService likeService;


	// 게시물 등록 /board/writeform?menu_id=1
	@GetMapping("/writeform")
	public ModelAndView writeform(BoardVo vo, HttpSession session) {
		
		
		// 세션으로 닉네임 받아오기
		String nickname = (String)session.getAttribute("nickname");

		ModelAndView mv = new ModelAndView();
		mv.addObject("nickname", nickname);		
		mv.addObject("vo", vo);
		mv.setViewName("board/write");
		return mv;
	}
	
   //게시물 작성
	@PostMapping("/write")
	public ModelAndView write(BoardVo vo) {
		boardService.insertBoard(vo);

		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo);
		mv.setViewName("redirect:/board/listsearch?page=1&perPageNum=10&menu_id=" + vo.getMenu_id());
		return mv;
	}
	
	// /Board/View?bnum=4&menu_id=MENU01
	// 게시물 보기
	@GetMapping("/view")
	
	public  ModelAndView   view( BoardVo vo, HttpSession session ) {
		
		ModelAndView  mv  =  new ModelAndView();	
		// 게시물 조회 시 조회수 증가
		boardService.readCount(vo);		
		
		// 메뉴 목록 조회
		List<MenuVo>  menuList  =  menuService.getMenuList();
		
		// 보여줄 게시물 내용을 조회
		BoardVo       boardVo  =   boardService.getView( vo );
		
		// LikeCheck 가져오기
		String memberid = (String)session.getAttribute("memberid");
		if(memberid != null) {
			int bnum = vo.getBnum();
			int likecheck = likeService.likeCheck(bnum, memberid);			
			mv.addObject("likecheck",likecheck);
		}

		// 댓글 목록 조회
		List<ReplyVo> replyList = replyService.getReplyList(vo);
		
		// 세션으로 닉네임 받아오기
		String nickname = (String)session.getAttribute("nickname");
		
		// 내용 자동 줄바꿈
		String        cont     =   boardVo.getCont().replace("\n", "<br>") ;
		boardVo.setCont(cont);
		
		
		
		mv.addObject("menuList",  menuList);
		mv.addObject("nickname",  nickname);
		mv.addObject("replyList",replyList);
		mv.addObject("vo", boardVo);
		mv.setViewName("board/view");
		return mv;
	}
	
	
	// /board/updateform?bnum=1&menu_id=1
	// 게시글 수정
	@GetMapping("/updateform")
	public  ModelAndView  updateForm( BoardVo vo ) {
		
		BoardVo       boardVo  =  boardService.getView( vo );  
		
		ModelAndView  mv       =  new ModelAndView();
		mv.addObject("vo", boardVo );
		mv.setViewName("board/update");
		return   mv;
	}
	@PostMapping("/update")
	public ModelAndView update(BoardVo vo) {
		boardService.updateBoard(vo);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/board/view?bnum="+ vo.getBnum());
		return mv;
	}
	


	//게시물 목록 ( 검색 + 페이징 )
	@GetMapping("/listsearch")
	public ModelAndView listsearch(BoardVo vo, SearchCriteria scri,NoticeVo nvo) {
		
		// 메뉴목록
		//List<MenuVo> menuList = menuService.getMenuList();
		
		// 현재 메뉴이름
		String  menuname  = menuService.getMenuName( vo.getMenu_id() );
		
		// 게시물 목록
		List<BoardVo> boardList = boardService.listSearch(scri);
		
		// 공지사항 목록
		List<NoticeVo> noticeList = noticeService.noticelist(nvo);
		// 페이지
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(boardService.countSearch(scri));
		int endpageCount = (int) pageMaker.getTotalCount() / pageMaker.getDisplayPageNum();
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("vo", vo);
		mv.addObject("name", menuname);
		mv.addObject("pageMaker",pageMaker);
		mv.addObject("noticeList", noticeList);
		mv.addObject("boardList", boardList);
		mv.addObject("endpageCount", endpageCount);
		mv.setViewName("board/listsearch");
		return mv;
		
	}

	
}
