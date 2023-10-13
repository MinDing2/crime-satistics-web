package com.spring.board.service;

public interface LikeService {

	int likeCheck(int bnum, String memberid);

	void insertLike(int bnum, String memberid);

	void updateLikeCheckCancel(int bnum, String memberid);

	void updateLike(int bnum);

	void updateLikeCheck(int bnum, String memberid);

	void updateLikeCancel(int bnum);

	void deleteLike(int bnum, String memberid);


	

}
