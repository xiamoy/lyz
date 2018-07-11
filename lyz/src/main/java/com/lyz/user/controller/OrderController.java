package com.lyz.user.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.lyz.user.bean.Address;
import com.lyz.user.bean.Cart;
import com.lyz.user.bean.Comment;
import com.lyz.user.bean.Order;
import com.lyz.user.bean.OrderItem;
import com.lyz.user.bean.Product;
import com.lyz.user.bean.User;
import com.lyz.user.constant.Constants;
import com.lyz.user.service.AddressService;
import com.lyz.user.service.CommentService;
import com.lyz.user.service.OrderService;
import com.lyz.user.service.ProductService;
import com.lyz.user.service.UserService;
import com.lyz.util.CommonUtils;

@Controller
@RequestMapping("/order")
public class OrderController {

	private final Logger logger = Logger.getLogger(this.getClass());

	@Autowired
	private UserService mUserService;
	
	@Autowired
	private AddressService mAddressService;
	
	@Autowired
	private ProductService mProductService;
	
	@Autowired
	private OrderService mOrderService;
	
	@Autowired
	private CommentService mCommentService;

	@RequestMapping("/subOrder")
	private ModelAndView submitOrder(HttpServletRequest request,	HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		
		//if user is login
		Object session_login_user = request.getSession().getAttribute(
				Constants.session_login_user);
		if (session_login_user == null) {
			mav.setViewName("/home/login");
			return mav;
		}
		
		String aid = request.getParameter("addid");
		String pids[] = request.getParameterValues("pro_id");
		String[] counts = request.getParameterValues("product_count");
		
		Address address = mAddressService.findAddressById(aid);
		User user = (User) session_login_user;
		Double total = Double.parseDouble(request.getParameter("total"));
		// create order
		Order order = new Order(CommonUtils.getUUID(), new Date(), total,
				address.getAddress(), address.getReceiver(),
				address.getTelephone(), user);
		order.setState(0);
		
		List<OrderItem> orderItems = new ArrayList<>();
		for (int i=0;i<pids.length;i++) {
			OrderItem orderItem = new OrderItem();
			int pId = Integer.parseInt(pids[i]);
			Product product = mProductService.findProductById(pId);
			
			orderItem.setProduct(product);
			orderItem.setItemid(CommonUtils.getUUID());
			int count = Integer.parseInt(counts[i]);
			orderItem.setCount(count);
			orderItem.setOrder(order);
			//add orderitems to Order
			order.getItems().add(orderItem);
			orderItems.add(orderItem);
			
			//update product
			product.setSales(product.getSales()+count);
			product.setStock(product.getStock()-count);
			mProductService.updateProduct(product);
		}

		// delete from cart if it according addCart
		Object session_cart = request.getSession().getAttribute(
				Constants.session_shop_cart);
		if (session_cart != null ) {
			Cart shopCart = (Cart) session_cart;
			shopCart.removeCarItem(pids);
		}
		mOrderService.saveOrder(order);
		for(OrderItem orderItem:orderItems){
			mOrderService.saveOrderItem(orderItem);
		}
				
		mav.addObject("order", order);
		mav.setViewName("/home/success");
		return mav;
	}
	
	@RequestMapping(value="/allOrders")
	private ModelAndView findAllOrders(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		User user = (User) request.getSession().getAttribute(Constants.session_login_user);
		if (user==null) {
			mav.setViewName("home/login");
			return mav;
		}
		List<Order> usersOrders = mOrderService.findUsersOrders(user.getUid());
		logger.debug("userOrders:"+usersOrders);
		
		for(Order order:usersOrders){
			List<OrderItem> items = mOrderService.findOrderItemByOid(order.getOid());
			for(OrderItem item:items){
				logger.info("orderitems :"+item);
			}
		}
		mav.addObject(Constants.user_all_orders, usersOrders);
		mav.setViewName("person/order");
		return mav;
	}
	
	@RequestMapping(value="/orderDetail")
	private ModelAndView findOrederInfo(@RequestParam("oid") String oid){
		ModelAndView mav = new ModelAndView("person/orderinfo");
		Order order = mOrderService.findOrderById(oid);
		logger.info("orderDetail 1:"+order);
		List<OrderItem> orderItems = mOrderService.findOrderItemByOid(oid);
		order.setItems(orderItems);
		logger.info("orderDetail 2:"+order);
		mav.addObject("order", order);
		
		return mav;
	}
	
	@RequestMapping("/toCommts")
	private ModelAndView toCommentOrder(@RequestParam("oid") String oid){
		ModelAndView mav = new ModelAndView();
		List<OrderItem> orderItems = mOrderService.findOrderItemByOid(oid);
		logger.info("toCommts :"+orderItems);
		mav.addObject("orderitems", orderItems);
		mav.setViewName("person/commentlist");
		return mav;
	}
	
	@RequestMapping("/postCommt")
	private String postComments(HttpServletRequest request,HttpServletResponse response){
		User user = (User) request.getSession().getAttribute(Constants.session_login_user);
		if (user==null) {
			return "home/login";
		}
		String oid= request.getParameter("oid");
		String[] pids = request.getParameterValues("pid");
		String[] commts = request.getParameterValues("commt");
		String[] levels = request.getParameterValues("level");
		
		List<Comment> comments = new ArrayList<>();
		for (int i=0;i<pids.length;i++) {
			Comment comment = new Comment();
			int id = Integer.parseInt(pids[i]);
			comment.setProduct(mProductService.findProductById(id));
			comment.setCid(CommonUtils.getUUID());
			comment.setDescription(commts[i]);
			comment.setLevel(Integer.parseInt(levels[i]));
			comment.setPostdate(CommonUtils.formatDate(new Date()));
			comment.setPoster(user.getUsername());
			comments.add(comment);
			//
			logger.info("cmmt "+i+":"+comment);
			mCommentService.addComment(comment);
		}
		//update state of order
		mOrderService.updateOrderState(Constants.order_close,oid);
		return "redirect:/user/allComments?uid="+user.getUid();
	}
	
	@RequestMapping("/confirmOrder")
	private String confirmProd(@RequestParam("oid")String oid,HttpServletRequest request){
		if (request.getSession().getAttribute(Constants.session_login_user)==null) {
			return "home/login";
		}
		logger.info("confirm path:"+request.getRequestURI()+","+request.getPathInfo());
		mOrderService.updateOrderState(Constants.waitfor_commt_prod, oid);
		return "redirect:/order/allOrders";
	}
	
	
	@RequestMapping("/delOrder")
	private String deleteOrder(@RequestParam("oid")String oid,HttpServletRequest request){
		if (request.getSession().getAttribute(Constants.session_login_user)==null) {
			return "home/login";
		}
		mOrderService.delteOrderById(oid);
		return "redirect:/order/allOrders";
	}
}
