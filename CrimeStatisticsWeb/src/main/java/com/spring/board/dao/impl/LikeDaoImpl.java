package com.spring.board.dao.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.dao.LikeDao;

@Repository("likeDao")
public class LikeDaoImpl implements LikeDao {

	@Autowired
	private SqlSession sqlSession;


	// <!-- 게시글 추천 시 Like 테이블에 insert -->
	@Override
	public void insertLike(int bnum, String memberid) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("memberid", memberid);
		map.put("bnum", bnum);
		sqlSession.insert("Like.inserLike", map);
		
	}

	//	<!-- 게시글 추천취소 시 다시 0 -->
	@Override
	public void updateLikeCheckCancel(int bnum, String memberid) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("memberid", memberid);
		map.put("bnum", bnum);
		sqlSession.update("Like.updateLikeCheckCancel", map);
		
	}

	//<!-- 게시글 추천수 -->
	@Override
	public void updateLike(int bnum) {
		sqlSession.update("Like.updateLike",bnum);
		
	}

	//<!-- 게시글 추천취소 시 delete -->
	@Override
	public void deleteLike(int bnum, String memberid) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("memberid", memberid);
		map.put("bnum", bnum);
		sqlSession.delete("Like.deleteLike", map);
		
	}
	//<!-- 게시글 추천 시 Check를 1로 만들어서 중복방지 -->
	@Override
	public void updateLikeCheck(int bnum, String memberid) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("memberid", memberid);
		map.put("bnum", bnum);
		sqlSession.update("Like.updateLikeCheck", map);
		
	}

	//<!-- 게시글 추천취소 시 다시 0 -->
	@Override
	public void updateLikeCancel(int bnum) {
		sqlSession.update("Like.updateLikeCancel", bnum);
		
	}
	
	// <!-- 게시글 추천 중복방지 select문 -->
	@Override
	public int likeCheck(int bnum, String memberid) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("memberid", memberid);
		map.put("bnum", bnum);
		return sqlSession.selectOne("Like.likeCheck", map);
	}





	
}
