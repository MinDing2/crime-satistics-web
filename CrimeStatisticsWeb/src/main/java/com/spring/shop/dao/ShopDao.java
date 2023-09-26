package com.spring.shop.dao;

import java.util.List;

import com.spring.shop.vo.CartVo;
import com.spring.shop.vo.ProductVo;

public interface ShopDao {

	// 전체 호신용품 
	List<ProductVo> allPdList();
	
	// 카테고리별 호신용품 리스트
	List<ProductVo> catePdList(int cateCode);

	// 상품 상세조회
	ProductVo getView(int pdNum);
	
	// 장바구니 담기
	void addCart(CartVo cartVo);
	
	// 장바구니 리스트
	List<CartVo> getCartList(String memberid);
	
	// 장바구니 삭제
	void deleteCart(String memberid, int cartNum);
}
