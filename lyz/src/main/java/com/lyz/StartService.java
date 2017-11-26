package com.lyz;

import redis.clients.jedis.Jedis;

public class StartService {
	
	private Jedis redis;

	public static void main(String[] args) {
		
//		MailParam mailParam = new MailParam("to:abc","subject","content:hello");
//		mailParam.setFrom("my");
//		MailService mailService = new MailService();
//		
//		mailService.mailSend(mailParam);
		
		Jedis jedis = new Jedis("127.0.0.1");
		System.out.println("Connection to server successfully");
		System.out.println("Server is running "+jedis.ping());
		
		
	}
	


}
