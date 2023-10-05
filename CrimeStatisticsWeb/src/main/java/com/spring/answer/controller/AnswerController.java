package com.spring.answer.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.answer.service.AnswerService;
import com.spring.answer.vo.AnswerVo;
import com.spring.question.service.QuestionService;


@Controller
@RequestMapping("/answer")
public class AnswerController {
	@Inject
	private QuestionService questionservice; 
	@Inject
	private AnswerService answerService;
	
	//댓글 조회
	
	//답글 작성
	@PostMapping("/write")
	public String postwrite(AnswerVo vo, HttpSession session) {
		String adminid = (String)session.getAttribute("adminid");
		vo.setAdminid(adminid);
		answerService.write(vo);
		
		return "redirect:/question/view?quewtion_id=" + vo.getQuestion_id();	
	}
	//댓글 수정
	
	//댓글 삭제 
}
