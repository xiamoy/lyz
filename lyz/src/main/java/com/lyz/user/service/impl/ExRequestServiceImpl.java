package com.lyz.user.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lyz.user.bean.ExRequest;
import com.lyz.user.dao.ExRequestDao;
import com.lyz.user.service.ExRequestService;

@Service
@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
public class ExRequestServiceImpl implements ExRequestService {

	@Resource
	private ExRequestDao mExRequestDao;
	
	@Override
	@CacheEvict(value="exgoodCache",allEntries=true)
	public void saveChangeRequest(ExRequest cRequest) {
		mExRequestDao.saveChangeRequest(cRequest);
	}

	@Override
	public void deleteRequest(String rid) {
		mExRequestDao.deleteRequest(rid);
	}

	@Override
	public void updateRequest(ExRequest cRequest) {
		mExRequestDao.updateRequest(cRequest);
	}

	

	@Override
	public ExRequest findRequestById(String uid) {
		return mExRequestDao.findRequestById(uid);
	}

	@Override
	public List<ExRequest> findSendToMeRequests(String uid) {
		return mExRequestDao.findSendToMeRequests(uid);
	}

	

	@Override
	public List<ExRequest> findMySendRequest(String uid) {
		return mExRequestDao.findMySendRequest(uid);
	}

}
