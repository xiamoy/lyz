package com.lyz.user.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.lyz.user.bean.Address;
import com.lyz.user.bean.Comment;
import com.lyz.user.bean.ExGoods;
import com.lyz.user.bean.ExRequest;
import com.lyz.user.bean.Order;
import com.lyz.user.bean.User;
import com.lyz.user.constant.Constants;
import com.lyz.user.service.AddressService;
import com.lyz.user.service.CommentService;
import com.lyz.user.service.ExGoodsService;
import com.lyz.user.service.ExRequestService;
import com.lyz.user.service.OrderService;
import com.lyz.user.service.UserService;
import com.lyz.util.CommonUtils;


@Controller
@RequestMapping("/user")
public class UserController {
	private final Log logger = LogFactory.getLog(UserController.class);
	
	@Autowired
	private UserService mUserService;
	
	@Autowired
	private AddressService mAddressService;
	
	@Autowired
	private CommentService mCommentService;
	
	@Autowired
	private ExGoodsService mExGoodsService;
	
	@Autowired
	private ExRequestService mExRequestService;
	
	@Autowired
	private OrderService mOrderService;
	
	@RequestMapping("/login")
	public String login(HttpServletRequest request, @RequestParam(value="username", defaultValue="") String username,
			@RequestParam(value="password", defaultValue="") String password){
		logger.debug("user login:"+username+";"+password);
		User user = mUserService.findUser(username, password);
		
		logger.info("user login:"+user);
		// address has been set for user
		if (user!=null) {
			logger.info("login user:"+user);
			request.getSession().setAttribute(Constants.session_login_user, user);
			return "redirect:/product/initProduct";
		}else{
			return "WEB-INF/jsp/error";
		}

	}
	
	
	@RequestMapping("/save")
	public String save(HttpServletRequest request){
		logger.debug("save me:"+request.getParameter("username")+","+request.getParameter("password")+
				","+request.getParameter("email")+","+request.getParameter("phone"));
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		User user = new User(username,password);
		request.getSession().setAttribute("register_user", username);
		user.setUid(CommonUtils.getUUID());
		
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		if (email !=null ) {//user register by email
			user.setEmail(email);
		}else  if (phone!=null) {//user register by telephone
			user.setTelephone(Long.parseLong(phone));
		}
		mUserService.saveUser(user);
		
		return "home/login";
	}
	
	@RequestMapping("/logout")
	private String logoutUser(HttpServletRequest request,HttpServletResponse response){
		request.getSession().removeAttribute("login_user");
		return "redirect:/product/initProduct";
	}
	
	@RequestMapping(value="/addAddress")
	private void addNewAddress(HttpServletRequest request,HttpServletResponse response){
		String redirectPath = request.getParameter("redirectpath");
		
		String receiver = request.getParameter("receiver");
		String phone = request.getParameter("telephone");
		String details = request.getParameter("detailAddrs");
		User user = (User) request.getSession().getAttribute(Constants.session_login_user);
		Address address = new Address();
		address.setAid(CommonUtils.getUUID());
		address.setAddress(details);
		address.setReceiver(receiver);
		address.setTelephone(phone);
		address.setUid(user.getUid());
		List<Address> addList = user.getAddresses();
		if (addList==null || addList.size()==0) {
			address.setIsDefault(1);
			addList = new ArrayList<>();
		}else{
			address.setIsDefault(0);
		}
		mAddressService.addAddress(address);
		addList.add(address);
		user.setAddresses(addList);
		
		try {
			response.sendRedirect(request.getContextPath()+"/"+redirectPath);			
		} catch (IOException e) {
			logger.error(e.getMessage());
		}
		
		//return "home/pay";
	}
	
