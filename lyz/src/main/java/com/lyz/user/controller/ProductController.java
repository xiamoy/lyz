package com.lyz.user.controller;

import java.io.IOException;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.lyz.user.bean.Category;
import com.lyz.user.bean.Comment;
import com.lyz.user.bean.Product;
import com.lyz.user.constant.Constants;
import com.lyz.user.service.CommentService;
import com.lyz.user.service.ProductService;
import com.lyz.util.CommonUtils;

@Controller
@RequestMapping("/product")
public class ProductController {

	private final Logger logger = Logger.getLogger(ProductController.class);
	
	@Autowired
	private ProductService mProductService;
	
	@Autowired
	private CommentService mCommentService;
	
	@RequestMapping("/initProduct")
	private void findAllCategory(HttpServletRequest request,HttpServletResponse response){
		logger.info("begin to find all category...");
		
				
		List<Category> allCategory = mProductService.findAllCategory();
		if (allCategory==null ) {
			return ;
		}
		Map<String, List<Product>> products = new HashMap<>();
		for(Category category:allCategory){
			String cid = category.getCid();
			List<Product> productByCatg = mProductService.findProductByCatg(cid);
			products.put(cid, productByCatg);
		}
		List<Product> topSaleProduct = mProductService.getTopSaleProduct(3);
		
		request.getSession().setAttribute(Constants.category_all, allCategory);
		request.getSession().setAttribute(Constants.product_on_category, products);
		request.getSession().setAttribute(Constants.top_sale_product, topSaleProduct);
	
		try {
			response.sendRedirect("home/home.jsp");
		} catch (IOException e) {
		logger.error(e.getMessage());
		}
	}
	
	
	
	@RequestMapping(value="/prodintro.action",method=RequestMethod.GET)
	private ModelAndView productIntro(@RequestParam("pid")int pid){
		ModelAndView mav =new ModelAndView();
		
		Product product = mProductService.findProductById(pid);
		if (product==null) {
			logger.info("Failed to find product of "+pid);
			mav.setViewName("WEB-INF/jsp/error_product");
			return mav;
		}
		
		mav.addObject("prod_item",product);
		List<Comment> allComments = mCommentService.findCommentsByPid(pid);
		mav.addObject("commt_counts",allComments.size());
		mav.addObject("prod_comment", allComments);
		
		 Map<Integer, List<Comment>> groupComments = CommonUtils.groupByLevel(allComments);
		 mav.addObject("good_count", groupComments.get(Constants.good_comment_flag).size());
		 mav.addObject("mid_count", groupComments.get(Constants.mid_comment_flag).size());
		 mav.addObject("bad_count", groupComments.get(Constants.bad_comment_flag).size());

		logger.info("Get prodct of "+pid+"is :"+product);
		logger.info("include comments:"+allComments);
		mav.setViewName("home/introduction");
		return mav;
	}
	
	
}
