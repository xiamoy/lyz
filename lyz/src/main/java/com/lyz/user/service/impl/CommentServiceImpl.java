package com.lyz.user.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lyz.user.bean.Comment;
import com.lyz.user.dao.CommentDao;
import com.lyz.user.service.CommentService;

@Service
@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
public class CommentServiceImpl implements CommentService {

	@Resource
	private CommentDao mCommentDao;
	
	@Override
	public List<Comment> findCommentsByPid(int pid) {
		return mCommentDao.findCommentsByPid(pid);
	}

	@Override
	public List<Comment> getAllUserCommts(String uid) {
		return mCommentDao.getAllUserCommts(uid);
	}

	@Override
	public void addComment(Comment comment) {
		mCommentDao.addComment(comment);
	}

	@Override
	public void deleteCommentById(String cid) {
		mCommentDao.deleteCommentById(cid);
	}

}
