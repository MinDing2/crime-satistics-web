package com.spring.shop.dao;

import java.util.Date;
import java.util.List;

import com.spring.shop.vo.CartVo;
import com.spring.shop.vo.OrderDetailVo;
import com.spring.shop.vo.OrderInfoVo;
import com.spring.shop.vo.PointVo;
import com.spring.shop.vo.ProductVo;
import com.spring.shop.vo.ReviewVo;

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

	// 장바구니 결제가격 계산
	int calcPayment(String memberid, int cartNum);

	// 장바구니 전체 결제가격 계산
	int calcTotalPayment(String memberid);

	// (장바구니) 단일 상품 구매시 물품 및 가격 정보
	CartVo getCartOne(String memberid, int cartNum);

	// 주문정보 저장
	void orderSave(OrderInfoVo orderInfoVo);
	
	// 주문상세 저장
	void orderDetailSave(OrderDetailVo orderDetailVo, String memberid, String[] cartNums);
	
	// 주문완료된 장바구니 삭제
	void deleteOrderedCart(String[] cartNums);

	// 장바구니 번호
	int getCartNum(CartVo cartVo);

	// 주문상세 가져오기
	List<OrderDetailVo> getOrderDetail(String orderid);

	// 주문정보 가져오기
	List<OrderInfoVo> getOrderInfoList(String memberid);

	// 리뷰 작성
	void writeReview(ReviewVo reviewVo);

	// 리뷰 리스트
	List<ReviewVo> getReviewList(String memberid);

	// 리뷰 삭제
	void deleteReview(int reviewid, String memberid);

	// 전체 리뷰 가져오기(하나의 상품)
	List<ReviewVo> getAllReviewList(int pdNum);
	
	// 하나의 상품 리뷰 평균
	double getReviewAvg(int pdNum);

	// 포인트 사용(포인트 테이블)
	void insertPointUsage(int usedPoint, String memberid, int afterUsagePoint);

	// 포인트 적립(포인트 테이블)
	void insertAccumulatePoint(int accumulatePoint, String memberid, int afterAccumulatePoint);

	// 포인트 내역
	List<PointVo> getPointList(String memberid);

	// 포인트 내역 기간 조회
	List<PointVo> showPointDate(Date startDate, Date endDate, String memberid);
}
