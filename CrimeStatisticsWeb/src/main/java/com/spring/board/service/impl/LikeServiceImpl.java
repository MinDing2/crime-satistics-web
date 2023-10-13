package com.spring.board.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.LikeDao;
import com.spring.board.service.LikeService;

@Service("likeService")
public class LikeServiceImpl implements LikeService {
  
  @Autowired
  private LikeDao likeDao;

@Override
public int likeCheck(int bnum, String memberid) {
	
	return likeDao.likeCheck(bnum,memberid);
}

@Override
public void insertLike(int bnum, String memberid) {
	likeDao.insertLike(bnum,memberid);
	
}

@Override
public void updateLikeCheckCancel(int bnum, String memberid) {
	likeDao.updateLikeCheckCancel(bnum,memberid);
	
}

@Override
public void updateLike(int bnum) {
	likeDao.updateLike(bnum);
	
}

@Override
public void updateLikeCheck(int bnum, String memberid) {
	likeDao.updateLikeCheck(bnum,memberid);
	
}

@Override
public void updateLikeCancel(int bnum) {
	likeDao.updateLikeCancel(bnum);
	
}

@Override
public void deleteLike(int bnum, String memberid) {
	likeDao.deleteLike(bnum,memberid);
	
}




}
