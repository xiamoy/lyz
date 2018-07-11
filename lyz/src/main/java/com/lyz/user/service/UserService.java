package com.lyz.user.service;

import com.lyz.user.bean.User;

public interface UserService {
	

	User findUser(String username,String password);
	
    User saveUser(User user);
	
//	List<User> getAllUser();
	
	
//	User getUserByName(String username);
	
	User getUserById(String uid);
	
	User resetUser(String uid, User user);
	

//	void deleteUserByName(String username);
	
}
