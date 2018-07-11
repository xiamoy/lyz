package com.lyz.user.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.Caching;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lyz.user.bean.ExGoods;
import com.lyz.user.dao.ExGoodsDao;
import com.lyz.user.service.ExGoodsService;

@Service
@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
public class ExGoodsServiceImpl implements ExGoodsService {

	private static final Logger logger = Logger.getLogger(ExGoodsServiceImpl.class);
	
	@Resource
	private ExGoodsDao mExGoodsDao;
	
	@Override
	@Caching(
	   	    evict={@CacheEvict(value="exgoodsCache",allEntries=true)}
	)
	public ExGoods addNewGoods(ExGoods goods) {
		logger.info("add new goods from dao..."+goods);
		mExGoodsDao.addNewGoods(goods);
		return goods;
	}

	@Override
	@Caching(
	    evict={@CacheEvict(value={"exgoodsCache","exgoodCache"},allEntries=true)}
	)
	public ExGoods updateGoods(ExGoods goods) {
		logger.info("upate goods from dao..."+goods);
		mExGoodsDao.updateGoods(goods);
		return goods;
	}

	@Override
	@Cacheable(value="exgoodCache")
	public ExGoods findGoodsById(int cgid) {
		logger.info("find goods from dao..."+cgid);
		return mExGoodsDao.findGoodsById(cgid);
	}

	@Override
	@Cacheable(value="exgoodsCache")
	public List<ExGoods> findUsersGoods(String uid) {
		logger.info("find user goods from dao..."+uid);
		return mExGoodsDao.findUsersGoods(uid);
	}

	@Override
	@Cacheable(value="exgoodsCache")
	public List<ExGoods> getTopGoods() {
		logger.info("get all goods order by price from dao...");
		return mExGoodsDao.getTopGoods();
	}

	@Override
	@Caching(  
	   evict={
			 @CacheEvict(value={"exgoodsCache","exgoodCache"},allEntries=true)
	   }		
    )
	public void deleteGoodsById(int cgid) {
		mExGoodsDao.deleteGoodsById(cgid);
	}

}
