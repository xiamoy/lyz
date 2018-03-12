package com.lyz.user.service;

import java.util.List;

import com.lyz.user.bean.User;

/**
 * 用户service接口
 * @author liuyazhuang
 *
 */
public interface UserService {
	
	User findUser(String username,String password);
	
	 /**
     * 保存用户
     * @param user
     */
    void saveUser(User user);
    
	/**
	 * 获取所有用户列表
	 * @return
	 */
	List<User> getAllUser();
	
	/**
	 * 根据用户名查询用户信息
	 * @param id
	 * @return
	 */
	User getUserByName(String username);
	
	/**
	 * 更新用户的名称
	 * @param user
	 */
	void renameUser(String name, String username);
	
	/**
	 * 根据id删除指定的用户
	 * @param id
	 */
	void deleteUserByName(String username);
}
