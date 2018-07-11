package com.lyz.user.constant;

public interface Constants {

	String session_login_user = "login_user";
	String session_history_prod = "session_history_prod";
	
	String category_all="category_all";
	String product_on_category="product_on_category";
	String top_sale_product = "top_sale_product";
	String top_exchange_goods = "top_exchange_goods";
	String search_kword_product = "search_kword_product";
	
	String session_shop_cart = "session_shop_cart";
	String topay_shop_cart="topay_shop_cart";
	
	String user_all_orders = "user_all_orders";
	String top_home_goods = "top_home_goods";
	String look_change_goods="look_change_goods";
	
	String upload_imgsrc_prefix="images/exchange/";
	
	//order state 
	int waitfor_send_prod=0;
	int waitfor_confirm_prod=1;
	int waitfor_commt_prod=2;
	int order_close=3;
	
	//comment level
	int good_comment_flag = 1;
	int mid_comment_flag = 2;
	int bad_comment_flag=3;
	
	//change request state
	int request_wait=0;
	int request_agree=1;
	int request_refuse=2;
	
}
