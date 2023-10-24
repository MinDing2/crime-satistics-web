package com.spring.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.BoardDao;
import com.spring.board.domain.Criteria;
import com.spring.board.domain.ReplyVo;
import com.spring.board.domain.SearchCriteria;
import com.spring.board.service.BoardService;
import com.spring.board.vo.BoardVo;

@Service("boardService")
public class BoardSerivceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;

	@Override
	public List<BoardVo> getBoardList(BoardVo vo) {
		List<BoardVo> boardList = boardDao.getBoardList(vo);
		return boardList;
	}

	// 게시물 작성
	@Override
	public void insertBoard(BoardVo vo) {
		boardDao.insertBoard(vo);
		
	}
    // 게시물 조회
	@Override
	public BoardVo getView(BoardVo vo) {
		BoardVo boardVo = boardDao.getView(vo);
		return boardVo;
	}
    // 게시물 수정
	@Override
	public void updateBoard(BoardVo vo) {
		boardDao.updateBoard(vo);
		
	}
    // 게시물 삭제
	@Override
	public void deleteBoard(int bnum) {
		boardDao.deleteBoard(bnum);
		
	}
    // 게시물 조회수
	@Override
	public void readCount(BoardVo vo) {
		boardDao.readCount(vo);
		
	}
    // 페이징
	@Override
	public List<BoardVo> listPage(Criteria cri) {
		List<BoardVo> boardList = boardDao.listPage(cri);
		return boardList;
	}
    // 페이징 시 게시물 수
	@Override
	public int listCount(BoardVo vo) {
		
		return boardDao.listCount(vo);
	}

	// 검색 + 페이징
	@Override
	public List<BoardVo> listSearch(SearchCriteria scri) {
		List<BoardVo> boardList = boardDao.listSearch(scri);
		return boardList;
	}
  
	// 검색 + 페이징 시 게시물 수
	@Override
	public int countSearch(SearchCriteria scri) {
		
		return boardDao.countSearch(scri);
	}
   // 나의 게시물 수
	@Override
	public int myBoardcnt(BoardVo boardVo, String nickname) {
		int myBoardcnt = boardDao.myBoardcnt(boardVo,nickname);
		return myBoardcnt;
	}
	
	// 나의 게시물 목록
	@Override
	public List<BoardVo> myboardList(String nickname) {
		List<BoardVo> myboardList = boardDao.myboardList(nickname);
		return myboardList;
	}
	// 내가 좋아요 누른 게시물
	@Override
	public List<BoardVo> mylikeList(String memberid) {
		List<BoardVo> mylikeList = boardDao.mylikeList(memberid);
		return mylikeList;
	}

}
