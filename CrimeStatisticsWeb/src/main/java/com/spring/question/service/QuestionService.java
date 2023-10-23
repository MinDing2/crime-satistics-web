package com.spring.question.service;

import java.util.List;

import com.spring.question.vo.QuestionVo;

public interface QuestionService {
	//질문 목록
	public List<QuestionVo> list();
	
	//질문 작성
	public void insertQuestion(QuestionVo vo);
	
	//질문 조회
	public QuestionVo view(int question_id);
	
	//질문 수정
	public void modify(QuestionVo vo); 
	
	//질문 삭제
	public Object delete(int question_id, String memberid);
	
	//질문 개수
	public int count();
	
	//질문 목록 + 페이징 
	public List<QuestionVo> listPage(int displayPost, int postNum);
	
	//질문 목록 + 페이징 + 검색 
	public List<QuestionVo> listPageSearch(int displayPost, int postNum, String searchType, String keyword);
	
	// 게시물 총 갯수 + 검색 적용
	public int searchCount(String searchType, String keyword);
	
	// 마이페이지 질문 리스트 
	public List<QuestionVo> listMyPage(int displayPost, int postNum, String memeberid);
	//질문 개수
	public Object questionCnt(String memberid, String nickname);
	//관리자 페이지 답변 리스트
	public List<QuestionVo> adminListPageSearch(int displayPost, int postNum, String searchType, String keyword);
	
}
