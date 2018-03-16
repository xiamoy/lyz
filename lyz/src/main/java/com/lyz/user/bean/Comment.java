package com.lyz.user.bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Comment implements Comparable{

	private String cid;
	private String poster;
	private String description;
	private int pid;
	private String postdate;
	private Integer level;
	
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getPostdate() {
		return postdate;
	}
	public void setPostdate(String postdate) {
		this.postdate = postdate;
	}
	
	public Integer getLevel(){
		return level;
	}
	
	public void setLevel(int level){
		this.level = level;
	}
	@Override
	public int compareTo(Object o) {
		if (o instanceof Comment) {
			Comment comment = (Comment)o;
			  SimpleDateFormat temp=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");  
			  try {
				Date thisDate = temp.parse(this.postdate);
				Date otherDate = temp.parse(comment.getPostdate());
				System.out.println("this:"+thisDate+";"+otherDate);
				return thisDate.compareTo(otherDate);
			} catch (ParseException e) {
				return 0;
			}
 //			return this.level.compareTo(comment.getLevel());
		}
		return 0;
	}
	@Override
	public String toString() {
		return "Comment [cid=" + cid + ", poster=" + poster + ", description="
				+ description + ", pid=" + pid + ", postdate=" + postdate
				+ ", level=" + level + "]";
	}
	
}
