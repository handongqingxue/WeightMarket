package com.weightMarket.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.weightMarket.entity.*;
import com.weightMarket.util.JsonUtil;
import com.weightMarket.util.PlanResult;
import com.weightMarket.service.*;

@Controller
@RequestMapping("/background")
public class BackgroundController {

	@Autowired
	private UtilService utilService;
	@Autowired
	private ProductNeedService productNeedService;
	@Autowired
	private GetPriceUserService getPriceUserService;
	public static final String MODULE_NAME="/background";
	
	/**
	 * ��ת����¼ҳ��
	 * @return
	 */
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login(HttpServletRequest request) {
		
		return MODULE_NAME+"/login";
	}

	/**
	 * Ϊ��¼ҳ���ȡ��֤��
	 * @param session
	 * @param identity
	 * @param response
	 */
	@RequestMapping(value="/login/captcha")
	public void getKaptchaImageByMerchant(HttpSession session, String identity, HttpServletResponse response) {
		utilService.getKaptchaImageByMerchant(session, identity, response);
	}

	/**
	 * ��̨�û���¼
	 * @param userName
	 * @param password
	 * @param rememberMe
	 * @param loginVCode
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/login",method=RequestMethod.POST,produces="plain/text; charset=UTF-8")
	@ResponseBody
	public String login(String userName,String password,
			String rememberMe,String loginVCode,HttpServletRequest request) {
		System.out.println("===��¼�ӿ�===");
		//����ֵ��json
		PlanResult plan=new PlanResult();
		HttpSession session=request.getSession();
		String verifyCode = (String) session.getAttribute("��֤��");
		System.out.println("verifyCode==="+verifyCode);
		System.out.println("loginVCode==="+loginVCode);
		if(verifyCode.equals(loginVCode)) {
			//TODO���⸽�����ӵ�¼������Ϣ���裬���û����˺��Լ����봢�浽shiro��ܵĹ������õ��з��������ѯ
			try {
				System.out.println("��֤��һ��");
				UsernamePasswordToken token = new UsernamePasswordToken(userName,password);  
				Subject currentUser = SecurityUtils.getSubject();  
				if (!currentUser.isAuthenticated()){
					//ʹ��shiro����֤  
					token.setRememberMe(true);  
					currentUser.login(token);//��֤��ɫ��Ȩ��  
				}
			}catch (Exception e) {
				e.printStackTrace();
				plan.setStatus(1);
				plan.setMsg("��½ʧ��");
				return JsonUtil.getJsonFromObject(plan);
			}
			Admin admin=(Admin)SecurityUtils.getSubject().getPrincipal();
			session.setAttribute("admin", admin);
			
			plan.setStatus(0);
			plan.setMsg("��֤ͨ��");
			plan.setUrl("/background/sysMgr/sysSet/set");
			return JsonUtil.getJsonFromObject(plan);
		}
		plan.setStatus(1);
		plan.setMsg("��֤�����");
		return JsonUtil.getJsonFromObject(plan);
	}
	
	@RequestMapping(value="/sysMgr/sysSet/set")
	public String goSysMgrSysSetSet() {
		
		return MODULE_NAME+"/sysMgr/sysSet/set";
	}
	
	@RequestMapping(value="/fgDataMgr/productNeed/add")
	public String goFgDataMgrProductNeedAdd() {
		
		return MODULE_NAME+"/fgDataMgr/productNeed/add";
	}
	
	@RequestMapping(value="/fgDataMgr/productNeed/list")
	public String goFgDataMgrProductNeedList() {
		
		return MODULE_NAME+"/fgDataMgr/productNeed/list";
	}
	
	@RequestMapping(value="/fgDataMgr/getPriceUser/list")
	public String goFgDataMgrGetPriceUserList() {
		
		return MODULE_NAME+"/fgDataMgr/getPriceUser/list";
	}
	
	@RequestMapping(value="/selectProdNeedList")
	@ResponseBody
	public Map<String, Object> selectProdNeedList(String name,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		int count=productNeedService.selectForInt(name);
		List<ProductNeed> pnList=productNeedService.selectForList(name, page, rows, sort, order);

		jsonMap.put("total", count);
		jsonMap.put("rows", pnList);
			
		return jsonMap;
	}

	@RequestMapping(value="/addProdNeed")
	@ResponseBody
	public Map<String, Object> addProdNeed(ProductNeed pn) {

		Map<String, Object> jsonMap = new HashMap<String, Object>();
		int count=productNeedService.add(pn);
		
		if(count==0) {
			jsonMap.put("message", "no");
			jsonMap.put("info", "��������ʧ�ܣ�");
		}
		else {
			jsonMap.put("message", "ok");
			jsonMap.put("info", "��������ɹ���");
		}
		return jsonMap;
	}
	
	@RequestMapping(value="/selectGetPriceUserList")
	@ResponseBody
	public Map<String, Object> selectGetPriceUserList(String userName,String phone,String createTimeStart,String createTimeEnd,
			String pnName,Boolean deal,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		int count=getPriceUserService.selectForInt(userName,phone,createTimeStart,createTimeEnd,pnName,deal);
		List<GetPriceUser> gpuList=getPriceUserService.selectForList(userName,phone,createTimeStart,createTimeEnd,pnName,deal, page, rows, sort, order);

		jsonMap.put("total", count);
		jsonMap.put("rows", gpuList);
			
		return jsonMap;
	}
}