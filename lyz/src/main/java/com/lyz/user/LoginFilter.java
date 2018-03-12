//package com.lyz.user;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.util.ArrayList;
//import java.util.List;
//
//import javax.servlet.Filter;
//import javax.servlet.FilterChain;
//import javax.servlet.FilterConfig;
//import javax.servlet.ServletException;
//import javax.servlet.ServletRequest;
//import javax.servlet.ServletResponse;
//import javax.servlet.annotation.WebFilter;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import org.apache.log4j.Logger;
//
//import com.lyz.user.bean.User;
//
//@WebFilter(filterName="LoginFilter")
//public class LoginFilter implements Filter {
//
//	private static Logger logger = Logger.getLogger(LoginFilter.class);
//	 private String redirectURL = "";  
//	 private List<String> notCheckURLList = null;  
//	    
//	@Override
//	public void destroy() {
//		// TODO Auto-generated method stub
//		this.notCheckURLList.clear();
//	}
//
//	@Override
//	public void doFilter(ServletRequest req, ServletResponse res,
//			FilterChain chain) throws IOException, ServletException {
//		
//		
//		HttpServletRequest request = (HttpServletRequest) req;
//		HttpServletResponse response = (HttpServletResponse) res;
//		request.setCharacterEncoding("utf-8");
//		response.setContentType("text/html;charset=UTF-8");
//		HttpSession session = request.getSession();
//		
//		 String requestURI = request.getRequestURI();  
//	        for(String url : this.notCheckURLList){  
//	            if(requestURI.indexOf(url) != -1) { 
//	            	logger.info("login--"+requestURI);
//	                chain.doFilter(request, response);  
//	                return;  
//	            }  
//	        } 
//		
//		PrintWriter out = response.getWriter();
//		User user = (User)session.getAttribute("user");
//		if (user!=null) {
//			chain.doFilter(request, response);
//		}else{
////			out.println("您还未登录，三秒钟后跳转到登录页面");
//			response.sendRedirect("login.jsp");
////			response.setHeader("refresh", "3;/lyz/login.jsp");
//		}
//		
//		   
//        /** 
//         * loginKey为用户登录成功后写到session中的，在这里通过获取loginKey判断是否登录成功 
//         * 如果登录成功，则跳转到登录前浏览的页面，如果登录前是从login.jsp过来的，则不跳转 
//         */  
////        Object loginKey = session.getAttribute("loginKey");  
////        if(loginKey != null && loginKey.toString().equals("success")) {  
////            session.removeAttribute("loginKey");  
////            Object uri = session.getAttribute("requestURI");  
////            if(uri != null) {  
////                response.sendRedirect(uri.toString());  
////                return;  
////            }  
////        }  
//        /** 
//         * 判断是否是不需要执行过滤的页面，如果是则直接放行 
//         */  
////        String requestURI = request.getRequestURI();  
////        for(String url : this.notCheckURLList){  
////            if(requestURI.indexOf(url) != -1) {  
////                chain.doFilter(request, response);  
////                return;  
////            }  
////        }  
//        
//        /** 
//         * 如果用户未登录，记录目前访问的页面，并跳转到登录页面 
//         */  
////        if(session.getAttribute("user") == null) {  
////            if(requestURI.endsWith("jsp"))  
////                session.setAttribute("requestURI", requestURI);  
////            response.sendRedirect(request.getContextPath() + "/" + redirectURL);  
////            return;  
////        }   
//        chain.doFilter(request, response);  
//	}
//
//	@Override
//	public void init(FilterConfig filterConfig) throws ServletException {
//		// TODO Auto-generated method stub
//		 //初始化配置的参数  
//        redirectURL = filterConfig.getInitParameter("redirectURL");  
//        String notCheckURLStr = filterConfig.getInitParameter("notCheckURLList");  
//        if(notCheckURLStr != null) {  
//            notCheckURLList = new ArrayList<String>();  
//            notCheckURLList.clear();  
//            String[] urls = notCheckURLStr.split(",");  
//            for (String url : urls) {  
//                notCheckURLList.add(url);  
//            }  
//        }  
//	}
//
//	
//
//}
