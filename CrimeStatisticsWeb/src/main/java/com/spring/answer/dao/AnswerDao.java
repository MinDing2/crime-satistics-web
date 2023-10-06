package com.spring.answer.dao;

import java.util.List;

import com.spring.answer.vo.AnswerVo;

public interface AnswerDao {
	
	public List<AnswerVo> list(int quesiton_id);
	
	public void write(AnswerVo vo);

}
