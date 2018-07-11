package com.lyz.user.service;

import java.util.List;

import com.lyz.user.bean.ExGoods;

public interface ExGoodsService {
	ExGoods addNewGoods(ExGoods goods);
	ExGoods updateGoods(ExGoods goods);
	ExGoods findGoodsById(int cgid);
	List<ExGoods> findUsersGoods(String uid);
	List<ExGoods> getTopGoods();
	void deleteGoodsById(int cgid);
}
