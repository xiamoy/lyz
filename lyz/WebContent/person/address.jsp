<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>地址管理</title>

		<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="../css/personal.css" rel="stylesheet" type="text/css">
		<link href="../css/addstyle.css" rel="stylesheet" type="text/css">
		<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
		<script src="../AmazeUI-2.4.2/assets/js/amazeui.js"></script>

	</head>

	<body>
				
		<%@include file="/person/commheader.jsp" %>

		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-address">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">地址管理</strong> / <small>Address&nbsp;list</small></div>
						</div>
						<hr/>
						<ul class="am-avg-sm-1 am-avg-md-3 am-thumbnails">
					
							<c:if test="${empty login_user.addresses }">
								<li class="user-addresslist defaultAddr">您还没有地址哦，先增加一个吧</li>
							</c:if>
							<c:if test="${not empty login_user.addresses }">
								<c:forEach items="${login_user.addresses }" var="addrs">
									<c:choose>
										<c:when test="${addrs.isDefault==1 }">
											<li class="user-addresslist defaultAddr">
											<span class="new-option-r"><i class="am-icon-check-circle"></i>默认地址</span>
										</c:when>
										<c:otherwise>
											<li class="user-addresslist ">
											<span class="new-option-r"><i class="am-icon-check-circle"></i>
											<a style="background: #ee3495;border-radius:0 0 5px 5px;color: #fff;" 
												href="${pageContext.request.contextPath }/user/setDeftAddrs?aid=${addrs.aid}&flag=person">设为默认</a>
											</span>
										</c:otherwise>
									</c:choose>
								
									<p class="new-tit new-p-re">
										<span class="new-txt">${addrs.receiver }</span>
										<span class="new-txt-rd2">${addrs.telephone }</span>
									</p>
									<div class="new-mu_l2a new-p-re">
										<p class="new-mu_l2cw">
											<span class="title">地址：${addrs.address }</span>
										</p>
									</div>
									<div class="new-addr-btn">
										<!-- <a href="#"><i class="am-icon-edit"></i>编辑</a>
										<span class="new-addr-bar">|</span> -->
										<a href="${pageContext.request.contextPath }/user/delAddrs?aid=${addrs.aid}&flag=person" ><i class="am-icon-trash"></i>删除</a>
									</div>
								</li>
							</c:forEach>
							</c:if>
							
						</ul>
						<div class="clear"></div>
						<a class="new-abtn-type" data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0}">添加新地址</a>
						<!--例子-->
						<div class="am-modal am-modal-no-btn" id="doc-modal-1">

							<div class="add-dress">

								<!--标题 -->
								<div class="am-cf am-padding">
									<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add&nbsp;address</small></div>
								</div>
								<hr/>

								<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
									<form id="newAddrsForm" action="${pageContext.request.contextPath }/user/addAddress"
											 method="post"  class="am-form am-form-horizontal">
										<input type="hidden" name="redirectpath" value="person/address.jsp"/>
										<div class="am-form-group">
											<label for="user-name" class="am-form-label">收货人</label>
											<div class="am-form-content">
												<input type="text" name="receiver" id="user-name" placeholder="收货人">
											</div>
										</div>

										<div class="am-form-group">
											<label for="user-phone" class="am-form-label">手机号码</label>
											<div class="am-form-content">
												<input id="user-phone" name="telephone" placeholder="手机号必填" type="email">
											</div>
										</div>

										<div class="am-form-group">
											<label for="user-intro" class="am-form-label">详细地址</label>
											<div class="am-form-content">
												<textarea class="" rows="3" id="user-intro" name="detailAddrs" placeholder="输入详细地址"></textarea>
												<small>100字以内写出你的详细地址...</small>
											</div>
										</div>

										<div class="am-form-group">
											<div class="am-u-sm-9 am-u-sm-push-3">
												<a id="submtAddre" class="am-btn am-btn-danger">保存</a>
												<a href="javascript: void(0)" class="am-close am-btn am-btn-danger" data-am-modal-close>取消</a>
											</div>
										</div>
									</form>
								</div>

							</div>

						</div>

					</div>

					<script type="text/javascript">
						$(document).ready(function() {							
							$(".new-option-r").click(function() {
								$(this).parent('.user-addresslist').addClass("defaultAddr").siblings().removeClass("defaultAddr");
							});
							
							var $ww = $(window).width();
							if($ww>640) {
								$("#doc-modal-1").removeClass("am-modal am-modal-no-btn")
							}
							
							$("#submtAddre").click(function(){
								$("#newAddrsForm").submit();
							})
							
						});
						
					</script>

					<div class="clear"></div>
				</div>
				
				<!--底部-->
				<%@include file="/home/foot.jsp" %>
			</div>
			
			<%@include file="/person/commaside.jsp" %>			
		</div>

	</body>

</html>