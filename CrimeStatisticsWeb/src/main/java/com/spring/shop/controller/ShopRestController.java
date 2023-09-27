package com.spring.shop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring.shop.service.ShopService;
import com.spring.shop.vo.CartVo;

@RestController //@ResponseBody + @Controller
public class ShopRestController {

	@Autowired
	private ShopService shopService;
	
	// 장바구니 담기
	@PostMapping("/shop/view/add-cart")
	public String addCart(CartVo cartVo, HttpSession session) {
		String memberid = (String)session.getAttribute("memberid");
		String result = "";
		if (memberid == null) {
			result = "fail";
		} else {
			cartVo.setMemberid(memberid);
			shopService.addCart(cartVo);
			result = "success";
		}
		return result;
	}
	
	// 장바구니 삭제
	@PostMapping("/shop/cart-list/delete")
	public void deleteCart(@RequestParam("memberid") String memberid,
							 @RequestParam("cartNum") int cartNum) {
		shopService.deleteCart(memberid, cartNum);
	}
}
