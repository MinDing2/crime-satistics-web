package com.spring.admin.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.admin.dao.AdminDao;
import com.spring.admin.service.AdminService;
import com.spring.admin.vo.AdminVo;
import com.spring.shop.vo.CategoryVo;
import com.spring.shop.vo.ProductVo;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDao;
	
	// 관리자 로그인
	@Override
	public AdminVo login(AdminVo adminVo) {
		return adminDao.login(adminVo);
	}

	// 카테고리
	@Override
	public List<CategoryVo> category() {
		return adminDao.category();
	}

	// 상품등록
	@Override
	public void register(ProductVo productVo) {
		adminDao.register(productVo);
	}

}
