package com.spring.answer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring.answer.service.AnswerService;
import com.spring.answer.vo.AnswerVo;

@RestController
@RequestMapping("/answer")
public class AnswerRestController {
	

	@Autowired
	private AnswerService answerService;
	
	@PostMapping("/modify")
	public String postModify(@RequestParam("answer_id") int answer_id,
							 @RequestParam("answer_cont") String answer_cont,
							 @RequestParam("question_id") int question_id) throws Exception {
	    // answerService.modify 메서드를 호출하여 수정 로직 수행
		AnswerVo answerVo = new AnswerVo();
		answerVo.setAnswer_id(answer_id);
		answerVo.setAnswer_cont(answer_cont);
		answerVo.setQuestion_id(question_id);
	    answerService.modify(answerVo);
	    
	    return "response";
	}	

}
