package com.lyz.user.bean;

import java.io.Serializable;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

@JsonSerialize
@JsonNaming(PropertyNamingStrategy.LowerCaseWithUnderscoresStrategy.class) 
public class Address implements Serializable{
	
	
	private static final long serialVersionUID = -4163680671232220776L;
	
	private String aid;
	private  String uid;
	private String receiver;
	private String telephone;
	private String address;
	private int isDefault;
	
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getIsDefault() {
		return isDefault;
	}
	public void setIsDefault(int isDefault) {
		this.isDefault = isDefault;
	}
	@Override
	public String toString() {
		return "Address [aid=" + aid + ", uid=" + uid + ", receiver="
				+ receiver + ", telephone=" + telephone + ", address="
				+ address + ", isDefault=" + isDefault + "]";
	}
	
}
