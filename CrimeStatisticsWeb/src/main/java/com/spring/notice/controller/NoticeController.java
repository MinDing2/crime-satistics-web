package com.spring.notice.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.notice.service.NoticeService;
import com.spring.notice.vo.NoticeVo;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;

	
	//공지글 등록
	@GetMapping("/writeform")
	public ModelAndView writeform(NoticeVo nvo, HttpSession session) {
		
		// 세션으로 닉네임 받아오기
		String nickname = (String)session.getAttribute("nickname");
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("nvo",nvo);
		mv.addObject("nickname",nickname);
		mv.setViewName("notice/write");
		return mv;
		
	}
	
	@PostMapping("/write")
	public ModelAndView write(NoticeVo nvo) {
		
		noticeService.insertNotice(nvo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("nvo", nvo);
		mv.setViewName("redirect:/notice/list");
		
		System.out.println(nvo);
		return mv;
	}
	//공지글 목록
	@GetMapping("/list")
	public ModelAndView list(NoticeVo nvo) {
		
		List<NoticeVo> NoticeList = noticeService.noticelist(nvo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("NoticeList", NoticeList);
		mv.setViewName("notice/list");
		return mv;
	}
	//공지글 조회
	@GetMapping("/view")
	public ModelAndView view(NoticeVo nvo) {
		
		//조회수 증가
		noticeService.readCount(nvo);
		
		//공지글 내용 들고오기
		NoticeVo noticevo = noticeService.viewNotice(nvo);
		
		// 내용 자동 줄바꿈
		String        cont     =   noticevo.getCont().replace("\n", "<br>") ;
		noticevo.setCont(cont);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("nvo", noticevo);
		mv.setViewName("notice/view");
		
		return mv;
	}
	//공지글 수정
	@GetMapping("/updateform")
	public ModelAndView updateform(NoticeVo nvo) {
		
		//공지내용 들고오기
		NoticeVo noticevo = noticeService.viewNotice(nvo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("nvo", noticevo);
		mv.setViewName("notice/update");
		
		return mv;
	}
	
	@PostMapping("/update")
	public ModelAndView update(NoticeVo nvo) {
		
		noticeService.updateNotice(nvo);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/notice/view?nbnum="+ nvo.getNbnum());
		return mv;
	}
	//공지글 삭제
	@GetMapping("delete")
	public ModelAndView delete(NoticeVo nvo) {
		
		noticeService.deleteNotice(nvo);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/notice/list");
		return mv;
	}
	
}
