package com.spring.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.board.domain.ReplyVo;
import com.spring.board.service.ReplyService;


@Controller
@RequestMapping("/reply")
public class ReplyController {

	@Autowired
	private ReplyService replyService;
	
	
	//
	@PostMapping("/write")
	public ModelAndView write(ReplyVo vo) {
		
		replyService.insertReply(vo);		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/board/view?bnum=" + vo.getBnum());
		return mv;
		
	}
	//
	@PostMapping("/update")
	public ModelAndView update(ReplyVo vo) {
		replyService.updateReply(vo);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/board/view?bnum=" + vo.getBnum());
		return mv;		
	}
	
	//
	@GetMapping("/delete")
	public ModelAndView delete(ReplyVo vo) {
		
		replyService.deleteReply(vo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/board/view?bnum=" + vo.getBnum());
		return mv;
		
	}	
	
}
