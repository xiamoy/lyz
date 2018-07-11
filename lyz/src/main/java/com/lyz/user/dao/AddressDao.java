package com.lyz.user.dao;

import java.util.List;

import com.lyz.user.bean.Address;

public interface AddressDao {
	
	List<Address> findUsersAddr(String uid);
	void addAddress(Address address);
	Address findAddressById(String aid);
	void updateAddress(Address address);
	void deleteAddress(String aid);
}
