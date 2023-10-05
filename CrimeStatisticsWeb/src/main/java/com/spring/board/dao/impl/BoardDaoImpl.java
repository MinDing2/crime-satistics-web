package com.spring.board.dao.impl;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.dao.BoardDao;
import com.spring.board.domain.Criteria;
import com.spring.board.domain.SearchCriteria;
import com.spring.board.vo.BoardVo;


@Repository("boardDao")
public class BoardDaoImpl implements BoardDao {

	@Autowired
	private  SqlSession  sqlSession;

	// 게시물 목록
	@Override
	public List<BoardVo> getBoardList(BoardVo vo) {
		List<BoardVo> boardList = sqlSession.selectList("Board.getList", vo);
		return boardList;
	}
	// 게시물 작성
	@Override
	public void insertBoard(BoardVo vo) {
		sqlSession.insert("Board.insertBoard", vo);
		
	}
	// 게시물 조회
	@Override
	public BoardVo getView(BoardVo vo) {
		BoardVo boardVo = sqlSession.selectOne("Board.getView", vo);
		return boardVo;
	}
	// 게시물 수정
	@Override
	public void updateBoard(BoardVo vo) {
		sqlSession.update("Board.updateBoard", vo);
		
	}
	// 게시물 삭제
	@Override
	public void deleteBoard(BoardVo vo) {
		sqlSession.delete("Board.deleteBoard", vo);
		
	}
	// 게시물 조회수
	@Override
	public void readCount(BoardVo vo) {
		sqlSession.update("Board.readCount", vo);
		
	}
	// 게시물 목록(페이징)
	@Override
	public List<BoardVo> listPage(Criteria cri) {
		List<BoardVo> boardList = sqlSession.selectList("Board.listPage", cri);
		return boardList;
	}
	// 게시물 수(페이징)
	@Override
	public int listCount(BoardVo vo) {
		
		return sqlSession.selectOne("Board.listCount",vo);
	}
	// 게시물 목록(검색 + 페이징)
	@Override
	public List<BoardVo> listSearch(SearchCriteria scri) {
		List<BoardVo> boardList = sqlSession.selectList("Board.listSearch", scri);
		return boardList;
	}
	// 게시물 수(검색 + 페이징)
	@Override
	public int countSearch(SearchCriteria scri) {
		
		return sqlSession.selectOne("Board.countSearch", scri);
	}

	


}
