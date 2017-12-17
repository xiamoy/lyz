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
    void saveUser(String username, String password, String name,String email);
	
	/**
	 * 获取所有用户列表
	 * @return
	 */
	List<User> getAllUser();
	
	/**
	 * 根据id查询用户信息
	 * @param id
	 * @return
	 */
	User getUserById(Integer id);
	
	/**
	 * 更新用户的名称
	 * @param user
	 */
	void renameUser(String name, String id);
	
	/**
	 * 根据id删除指定的用户
	 * @param id
	 */
	void deleteUserById(Integer id);
}
