package com.lyz.user.service;

import java.util.List;

import com.lyz.user.bean.ExRequest;

public interface ExRequestService {
	void saveChangeRequest(ExRequest cRequest);
	void deleteRequest(String rid);
	void updateRequest(ExRequest cRequest);
	List<ExRequest> findSendToMeRequests(String uid);
	ExRequest findRequestById(String crid);
	List<ExRequest> findMySendRequest(String uid);
}
