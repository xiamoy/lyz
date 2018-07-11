<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- <script type="text/javascript">
$(".menu ul li.person ul li a").each(function(){
	 $(this).click(function(){
		 $(".menu ul li.person ul li.active").removeClass("active");
		$(this).parent().addClass("active"); 
	 });
});
</script> -->

<aside class="menu">
	<ul>
		<li class="person "><a href="${pageContext.request.contextPath }/user/personInfo">个人中心</a></li>
		<li class="person "><a class="catgry" href="javascript:;">个人资料</a>
			<ul>
				<li ><a  href="${pageContext.request.contextPath }/person/information.jsp">个人信息</a></li>
				<li><a href="${pageContext.request.contextPath }/person/safety.jsp">安全设置</a></li>
				<li><a href="${pageContext.request.contextPath }/person/address.jsp">收货地址</a></li>
			</ul>
		</li>
		<li class="person "><a class="catgry" href="javascript:;">我的交易</a>
			<ul>
				<li><a href="${pageContext.request.contextPath }/order/allOrders">订单管理</a></li>
				<li><a href="${pageContext.request.contextPath }/user/allRequests">换购请求</a></li>
			</ul>
		</li>

		<li class="person"><a class="catgry" href="javascript:;">我的喜好</a>
			<ul>
				<%-- <li><a href="${pageContext.request.contextPath }/person/collection.jsp">收藏</a></li> --%>
				<li><a href="${pageContext.request.contextPath }/user/allUserGoods">换购商品</a></li>				
				<li><a href="${pageContext.request.contextPath }/person/footprint.jsp">足迹</a></li>
				<li><a href="${pageContext.request.contextPath }/user/allComments?uid=${login_user.uid}">评价</a></li>
				
			</ul>
		</li>
	</ul>

</aside>