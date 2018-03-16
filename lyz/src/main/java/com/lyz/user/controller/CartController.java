package com.lyz.user.controller;

import java.io.IOException;

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

import com.lyz.user.bean.Cart;
import com.lyz.user.bean.CartItem;
import com.lyz.user.constant.Constants;
import com.lyz.user.service.ProductService;

@Controller
@RequestMapping("/cart")
public class CartController {

	private final Logger logger = Logger.getLogger(CartController.class);
	
	@Autowired
	private ProductService mProductService;
	
	@RequestMapping("/addCart")
	private void addToCart(HttpServletRequest request, HttpServletResponse response){
		
		HttpSession session = request.getSession();
		//if user is login
		if (session.getAttribute(Constants.session_login_user) == null) {
			try {
				response.sendRedirect(request.getContextPath()+"/home/login.jsp");
			} catch (IOException e) {
				logger.info("redirect error:"+e.getMessage());
			}
		}
		
		Cart shopcart = getShopCart(request);
		int pid = Integer.parseInt(request.getParameter("pid"));
		int count = Integer.parseInt(request.getParameter("item_count"));
		
		CartItem cartItem = new CartItem(mProductService.findProductById(pid), count);
		shopcart.add2Cart(cartItem);
		
		//query all orders and their orderitem
//		return "/home/shopcart";
		try {
			request.getRequestDispatcher("/home/shopcart.jsp").forward(request, response);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/directBuy.action",method=RequestMethod.GET)
	private ModelAndView payProduct(HttpServletRequest request,@RequestParam("pid") int pid){
//		logger.info("directBuy:"+request.getSession()+";"+request.getContextPath());
		logger.info("requst into:"+pid+";"+request.getParameter("item_count"));
		ModelAndView modelAndView = new ModelAndView();
	
		
		modelAndView.setViewName("home/pay");
		return modelAndView;
	}
	
	
	private Cart getShopCart(HttpServletRequest request) {
		Object shopcart = request.getSession().getAttribute(Constants.session_shop_cart);
		Cart sessionCart = null;
		if (shopcart == null) {
			logger.info("initial cart in session...");
			sessionCart = new Cart();
			request.getSession().setAttribute(Constants.session_shop_cart, sessionCart);
		}else {
			sessionCart = (Cart)shopcart;
		}
		return sessionCart;
	}
}
