package com.lyz.util;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import com.lyz.user.bean.Comment;

public class CommonUtils {
	public static String getUUID(){
		return UUID.randomUUID().toString().replace("-", "");
	}
	
	public static Map<Integer, List<Comment>> groupByLevel(List<Comment> comments){
		Map<Integer, List<Comment>> groupedComment = new HashMap<>();
		for (Comment comment:comments) {
			Integer level = comment.getLevel();
			if (groupedComment.containsKey(level)) {
				groupedComment.get(level).add(comment);
			}else {
				List<Comment> newComments = new ArrayList<>();
				newComments.add(comment);
				groupedComment.put(level, newComments);
			}
		}
		return groupedComment;
	}
	
	public static String formatDate(Date date){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(date);
	}
}
