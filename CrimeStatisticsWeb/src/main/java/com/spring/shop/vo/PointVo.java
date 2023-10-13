package com.spring.shop.vo;

public class PointVo {
	
	private int pointid;
	private String memberid;
	private int accumulatePoint;
	private int usagePoint;
	private int point;
	private String pointDate;
	
	// join column
	private String name;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getPointid() {
		return pointid;
	}
	public void setPointid(int pointid) {
		this.pointid = pointid;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public int getAccumulatePoint() {
		return accumulatePoint;
	}
	public void setAccumulatePoint(int accumulatePoint) {
		this.accumulatePoint = accumulatePoint;
	}
	public int getUsagePoint() {
		return usagePoint;
	}
	public void setUsagePoint(int usagePoint) {
		this.usagePoint = usagePoint;
	}
	public String getPointDate() {
		return pointDate;
	}
	public void setPointDate(String pointDate) {
		this.pointDate = pointDate;
	}
}
