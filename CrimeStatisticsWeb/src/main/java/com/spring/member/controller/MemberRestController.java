package com.spring.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring.member.service.MemberService;
import com.spring.member.vo.MemberVo;
import com.spring.shop.service.ShopService;
import com.spring.shop.vo.PointVo;

@RestController
@RequestMapping("/member")
public class MemberRestController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ShopService shopService;
	
	// 비밀번호 확인
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
	
	// 아이디 중복체크
	@PostMapping("/id-check-duplicate")
	public String idCheckDuplicate(@RequestParam("memberid") String memberid) {
		MemberVo findMember = memberService.findById(memberid);
		if (findMember == null) {
			return "possible";
		} else {
			return "duplicate";
		}
	}
	
	// 닉네임 중복체크
	@PostMapping("/nickname-check-duplicate")
	public String nicknameCheckDuplicate(@RequestParam("nickname") String nickname) {
		int num = memberService.nicknameCheck(nickname);
		if (num == 0) {
			return "available";
		} else {
			return "duplicate";
		}
	}
	
	// 비밀번호 찾기
	@PostMapping("/find-password")
	public String findPassword(@RequestParam("memberid") String memberid) {
		MemberVo findMember = memberService.findById(memberid);
		if (findMember != null) {
			return findMember.getPasswd();
		} else {
			return "null";
		}
	}
	
	// 주문자 정보
	@PostMapping("find-by-orderinfo")
	public Object findByOrderInfo(@RequestParam("name") String name,
								  @RequestParam("tel") String tel,
								  @RequestParam("email") String email, Model model) {
		MemberVo findMember = memberService.findByOrderInfo(name, tel, email);
		if (findMember != null) {
			Map<String, String> map = new HashMap<>();
			map.put("name", findMember.getName());
			map.put("tel", findMember.getTel());
			map.put("address_postcode", findMember.getAddress_postcode());
			map.put("address_primary", findMember.getAddress_primary());
			map.put("address_detail", findMember.getAddress_detail());
			map.put("email", findMember.getEmail());
			return map;
		} else {
			return "error";
		}
	}
}
