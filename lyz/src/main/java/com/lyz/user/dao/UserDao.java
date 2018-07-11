package com.lyz.user.dao;

import java.util.List;

import com.lyz.user.bean.User;


public interface UserDao {
	
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
	 * 根据username查询用户信息
	 * @param username
	 * @return
	 */
	User getByName(String username);
	
	User getUserById(String uid);
	
	/**
	 * 更新用户的名称
	 * @param user
	 */
	void resetUser(User user);
	
	/**
	 * 根据username删除指定的用户
	 * @param username
	 */
	void deleteByName(String username);
}
