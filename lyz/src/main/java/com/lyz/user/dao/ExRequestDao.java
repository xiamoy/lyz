package com.lyz.user.dao;

import java.util.List;

import com.lyz.user.bean.ExRequest;

public interface ExRequestDao {
	
	void saveChangeRequest(ExRequest cRequest);
	void deleteRequest(String crid);
	void updateRequest(ExRequest cRequest);
	List<ExRequest> findSendToMeRequests(String uid);
	List<ExRequest> findGoodsRequest(int cgid);
	ExRequest findRequestById(String crid);
	List<ExRequest> findMySendRequest(String uid);
}