	@RequestMapping("/setDeftAddrs")
	private String setDefaultAddress(@RequestParam("aid")String aid,@RequestParam("flag")String flag,HttpServletRequest request){
		User user = (User) request.getSession().getAttribute(Constants.session_login_user);
		Address oldDeftAddrs = user.getDeafaultAddress();
		logger.info("setDeft addrs:"+oldDeftAddrs);
		Address toDefatl = mAddressService.findAddressById(aid);
		
		toDefatl.setIsDefault(1);
		oldDeftAddrs.setIsDefault(0);
		mAddressService.updateAddress(aid, toDefatl);
		mAddressService.updateAddress(oldDeftAddrs.getAid(), oldDeftAddrs);

		String uid = user.getUid();
		user.setAddresses(mAddressService.findUsersAddr(uid));
		if ("person".equals(flag)) {
			return "person/address";
		}else {
			return "home/pay";
		}
	}
	
	@RequestMapping("/delAddrs")
	private String deleteAddress(@RequestParam("aid")String aid,@RequestParam("flag")String flag,
			HttpServletRequest request){
		User user = (User) request.getSession().getAttribute(Constants.session_login_user);
		if (user==null) {
			return "home/login";
		}
		
		mAddressService.deleteAddress(aid);
		String uid = user.getUid();
		user.setAddresses(mAddressService.findUsersAddr(uid));
		if("person".equals(flag)){
			return "person/address";
		}
		return "home/pay";
	}
	
	@RequestMapping(value="/personInfo")
	private ModelAndView  enterPerson(HttpServletRequest request,HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		User user =(User) request.getSession().getAttribute(Constants.session_login_user);
		if (user == null) {
			mav.setViewName("home/login");
			return mav;
		}
		List<Order> usersOrders = mOrderService.findUsersOrders(user.getUid());
		int waitSend = 0,waitConfirm=0,waitComment=0,orderClose=0;
		for(Order order:usersOrders){
			int state = order.getState();
			if (state==Constants.order_close) {
				orderClose++;
			}else  if (state==Constants.waitfor_confirm_prod) {
				waitConfirm++;
			}else if (state==Constants.waitfor_commt_prod) {
				waitComment++;
			}else {
				waitSend++;
			}
		}
		mav.addObject("waitSend", waitSend);
		mav.addObject("waitConfirm", waitConfirm);
		mav.addObject("waitComment", waitComment);
		mav.addObject("orderClose", orderClose);

		int oth_waitAgree=0,oth_alreadyAgree=0,own_waitAgree=0,own_alreadyAgree=0;
		List<ExRequest> mySendRequest = mExRequestService.findMySendRequest(user.getUid());
		List<ExRequest> toMeRequests = mExRequestService.findSendToMeRequests(user.getUid());
		for(ExRequest exRequest:mySendRequest){
			if (exRequest.getState()==Constants.request_agree) {
				oth_alreadyAgree++;
			}else if(exRequest.getState()==Constants.request_wait) {
				oth_waitAgree++;
			}
		}
		
		for(ExRequest exRequest:toMeRequests){
			if (exRequest.getState()==Constants.request_agree) {
				own_alreadyAgree++;
			}else if (exRequest.getState()==Constants.request_wait) {
				own_waitAgree++;
			}
		}
		mav.addObject("oth_waitAgree", oth_waitAgree);
		mav.addObject("oth_alreadyAgree", oth_alreadyAgree);
		mav.addObject("own_waitAgree", own_waitAgree);
		mav.addObject("own_alreadyAgree", own_alreadyAgree);
		mav.setViewName("person/index");
		return mav;
	}
	
	
			
		
	@RequestMapping("/resetUser")
	public void resetUser(HttpServletRequest request,HttpServletResponse response){
		String uid = request.getParameter("uid");
		User user = (User) request.getSession().getAttribute(Constants.session_login_user);
		logger.debug(uid + "==before=========" + user);
		user.setUsername(request.getParameter("username"));
		user.setName(request.getParameter("realname"));
		
		String phone = request.getParameter("phone");
		if (phone!="") {
			user.setTelephone(Long.parseLong(phone));
		}
		
		user.setEmail(request.getParameter("email"));
		logger.debug(uid + "==after=========" + user);
		mUserService.resetUser(uid,user);
		
		request.getSession().setAttribute(Constants.session_login_user, user);
		try {
			response.sendRedirect(request.getContextPath()+"/person/information.jsp");
		} catch (IOException e) {
			logger.error(e.getMessage());
		}
	}
	
