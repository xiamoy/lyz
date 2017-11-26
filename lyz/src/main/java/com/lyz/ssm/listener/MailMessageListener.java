//package com.lyz.ssm.listener;
//
//import org.springframework.stereotype.Component;
//
//import com.alibaba.fastjson.JSONObject;
//import com.lyz.ssm.biz.MailService;
//import com.lyz.ssm.common.model.MailParam;
//
//import org.apache.activemq.command.ActiveMQTextMessage;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.jms.core.JmsTemplate;
//import org.springframework.jms.listener.SessionAwareMessageListener;
//import org.springframework.stereotype.Component;
//
//import javax.jms.JMSException;
//import javax.jms.Message;
//import javax.jms.Session;
//
//
//@Component
//public class MailMessageListener implements SessionAwareMessageListener<Message> {
//
//    private final Logger log = LoggerFactory.getLogger(MailMessageListener.class);
//
//    @Autowired
//    private JmsTemplate mailMqJmsTemplate;
//    
//    @Autowired
//    private MailService mailService;
//
//    /**
//     * 发送邮件
//     *
//     * @param message
//     * @param session
//     */
//    public  void onMessage(Message message, Session session) throws JMSException {
//        //这里建议不要try catch，让异常抛出，通过redeliveryPolicy去重试，达到重试次数进入死信DLQ(Dead Letter Queue)
//        ActiveMQTextMessage msg = (ActiveMQTextMessage) message;
//        final String ms = msg.getText();
//        log.info("==>receive message:" + ms);
//        // 转换成相应的对象
//        MailParam mailParam = JSONObject.parseObject(ms, MailParam.class);
//        if (mailParam == null) {
//            log.error("mailParam is empty!");
//            return;
//        }
//        mailService.mailSend(mailParam);
//    }
//
//}