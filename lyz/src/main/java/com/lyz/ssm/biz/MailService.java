//package com.lyz.ssm.biz;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.mail.SimpleMailMessage;
//import org.springframework.mail.javamail.JavaMailSender;
//import org.springframework.mail.javamail.JavaMailSenderImpl;
//import org.springframework.stereotype.Service;
//
//import com.lyz.ssm.common.model.MailParam;
//
//@Service
//public class MailService {
//	
//	@Autowired
//	private JavaMailSender mailSender;
//	
//	@Autowired
//	private SimpleMailMessage simpleMailMessage;
//	
//	private JavaMailSenderImpl sender = new JavaMailSenderImpl();
//	private SimpleMailMessage msg = new SimpleMailMessage();
//	
//	public void mailSend(final MailParam mail){
//		 try {
//	            Thread.sleep(2000);
//	        } catch (InterruptedException e) {
//	            e.printStackTrace();
//	        }
////	        simpleMailMessage.setFrom(mail.getFrom()); // 发送人,从配置文件中取得
////	        simpleMailMessage.setTo(mail.getTo()); // 接收人
////	        simpleMailMessage.setSubject(mail.getSubject());
////	        simpleMailMessage.setText(mail.getContent());
////	        mailSender.send(simpleMailMessage);
//		 
//		    msg.setFrom(mail.getFrom()); // 发送人,从配置文件中取得
//	        msg.setTo(mail.getTo()); // 接收人
//	        msg.setSubject(mail.getSubject());
//	        msg.setText(mail.getContent());
//	        sender.send(msg);
//	}
//	
//}
