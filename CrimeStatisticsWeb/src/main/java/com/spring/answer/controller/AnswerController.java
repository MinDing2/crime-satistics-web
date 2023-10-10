package com.spring.answer.controller;

import javax.inject.Inject;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.answer.service.AnswerService;
import com.spring.answer.vo.AnswerVo;
import com.spring.question.service.QuestionService;


@Controller
@RequestMapping("/answer")
public class AnswerController {
	
	@Autowired
	private AnswerService answerService;
	
	
	// 댓글 단일 조회 (수정 페이지)
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void getMofidy(@RequestParam("question_id") int question_id, @RequestParam("answer_id") int answer_id, Model model) throws Exception {
		
		AnswerVo vo = new AnswerVo();
		vo.setQuestion_id(question_id);
		vo.setAnswer_id(answer_id);
		
		AnswerVo answer = answerService.answerSelect(vo);
			 
		model.addAttribute("answer", answer);
	}
	
	//댓글 작성
	@PostMapping("/writewAnswer")
	public String postWrite(AnswerVo vo) {
		
		System.out.println(vo);
		answerService.write(vo);
		return "redirect:/question/view?question_id=" + vo.getQuestion_id();
	}
	
	// 댓글 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(AnswerVo vo) throws Exception {

		answerService.modify(vo);

		return "redirect:/question/view?question_id=" + vo.getQuestion_id();
	}
	

	//답글 삭제
		@GetMapping("/delete")
		public String getDelete(AnswerVo vo) {
			answerService.delete(vo);
			return "redirect:/question/view?question_id=" + vo.getQuestion_id();
		}
}
