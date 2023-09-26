package com.spring.answer.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.answer.dao.AnswerDao;

@Repository("answerDao")
public class AnswerDaoImpl implements AnswerDao {
	@Autowired
	SqlSession sqlsession;
	
	private final String namespace = "Answer";
}
