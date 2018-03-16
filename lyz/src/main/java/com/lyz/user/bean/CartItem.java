package com.lyz.user.bean;

public class CartItem {

	private Product product;
//	private Double subtotal;
	private Integer count;

	public CartItem(Product product, Integer count) {
		super();
		this.product = product;
		this.count = count;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Double getSubtotal() {
		return product.getShopPrice() * count;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

}
