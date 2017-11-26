package com.lyz.ssm.enums;

public enum BizExceptionEnum {

	DB_INSERT_RESULT_ERROR(99990001, "db insert error"),
	DB_UPDATE_RESULT_ERROR(99990002, "db update error"),
	DB_SELECTONE_IS_NULL(99990003,"db select return null"),

	INNER_ERROR(99980001, "系统错误"),
	TOKEN_IS_ILLICIT(99980002, "Token验证非法"),
	SESSION_IS_OUT_TIME(99980003, "会话超时");

	private int state;

	private String msg;

	 BizExceptionEnum(int state, String msg) {
		this.state = state;
		this.msg = msg;
	}

	public  int getState() {
		return state;
	}

	public  String getMsg() {
		return msg;
	}

	public static  BizExceptionEnum stateOf(int index) {
		for (BizExceptionEnum state : values()) {
			if (state.getState() == index) {
				return state;
			}
		}
		return null;
	}
}
