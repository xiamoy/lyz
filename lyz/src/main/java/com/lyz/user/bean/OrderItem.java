package com.lyz.user.bean;


public class OrderItem {
	private String itemid;
	private int count;
	
	private Product product;
	private Order order;
	private Double subtotal;
	
	public String getItemid() {
		return itemid;
	}
	public void setItemid(String itemid) {
		this.itemid = itemid;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public Double getSubtotal() {
		return product.getShopPrice()*count;
	}
	
	@Override
	public String toString() {
		return "OrderItem [itemid=" + itemid + ", count=" + count
				+ ", product=" + product + ", order=" + order + ", subtotal="
				+ subtotal + "]";
	}
	
}
