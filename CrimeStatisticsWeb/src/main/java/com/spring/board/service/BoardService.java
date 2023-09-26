package com.spring.board.service;

import java.util.List;

import com.spring.board.domain.Criteria;
import com.spring.board.domain.SearchCriteria;
import com.spring.board.vo.BoardVo;

public interface BoardService {

	//전체 게시물 목록	
	List<BoardVo> getBoardList(BoardVo vo);

	//게시물 등록
	void insertBoard(BoardVo vo);
	
	//게시물 조회
	BoardVo getView(BoardVo vo);

    //게시물 수정
	void updateBoard(BoardVo vo);
	
    //게시물 삭제
	void deleteBoard(BoardVo vo);

    //게시물 조회수	
	void readCount(BoardVo vo);

	//페이징 후 게시물 목록
	List<BoardVo> listPage(Criteria cri);	
	int listCount(BoardVo vo);

	List<BoardVo> listSearch(SearchCriteria scri);

	int countSearch(SearchCriteria scri);



}
