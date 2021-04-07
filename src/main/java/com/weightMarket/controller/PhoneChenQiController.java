package com.weightMarket.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.weightMarket.entity.*;
import com.weightMarket.service.*;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/phone/chenQi")
public class PhoneChenQiController {

	@Autowired
	private GetPriceUserService getPriceUserService;
	@Autowired
	private ProductNeedService productNeedService;
	@Autowired
	private SystemInfoService systemInfoService;
	@Autowired
	private ExampleShowService exampleShowService;
	
	@RequestMapping(value="/addGetPriceUser")
	@ResponseBody
	public void addGetPriceUser(GetPriceUser gpu,HttpServletResponse response) {

		String jsonpCallback=null;
        try {
			gpu.setUserName(new String(gpu.getUserName().getBytes("ISO-8859-1"),"UTF-8"));
			int count=getPriceUserService.add(gpu);
			if(count==0) {
		        jsonpCallback="jsonpCallback(\"{\\\"status\\\":0,\\\"msg\\\":\\\"获取报价失败！\\\"}\")";
			}
			else {
		        jsonpCallback="jsonpCallback(\"{\\\"status\\\":1,\\\"msg\\\":\\\"获取报价成功，请等待客服电话回复！\\\"}\")";
			}
			ajaxResponse(response,jsonpCallback);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/selectGetPriceUserList")
	@ResponseBody
	public void selectGetPriceUserList(Boolean deal,HttpServletResponse response) {

		String jsonpCallback=null;
		List<GetPriceUser> gpuList=getPriceUserService.selectList(deal);
		
		if(gpuList.size()==0) {
	        jsonpCallback="jsonpCallback(\"{\\\"message\\\":\\\"no\\\",\\\"info\\\":\\\"暂无报价用户\\\"}\")";
		}
		else {
			String gpuListStr=JSONArray.fromObject(gpuList).toString().replaceAll("\"", "\\\\\"");
	        jsonpCallback="jsonpCallback(\"{\\\"message\\\":\\\"ok\\\",\\\"data\\\":"+gpuListStr+"}\")";
		}

		ajaxResponse(response,jsonpCallback);
	}

	@RequestMapping(value="/selectProdNeedList")
	@ResponseBody
	public void selectProdNeedList(HttpServletResponse response) {

		String jsonpCallback=null;
		List<ProductNeed> pnList=productNeedService.selectList();
		
		if(pnList.size()==0) {
	        jsonpCallback="jsonpCallback(\"{\\\"message\\\":\\\"no\\\",\\\"info\\\":\\\"暂无产品需求\\\"}\")";
		}
		else {
			String pnListStr=JSONArray.fromObject(pnList).toString().replaceAll("\"", "\\\\\"");
	        jsonpCallback="jsonpCallback(\"{\\\"message\\\":\\\"ok\\\",\\\"data\\\":"+pnListStr+"}\")";
		}

		ajaxResponse(response,jsonpCallback);
	}

	@RequestMapping(value="/selectExampleShowList")
	@ResponseBody
	public void selectExampleShowList(HttpServletResponse response) {

		String jsonpCallback=null;
		List<ExampleShow> esList=exampleShowService.selectList();
		
		if(esList.size()==0) {
	        jsonpCallback="jsonpCallback(\"{\\\"message\\\":\\\"no\\\",\\\"info\\\":\\\"暂无案例展示\\\"}\")";
		}
		else {
			String esListStr=JSONArray.fromObject(esList).toString().replaceAll("\"", "\\\\\"");
	        jsonpCallback="jsonpCallback(\"{\\\"message\\\":\\\"ok\\\",\\\"data\\\":"+esListStr+"}\")";
		}

		ajaxResponse(response,jsonpCallback);
	}

	@RequestMapping(value="/getSystemInfo")
	@ResponseBody
	public void getSystemInfo(HttpServletResponse response) {

		String jsonpCallback=null;
		SystemInfo systemInfo = systemInfoService.get();
		
		if(systemInfo==null) {
	        jsonpCallback="jsonpCallback(\"{\\\"message\\\":\\\"no\\\",\\\"info\\\":\\\"暂无信息\\\"}\")";
		}
		else {
			systemInfo.setYszc("");
			String siStr=JSONObject.fromObject(systemInfo).toString().replaceAll("\"", "\\\\\"");
	        jsonpCallback="jsonpCallback(\"{\\\"message\\\":\\\"ok\\\",\\\"systemInfo\\\":"+siStr+"}\")";
		}

		ajaxResponse(response,jsonpCallback);
	}

	@RequestMapping(value="/getSecretPolicy")
	@ResponseBody
	public void getSecretPolicy(HttpServletResponse response) {
		
		String yszc = systemInfoService.get().getYszc().replaceAll("\"", "\\\\\\\\\\\\\"");
		String jsonpCallback="jsonpCallback(\"{\\\"yszc\\\":\\\""+yszc+"\\\"}\")";

		ajaxResponse(response,jsonpCallback);
	}
	
	/**
	 * 调用ajax返回
	 * @param response
	 * @param jsonpCallback
	 */
	public void ajaxResponse(HttpServletResponse response,String jsonpCallback) {
		try {
			response.getWriter().print(jsonpCallback);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
