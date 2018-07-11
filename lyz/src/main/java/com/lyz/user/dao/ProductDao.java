package com.lyz.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lyz.user.bean.Category;
import com.lyz.user.bean.Product;

public interface ProductDao {

	List<Category> findAllCategory();
	List<Product> findProductByCatg(String cid);
	Product findProductById(int pid);
	List<Product> getTopSaleProduct(/*@Param("start") int start,*/ @Param("limit") int limit);
	List<Product> searchKeyProduct(@Param("keyword") String keyword);
	List<Product> selectProductByItemid(String itemid);
	void updateProduct(Product product);
}
