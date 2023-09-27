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
	public void delete(int question_id);
	
	//질문 개수
	public void count();
}
