package com.lyz.user.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lyz.user.bean.Order;
import com.lyz.user.bean.OrderItem;
import com.lyz.user.dao.OrderDao;
import com.lyz.user.service.OrderService;

@Service
@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
public class OrderServiceImpl implements OrderService {

	@Resource
	private OrderDao mOrderDao;
	
	@Override
	public void saveOrder(Order order) {
		mOrderDao.saveOrder(order);
	}

	@Override
	public List<Order> findUsersOrders(String uid) {
		return mOrderDao.findUsersOrders(uid);
	}

	@Override
	public List<OrderItem> findOrderItemByOid(String oid) {
		return mOrderDao.findOrderItemByOid(oid);
	}

	@Override
	public Order findOrderById(String oid) {
		return mOrderDao.findOrderById(oid);
	}

	@Override
	public void saveOrderItem(OrderItem orderItem) {
		mOrderDao.saveOrderItem(orderItem);
	}

	@Override
	public void updateOrderState(int state,String oid) {
		mOrderDao.updateOrderState(state,oid);
	}

	@Override
	public void delteOrderById(String oid) {
		mOrderDao.delteOrderById(oid);
	}

}
