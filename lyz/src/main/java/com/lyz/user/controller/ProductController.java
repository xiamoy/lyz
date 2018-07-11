package com.lyz.user.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.lyz.user.bean.Category;
import com.lyz.user.bean.ExGoods;
import com.lyz.user.bean.Product;
import com.lyz.user.bean.User;
import com.lyz.user.constant.Constants;
import com.lyz.user.service.CommentService;
import com.lyz.user.service.ExGoodsService;
import com.lyz.user.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {

	private final Logger logger = Logger.getLogger(ProductController.class);
	
	@Autowired
	private ProductService mProductService;
	
	@Autowired
	private CommentService mCommentService;
	
	@Autowired
	private ExGoodsService mExGoodsService;
	
	
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
		List<ExGoods> topGoods = mExGoodsService.getTopGoods();
		logger.info("exgoods--------:"+topGoods);
	
		User user = (User)request.getSession().getAttribute(Constants.session_login_user);
		if (user != null) {
			List<ExGoods> owner = mExGoodsService.findUsersGoods(user.getUid());
			topGoods.removeAll(owner);
		}
		
		request.getSession().setAttribute(Constants.category_all, allCategory);
		request.getSession().setAttribute(Constants.product_on_category, products);
		request.getSession().setAttribute(Constants.top_sale_product, topSaleProduct);
		request.getSession().setAttribute(Constants.top_home_goods, topGoods);
	
		try {
			response.sendRedirect(request.getContextPath()+"/home/home.jsp");
		} catch (IOException e) {
		logger.error(e.getMessage());
		}
	}
	
	
	
	@RequestMapping(value="/prodintro.action",method=RequestMethod.GET)
	private ModelAndView productIntro(HttpServletRequest request, @RequestParam("pid")int pid){
		ModelAndView mav =new ModelAndView();
		
		Product product = mProductService.findProductById(pid);
		if (product==null) {
			logger.info("Failed to find product of "+pid);
			mav.setViewName("WEB-INF/jsp/error_product");
			return mav;
		}
				
		mav.addObject("prod_item",product);
		
		Set<Product> historyProds = getHistoryProds(request);
		historyProds.add(product);
	
		
		logger.info("Get prodct of "+pid+"is :"+product);
		logger.info("include comments:"+product.getProdComments());
		mav.setViewName("home/introduction");
		return mav;
	}
	
	@RequestMapping("/search")
	private ModelAndView searchProduct(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		String keyword = request.getParameter("index_none_header_sysc");
		logger.info("search keyword:"+keyword);
		List<Product> searchList = mProductService.searchKeyProduct(keyword);
		
		mav.addObject(Constants.search_kword_product, searchList);
		mav.setViewName("home/search");
		return mav;
	}
	
	@RequestMapping("/delProdCommt")
	private String deleteComment(@RequestParam("cid")String cid,HttpServletRequest request){
		User user = (User) request.getSession().getAttribute(Constants.session_login_user);
		if (user==null) {
			return "home/login";
		}
		mCommentService.deleteCommentById(cid);
		
		return "redirect:/user/allComments?uid="+user.getUid();
	}
	
	@RequestMapping("/delFootProd")
	private String deleBrowseProd(@RequestParam("pid") int pid,HttpServletRequest request){
		HttpSession session = request.getSession();
		if (session.getAttribute(Constants.session_login_user)==null) {
			return "home/login";
		}
		Set<Product> historyProds = getHistoryProds(request);
		for(Product p:historyProds){
			if (p.getPid()==pid) {
				historyProds.remove(p);
				break;
			}
		}
		return "person/footprint";
		
	}
	
	@SuppressWarnings("unchecked")
	private Set<Product> getHistoryProds(HttpServletRequest request) {
		Object historyProd = request.getSession().getAttribute(Constants.session_history_prod);
		Set<Product> sessionProd = null;
		if (historyProd == null) {
			logger.info("create history product in session...");
			sessionProd = new HashSet<Product>();
			request.getSession().setAttribute(Constants.session_history_prod, sessionProd);
		}else {
			sessionProd = (HashSet<Product>)historyProd;
		}
		return sessionProd;
	}
	
}
