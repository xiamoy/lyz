//package com.lyz.ssm.listener;
//
//import javax.jms.JMSException;
//import javax.jms.Message;
//import javax.jms.Session;
//
//import org.apache.activemq.command.ActiveMQTextMessage;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//
//import org.springframework.jms.listener.SessionAwareMessageListener;
//import org.springframework.stereotype.Component;
//
//import com.alibaba.fastjson.JSONObject;
//import com.lyz.ssm.biz.TransactionBizService;
//import com.lyz.ssm.common.model.BizOperator;
//
//@Component
//public class TransactionBizMessageListener implements SessionAwareMessageListener<Message>{
//
//	 private static final Logger log = LoggerFactory.getLogger(TransactionBizMessageListener.class);
//	    private final String transactionBiz = "testDistributedTransaction";
//
//	    @Autowired
//	    private TransactionBizService transactionBizService;
//
//	    /**
//	     * 执行分布式事务中的某个业务
//	     * 采用线程池的方式解决效率问题
//	     *
//	     * @param message
//	     * @param session
//	     */
//	    public  void onMessage(Message message, Session session) throws JMSException{
//	        //这里建议不要try catch，让异常抛出，通过redeliveryPolicy去重试，达到重试次数进入死信DLQ(Dead Letter Queue)
//	        ActiveMQTextMessage msg = (ActiveMQTextMessage) message;
//	        String ms = ms = msg.getText();
//	        log.info("==>receive message:" + ms);
//	        // 转换成相应的对象
//	        BizOperator operator = JSONObject.parseObject(ms, BizOperator.class);
//	        if (operator != null && transactionBiz.equals(operator.getOperator())) {
//	            transactionBizService.addScoreBySyn(100);
//	            //throw new RuntimeException("test redeliveryPolicy");
//	        } else {
//	            log.info("==>message:" + ms + " no about operator!");
//	        }
//	    }
//}
