package com.lyz.user.bean;

import java.io.Serializable;
import java.util.List;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

@JsonSerialize
@JsonNaming(PropertyNamingStrategy.LowerCaseWithUnderscoresStrategy.class) 
public class ExGoods implements Serializable{

	private static final long serialVersionUID = 3520088338615166855L;
	
	private int cgid;
	private String gname;
	private Double price;
	private String gimage;
	private String gdesc;
	//belong to which user
	private User user;
	private List<ExRequest> changeRequests;
	
	public int getCgid() {
		return cgid;
	}
	public void setCgid(int cgid) {
		this.cgid = cgid;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getGimage() {
		return gimage;
	}
	public void setGimage(String gimage) {
		this.gimage = gimage;
	}
	public String getGdesc() {
		return gdesc;
	}
	public void setGdesc(String gdesc) {
		this.gdesc = gdesc;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<ExRequest> getChangeRequests() {
		return changeRequests;
	}
	public void setChangeRequests(List<ExRequest> changeRequests) {
		this.changeRequests = changeRequests;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		return obj instanceof ExGoods 
				&& this.getCgid()==((ExGoods)obj).getCgid();
	};
	
	
	@Override
	public String toString() {
		return "ExGoods [cgid=" + cgid + ", gname=" + gname + ", price="
				+ price + ", gimage=" + gimage + ", gdesc=" + gdesc + ", user="
				+ user + ", changeRequests=" + changeRequests + "]";
	}

}
