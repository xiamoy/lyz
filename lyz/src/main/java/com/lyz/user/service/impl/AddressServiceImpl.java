package com.lyz.user.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.Caching;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lyz.user.bean.Address;
import com.lyz.user.dao.AddressDao;
import com.lyz.user.service.AddressService;

@Service
@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
public class AddressServiceImpl implements AddressService {

	private static final Logger logger = Logger.getLogger(AddressServiceImpl.class);
	
	@Resource
	private AddressDao mAddressDao;
	
	@Override
	@Cacheable(value="addressesCache",key="#uid")
	public List<Address> findUsersAddr(String uid) {
		logger.info("find user address from dao..."+uid);
		return mAddressDao.findUsersAddr(uid);
	}

	@Override
	@Caching(
	   evict={
	       @CacheEvict(value="addressesCache",key="#address.uid")
	   },
	   put={
		@CachePut(value="addressCache",key="#address.aid")
	   }
	)
	public Address addAddress(Address address) {
		mAddressDao.addAddress(address);
		return address;
	}

	@Override
	@Cacheable(value="addressCache",key="#aid")
	public Address findAddressById(String aid) {
		return mAddressDao.findAddressById(aid);
	}

	@Override
	@Caching(
	   put={
		  @CachePut(value="addressCache",key="#aid"),
	   },
	   evict={
			 @CacheEvict(value="addressesCache",key="#address.uid")
	   }
	)
	public Address updateAddress(String aid, Address address) {
		mAddressDao.updateAddress(address);
		return address;
	}

	@Override
	@Caching(
	   evict={
			  @CacheEvict(value="addressCache",key="#aid"),
			  @CacheEvict(value="addressesCache",allEntries=true)
	   }		
	)
	public void deleteAddress(String aid) {
		mAddressDao.deleteAddress(aid);
	}

}
