package com.spring.question.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.member.service.MemberService;
import com.spring.member.vo.MemberVo;
import com.spring.question.service.QuestionService;
import com.spring.question.vo.QuestionVo;

@Controller
@RequestMapping("/question")
public class QuestionController {
	@Autowired
	private QuestionService questionService; 
	
	@Autowired
	private MemberService memberService;

	//질문 목록
	@GetMapping("/list")
	 public String getList(Model model){
		List<QuestionVo> list = questionService.list();
		
		model.addAttribute("list", list); 
		return "question/list";
	 }
	//질문 작성 폼
	@GetMapping("/writeform")
	public String getWrite(Model model, HttpSession session) {
		String memberid = (String)session.getAttribute("memberid");

		MemberVo findMember = memberService.findById(memberid);
		model.addAttribute("memberid", memberid);
		model.addAttribute("nickname", findMember.getNickname());
		return "question/write";
	}
	//질문 insert
	@PostMapping("/write")
	public String write(QuestionVo vo, HttpSession session) {
		String memberid = (String)session.getAttribute("memberid");
		vo.setMemberid(memberid);
		questionService.insertQuestion(vo);
		return "redirect:/question/list";	
	}
	
	//질문 조회 
	@GetMapping("/view")
	public void getView(@RequestParam("question_id") int question_id, Model model) {
		QuestionVo vo = questionService.view(question_id);
		
		model.addAttribute("view", vo);		
	}
	
	//질문 수정 폼
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void getModify(@RequestParam("question_id") int question_id, Model model) {
		QuestionVo vo = questionService.view(question_id);

		model.addAttribute("view", vo);
	}
	
	// 질문 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(QuestionVo vo) {
		questionService.modify(vo);
		return "redirect:/question/view?question_id=" + vo.getQuestion_id();		
	}
	
	@GetMapping("/delete")
	public String getDelete(@RequestParam("question_id") int question_id) {
		questionService.delete(question_id);
		return "redirect:/question/list";
	}
}
