package com.lyz.user.bean;

import java.io.Serializable;


public class Product implements Serializable {

	private static final long serialVersionUID = 6428561977413948286L;
	
	private int pid;
	private String pname;
	private double marketPrice;
	private double shopPrice;
	private String pimage;
	private String pdate;
	private int is_hot;
	private String pdesc;
	private int pflag;
	private int sales;
	private int stock;
	private String cid;
	
	
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public double getMarketPrice() {
		return marketPrice;
	}
	public void setMarketPrice(double marketPrice) {
		this.marketPrice = marketPrice;
	}
	public double getShopPrice() {
		return shopPrice;
	}
	public void setShopPrice(double shopPrice) {
		this.shopPrice = shopPrice;
	}
	public String getPimage() {
		return pimage;
	}
	public void setPimage(String pimage) {
		this.pimage = pimage;
	}
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	public int getIs_hot() {
		return is_hot;
	}
	public void setIs_hot(int is_hot) {
		this.is_hot = is_hot;
	}
	public String getPdesc() {
		return pdesc;
	}
	public void setPdesc(String pdesc) {
		this.pdesc = pdesc;
	}
	public int getPflag() {
		return pflag;
	}
	public void setPflag(int pflag) {
		this.pflag = pflag;
	}
	public int getSales() {
		return sales;
	}
	public void setSales(int sales) {
		this.sales = sales;
	}
	
	public int getStock(){
		return stock;
	}
	
	public void setStock(int stock) {
		this.stock = stock;
	}
	
	
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + pid;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Product other = (Product) obj;
		if (pid != other.pid)
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "Product [pid=" + pid + ", pname=" + pname + ", marketPrice="
				+ marketPrice + ", shopPrice=" + shopPrice + ", pimage="
				+ pimage + ", pdate=" + pdate + ", is_hot=" + is_hot
				+ ", pdesc=" + pdesc + ", pflag=" + pflag + ", sales=" + sales
				+ ", stock="+stock+", cid=" + cid + "]";
	}
	
}
