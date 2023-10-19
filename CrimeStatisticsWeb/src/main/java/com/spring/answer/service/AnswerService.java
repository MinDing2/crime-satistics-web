package com.spring.answer.service;

import java.util.List;


import com.spring.answer.vo.AnswerVo;

public interface AnswerService {

	//조회
	public List<AnswerVo> list(int quesiton_id);
		
	//작성
	public void write(AnswerVo vo);
	
	//
	public AnswerVo answerSelect(AnswerVo  vo);
	
	//수정
	public void modify(AnswerVo vo);
	
	//삭제
	public void delete(AnswerVo vo);
}
