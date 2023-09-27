package com.spring.shop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
		model.addAttribute("allProductList", allProductList);
		return "shop/pd_list";
	}
	
	// 상품 상세조회
	@GetMapping("/view")
	public String getProductView(Model model, @RequestParam("n") int pdNum) {
		ProductVo productVo = shopService.getView(pdNum);
		model.addAttribute("product", productVo);
		return "shop/view";
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
