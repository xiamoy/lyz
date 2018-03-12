package com.lyz.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import org.springframework.web.servlet.ModelAndView;

import com.lyz.user.bean.Category;
import com.lyz.user.bean.Product;
import com.lyz.user.constant.Constants;
import com.lyz.user.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {

	private final Logger logger = Logger.getLogger(ProductController.class);
	
	@Autowired
	private ProductService mProductService;
	
	@RequestMapping("/category")
	private String findAllCategory(/*ModelMap modelMap*/ModelAndView modelAndView){
		logger.info("begin to find all category...");
		
		
		 modelAndView = new ModelAndView();
		modelAndView.setViewName("/home/home");
		
		List<Category> allCategory = mProductService.findAllCategory();
		if (allCategory==null ) {
			return null;
		}
		Map<String, List<Product>> products = new HashMap<>();
		for(Category category:allCategory){
			String cid = category.getCid();
			List<Product> productByCatg = mProductService.findProductByCatg(cid);
			products.put(cid, productByCatg);
		}
		modelAndView.addObject(Constants.category_all, allCategory);
		modelAndView.addObject(Constants.product_on_category, products);
		
//		return modelAndView;
		return "/home/home";
		
		// use modelMap
//		modelMap.addAttribute(Constants.category_all, allCategory);
//		modelMap.addAttribute(Constants.product_on_category, products);
//		return "home/home";
		
	}
}
