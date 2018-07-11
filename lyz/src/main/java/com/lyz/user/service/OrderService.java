package com.lyz.user.service;

import java.util.List;

import com.lyz.user.bean.Order;
import com.lyz.user.bean.OrderItem;

public interface OrderService {
	void saveOrder(Order order);
	List<Order> findUsersOrders(String uid);
	List<OrderItem> findOrderItemByOid(String oid);
	Order findOrderById(String oid);
	void saveOrderItem(OrderItem orderItem);
	void updateOrderState(int state,String oid);
	void delteOrderById(String oid);
}
