package com.spring.answer.dao;

import java.util.List;

import com.spring.answer.vo.AnswerVo;

public interface AnswerDao {
	
	public List<AnswerVo> list(int quesiton_id);
	//댓글 작성
	public void write(AnswerVo vo);
	
	// 단일 댓글 조회
	public AnswerVo answerSelect(AnswerVo  vo);
	
	// 댓글 수정
	public void modify(AnswerVo vo);
	
	//댓글 삭제
	public void delete(AnswerVo vo);
}
