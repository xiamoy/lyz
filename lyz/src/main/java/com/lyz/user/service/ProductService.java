package com.lyz.user.service;

import java.util.List;

import com.lyz.user.bean.Category;
import com.lyz.user.bean.Product;

public interface ProductService {

	List<Category> findAllCategory();
	List<Product> findProductByCatg(String cid);
}
