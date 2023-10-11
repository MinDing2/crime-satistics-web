package com.spring.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.member.service.MemberService;
import com.spring.member.vo.MemberVo;

@RestController
@RequestMapping("/member")
public class MemberRestController {

	@Autowired
	private MemberService memberService;
	
	// 鍮꾨�踰덊샇 �솗�씤
	@PostMapping("/password-check")
	public String passwordCheck(@RequestParam("password") String password, HttpSession session) {
		String memberid = (String)session.getAttribute("memberid");
		MemberVo findMember = memberService.findById(memberid);
		if (findMember.getPasswd().equals(password)) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	// �븘�씠�뵒 以묐났泥댄겕s
	@PostMapping("/id-check-duplicate")
	public String idCheckDuplicate(@RequestParam("memberid") String memberid) {
		MemberVo findMember = memberService.findById(memberid);
		if (findMember == null) {
			return "possible";
		} else {
			return "duplicate";
		}
	}
	
	// �땳�꽕�엫 以묐났泥댄겕
	@PostMapping("/nickname-check-duplicate")
	public String nicknameCheckDuplicate(@RequestParam("nickname") String nickname) {
		int num = memberService.nicknameCheck(nickname);
		if (num == 0) {
			return "available";
		} else {
			return "duplicate";
		}
	}
	
	// 鍮꾨�踰덊샇 李얘린
	@PostMapping("/find-password")
	public String findPassword(@RequestParam("memberid") String memberid) {
		MemberVo findMember = memberService.findById(memberid);
		if (findMember != null) {
			return findMember.getPasswd();
		} else {
			return "null";
		}
	}
	
}
