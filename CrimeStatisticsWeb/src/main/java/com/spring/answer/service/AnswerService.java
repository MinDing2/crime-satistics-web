package com.spring.answer.service;

import java.util.List;


import com.spring.answer.vo.AnswerVo;

public interface AnswerService {

	//
	public List<AnswerVo> list(int quesiton_id);
		
	//
	public void write(AnswerVo vo);
	
	//
	public AnswerVo answerSelect(AnswerVo  vo);
	
	//
	public void modify(AnswerVo vo);
	
	//
	public void delete(AnswerVo vo);
}
