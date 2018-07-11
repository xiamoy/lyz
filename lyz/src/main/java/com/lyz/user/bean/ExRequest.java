package com.lyz.user.bean;

import java.io.Serializable;
import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

@JsonSerialize
@JsonNaming(PropertyNamingStrategy.LowerCaseWithUnderscoresStrategy.class) 
public class ExRequest implements Serializable {
	
	
	private static final long serialVersionUID = 6013227971694257835L;
	private String crid;
	private ExGoods srcGoods;
	private ExGoods destGoods;
	private int state;
	private Date createtime;
	
//	private String srcUid;
//	private String srcGid;
//	private String destUid;
	
	public String getCrid() {
		return crid;
	}
	public void setCrid(String crid) {
		this.crid = crid;
	}
	public ExGoods getSrcGoods() {
		return srcGoods;
	}
	public void setSrcGoods(ExGoods srcGoods) {
		this.srcGoods = srcGoods;
	}
	public ExGoods getDestGoods() {
		return destGoods;
	}
	public void setDestGoods(ExGoods destGoods) {
		this.destGoods = destGoods;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	
	@Override
	public String toString() {
		return "ChangeRequest [crid=" + crid + ", srcGoods=" + srcGoods
				+ ", destGoods=" + destGoods + ", state=" + state
				+ ", createtime=" + createtime + "]";
	}
	
}
