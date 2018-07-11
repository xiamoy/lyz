<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>安全设置</title>

		<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="../css/personal.css" rel="stylesheet" type="text/css">
		<link href="../css/infstyle.css" rel="stylesheet" type="text/css">
		
		<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
		<script type="text/javascript">
			
		</script>
	</head>

	<body>
		<!--头 -->
		<%@include file="/person/commheader.jsp" %>

		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<!--标题 -->
					<div class="user-safety">
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">账户安全</strong> / <small>Set&nbsp;up&nbsp;Safety</small></div>
						</div>
						<hr/>

						<!--头像 -->
						<div class="user-infoPic">

							<div class="filePic">
								<img class="am-circle am-img-thumbnail" src="../images/getAvatar.do.jpg" alt="" />
							</div>

							<p class="am-form-help">头像</p>

							<div class="info-m">
								<div><b>用户名：<i>${login_user.username }</i></b></div>
							</div>
						</div>

						<div class="check">
							<ul>
								<li>
									<i class="i-safety-lock"></i>
									<div class="m-left">
										<div class="fore1">登录密码</div>
										<div class="fore2"><small>为保证您购物安全，建议您定期更改密码以保护账户安全。</small></div>
									</div>
									<div class="fore3">
										<a href="${pageContext.request.contextPath }/person/password.jsp">
											<div class="am-btn am-btn-secondary">修改</div>
										</a>
									</div>
								</li>
							</ul>
						</div>

					</div>
				</div>
				<!--底部-->
				<%@include file="/home/foot.jsp" %>				
			</div>

			 <%@include file="/person/commaside.jsp" %> 
			
		</div>

	</body>

</html>