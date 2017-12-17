package com.lyz.user.controller;

import java.util.List;

import javax.security.auth.login.LoginContext;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lyz.user.bean.User;
import com.lyz.user.service.UserService;

/**
 * UserController类
 * @author liuyazhuang
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {
	private final Log logger = LogFactory.getLog(this.getClass());
	
	@Autowired
	private UserService mUserService;
	
	@RequestMapping("/login")
	public String login(@RequestParam(value="username", defaultValue="") String username,
			@RequestParam(value="password", defaultValue="") String password){
		logger.debug(username);
		User user = mUserService.findUser(username, password);
		logger.info("user login:"+user);
		if(user==null){
			return "error";
		}else{
			return "success";
		}
	}
	
	/**
	 * 保存用户
	 */
	@RequestMapping("/save")
	@ResponseBody
	public Integer save(@RequestParam(value="username", defaultValue="") String username,
			@RequestParam(value="password", defaultValue="") String password,@RequestParam(value="name") String name,
			@RequestParam(value="email", defaultValue="") String email){
		logger.debug(name);
		mUserService.saveUser(username,password,name, email);
		return 1;
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
	 * 根据用户id获取用户信息
	 * @return
	 */
	@RequestMapping("/getUserById")
	@ResponseBody
	public Object getUserById(@RequestParam(value="id", defaultValue="0") String id){
		User user = mUserService.getUserById(Integer.parseInt(id));
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
	public Integer delete(@RequestParam(value="id", defaultValue="0") String id){
		logger.debug(id);
		mUserService.deleteUserById(Integer.parseInt(id));
		return 1;
	}
}
