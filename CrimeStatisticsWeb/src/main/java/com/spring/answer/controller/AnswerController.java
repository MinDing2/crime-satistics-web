package com.spring.answer.controller;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.answer.service.AnswerService;
import com.spring.question.service.QuestionService;

@Controller
@RequestMapping("/answer")
public class AnswerController {
	@Inject
	private QuestionService service; 
	@Inject
	private AnswerService answerService;
	
	//댓글 조회
	
	//댓글 작성
	
	//댓글 수정
	
	//댓글 삭제 
}
