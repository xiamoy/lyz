package com.lyz.user.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.lyz.user.bean.ExGoods;
import com.lyz.user.bean.ExRequest;
import com.lyz.user.bean.User;
import com.lyz.user.constant.Constants;
import com.lyz.user.service.ExGoodsService;
import com.lyz.user.service.ExRequestService;

@Controller
@RequestMapping("/goods")
public class GoodsController {
	
	private final Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private ExGoodsService mExGoodsService;
	
	@Autowired
	private ExRequestService mExRequestService;
	
	@RequestMapping("/goodsInfo")
	private ModelAndView showGoodsInfo(@RequestParam("cgid")int cgid ,HttpServletRequest request){
		
		ModelAndView mav = new ModelAndView("home/cgoodsinfo");
		ExGoods exGoods = mExGoodsService.findGoodsById(cgid);
		logger.info("goods info:"+exGoods);
		
		mav.addObject("goods", exGoods);
		return mav;
	}
	
	
	@RequestMapping("/addGoods")
	private String addChangeGoods(@RequestParam("cgid")int cgid ,HttpServletRequest request){
		User user = (User) request.getSession().getAttribute(Constants.session_login_user);

		ExGoods lookGoods = mExGoodsService.findGoodsById(cgid);
		
		logger.info("look exgoods:"+lookGoods);
		List<ExGoods> changeGoods = getChangeGoods(request);
		changeGoods.add(lookGoods);
		return "redirect:/user/allExGoods?cgid="+cgid+"&uid="+user.getUid();
	}
	
	@RequestMapping("/deleRequest")
	private String deletRequest(@RequestParam("crid")String crid, HttpServletRequest request){
		//if state is agreed
		ExRequest exRequest = mExRequestService.findRequestById(crid);
//		if (exRequest.getState()==Constants.request_agree) {
//			//change goods owner 
//			ExGoods srcGoods = exRequest.getSrcGoods();
//			ExGoods destGoods = exRequest.getDestGoods();
//			User srcUser =srcGoods.getUser();
//			User desUser = destGoods.getUser();
//			srcGoods.setUser(desUser);
//			destGoods.setUser(srcUser);
//			mExGoodsService.updateGoods(srcGoods);
//			mExGoodsService.updateGoods(destGoods);
//		}
		mExRequestService.deleteRequest(crid);
		return "redirect:/user/allRequests";	
	}
	
	@RequestMapping("/agreeRequest")
	private String agreeRequest(@RequestParam("crid")String crid){
		ExRequest exRequest = mExRequestService.findRequestById(crid);
		exRequest.setState(Constants.request_agree);
		mExRequestService.updateRequest(exRequest);
		return "redirect:/user/allRequests";
	}
	
	@RequestMapping("/refuseRequest")
	private String refuseRequest(@RequestParam("crid")String crid){
		ExRequest exRequest = mExRequestService.findRequestById(crid);
		exRequest.setState(Constants.request_refuse);
		mExRequestService.updateRequest(exRequest);
		return "redirect:/user/allRequests";
	}
	
	@RequestMapping("/addNewGoods")
	private String addNewExGoods(HttpServletRequest request,HttpServletResponse response){
		String gname = request.getParameter("gname");
		double price = Double.parseDouble(request.getParameter("price"));
		String imgsrc = request.getParameter("imgpath");
		String desc = request.getParameter("desc");
		
		logger.info("new goods:"+gname+","+price+","+imgsrc+","+desc);
		User user = (User)request.getSession().getAttribute(Constants.session_login_user);
		
		ExGoods exGoods = new ExGoods();
		exGoods.setGname(gname);
		exGoods.setGdesc(desc);
		exGoods.setPrice(price);
		exGoods.setUser(user);
		exGoods.setGimage(Constants.upload_imgsrc_prefix+imgsrc);
		
		mExGoodsService.addNewGoods(exGoods);
		return "redirect:/user/allUserGoods";
	}
	
	@RequestMapping("/deleteGoods")
	private String deleteGoods(@RequestParam("cgid")int cgid){
		mExGoodsService.deleteGoodsById(cgid);
		return "redirect:/user/allUserGoods";
	}
	
	
	private List<ExGoods> getChangeGoods(HttpServletRequest request){
		@SuppressWarnings("unchecked")
		List<ExGoods> changGoods = (List<ExGoods>) request.getSession().getAttribute(Constants.look_change_goods);
		if (changGoods==null) {
			changGoods = new ArrayList<>();
			request.getSession().setAttribute(Constants.look_change_goods, changGoods);
		}
		return changGoods;
		
	}
	
}
