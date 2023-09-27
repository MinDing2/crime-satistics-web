package com.spring.question.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.spring.question.dao.QuestionDao;
import com.spring.question.service.QuestionService;
import com.spring.question.vo.QuestionVo;

@Service("questionService")
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	private QuestionDao dao; 

	//질문 목록
	@Override
	public List<QuestionVo> list(){
		return dao.list();
	}
	
	//질문 작성
	@Override
	public void insertQuestion(QuestionVo vo) {
		dao.insertQuestion(vo);
	}
	
	//질문 조회
	@Override
	public QuestionVo view(int question_id) {
		return dao.view(question_id);
	}
	
	//질문 수정
	@Override
	public void modify(QuestionVo vo) {
		dao.modify(vo);	
	}
	
	//질문 삭제
	@Override
	public void delete(int question_id) {
		dao.delete(question_id);
	}
	
	//질문 개수
	@Override
	public void count() {
		dao.count();
	}
	
}
