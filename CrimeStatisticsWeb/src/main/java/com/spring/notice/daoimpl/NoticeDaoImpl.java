package com.spring.notice.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.notice.dao.NoticeDao;
import com.spring.notice.vo.NoticeVo;

@Repository("noticeDao")
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	private SqlSession sqlSession;

	//공지사항 작성	
	@Override
	public void insertNotice(NoticeVo nvo) {
		sqlSession.insert("Notice.insertNotice", nvo);
	}
	//공지사항목록 조회
	@Override
	public List<NoticeVo> noticelist(NoticeVo nvo) {
		List<NoticeVo> NoticeList = sqlSession.selectList("Notice.listNotice", nvo);
		return NoticeList;
	}

	//공지사항내용 조회
	@Override
	public NoticeVo viewNotice(NoticeVo nvo) {
		NoticeVo noticevo = sqlSession.selectOne("Notice.viewNotice", nvo);
		return noticevo;
	}
	//공지글 조회수
	@Override
	public void readCount(NoticeVo nvo) {
		sqlSession.update("Notice.readCount", nvo);
		
	}
	//공지사항 수정
	@Override
	public void updateNotice(NoticeVo nvo) {
		sqlSession.update("Notice.updateNotice",nvo);
		
	}
	//공지사항 삭제
	@Override
	public void deleteNotice(NoticeVo nvo) {
		sqlSession.delete("Notice.deleteNotice", nvo);
		
	}

}
