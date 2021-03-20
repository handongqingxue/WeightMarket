package com.weightMarket.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.weightMarket.service.*;
import com.weightMarket.entity.*;
import com.weightMarket.util.JsonUtil;
import com.weightMarket.util.PlanResult;

@Controller
@RequestMapping("/phone")
public class PhoneController {

	@Autowired
	private GetPriceUserService getPriceUserService;
	@Autowired
	private ProductNeedService productNeedService;
	@Autowired
	private SystemInfoService systemInfoService;
	@Autowired
	private ExampleShowService exampleShowService;
	
	@RequestMapping(value="/goIndex")
	public String goIndex() {
		
		return "/phone/index";
	}

	@RequestMapping(value="/goSecretPolicy")
	public String goSecretPolicy(HttpServletRequest request) {
		
		String yszc = systemInfoService.get().getYszc();
		request.setAttribute("yszc", yszc);
		
		return "/phone/secretPolicy";
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
			plan.setMsg("获取报价失败！");
			json=JsonUtil.getJsonFromObject(plan);
		}
		else {
			plan.setStatus(1);
			plan.setMsg("获取报价成功，请等待客服电话回复！");
			json=JsonUtil.getJsonFromObject(plan);
		}
		return json;
	}
	
	@RequestMapping(value="/selectGetPriceUserList")
	@ResponseBody
	public Map<String, Object> selectGetPriceUserList(Boolean deal) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		List<GetPriceUser> gpuList=getPriceUserService.selectList(deal);
		
		if(gpuList.size()==0) {
			jsonMap.put("message", "no");
			jsonMap.put("info", "暂无报价用户");
		}
		else {
			jsonMap.put("message", "ok");
			jsonMap.put("data", gpuList);
		}
		return jsonMap;
	}

	@RequestMapping(value="/selectProdNeedList")
	@ResponseBody
	public Map<String, Object> selectProdNeedList() {

		Map<String, Object> jsonMap = new HashMap<String, Object>();
		List<ProductNeed> pnList=productNeedService.selectList();
		
		if(pnList.size()==0) {
			jsonMap.put("message", "no");
			jsonMap.put("info", "暂无产品需求");
		}
		else {
			jsonMap.put("message", "ok");
			jsonMap.put("data", pnList);
		}
		return jsonMap;
	}

	@RequestMapping(value="/selectExampleShowList")
	@ResponseBody
	public Map<String, Object> selectExampleShowList() {

		Map<String, Object> jsonMap = new HashMap<String, Object>();
		List<ExampleShow> esList=exampleShowService.selectList();
		
		if(esList.size()==0) {
			jsonMap.put("message", "no");
			jsonMap.put("info", "暂无案例展示");
		}
		else {
			jsonMap.put("message", "ok");
			jsonMap.put("data", esList);
		}
		return jsonMap;
	}

	@RequestMapping(value="/getSystemInfo")
	@ResponseBody
	public Map<String, Object> getSystemInfo() {

		Map<String, Object> jsonMap = new HashMap<String, Object>();
		SystemInfo systemInfo = systemInfoService.get();
		
		if(systemInfo==null) {
			jsonMap.put("message", "no");
			jsonMap.put("info", "暂无信息");
		}
		else {
			jsonMap.put("message", "ok");
			jsonMap.put("systemInfo", systemInfo);
		}
		return jsonMap;
	}
}