package com.lyz.ssm.quartz;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import com.lyz.ssm.common.cache.RedisCache;

public class CacheQuartz {
	private final Logger LOG = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private RedisCache cache;
	
	/**
	 * 每隔5分钟定时清理缓存
	 * 这几在集群环境 重复触发没关系
	 */
	@Scheduled(cron = "0 0/5 * * * ? ")
	public  void cacheClear() {
		cache.clearCache();
	}
}
