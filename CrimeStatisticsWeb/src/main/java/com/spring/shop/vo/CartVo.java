package com.spring.shop.vo;

import java.util.Date;

public class CartVo {
	
	// cart table column
	private int cartNum;
	private String memberid;
	private int pdNum;
	private int cartStock;
	private Date addDate;
	
	// products table column
	private String pdName;
	private int pdPrice;
	private Date pdDate;
	private String pdThumbImg;
	
	// need field(제품가격 * 담은 수량)
	private int totalPrice;
	
	
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice() {
		this.totalPrice = this.pdPrice * this.cartStock;
	}
	public String getPdName() {
		return pdName;
	}
	public void setPdName(String pdName) {
		this.pdName = pdName;
	}
	public int getPdPrice() {
		return pdPrice;
	}
	public void setPdPrice(int pdPrice) {
		this.pdPrice = pdPrice;
	}
	public Date getPdDate() {
		return pdDate;
	}
	public void setPdDate(Date pdDate) {
		this.pdDate = pdDate;
	}
	public String getPdThumbImg() {
		return pdThumbImg;
	}
	public void setPdThumbImg(String pdThumbImg) {
		this.pdThumbImg = pdThumbImg;
	}
	public int getCartNum() {
		return cartNum;
	}
	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public int getPdNum() {
		return pdNum;
	}
	public void setPdNum(int pdNum) {
		this.pdNum = pdNum;
	}
	public int getCartStock() {
		return cartStock;
	}
	public void setCartStock(int cartStock) {
		this.cartStock = cartStock;
	}
	public Date getAddDate() {
		return addDate;
	}
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}
}
