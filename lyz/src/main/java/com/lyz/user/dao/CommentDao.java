package com.lyz.user.dao;

import java.util.List;

import com.lyz.user.bean.Comment;

public interface CommentDao {

	List<Comment> findCommentsByPid(int pid);
}
