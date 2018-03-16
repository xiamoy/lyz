package com.lyz.user.service.impl;

import java.util.List;

import javax.annotation.Resource;

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

	@Resource
	private ProductDao mProductDao;
	
	@Override
	public List<Category> findAllCategory() {
		return mProductDao.findAllCategory();
	}

	@Override
	public List<Product> findProductByCatg(String cid) {
		return mProductDao.findProductByCatg(cid);
	}

	@Override
	public Product findProductById(int pid) {
		return mProductDao.findProductById(pid);
	}

	@Override
	public List<Product> getTopSaleProduct(int limit) {
		return mProductDao.getTopSaleProduct(limit);
	}

}
