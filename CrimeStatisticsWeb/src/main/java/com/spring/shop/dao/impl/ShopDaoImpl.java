package com.spring.shop.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.shop.dao.ShopDao;
import com.spring.shop.vo.CartVo;
import com.spring.shop.vo.ProductVo;

@Repository("shopDao")
public class ShopDaoImpl implements ShopDao {

	@Autowired
	private SqlSession sqlSession;
	
	private final String namespace = "Shop";
	
	// 전체 호신용품 리스트
	@Override
	public List<ProductVo> allPdList() {
		return sqlSession.selectList(namespace + ".allPdList");
	}

	@Override
	public List<ProductVo> catePdList() {
		// TODO Auto-generated method stub
		return null;
	}

	// 상품 상세조회
	@Override
	public ProductVo getView(int pdNum) {
		return sqlSession.selectOne(namespace + ".getView", pdNum);
	}

	// 장바구니 담기
	@Override
	public void addCart(CartVo cartVo) {
		sqlSession.insert(namespace + ".addCart", cartVo);
	}

	// 장바구니 리스트
	@Override
	public List<CartVo> getCartList(String memberid) {
		return sqlSession.selectList(namespace + ".getCartList", memberid);
	}

	// 장바구니 삭제
	@Override
	public void deleteCart(String memberid, int cartNum) {
		Map<String, Object> map = new HashMap<>();
		map.put("memberid", memberid);
		map.put("cartNum", cartNum);
		sqlSession.delete(namespace + ".deleteCart", map);
	}

}
