<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>付款成功页面</title>
<link rel="stylesheet"  type="text/css" href="../AmazeUI-2.4.2/assets/css/amazeui.css"/>
<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />

<link href="../css/sustyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../basic/js/jquery-1.7.min.js"></script>

</head>

<body>


<!--顶部导航条 -->

<%@include file="/home/head.jsp" %>


<div class="take-delivery">
 <div class="status">
   <h2>您已成功付款</h2>
   <div class="successInfo">
     <ul>
       <li>订单编号:<em><a href="#">${order.oid }</a></em></li>
       <li>付款金额<em>¥${order.total }</em></li>
       <div class="user-info">
         <p>收货人：${order.name }</p>
         <p>联系电话：${order.telephone }</p>
         <p>收货地址：${order.address }</p>
       </div>
             请认真核对您的收货信息，如有错误请联系我们
                               
     </ul>
     <div class="option">
       <span class="info">您可以</span>
        <a href="${pageContext.request.contextPath }/order/allOrders" class="J_MakePoint">查看<span>已买到的宝贝</span></a>
        <a href="${pageContext.request.contextPath }/order/orderDetail?oid=${order.oid}" class="J_MakePoint">查看<span>交易详情</span></a>
     </div>
    </div>
  </div>
</div>

<%@include file="/home/foot.jsp" %>

</body>
</html>
