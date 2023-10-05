package com.spring.answer.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.answer.dao.AnswerDao;
import com.spring.answer.vo.AnswerVo;

@Repository("answerDao")
public class AnswerDaoImpl implements AnswerDao {
	 @Autowired
	 private SqlSession sql;
	private static String namespace = "Answer";
	//댓글 조회
	@Override
	public List<AnswerVo> list(int bno) {
		return sql.selectList(namespace + ".AnswerList", bno);
	}

	//댓글 작성 
	@Override
	public void write(AnswerVo vo) {
		sql.insert(namespace + ".AnswerWrite", vo);
	}

	@Override
	public void modify(AnswerVo vo) {
		sql.update(namespace + ".AnswerModify", vo);
	}

	@Override
	public void delete(AnswerVo vo) {
		sql.delete(namespace + ".AnswerDelete", vo);
	}

		

		
	
}
