package com.lyz.user.bean;

import java.io.Serializable;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

/**
 * 用户实体类
 * @author liuyazhuang
 *
 */
@JsonSerialize
@JsonNaming(PropertyNamingStrategy.LowerCaseWithUnderscoresStrategy.class) 
public class User implements Serializable{
	private static final long serialVersionUID = 1332643889208978231L;
	
	/**
	 * id
	 */
//	private Integer uid;
	private String uid;
	
	private String username;
	private String password;
	private String name;
	private String email;
	private long telephone;
	private String code;
	private int state;
	
	public User(){
		super();
	}
		
	public User(String username,String password) {
		this.username = username;
		this.password = password;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
//	public Integer getUid() {
//		return uid;
//	}
//	public void setUid(Integer uid) {
//		this.uid = uid;
//	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public long getTelephone() {
		return telephone;
	}

	public void setTelephone(long telephone) {
		this.telephone = telephone;
	}

	@Override
	public String toString() {
		return "User [uid=" + uid + ", username=" + username + ", password="
				+ password + ", name=" + name + ", email=" + email
				+ ", telephone=" + telephone + ", code=" + code + ", state="
				+ state + "]";
	}
	
}
