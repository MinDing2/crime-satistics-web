package com.spring.answer.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.answer.dao.AnswerDao;
import com.spring.answer.service.AnswerService;

@Service("answerService")
public class AnswerServiceImpl implements AnswerService {
	@Autowired
	AnswerDao answerDao;
}
