package com.spring.answer.service;

import java.util.List;

import com.spring.answer.vo.AnswerVo;

public interface AnswerService {

	//댓글 조회
	public List<AnswerVo> list(int answer_id);
		
	//댓글 작성 
	public void write(AnswerVo vo);

	//댓글 수정
	public void modify(AnswerVo vo);

	//댓글 삭제 
	public void delete(AnswerVo vo);
}
