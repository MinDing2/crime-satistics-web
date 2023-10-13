package com.spring.member.daoimpl;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.member.dao.MemberDao;
import com.spring.member.vo.MemberVo;

@Repository("memberDao")
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSession sqlSession;

	private final String namespace = "Member";
	
	// 회원가입
	@Override
	public void signup(MemberVo memberVo) {
		sqlSession.insert(namespace + ".signup", memberVo);
	}

	// 회원찾기
	@Override
	public MemberVo findById(String memberId) {
		return sqlSession.selectOne(namespace + ".findById", memberId);
	}

	// 로그인
	@Override
	public MemberVo login(MemberVo memberVo) {
		return sqlSession.selectOne(namespace + ".login", memberVo);
	}

	// 회원수정
	@Override
	public void memberModify(MemberVo memberVo) {
		sqlSession.update(namespace + ".memberModify", memberVo);
	}

	// 회원탈퇴
	@Override
	public void memberDelete(String memberid) {
		sqlSession.delete(namespace + ".memberDelete", memberid);
	}

	// 닉네임체크
	@Override
	public int nicknameCheck(String nickname) {
		return sqlSession.selectOne(namespace + ".nicknameCheck", nickname);
	}

	// 아이디 찾기(이메일 활용)
	@Override
	public String findIdWithEmail(String email) {
		return sqlSession.selectOne(namespace + ".findIdWithEmail", email);
	}

	// 주문자 정보
	@Override
	public MemberVo findByOrderInfo(String name, String tel, String email) {
		Map<String, String> map = new HashMap<>();
		map.put("name", name);
		map.put("tel", tel);
		map.put("email", email);
		return sqlSession.selectOne(namespace + ".findByOrderInfo", map);
	}

	// 적립예정 포인트
	@Override
	public void accumulatePoint(int accumulatePoint, String memberid) {
		Map<String, Object> map = new HashMap<>();
		map.put("accumulatePoint", accumulatePoint);
		map.put("memberid", memberid);
		sqlSession.update(namespace + ".accumulatePoint", map);
	}

	// 사용 포인트
	@Override
	public void pointUsage(int usedPoint, String memberid) {
		Map<String, Object> map = new HashMap<>();
		map.put("usedPoint", usedPoint);
		map.put("memberid", memberid);
		sqlSession.update(namespace + ".pointUsage", map);
	}
}
