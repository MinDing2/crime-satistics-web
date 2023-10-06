package com.spring.answer.dao.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import org.springframework.stereotype.Repository;

import com.spring.answer.dao.AnswerDao;
import com.spring.answer.vo.AnswerVo;

@Repository("answerDao")
public class AnswerDaoImpl implements AnswerDao {
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "Answer";
	
	@Override
	public List<AnswerVo> list(int quesiton_id) {
		return sql.selectList(namespace +".listAnswer", quesiton_id);
	}

	@Override
	public void write(AnswerVo vo) {
		sql.insert(namespace + ".writeAnswer", vo);
	}
	
	
}
