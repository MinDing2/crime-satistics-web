package com.spring.shop.vo;

import java.util.Date;

public class ReviewVo {
	
	private int reviewid;
	private String memberid;
	private int pdNum;
	private String reviewText;
	private String reviewImg;
	private int rating;
	private String reviewDate;
	
	// join column
	private String pdName;
	
	
	public String getPdName() {
		return pdName;
	}
	public void setPdName(String pdName) {
		this.pdName = pdName;
	}
	public int getReviewid() {
		return reviewid;
	}
	public void setReviewid(int reviewid) {
		this.reviewid = reviewid;
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
	public String getReviewText() {
		return reviewText;
	}
	public void setReviewText(String reviewText) {
		this.reviewText = reviewText;
	}
	public String getReviewImg() {
		return reviewImg;
	}
	public void setReviewImg(String reviewImg) {
		this.reviewImg = reviewImg;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	
	@Override
	public String toString() {
		return "ReviewVo [reviewid=" + reviewid + ", memberid=" + memberid + ", pdNum=" + pdNum + ", reviewText="
				+ reviewText + ", reviewImg=" + reviewImg + ", rating=" + rating + ", reviewDate=" + reviewDate + "]";
	}
}
