package com.lyz.user.dao;

import java.util.List;

import com.lyz.user.bean.ExGoods;

public interface ExGoodsDao {
	void addNewGoods(ExGoods goods);
	void updateGoods(ExGoods goods);
	ExGoods findGoodsById(int cgid);
	List<ExGoods> findUsersGoods(String uid);
	List<ExGoods> getTopGoods();
	void deleteGoodsById(int cgid);
}
