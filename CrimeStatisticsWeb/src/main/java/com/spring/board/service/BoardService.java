package com.spring.board.service;

import java.util.List;

import com.spring.board.domain.Criteria;
import com.spring.board.domain.ReplyVo;
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
	void deleteBoard(int bnum);

    //게시물 조회수	
	void readCount(BoardVo vo);

	//페이징 후 게시물 목록
	List<BoardVo> listPage(Criteria cri);	
	int listCount(BoardVo vo);

	// 검색 + 페이징
	List<BoardVo> listSearch(SearchCriteria scri);
	int countSearch(SearchCriteria scri);
	
    // 내가 작성한 게시물 갯수
	int myBoardcnt(BoardVo boardVo, String nickname);
	
    // 작성한 게시물 목록
	List<BoardVo> myboardList(String nickname);
	
    // 좋아요 누른 게시물 목록
	List<BoardVo> mylikeList(String memberid);
	



}
