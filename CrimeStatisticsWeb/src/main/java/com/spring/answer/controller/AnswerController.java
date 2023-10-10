package com.spring.answer.controller;

import java.net.http.HttpRequest;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	
	
	// ����
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void getMofidy(@RequestParam("question_id") int question_id, @RequestParam("answer_id") int answer_id, Model model) throws Exception {
		
		AnswerVo vo = new AnswerVo();
		vo.setQuestion_id(question_id);
		vo.setAnswer_id(answer_id);
		
		AnswerVo answer = answerService.answerSelect(vo);
			 
		model.addAttribute("answer", answer);
	}
	
	//
	@PostMapping("/writewAnswer")
	public String postWrite(AnswerVo vo, HttpSession session,HttpServletRequest request) {
		
		String loggedInAdminId = (String) session.getAttribute("adminid");
		
		if(loggedInAdminId == null) {
			    //adminid�� �α��ε��� ���� ���, JavaScript alert �޽����� ����ϰ� ���� �������� �ǵ��ư���
		        request.setAttribute("msg", "���������� �ʿ��մϴ�.");
		        request.setAttribute("url", "/question/view?question_id=" + vo.getQuestion_id() );
		        return "question/alert";
		}
		vo.setAdminid(loggedInAdminId);
		
		//System.out.println(vo);
	
		answerService.write(vo);
		return "redirect:/question/view?question_id=" + vo.getQuestion_id();
	}
	
	
	//
//	@RequestMapping(value = "/modify", method = RequestMethod.POST)
//	public String postModify(AnswerVo vo) throws Exception {
//
//		answerService.modify(vo);
//
//		return "redirect:/question/view?question_id=" + vo.getQuestion_id();
//	}
	

	//
		@GetMapping("/delete")
		public String getDelete(AnswerVo vo) {
			answerService.delete(vo);
			return "redirect:/question/view?question_id=" + vo.getQuestion_id();
		}
}
