package com.spring.board.dao;

import java.util.List;

import com.spring.board.domain.Criteria;
import com.spring.board.domain.SearchCriteria;
import com.spring.board.vo.BoardVo;

public interface BoardDao {

	List<BoardVo> getBoardList(BoardVo vo);

	void insertBoard(BoardVo vo);

	BoardVo getView(BoardVo vo);

	void updateBoard(BoardVo vo);

	void deleteBoard(int bnum);

	void readCount(BoardVo vo);

	List<BoardVo> listPage(Criteria cri);

	int listCount(BoardVo vo);

	List<BoardVo> listSearch(SearchCriteria scri);

	int countSearch(SearchCriteria scri);

	int myBoardcnt(BoardVo boardVo, String nickname);

	List<BoardVo> myboardList(String nickname);

	List<BoardVo> mylikeList(String memberid);



}
