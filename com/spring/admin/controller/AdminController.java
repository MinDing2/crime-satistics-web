package com.spring.admin.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.spring.admin.service.AdminService;
import com.spring.admin.vo.AdminVo;
import com.spring.shop.vo.CategoryVo;
import com.spring.shop.vo.ProductVo;
import com.spring.utils.UploadFileUtils;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	// 관리자 로그인 페이지
	@GetMapping("/login-page")
	public String adminLoginForm() {
		return "admin/login";
	}
	
	// 관리자 로그인
	@PostMapping("/login")
	public String adminLogin(HttpSession session, AdminVo adminVo) {
		AdminVo findAdmin = adminService.login(adminVo);
		session.setAttribute("adminid", findAdmin.getAdminid());
		session.setAttribute("nickname", findAdmin.getNickname());
		
		return "redirect:/";
	}
	
	// 관리자 로그아웃
	@GetMapping("/logout")
	public String adminLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	// 관리자 페이지
	@GetMapping("/page")
	public String adminPage() {
		return "admin/page";
	}
	
	// 상품 등록 페이지
	@GetMapping("/products/register")
	public String productsRegisterForm(Model model) {
		List<CategoryVo> category = adminService.category();
		model.addAttribute("category", category);
		return "admin/products/register";
	}
	
	// 상품 등록
	@PostMapping("/products/register")
	public String productsRegister(ProductVo productVo, MultipartFile file) throws Exception {
		String imgUploadPath = uploadPath;
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		 
		 	productVo.setPdImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		 	productVo.setPdThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		} else {
			fileName = uploadPath + "images" + File.separator + "none.png";
			productVo.setPdImg(fileName);
			productVo.setPdThumbImg(fileName);
		}

		adminService.register(productVo);
		return "redirect:/";
	}
	
}
