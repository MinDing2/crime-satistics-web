 package com.spring.question.controller;

import java.util.List;



import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
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

import com.spring.member.service.MemberService;
import com.spring.member.vo.MemberVo;
import com.spring.question.service.QuestionService;
import com.spring.question.vo.Page;
import com.spring.question.vo.QuestionVo;

@Controller
@RequestMapping("/question")
public class QuestionController {
	@Autowired
	private QuestionService questionService; 
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private AnswerService answerService;
	
	//
	@GetMapping("/list")
	 public String getList(Model model){
		List<QuestionVo> list = questionService.list();
		
		model.addAttribute("list", list); 
		return "question/list";
	 }
	
	//
	@GetMapping("/writeform")
	public String getWrite(Model model, HttpSession session, HttpServletRequest request) {
		String memberid = (String)session.getAttribute("memberid");
		
		if(memberid == null) {
			request.setAttribute("msg", "관리자 권한입니다.");
			request.setAttribute("url", "http://localhost:8080" );
			return "question/alert";
		}
		MemberVo findMember = memberService.findById(memberid);
		
		model.addAttribute("memberid", memberid);
		model.addAttribute("nickname", findMember.getNickname());
		return "question/write";
	}
	
	//작성
	@PostMapping("/write")
	public String postwrite(QuestionVo vo, HttpSession session) {
		
		String memberid = (String)session.getAttribute("memberid");

		vo.setMemberid(memberid);
		
		questionService.insertQuestion(vo);
		
		return "redirect:/question/listPageSearch?num=1" ;	
	}
	
	//
	@GetMapping("/view")
	public void getView(@RequestParam("question_id") int question_id, Model model, HttpSession session) {
		
		QuestionVo vo = questionService.view(question_id);
	    String nickname = (String)session.getAttribute("nickname");
	    
		//
		model.addAttribute("view", vo);
		
		//
		List<AnswerVo> answer = null;
		answer = answerService.list(question_id);
		model.addAttribute("answer", answer);
		model.addAttribute("nickname", nickname);
	}
	
	//수정
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String getModify(@RequestParam("question_id") int question_id, Model model,HttpSession session,HttpServletRequest request) {
		QuestionVo vo = questionService.view(question_id);
        String memberid = (String)session.getAttribute("memberid");
		
		if(memberid == null) {
			request.setAttribute("msg", "회원만 가능합니다.");
			request.setAttribute("url", "/question/view?question_id=" + vo.getQuestion_id());
			return "question/alert";
		}

		model.addAttribute("view", vo);
		return "/question/modify";
	}
	
	// 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(QuestionVo vo) {
		questionService.modify(vo);
		return "redirect:/question/view?question_id=" + vo.getQuestion_id();		
	}
	
	//삭제
	@GetMapping("/delete")
	public String getDelete(@RequestParam("question_id") int question_id, HttpSession session, HttpServletRequest request) {
		
		String memberid = (String)session.getAttribute("memberid");
		
        QuestionVo vo   =  questionService.view(question_id);
		if(memberid == null) {
			request.setAttribute("msg", "관리자 권한입니다.");
			request.setAttribute("url", "/question/view?question_id=" + vo.getQuestion_id());
			return "question/alert";
		}
 
		questionService.delete(question_id);
		
		
		return "redirect:/question/listPageSearch?num=1";
	}
	
	//
	@GetMapping("/listPage")
	public void getListPage(Model model, @RequestParam("num") int num){
		
		
		Page page = new Page();
		
		page.setNum(num);
		page.setCount(questionService.count());  

		List<QuestionVo> list = null; 
		list = questionService.listPage(page.getDisplayPost(), page.getPostNum());

		model.addAttribute("list", list);   
		model.addAttribute("page", page);
		model.addAttribute("select", num);		
	}
	
	
	//
	@RequestMapping(value = "/listPageSearch", method = RequestMethod.GET)
	public void getListPageSearch(
			Model model, @RequestParam("num") int num, 
			@RequestParam(value = "searchType",required = false, defaultValue = "title") String searchType,
			@RequestParam(value = "keyword",required = false, defaultValue = "") String keyword
	  ) {

	 Page page = new Page();
	 
	 page.setNum(num);
	 page.setCount(questionService.searchCount(searchType, keyword));
	 
	 page.setSearchType(searchType);
	 page.setKeyword(keyword);
	 
	 List<QuestionVo> list = null; 
	 //list = service.listPage(page.getDisplayPost(), page.getPostNum());
	 list = questionService.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);
	 
	 model.addAttribute("list", list);
	 model.addAttribute("page", page);
	 model.addAttribute("select", num);
	}
}


