package com.lyz.user.bean;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class Cart {
	private Map<Integer, CartItem> itemMap=new HashMap<Integer, CartItem>();
	private Double total=0.0;
	
	public Collection<CartItem> getCartItems(){
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
	
	
	public void removeCarItem(Integer... pids){
		if (pids==null || pids.length==0) {
			return;
		}
		for(Integer pid:pids){
			CartItem removeItem = itemMap.remove(pid);
			total -= removeItem.getSubtotal();
		}
	}
	
	public void removeCarItem(String...pidStrs){
		if (pidStrs==null || pidStrs.length==0) {
			return;
		}
		for(String pid:pidStrs){
			CartItem item = itemMap.remove(Integer.parseInt(pid));
			
			if (item!=null) {
				total -= item.getSubtotal();
			}
			
		}
	}
	
	public void clearCart(){
		itemMap.clear();
		total = 0.0;
	}
}
