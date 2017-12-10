package com.lyz.user.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.lyz.user.bean.User;
import com.lyz.user.dao.UserDao;
import com.lyz.user.mapper.UserMapper;
/**
 * Dao实现类
 * @author liuyazhuang
 *
 */
@Repository
public class UserDaoImpl implements UserDao {
	@Resource
	private UserMapper mUserMapper;
	
	@Override
	public void saveUser(User user) {
		mUserMapper.saveUser(user);
	}

	@Override
	public List<User> getAllUser() {
		return mUserMapper.getAllUser();
	}

	@Override
	public User getById(Integer id) {
		return mUserMapper.getUserById(id);
	}

	@Override
	public void rename(User user) {
		mUserMapper.renameUser(user);
	}

	@Override
	public void deleteById(Integer id) {
		mUserMapper.deleteUserById(id);
	}


}
