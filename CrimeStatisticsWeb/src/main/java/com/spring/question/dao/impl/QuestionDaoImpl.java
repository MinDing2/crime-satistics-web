package com.spring.question.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public Object delete(int question_id, String memberid) {
        Map<String, Object> data = new HashMap<String, Object>();
		
		data.put("memberid",  memberid);
		data.put("question_id", question_id);
		
		return sqlSession.delete(namespace + ".delete", data);
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
	
	
	//질문 목록 + 페이징 + 검색
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
	
	// 마이페이지 질문 목록 
	@Override
	public List<QuestionVo> listMyPage(int displayPost, int postNum, String memberid) {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
	
		data.put("displayPost",displayPost);
		data.put("postNum", postNum);
		data.put("memberid", memberid);
		
		return sqlSession.selectList(namespace + ".mypageAnswerList", data);
	}
	
	// 마이페이지 질문 개수
	@Override
	public Object questionCnt(String memberid, String nickname) {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("memberid",  memberid);
		data.put("nickname", nickname);
		
		return sqlSession.selectOne(namespace + ".questionCnt", data);
	}
	
	//관리자 페이지 질문 목록
	@Override
	public List<QuestionVo> adminListPageSearch(int displayPost, int postNum, String searchType, String keyword) {
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		  data.put("displayPost", displayPost);
		  data.put("postNum", postNum);
		  
		  data.put("searchType", searchType);
		  data.put("keyword", keyword);
		  
		  
	  	return sqlSession.selectList(namespace +".adminListPageSearch", data); 
	}
}



