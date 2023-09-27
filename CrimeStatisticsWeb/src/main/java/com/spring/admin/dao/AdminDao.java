package com.spring.admin.dao;

import java.util.List;

import com.spring.admin.vo.AdminVo;
import com.spring.shop.vo.CategoryVo;
import com.spring.shop.vo.ProductVo;

public interface AdminDao {

	// 관리자 로그인
	AdminVo login(AdminVo adminVo);
	
	// 카테고리
	List<CategoryVo> category();
	
	// 상품등록
	void register(ProductVo productVo);
}
