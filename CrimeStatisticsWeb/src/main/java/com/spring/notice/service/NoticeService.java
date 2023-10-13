package com.spring.notice.service;

import java.util.List;

import com.spring.notice.vo.NoticeVo;

public interface NoticeService {

	void insertNotice(NoticeVo nvo);

	List<NoticeVo> noticelist(NoticeVo nvo);

	NoticeVo viewNotice(NoticeVo nvo);

	void readCount(NoticeVo nvo);

	void updateNotice(NoticeVo nvo);

	void deleteNotice(NoticeVo nvo);

}
