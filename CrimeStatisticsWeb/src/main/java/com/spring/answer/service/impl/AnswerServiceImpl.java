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
	@Inject
	AnswerDao dao;

	@Override
	public List<AnswerVo> list(int answer_id) {
		return dao.list(answer_id);
	}

	@Override
	public void write(AnswerVo vo) {
		dao.write(vo);		
	}

	@Override
	public void modify(AnswerVo vo) {
		dao.modify(vo);
	}

	@Override
	public void delete(AnswerVo vo) {
		dao.delete(vo);
	}
}
