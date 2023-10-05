package com.spring.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.board.service.LikeService;

@RestController
@RequestMapping("/board")
public class LikeController {
    
	@Autowired
	private LikeService likeService;
	
	@GetMapping("/updatelike")
	public int updateLike(int bnum, String memberid)throws Exception{
		
		int likeCheck = likeService.likeCheck(bnum, memberid);
		if(likeCheck == 0) {
			//좋아요 처음누름
			likeService.insertLike(bnum, memberid); //like테이블 삽입
			likeService.updateLike(bnum);	//게시판테이블 +1
			likeService.updateLikeCheck(bnum, memberid);//like테이블 구분자 1

		}else if(likeCheck == 1) {
			likeService.updateLikeCheckCancel(bnum, memberid); //like테이블 구분자0
			likeService.updateLikeCancel(bnum); //게시판테이블 - 1
			likeService.deleteLike(bnum, memberid); //like테이블 삭제
 
		}
		return likeCheck;
}
}
