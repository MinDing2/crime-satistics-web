package com.spring.shop.vo;

import java.util.Date;

public class OrderInfoVo {

	private String orderid;
	private String memberid;
	private String name;
	private String email;
	private String tel;
	private String address;
	private String address_postcode;
	private String address_primary;
	private String address_detail;
	private int    totalPrice;
	private Date   orderDate;
	private OrderStatus order_status;
	
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddress_postcode() {
		return address_postcode;
	}
	public void setAddress_postcode(String address_postcode) {
		this.address_postcode = address_postcode;
	}
	public String getAddress_primary() {
		return address_primary;
	}
	public void setAddress_primary(String address_primary) {
		this.address_primary = address_primary;
	}
	public String getAddress_detail() {
		return address_detail;
	}
	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public OrderStatus getOrder_status() {
		return order_status;
	}
	public void setOrder_status(OrderStatus order_status) {
		this.order_status = order_status;
	}
}
