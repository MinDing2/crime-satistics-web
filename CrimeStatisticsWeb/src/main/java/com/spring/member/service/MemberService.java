package com.spring.member.service;

import javax.servlet.http.HttpSession;

import com.spring.member.vo.MemberVo;

public interface MemberService {

	// 회원가입
	void signup(MemberVo memberVo);
	
	// 회원찾기
	MemberVo findById(String memberId);

	// 로그인
	MemberVo login(MemberVo memberVo);

	// 로그아웃
	void logout(HttpSession session);

	// 회원수정
	void memberModify(MemberVo memberVo);
	
	// 회원탈퇴
	void memberDelete(String memberid);
	
	// 닉네임체크
	int nicknameCheck(String nickname);
	
	// 아이디 찾기(이메일 활용)
	String findIdWithEmail(String email);

	// 주문자 정보
	MemberVo findByOrderInfo(String name, String tel, String email);

	// 적립예정 포인트
	void accumulatePoint(int accumulatePoint, String memberid);

	// 포인트 사용
	void pointUsage(int usedPoint, String memberid);
}
