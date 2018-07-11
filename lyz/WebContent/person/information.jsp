<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>个人资料</title>

		<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="../css/personal.css" rel="stylesheet" type="text/css">
		<link href="../css/infstyle.css" rel="stylesheet" type="text/css">
		<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
		<script src="../AmazeUI-2.4.2/assets/js/amazeui.js" type="text/javascript"></script>
		
		<script type="text/javascript">
		function subUserform(){
			$("#userInfoForm").submit();
		}
		$(document).ready(function(){
			$("#aa").load("commaside.jsp");
		});
		
	</script>
			
	</head>

	<body>
		<%@include file="/person/commheader.jsp" %>
            
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-info">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">个人资料</strong> / <small>Personal&nbsp;information</small></div>
						</div>
						<hr/>

						<!--头像 -->
						<div class="user-infoPic">

							<div class="filePic">
								<input type="file" class="inputPic" allowexts="gif,jpeg,jpg,png,bmp" accept="image/*">
								<img class="am-circle am-img-thumbnail" src="../images/getAvatar.do.jpg" alt="" />
							</div>

							<p class="am-form-help">头像</p>
							<div class="info-m">
								<div><b>用户名：<i>${login_user.username }</i></b></div>
								
							</div>
						</div>

						<!--个人信息 -->
						<div class="info-main">
							<form id="userInfoForm" action="${pageContext.request.contextPath }/user/resetUser" 
									method="post" class="am-form am-form-horizontal">
								<input type="hidden" name="uid" value="${login_user.uid }"/>
								<div class="am-form-group">
									<label for="user-name2" class="am-form-label">昵称</label>
									<div class="am-form-content">
										<input type="text" name="username" id="user-name2" placeholder="nickname" value="${login_user.username }" />

									</div>
								</div>

								<div class="am-form-group">
									<label for="user-name" class="am-form-label">姓名</label>
									<div class="am-form-content">
										<input type="text" name="realname" id="user-name2" placeholder="未设置" value="${login_user.name }">

									</div>
								</div>
			
								<div class="am-form-group">
									<label for="user-phone" class="am-form-label">电话</label>
									<div class="am-form-content">
										<input id="user-phone" name="phone" placeholder="未设置" type="tel" 
											<c:choose>
											   <c:when test="${login_user.telephone ==0}">
											     value=""
											   </c:when>
											   <c:otherwise>
											     value="${login_user.telephone }"
											   </c:otherwise>
											</c:choose>
										>

									</div>
								</div>
								<div class="am-form-group">
									<label for="user-email" class="am-form-label">电子邮件</label>
									<div class="am-form-content">
										<input id="user-email" name="email" placeholder="未设置" type="email" 
											<c:choose>
											   <c:when test="${login_user.email == null}">
											     value=""
											   </c:when>
											   <c:otherwise>
											     value="${login_user.email }"
											   </c:otherwise>
											</c:choose>
										  >

									</div>
								</div>
								<div class="am-form-group address">
									<label for="user-address" class="am-form-label">收货地址</label>
									<div class="am-form-content address">
										<a href="address.html">
											<p class="new-mu_l2cw">
												<span class="province">湖北</span>省
												<span class="city">武汉</span>市
												<span class="dist">洪山</span>区
												<span class="street">雄楚大道666号(中南财经政法大学)</span>
												<span class="am-icon-angle-right"></span>
											</p>
										</a>

									</div>
								</div>
								<div class="am-form-group safety">
									<label for="user-safety" class="am-form-label">账号安全</label>
									<div class="am-form-content safety">
										<a href="#">
											<span class="am-icon-angle-right"></span>
										</a>

									</div>
								</div>
								<div class="info-btn">
									<div class="am-btn am-btn-danger" onclick="subUserform()">保存修改</div>
								</div>

							</form>
						</div>

					</div>

				</div>
				<!--底部-->
				<%@include file="/home/foot.jsp" %>
			</div>
			
			<div id="aa"></div>
			<%--  <%@include file="/person/commaside.jsp" %>  --%>
		</div>
	</body>
	

</html>