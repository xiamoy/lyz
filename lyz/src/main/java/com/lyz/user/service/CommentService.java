package com.lyz.user.service;

import java.util.List;

import com.lyz.user.bean.Comment;

public interface CommentService {
	List<Comment> findCommentsByPid(int pid);
}
