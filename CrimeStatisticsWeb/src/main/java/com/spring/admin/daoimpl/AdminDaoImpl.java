package com.spring.admin.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.admin.dao.AdminDao;
import com.spring.admin.vo.AdminVo;
import com.spring.shop.vo.CategoryVo;
import com.spring.shop.vo.ProductVo;

@Repository("adminDao")
public class AdminDaoImpl implements AdminDao {

	@Autowired
	private SqlSession sqlSession;
	
	private final String namespace = "Admin";
	
	// 
	@Override
	public AdminVo login(AdminVo adminVo) {
		return sqlSession.selectOne(namespace + ".login", adminVo);
	}

	//
	@Override
	public List<CategoryVo> category() {
		return sqlSession.selectList(namespace + ".category");
	}

	// 
	@Override
	public void register(ProductVo productVo) {
		sqlSession.insert(namespace + ".register", productVo);
	}

}
