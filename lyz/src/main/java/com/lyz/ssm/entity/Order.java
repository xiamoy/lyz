package com.lyz.ssm.entity;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.lyz.ssm.util.CustomDateSerializer;

public class Order implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private long orderId;

	private User user;

	private long goodsId;

	private String title;

	@JsonSerialize(using = CustomDateSerializer.class)
	private Date createTime;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public long getOrderId() {
		return orderId;
	}

	public void setOrderId(long orderId) {
		this.orderId = orderId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public long getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(long goodsId) {
		this.goodsId = goodsId;
	}

	@Override
	public String toString() {
		return "Order [user=" + user + ", orderId=" + orderId + ", goodsId=" + goodsId + ", title=" + title
				+ ", createTime=" + createTime + "]";
	}
}
