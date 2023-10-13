package com.spring.shop.service.impl;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.shop.dao.ShopDao;
import com.spring.shop.service.ShopService;
import com.spring.shop.vo.CartVo;
import com.spring.shop.vo.OrderDetailVo;
import com.spring.shop.vo.OrderInfoVo;
import com.spring.shop.vo.PointVo;
import com.spring.shop.vo.ProductVo;
import com.spring.shop.vo.ReviewVo;

@Service("shopService")
public class ShopServiceImpl implements ShopService {

	@Autowired
	private ShopDao shopDao;
	
	// 전체 호신용품 리스트
	@Override
	public List<ProductVo> allPdList() {
		return shopDao.allPdList();
	}

	// 카테고리별 호신용품 리스트
	@Override
	public List<ProductVo> catePdList(int cateCode) {
		return shopDao.catePdList(cateCode);
	}
	
	// 상품 상세조회
	@Override
	public ProductVo getView(int pdNum) {
		return shopDao.getView(pdNum);
	}

	// 장바구니 담기
	@Override
	public void addCart(CartVo cartVo) {
		shopDao.addCart(cartVo);
	}

	// 장바구니 리스트
	@Override
	public List<CartVo> getCartList(String memberid) {
		return shopDao.getCartList(memberid);
	}

	// 장바구니 삭제
	@Override
	public void deleteCart(String memberid, int cartNum) {
		shopDao.deleteCart(memberid, cartNum);
	}

	// 장바구니 결제가격 계산
	@Override
	public int calcPayment(String memberid, int cartNum) {
		return shopDao.calcPayment(memberid, cartNum);
	}

	// 장바구니 전체 결제가격 계산
	@Override
	public int calcTotalPayment(String memberid) {
		return shopDao.calcTotalPayment(memberid);
	}

	// (장바구니) 단일 상품 구매시 물품 및 가격 정보
	@Override
	public CartVo getCartOne(String memberid, int cartNum) {
		return shopDao.getCartOne(memberid, cartNum);
	}

	// UUID 생성
	@Override
	public String generateMerchantUid() {
		UUID uuid = UUID.randomUUID();
        return "order_no_" + uuid.toString();
	}

	// 주문정보 저장
	@Override
	public void orderSave(OrderInfoVo orderInfoVo) {
		shopDao.orderSave(orderInfoVo);
	}

	// 주문상세 저장
	@Override
	public void orderDetailSave(OrderDetailVo orderDetailVo, String memberid, String[] cartNums) {
		shopDao.orderDetailSave(orderDetailVo, memberid, cartNums);
	}
	
	// 주문번호 생성
	@Override
	public String getUUID() {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";

		for (int i = 1; i <= 6; i++) {
			subNum += (int) (Math.random() * 10);
		}

		String orderid = ymd + "_" + subNum;
		
		return orderid;
	}

	// 주문완료된 장바구니 삭제
	@Override
	public void deleteOrderedCart(String[] cartNums) {
		shopDao.deleteOrderedCart(cartNums);
	}

	// 장바구니 번호
	@Override
	public int getCartNum(CartVo cartVo) {
		return shopDao.getCartNum(cartVo);
	}

	// 주문상세 가져오기
	@Override
	public List<OrderDetailVo> getOrderDetail(String orderid) {
		return shopDao.getOrderDetail(orderid);
	}

	// 주문정보 가져오기
	@Override
	public List<OrderInfoVo> getOrderInfoList(String memberid) {
		return shopDao.getOrderInfoList(memberid);
	}

	// 리뷰 작성
	@Override
	public void writeReview(ReviewVo reviewVo) {
		shopDao.writeReview(reviewVo);
	}

	// 리뷰 리스트
	@Override
	public List<ReviewVo> getReviewList(String memberid) {
		return shopDao.getReviewList(memberid);
	}

	// 리뷰 삭제
	@Override
	public void deleteReview(int reviewid, String memberid) {
		shopDao.deleteReview(reviewid, memberid);
	}

	// 전체 리뷰 가져오기
	@Override
	public List<ReviewVo> getAllReviewList(int pdNum) {
		return shopDao.getAllReviewList(pdNum);
	}
	
	// 하나의 상품 리뷰 평균
	@Override
	public double getReviewAvg(int pdNum) {
		return shopDao.getReviewAvg(pdNum);
	}

	// 포인트 사용(포인트 테이블)
	@Override
	public void insertPointUsage(int usedPoint, String memberid, int afterUsagePoint) {
		shopDao.insertPointUsage(usedPoint, memberid, afterUsagePoint);
	}

	// 포인트 적립(포인트 테이블)
	@Override
	public void insertAccumulatePoint(int accumulatePoint, String memberid, int afterAccumulatePoint) {
		shopDao.insertAccumulatePoint(accumulatePoint, memberid, afterAccumulatePoint);
	}

	// 포인트 내역
	@Override
	public List<PointVo> getPointList(String memberid) {
		return shopDao.getPointList(memberid);
	}

	// 포인트 내역 기간 조회
	@Override
	public List<PointVo> showPointDate(Date startDate, Date endDate, String memberid) {
		return shopDao.showPointDate(startDate, endDate, memberid);
	}

}
