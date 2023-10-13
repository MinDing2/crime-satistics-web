package com.spring.answer.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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

		 
	    String adminId = (String) session.getAttribute("adminid");

	    if (adminId != null) {
	      
	        AnswerVo answerVo = new AnswerVo();

	        answerVo.setAnswer_id(answer_id);
	        answerVo.setAnswer_cont(answer_cont);
	        answerVo.setQuestion_id(question_id);

	        answerService.modify(answerVo);

	        
	        return new ResponseEntity<>("Answer modified successfully", HttpStatus.OK);
	    } else {
	       
	        return new ResponseEntity<>("Access denied. You must be logged in as an admin to modify answers.", HttpStatus.FORBIDDEN);
	    }
	   
	
	


		
	
	    /*
	     		@GetMapping("/delete")
		    public String getDelete(AnswerVo vo, HttpSession session, HttpServletRequest request) {
			
			String loggedInAdminId = (String) session.getAttribute("adminid");
			
			if(loggedInAdminId == null) {
				request.setAttribute("msg", "관리자권한이 필요합니다");
				request.setAttribute("url", "/question/view?question_id=" + vo.getQuestion_id() );
				return "question/alert";
			}
			
			answerService.delete(vo);
			
			return "redirect:/question/view?question_id=" + vo.getQuestion_id();
		}
	     */
	}	

}
