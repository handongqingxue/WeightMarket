package com.weightMarket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.weightMarket.service.GetPriceUserService;
import com.weightMarket.entity.*;
import com.weightMarket.util.JsonUtil;
import com.weightMarket.util.PlanResult;
import com.weightMarket.entity.GetPriceUser;

@Controller
@RequestMapping("/phone")
public class PhoneController {

	@Autowired
	private GetPriceUserService getPriceUserService;
	
	@RequestMapping(value="/goIndex")
	public String goIndex() {
		
		return "/phone/index";
	}

	@RequestMapping(value="/goOpenTaoBaoApp")
	public String goOpenTaoBaoApp() {

		return "/phone/openTaoBaoApp";
	}
	
	@RequestMapping(value="/addGetPriceUser",produces="plain/text; charset=UTF-8")
	@ResponseBody
	public String addGetPriceUser(GetPriceUser gpu) {
		
		PlanResult plan=new PlanResult();
		String json;
		int count=getPriceUserService.add(gpu);
		if(count==0) {
			plan.setStatus(0);
			plan.setMsg("添加获取报价用户失败！");
			json=JsonUtil.getJsonFromObject(plan);
		}
		else {
			plan.setStatus(1);
			plan.setMsg("添加获取报价用户成功！");
			json=JsonUtil.getJsonFromObject(plan);
		}
		return json;
	}
}