package com.lyz.user.dao;

import java.util.List;

import com.lyz.user.bean.Category;
import com.lyz.user.bean.Product;

public interface ProductDao {

	List<Category> findAllCategory();
	List<Product> findProductByCatg(String cid);
}
