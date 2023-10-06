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
	
	@Autowired
	private AnswerService answerService;
	
	//댓글 조회
	
	//댓글 작성
	@PostMapping("/writewAnswer")
	public String posttWrite(AnswerVo vo) {
		
		System.out.println(vo);
		answerService.write(vo);
		return "redirect:/question/view?question_id=" + vo.getQuestion_id();
	}
}
