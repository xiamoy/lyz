package com.lyz.user.service.impl;

import javax.annotation.Resource;

import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.Caching;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lyz.user.bean.User;
import com.lyz.user.dao.UserDao;
import com.lyz.user.service.UserService;



@Service
@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
public class UserServiceImpl implements UserService {
	
	@Resource
	private UserDao mUserDao;
	
	@Override
	@Caching(
	   	put={
	   		@CachePut(value="_userCache",key="#user.uid"),
	   		@CachePut(value="_userCache",key="#user.username.concat(#user.password)")
	   	}
	)
	public User saveUser(User user) {
		mUserDao.saveUser(user);
		return user;
	}
	

/*	@Override
	@Cacheable("_getAllUser")
	public List<User> getAllUser() {
		return mUserDao.getAllUser();
	}*/

	/*@Override
	@Cacheable(value="_userCache",key="#username")
	public User getUserByName(String username) {
		return mUserDao.getByName(username);
	}*/

	@Override
	@Caching(
		put={
	   		@CachePut(value="_userCache",key="#user.uid"),
	   		@CachePut(value="_userCache",key="#user.username.concat(#user.password)")
	   	}
		)
	public User resetUser(String uid, User user) {
		mUserDao.resetUser(user);
		return user;
	}

	/*@Override
	@CacheEvict(value = { "getAllUser", "getUserById" }, allEntries = true)
	public void deleteUserByName(String username) {
		mUserDao.deleteByName(username);
	}*/

	@Override
	@Cacheable(value="_userCache",key="#username.concat(#password)")
	public User findUser(String username, String password) {
		return mUserDao.findUser(username, password);
	}


	@Override
	@Cacheable(value="_userCache",key="#uid")
	public User getUserById(String uid) {
		return mUserDao.getUserById(uid);
	}

}
