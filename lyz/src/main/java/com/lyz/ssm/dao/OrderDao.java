package com.lyz.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lyz.ssm.entity.Order;

public interface OrderDao {

	/**
     * 插入订单明细
     *
     * @param userId
     * @param userId
     * @return
     */
     int insertOrder(@Param("userId") long userId,@Param("goodsId") long goodsId, @Param("title")String title);


    /**
     * 根据偏移量查询订单列表
     * @param offset
     * @param limit
     * @return
     */
     List<Order> queryAll(@Param("offset") int offset, @Param("limit") int limit);
}
