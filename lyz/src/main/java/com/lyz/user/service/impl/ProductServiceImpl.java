package com.lyz.user.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.Caching;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lyz.user.bean.Category;
import com.lyz.user.bean.Product;
import com.lyz.user.dao.ProductDao;
import com.lyz.user.service.ProductService;

@Service
@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
public class ProductServiceImpl implements ProductService {

	private static final Logger logger = Logger.getLogger(ProductServiceImpl.class);
	
	@Resource
	private ProductDao mProductDao;
	


	@Override
	@Cacheable(value="_productsCache",key="#cid")
	public List<Product> findProductByCatg(String cid) {
		logger.info("findProductByCatg from dao ...");
		return mProductDao.findProductByCatg(cid);
	}

	@Override
	@Cacheable(value="_productsCache",key="#limit")
	public List<Product> getTopSaleProduct(int limit) {
		return mProductDao.getTopSaleProduct(limit);
	}
	
	@Override
	@Cacheable(value="_catgryCaches")
	public List<Category> findAllCategory() {
		logger.info("findAllCategory from dao ...");
		return mProductDao.findAllCategory();
	}
	
	@Override
	@Cacheable(value="_productCache")
	public Product findProductById(int pid) {
		logger.info("findProductBy "+pid+" from dao ...");
		return mProductDao.findProductById(pid);
	}
	
	@Override
	@Cacheable(value="_productsCache",key="#keyword")
	public List<Product> searchKeyProduct(String keyword){
		return mProductDao.searchKeyProduct(keyword);
	}

	@Override
	@Caching(
//	   put={ @CachePut(value="_productCache",key="#product.pid") },
	   evict={@CacheEvict(value={"_productsCache","_productCache"},allEntries=true) }
	)
	public void updateProduct(Product product) {
		mProductDao.updateProduct(product);
	}

}