	@RequestMapping("/resetpass")
	public void resetUserPass(HttpServletRequest request,HttpServletResponse response){
		String uid = request.getParameter("uid");
		User user = mUserService.getUserById(uid);
		user.setPassword(request.getParameter("newpass"));
		mUserService.resetUser(uid, user);
		request.getSession().removeAttribute(Constants.session_login_user);
		try {
			//login again after reset pwd
			response.sendRedirect(request.getContextPath()+"/home/login.jsp");
		} catch (IOException e) {
			logger.error(e.getMessage());
		}
	}
	
	@RequestMapping(value="/allComments")
	public ModelAndView getUserComments(@RequestParam("uid") String uid) {
				
		ModelAndView mav = new ModelAndView("person/comment");
		List<Comment> userCommts = mCommentService.getAllUserCommts(uid);
		logger.info("all user commts:"+userCommts);
		mav.addObject("userCommts", userCommts);
		return mav;
	}
	
	@RequestMapping("/allRequests")
	private ModelAndView allUserRequests(HttpServletRequest request){
		User user = (User)request.getSession().getAttribute(Constants.session_login_user);
		if (user==null) {
			return new ModelAndView("home/login");
		}
		ModelAndView mav = new ModelAndView();
		List<ExRequest> sendRequests = mExRequestService.findMySendRequest(user.getUid());
		List<ExRequest> sendToMeRequests = mExRequestService.findSendToMeRequests(user.getUid());
		
		logger.info("user requests:"+sendRequests);
		mav.addObject("sendRequests", sendRequests);
		logger.info("sendme rqst:"+sendToMeRequests);
		mav.addObject("sendMeReq", sendToMeRequests);
		mav.setViewName("person/exorder");
		return mav;
	}
	
	@RequestMapping("/allExGoods")
	public ModelAndView toExchangeGoods(@RequestParam("cgid")int cgid,
			@RequestParam("uid")String uid){
		ModelAndView mav = new ModelAndView();
		List<ExGoods> usersGoods = mExGoodsService.findUsersGoods(uid);
		logger.info("user all goods:"+usersGoods);
		mav.addObject("userGoods", usersGoods);
		mav.setViewName("person/collection");
		return mav;
	}
	
	@RequestMapping("/allUserGoods")
	public ModelAndView allUserGoods(HttpServletRequest request,HttpServletResponse response){
		User user = (User) request.getSession().getAttribute(Constants.session_login_user);
		if (user==null) {
			return new ModelAndView("home/login");
		}
		ModelAndView mav =new ModelAndView();
		List<ExGoods> usersGoods = mExGoodsService.findUsersGoods(user.getUid());
		mav.addObject("allGoods", usersGoods);
		mav.setViewName("person/allgoods");
		return mav;
		
	}
	
	@RequestMapping("/changeGoods")
	private String sendChangeRequest(HttpServletRequest request,HttpServletResponse response){
		logger.info("owncgid:"+request.getParameter("owngoods")+";excgid:"+request.getParameter("exgoods"));
		int owncgid = Integer.parseInt(request.getParameter("owngoods"));
		int excgid = Integer.parseInt(request.getParameter("exgoods"));
		ExRequest exRequest = new ExRequest();
		exRequest.setCrid(CommonUtils.getUUID());
		ExGoods destGoods = mExGoodsService.findGoodsById(excgid);
		exRequest.setDestGoods(destGoods);
		exRequest.setSrcGoods(mExGoodsService.findGoodsById(owncgid));
		exRequest.setCreatetime(new Date());
		logger.info("save request:"+exRequest);
		mExRequestService.saveChangeRequest(exRequest);
		
		//remove session tochange goods
		@SuppressWarnings("unchecked")
		List<ExGoods> goodsList = (List<ExGoods>) request.getSession().getAttribute(Constants.look_change_goods);
		goodsList.remove(destGoods);
		
		return "redirect:/user/allRequests";
	}
	
	
}
