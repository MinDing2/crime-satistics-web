package com.spring.shop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.shop.service.ShopService;
import com.spring.shop.vo.CartVo;
import com.spring.shop.vo.ProductVo;

@Controller
@RequestMapping("/shop")
public class ShopController {

	@Autowired
	private ShopService shopService;
	
	// 전체 호신용품 리스트
	@GetMapping("/list")
	public String getProductList(Model model) {
		List<ProductVo> allProductList = shopService.allPdList();
		model.addAttribute("list", allProductList);
		return "shop/pd_list";
	}
	
	// 카테고리별 상품 리스트
	@GetMapping("/list/{cateCode}")
	public String getCateCodePdList(@PathVariable("cateCode") int cateCode, Model model) {
		List<ProductVo> catePdList = shopService.catePdList(cateCode);
		model.addAttribute("list", catePdList);
		return "shop/pd_list";
	}
	
	// 상품 상세조회
	@GetMapping("/view")
	public String getProductView(Model model, @RequestParam("n") int pdNum, HttpSession session) {
		ProductVo productVo = shopService.getView(pdNum);
		String adminid = (String)session.getAttribute("adminid");
		model.addAttribute("product", productVo);
		
		if (adminid != null) {
			return "redirect:/admin/shop/view";
		} else {
			return "shop/view";
		}
		
	}
	
	// 장바구니 리스트
	@GetMapping("/cart-list")
	public String getCartList(Model model, HttpSession session) {
		String memberid = (String)session.getAttribute("memberid");
		List<CartVo> cartList = shopService.getCartList(memberid);
		model.addAttribute("cartList", cartList);
		return "shop/cart_list";
	}
}
