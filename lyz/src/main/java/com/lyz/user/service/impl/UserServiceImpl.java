package com.lyz.user.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lyz.user.bean.User;
import com.lyz.user.dao.UserDao;
import com.lyz.user.service.UserService;



/**
 * UserService实现类
 * @author liuyazhuang
 *
 */
@Service
@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
public class UserServiceImpl implements UserService {
	
	@Resource
	private UserDao mUserDao;
	
	@Override
	@CacheEvict(value = { "saveUser"}, allEntries = true)
	public void saveUser(String username, String password, String name,String email) {
		User user = new User(username,password,name,email);
		mUserDao.saveUser(user);
	}

	@Override
	@Cacheable("getAllUser")
	public List<User> getAllUser() {
		return mUserDao.getAllUser();
	}

	@Override
	@Cacheable("getUserById")
	public User getUserById(Integer id) {
		return mUserDao.getById(id);
	}

	@Override
	@CacheEvict(value = { "getAllUser", "getUserById" }, allEntries = true)
	public void renameUser(String name, String id) {
		mUserDao.rename(new User(id, name));
	}

	@Override
	@CacheEvict(value = { "getAllUser", "getUserById" }, allEntries = true)
	public void deleteUserById(Integer id) {
		mUserDao.deleteById(id);
	}

	@Override
	public User findUser(String username, String password) {
		
		return mUserDao.findUser(username, password);
	}

}
