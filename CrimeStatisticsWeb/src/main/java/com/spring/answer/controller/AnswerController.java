package com.spring.answer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.answer.service.AnswerService;

@Controller
@RequestMapping("/answer")
public class AnswerController {
	@Autowired
	private AnswerService answerService;
}
