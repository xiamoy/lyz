package com.lyz.user.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lyz.user.bean.Cart;
import com.lyz.user.bean.CartItem;
import com.lyz.user.bean.Product;
import com.lyz.user.constant.Constants;
import com.lyz.user.service.ProductService;

@Controller
@RequestMapping("/cart")
public class CartController {

	private final Logger logger = Logger.getLogger(CartController.class);
	
	@Autowired
	private ProductService mProductService;

	@RequestMapping(value="/addCart")
	private void addToCart(HttpServletRequest request, HttpServletResponse response){
		
		logger.info("addCart:"+request.getParameter("pid")+";"+request.getParameter("item_count"));
		
 		HttpSession session = request.getSession();
		//if user is login
		if (session.getAttribute(Constants.session_login_user) == null) {
			try {
				response.sendRedirect(request.getContextPath()+"/home/login.jsp");
				return;
			} catch (IOException e) {
				logger.info("redirect error:"+e.getMessage());
			}
		}
		
		Cart shopcart = getShopCart(request);
		int pid = Integer.parseInt(request.getParameter("pid"));
		int count = Integer.parseInt(request.getParameter("item_count"));
		
		CartItem cartItem = new CartItem(mProductService.findProductById(pid), count);
		shopcart.add2Cart(cartItem);
		try {
			request.getRequestDispatcher("/home/shopcart.jsp").forward(request, response);
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/directBuy.action")
	private void payProduct(HttpServletRequest request,HttpServletResponse response){
		logger.info("requst info:"+request.getParameter("pid")+";"+request.getParameter("item_count"));

		HttpSession session = request.getSession();
		//if user is login
		try {
			
		
		if (session.getAttribute(Constants.session_login_user) == null) {
			response.sendRedirect(request.getContextPath()+"/home/login.jsp");
		}
		
		int pid = Integer.parseInt(request.getParameter("pid"));
		int count = Integer.parseInt(request.getParameter("item_count"));
		
		Cart cart = new Cart();
		cart.add2Cart(new CartItem(mProductService.findProductById(pid), count));
		request.getSession().setAttribute(Constants.topay_shop_cart, cart);
		
		response.sendRedirect(request.getContextPath()+"/home/pay.jsp");
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
	}
	
	
	
	@RequestMapping(value="/settle")
	private String settleItems(HttpServletRequest request,HttpServletResponse response){
		Cart cart = new Cart();
				
		String[] pids = request.getParameterValues("items");
		String[] counts = request.getParameterValues("item_count");
		
		for(int i=0;i<pids.length;i++){
			Product product = mProductService.findProductById(Integer.parseInt(pids[i]));
			CartItem item = new CartItem(product, Integer.parseInt(counts[i]));
			cart.add2Cart(item);
		}
	
		request.getSession().setAttribute(Constants.topay_shop_cart, cart);
		return "home/pay";
	}
	
	@RequestMapping(value="/removeItem")
	private void removeCartItemFromCart(HttpServletRequest request,HttpServletResponse response){
		int pid = Integer.parseInt(request.getParameter("pid"));
		Cart cart = (Cart)request.getSession().getAttribute(Constants.session_shop_cart);
		cart.removeCarItem(pid);
		try {
			response.sendRedirect(request.getContextPath()+"/home/shopcart.jsp");
			return;
		} catch (IOException e) {
			logger.error("Redirect shopcart error:"+e.getMessage());
		}
	}
	
	@RequestMapping(value="/clearCart")
	private void clearCart(HttpServletRequest request,HttpServletResponse response){
		Cart shopCart = getShopCart(request);
		shopCart.clearCart();
		try {
			response.sendRedirect(request.getContextPath()+"/home/shopcart.jsp");
		} catch (IOException e) {
			logger.info("Failed to redirect shopcart.jsp..."+e.getMessage());
		}
		return ;
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
