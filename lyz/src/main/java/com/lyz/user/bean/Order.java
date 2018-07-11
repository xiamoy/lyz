package com.lyz.user.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Order {

	private String oid;
	private Date ordertime; 
	private double total;
	private String address;
	private String name;
	private String telephone;
	//state 0:待发货
	//state 1:待收货
	//state 2:待评价
	//state 3:交易关闭
	private int state;
	private User user;
	private List<OrderItem> items = new ArrayList<>();
	
	public Order() {
		super();
		
	}
	public Order(String oid, Date ordertime, double total, String address,
			String name, String telephone, User user /*, String uid*/) {
		super();
		this.oid = oid;
		this.ordertime = ordertime;
		this.total = total;
		this.address = address;
		this.name = name;
		this.telephone = telephone;
		this.user = user;
//		this.uid = uid;
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public Date getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(Date ordertime) {
		this.ordertime = ordertime;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	/*public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}*/
	
	public int getState() {
		return state;
	}
	
	public void setState(int state) {
		this.state = state;
	}
	
	public List<OrderItem> getItems() {
		return items;
	}
	
	public void setItems(List<OrderItem> items) {
		this.items = items;
	}
	@Override
	public String toString() {
		return "Order [oid=" + oid + ", ordertime=" + ordertime + ", total="
				+ total + ", address=" + address + ", name=" + name
				+ ", telephone=" + telephone + ", state=" + state + ", user="
				+ user + ", items=" + items + "]";
	}
}
