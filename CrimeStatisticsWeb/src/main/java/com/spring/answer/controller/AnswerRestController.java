package com.spring.answer.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
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
	public  ResponseEntity<String> postModify(@RequestParam("answer_id") int answer_id,
							 @RequestParam("answer_cont") String answer_cont,
							 @RequestParam("question_id") int question_id,
							 HttpSession session
							) throws Exception {

		 // 세션에서 로그인한 관리자 ID를 가져옵니다. 이것은 관리자로 로그인된 경우에만 값이 존재합니다.
	    String adminId = (String) session.getAttribute("adminid");

	    if (adminId != null) {
	        // 관리자로 로그인되어 있을 경우에만 수정을 허용합니다.
	        AnswerVo answerVo = new AnswerVo();

	        answerVo.setAnswer_id(answer_id);
	        answerVo.setAnswer_cont(answer_cont);
	        answerVo.setQuestion_id(question_id);

	        answerService.modify(answerVo);

	        // 수정이 성공했을 때, 성공 응답을 반환합니다.
	        return new ResponseEntity<>("Answer modified successfully", HttpStatus.OK);
	    } else {
	        // 관리자로 로그인되지 않은 경우에는 수정을 거부하고 권한 없음 응답을 반환합니다.
	        return new ResponseEntity<>("Access denied. You must be logged in as an admin to modify answers.", HttpStatus.FORBIDDEN);
	    }

	}	

}
