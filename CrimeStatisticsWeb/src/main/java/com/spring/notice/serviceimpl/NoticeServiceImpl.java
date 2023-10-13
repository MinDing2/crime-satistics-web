package com.spring.notice.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.notice.dao.NoticeDao;
import com.spring.notice.service.NoticeService;
import com.spring.notice.vo.NoticeVo;


@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao noticeDao;
	
	//공지글 작성
	@Override
	public void insertNotice(NoticeVo nvo) {
		noticeDao.insertNotice(nvo);
		
	}
	//공지글목록 조회
	@Override
	public List<NoticeVo> noticelist(NoticeVo nvo) {
		List<NoticeVo> NoticeList = noticeDao.noticelist(nvo);
		return NoticeList;
	}
	//공지글 조회
	@Override
	public NoticeVo viewNotice(NoticeVo nvo) {
		NoticeVo noticevo = noticeDao.viewNotice(nvo);
		return noticevo;
	}

	//조회수 증가
	@Override
	public void readCount(NoticeVo nvo) {
		noticeDao.readCount(nvo);
		
	}
	//공지글 수정
	@Override
	public void updateNotice(NoticeVo nvo) {
		noticeDao.updateNotice(nvo);
		
	}
	//공지글 삭제
	@Override
	public void deleteNotice(NoticeVo nvo) {
		noticeDao.deleteNotice(nvo);
		
	}
}
