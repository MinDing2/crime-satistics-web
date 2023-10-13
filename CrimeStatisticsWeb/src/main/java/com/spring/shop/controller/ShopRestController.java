package com.spring.shop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring.member.service.MemberService;
import com.spring.member.vo.MemberVo;
import com.spring.shop.service.ShopService;
import com.spring.shop.vo.CartVo;
import com.spring.shop.vo.OrderDetailVo;
import com.spring.shop.vo.OrderInfoVo;

@RestController
@RequestMapping("/shop")
public class ShopRestController {

	@Autowired
	private ShopService shopService;

	@Autowired
	private MemberService memberService;
	
	// 장바구니 담기
	@PostMapping("/view/add-cart")
	public String addCart(CartVo cartVo, HttpSession session) {
		String memberid = (String) session.getAttribute("memberid");
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
	@PostMapping("/cart-list/delete")
	public void deleteCart(@RequestParam("memberid") String memberid, @RequestParam("cartNum") int cartNum) {
		shopService.deleteCart(memberid, cartNum);
	}

	// 장바구니 선택 삭제
	@PostMapping("/cart-list/select-delete")
	public void deleteSelectCart(@RequestParam("memberid") String memberid, @RequestParam("cartNum") int cartNum) {
		shopService.deleteCart(memberid, cartNum);
	}

	// 전체 결제 가격 계산
	@PostMapping("/calc/all")
	public int calcTotalPayment(@RequestParam("memberid") String memberid) {
		int totalPaymentPrice = shopService.calcTotalPayment(memberid);
		return totalPaymentPrice;
	}

	// 결제 가격 계산
	@PostMapping("/calc")
	public int calcPayment(@RequestParam("memberid") String memberid, @RequestParam("cartNum") int cartNum) {

		int paymentPrice = shopService.calcPayment(memberid, cartNum);
		return paymentPrice;
	}

	// 장바구니 선택 결제
	@PostMapping("/select-pay")
	public String pay(OrderInfoVo orderInfoVo, OrderDetailVo orderDetailVo, 
			@RequestParam(value = "cartNums") String[] cartNums, 
			@RequestParam("accumulatePoint") int accumulatePoint,
			@RequestParam("pointUsage") int usedPoint,
			HttpSession session) {
		
		String memberid = (String)session.getAttribute("memberid");
		String orderid = shopService.getUUID();
		
		// UUID 저장
		orderInfoVo.setOrderid(orderid);	
		// 주문정보 저장
		shopService.orderSave(orderInfoVo);

		// 주문상세 저장
		orderDetailVo.setOrderid(orderid);
		shopService.orderDetailSave(orderDetailVo, memberid, cartNums);
		
		// 주문완료된 장바구니 삭제
		shopService.deleteOrderedCart(cartNums);
		
		// 포인트 사용
		memberService.pointUsage(usedPoint, memberid);
				
		// 포인트 사용된 후의 회원 포인트
		MemberVo useMember = memberService.findById(memberid);
		int afterUsagePoint = useMember.getPoint();
				
		// 포인트 테이블에 삽입
		shopService.insertPointUsage(usedPoint, memberid, afterUsagePoint);
						
		// 적립예정 포인트
		memberService.accumulatePoint(accumulatePoint, memberid);
				
		// 포인트 적립된 후의 회원 포인트
		MemberVo accMember = memberService.findById(memberid);
		int afterAccumulatePoint = accMember.getPoint();
				
		// 포인트 테이블에 삽입
		shopService.insertAccumulatePoint(accumulatePoint, memberid, afterAccumulatePoint);
		
		return orderid;
	}
	
	// 바로 결제
	@PostMapping("/pay")
	public String nowPay(OrderInfoVo orderInfoVo, OrderDetailVo orderDetailVo, 
			@RequestParam("cartNum") String cartNum, 
			@RequestParam("accumulatePoint") int accumulatePoint,
			@RequestParam("pointUsage") int usedPoint,
			HttpSession session) {
		
		String memberid = (String)session.getAttribute("memberid");
		String orderid = shopService.getUUID();
		String[] cartNums = { cartNum };
		
		// UUID 저장
		orderInfoVo.setOrderid(orderid);
		// 주문정보 저장
		shopService.orderSave(orderInfoVo);
		
		// 주문상세 저장
		orderDetailVo.setOrderid(orderid);
		shopService.orderDetailSave(orderDetailVo, memberid, cartNums);
		
		// 주문완료된 장바구니 삭제
		shopService.deleteOrderedCart(cartNums);
		
		// 포인트 사용
		memberService.pointUsage(usedPoint, memberid);
		
		// 포인트 사용된 후의 회원 포인트
		MemberVo useMember = memberService.findById(memberid);
		int afterUsagePoint = useMember.getPoint();
		
		// 포인트 테이블에 삽입
		shopService.insertPointUsage(usedPoint, memberid, afterUsagePoint);
				
		// 적립예정 포인트
		memberService.accumulatePoint(accumulatePoint, memberid);
		
		// 포인트 적립된 후의 회원 포인트
		MemberVo accMember = memberService.findById(memberid);
		int afterAccumulatePoint = accMember.getPoint();
		
		// 포인트 테이블에 삽입
		shopService.insertAccumulatePoint(accumulatePoint, memberid, afterAccumulatePoint);
		
		return orderid;
	}
	
	// 리뷰 삭제
	@PostMapping("/review/delete")
	public String deleteReview(@RequestParam("reviewid") int reviewid, @RequestParam("memberid") String memberid) {
		
		shopService.deleteReview(reviewid, memberid);
		
		return "complete";
	}
}
