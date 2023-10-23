package com.spring.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring.board.service.BoardService;

@RestController
@RequestMapping("/board")
public class BoardRestController {
 
	@Autowired
	private BoardService boardService;
	
	//게시물 삭제
	@PostMapping("/delete")
	private void delete(@RequestParam int bnum) {		
		boardService.deleteBoard(bnum);	
		
	}
	
	
}
