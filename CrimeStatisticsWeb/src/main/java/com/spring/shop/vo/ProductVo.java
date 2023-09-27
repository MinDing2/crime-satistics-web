package com.spring.shop.vo;

import java.util.Date;

public class ProductVo {
	
	private int pdNum;
	private String pdName;
	private String cateCode;
	private int pdPrice;
	private int pdStock;
	private String pdDes;
	private String pdImg;
	private Date pdDate;
	private String pdThumbImg;
	
	public String getPdThumbImg() {
		return pdThumbImg;
	}
	public void setPdThumbImg(String pdThumbImg) {
		this.pdThumbImg = pdThumbImg;
	}
	public int getPdNum() {
		return pdNum;
	}
	public void setPdNum(int pdNum) {
		this.pdNum = pdNum;
	}
	public String getPdName() {
		return pdName;
	}
	public void setPdName(String pdName) {
		this.pdName = pdName;
	}
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	public int getPdPrice() {
		return pdPrice;
	}
	public void setPdPrice(int pdPrice) {
		this.pdPrice = pdPrice;
	}
	public int getPdStock() {
		return pdStock;
	}
	public void setPdStock(int pdStock) {
		this.pdStock = pdStock;
	}
	public String getPdDes() {
		return pdDes;
	}
	public void setPdDes(String pdDes) {
		this.pdDes = pdDes;
	}
	public String getPdImg() {
		return pdImg;
	}
	public void setPdImg(String pdImg) {
		this.pdImg = pdImg;
	}
	public Date getPdDate() {
		return pdDate;
	}
	public void setPdDate(Date pdDate) {
		this.pdDate = pdDate;
	}
}
