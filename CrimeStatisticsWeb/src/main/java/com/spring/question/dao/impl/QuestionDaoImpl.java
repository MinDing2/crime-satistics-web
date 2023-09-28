package com.spring.question.dao.impl;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.question.dao.QuestionDao;
import com.spring.question.vo.QuestionVo;


@Repository("questionDao")
public class QuestionDaoImpl implements QuestionDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String namespace = "Question";
	
	//질문 목록
	@Override
	public List<QuestionVo> list() {
		return sqlSession.selectList(namespace +".list");
	}
	
	//질문 작성
	@Override
	public void insertQuestion(QuestionVo vo) {
		sqlSession.insert(namespace + ".writeQuestion" , vo);
	}
	
	//질문 조회 
	@Override
	public QuestionVo view(int question_id) {
		return sqlSession.selectOne(namespace +".view", question_id);
	}

	//질문 수정
	@Override
	public void modify(QuestionVo vo) {
		sqlSession.update(namespace + ".modify", vo); 
	}
	
	//질문 삭제
	@Override
	public void delete(int question_id) {
		sqlSession.delete(namespace + ".delete", question_id);
	}
	
	//질문 총 개수
	@Override
	public int count() {
		return sqlSession.selectOne(namespace + ".count");
	}
	
	//질문 목록 + 페이지 
	@Override
	public List<QuestionVo> listPage(int displayPost, int postNum) {
		
		HashMap<String, Integer> data = new HashMap<String, Integer>();
		
		data.put("displayPost",displayPost);
		data.put("postNum", postNum);
		
		return sqlSession.selectList(namespace + ".listPage", data);
	}

	@Override
	public List<QuestionVo> listPageSearch(int displayPost, int postNum, String searchType, String keyword) {
		  
		  HashMap<String, Object> data = new HashMap<String, Object>();
		  
		  data.put("displayPost", displayPost);
		  data.put("postNum", postNum);
		  
		  data.put("searchType", searchType);
		  data.put("keyword", keyword);
		  
		  return sqlSession.selectList(namespace + ".listPageSearch", data);
	}
	
	// 게시물 총 갯수 + 검색 적용
	@Override
	public int searchCount(String searchType, String keyword){
	 
	 HashMap<String, Object> data = new HashMap<String, Object>();
	 
	 data.put("searchType", searchType);
	 data.put("keyword", keyword);
	 
	 return sqlSession.selectOne(namespace + ".searchCount", data); 
	}
}



