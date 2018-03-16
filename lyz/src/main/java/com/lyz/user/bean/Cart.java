package com.lyz.user.bean;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class Cart {
	private Map<Integer, CartItem> itemMap=new HashMap<Integer, CartItem>();
	private Double total=0.0;
	
	public Collection<CartItem> getCarItems(){
		return itemMap.values();
	}
	
	public Map<Integer, CartItem> getItemMap(){
		return itemMap;
	}
	
	public void setItemMap(Map<Integer, CartItem> itemMap){
		this.itemMap = itemMap;
	}
	
	public Double getTotal(){
		return total;
	}
	
	public void setTotal(Double total){
		this.total = total;
	}
	
	public void add2Cart(CartItem cartItem) {
		int pid = cartItem.getProduct().getPid();
		//if the cart has already an product
		if (itemMap.containsKey(pid)) {
			CartItem olditem = itemMap.get(pid);
			olditem.setCount(olditem.getCount()+cartItem.getCount());	
		}else {
			//the product is first added
			itemMap.put(pid, cartItem);
		}
		
		total += cartItem.getSubtotal();
	}
	
	
	public void removeCarItem(Integer pid){
		CartItem removeItem = itemMap.remove(pid);
		total -= removeItem.getSubtotal();
	}
	
	public void clearCart(){
		itemMap.clear();
		total = 0.0;
	}
}
