package com.spring.answer.service.impl;

import java.util.List;


import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.answer.dao.AnswerDao;
import com.spring.answer.service.AnswerService;
import com.spring.answer.vo.AnswerVo;

@Service
public class AnswerServiceImpl implements AnswerService {
	
	@Autowired
	private AnswerDao dao;

	//조회 
	@Override
	public List<AnswerVo> list(int quesiton_id) {
		return dao.list(quesiton_id);
	}

	//답글 작성 
	@Override
	public void write(AnswerVo vo) {
		dao.write(vo);
	}
	
	//단일 수정 답글 조회
	@Override
	public AnswerVo answerSelect(AnswerVo vo) {
		return dao.answerSelect(vo);
	}
	
	//답글 수정
	@Override
	public void modify(AnswerVo vo) {
		dao.modify(vo);
	}
	
	//답글 삭제
	@Override
	public void delete(AnswerVo vo) {
		dao.delete(vo);
	}	

}
