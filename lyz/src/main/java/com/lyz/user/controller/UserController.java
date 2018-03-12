package com.lyz.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lyz.user.bean.User;
import com.lyz.user.service.UserService;
import com.lyz.util.CommonUtils;

/**
 * UserController类
 * @author liuyazhuang
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {
	private final Log logger = LogFactory.getLog(UserController.class);
	
	@Autowired
	private UserService mUserService;
	
	@RequestMapping("/login")
	public ModelAndView login(@RequestParam(value="username", defaultValue="") String username,
			@RequestParam(value="password", defaultValue="") String password
			//			HttpServletRequest request
			){
//		HttpSession session = request.getSession();
//		logger.debug("user login:"+request.getParameter("username")+";"+request.getParameter("password"));
		logger.debug("user login:"+username+";"+password);
		User user = mUserService.findUser(username, password);
		logger.info("user login:"+user);
//		session.setAttribute("login_user", username);
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("login_user", username);
		if(user==null){
//			return "WEB-INF/jsp/error";
			return new ModelAndView("WEB-INF/jsp/error", map);
		}else{
			return new ModelAndView("home/home",map);
		}
	}
	
	/**
	 * 保存用户
	 */
	@RequestMapping("/save")
//	@ResponseBody
	public ModelAndView save(@RequestParam(value="username", defaultValue="") String username,
			@RequestParam(value="password", defaultValue="") String password,@RequestParam(value="name", defaultValue="") String name,
			@RequestParam(value="email", defaultValue="") String email,@RequestParam(value="phone",defaultValue="")String phone){
		logger.debug(name);
		
		User user = new User(username,password);
		user.setUid(CommonUtils.getUUID());
		user.setName(name);
		if (email !=null) {//user register by email
			user.setEmail(email);
		}else if (phone!=null) {//user register by telephone
			user.setTelephone(Long.parseLong(phone));
		}
		mUserService.saveUser(user);
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("register_user", map);
		return new ModelAndView("home/login", map);
	}
	
	/**
	 * 获取所有用户列表
	 * @return
	 */
	@RequestMapping("/getall")
	@ResponseBody
	public Object getAllUser(){
		List<User> users = mUserService.getAllUser();
		for(User u : users){
			logger.debug(u.toString());
		}
		return users;
	}
	/**
	 * 根据用户名获取用户信息
	 * @return
	 */
	@RequestMapping("/getUserByName")
	@ResponseBody
	public Object getUserByName(@RequestParam(value="username") String username){
		User user = mUserService.getUserByName(username);
		logger.debug(user.toString());
		return user;
	}
	
	/**
	 * 根据用户id获取用户信息
	 * @return
	 */
	@RequestMapping("/renameUser")
	@ResponseBody
	public Integer renameUser(@RequestParam(value="id", defaultValue="0") String id, 
							 @RequestParam(value="name", defaultValue="") String name){
		logger.debug(id + "=========" + name);
		mUserService.renameUser(name, id);
		return 1;
	}
	/**
	 * 根据用户id获取用户信息
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Integer delete(@RequestParam(value="username") String username){
		logger.debug(username);
		mUserService.deleteUserByName(username);
		return 1;
	}
}
