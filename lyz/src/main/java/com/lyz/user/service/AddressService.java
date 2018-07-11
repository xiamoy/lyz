package com.lyz.user.service;

import java.util.List;

import com.lyz.user.bean.Address;

public interface AddressService {

	List<Address> findUsersAddr(String uid);
	Address addAddress(Address address);
	Address findAddressById(String aid);
	Address updateAddress(String aid,Address address);
	void deleteAddress(String aid);
}
