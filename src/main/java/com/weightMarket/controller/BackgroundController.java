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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.weightMarket.util.FileUploadUtils;
import com.weightMarket.entity.*;
import com.weightMarket.util.JsonUtil;
import com.weightMarket.util.PlanResult;

import net.sf.json.JSONObject;

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
	@Autowired
	private ProductTypeUserService productTypeUserService;
	@Autowired
	private ExampleShowService exampleShowService;
	@Autowired
	private SystemInfoService systemInfoService;
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
			//TODO���⸽����ӵ�¼������Ϣ���裬���û����˺��Լ����봢�浽shiro��ܵĹ������õ��з��������ѯ
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
	public String goSysMgrSysSetSet(HttpServletRequest request) {
		
		SystemInfo systemInfo=systemInfoService.get();
		request.setAttribute("systemInfo", systemInfo);
		
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
	
	@RequestMapping(value="/fgDataMgr/exampleShow/add")
	public String goFgDataMgrExampleShowAdd() {
		
		return MODULE_NAME+"/fgDataMgr/exampleShow/add";
	}
	
	@RequestMapping(value="/fgDataMgr/exampleShow/edit")
	public String goFgDataMgrExampleShowEdit(HttpServletRequest request) {

		String id = request.getParameter("id");
		ExampleShow exampleShow=exampleShowService.getById(id);
		request.setAttribute("exampleShow", exampleShow);
		
		return MODULE_NAME+"/fgDataMgr/exampleShow/edit";
	}
	
	@RequestMapping(value="/fgDataMgr/exampleShow/list")
	public String goFgDataMgrExampleShowList() {
		
		return MODULE_NAME+"/fgDataMgr/exampleShow/list";
	}
	
	@RequestMapping(value="/fgDataMgr/exampleShow/detail")
	public String goFgDataMgrExampleShowDetail(HttpServletRequest request) {

		String id = request.getParameter("id");
		ExampleShow exampleShow=exampleShowService.getById(id);
		request.setAttribute("exampleShow", exampleShow);
		
		return MODULE_NAME+"/fgDataMgr/exampleShow/detail";
	}
	
	@RequestMapping(value="/fgDataMgr/productTypeUser/list")
	public String goFgDataMgrProductTypeUserList() {
		
		return MODULE_NAME+"/fgDataMgr/productTypeUser/list";
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

	@RequestMapping(value="/editSystemInfo")
	@ResponseBody
	public Map<String, Object> editSystemInfo(SystemInfo si) {

		Map<String, Object> jsonMap = new HashMap<String, Object>();
		int count=systemInfoService.edit(si);
		
		if(count==0) {
			jsonMap.put("message", "no");
			jsonMap.put("info", "�༭����ʧ�ܣ�");
		}
		else {
			jsonMap.put("message", "ok");
			jsonMap.put("info", "�༭���óɹ���");
		}
		return jsonMap;
	}

	@RequestMapping(value="/addProdNeed")
	@ResponseBody
	public Map<String, Object> addProdNeed(ProductNeed pn) {

		Map<String, Object> jsonMap = new HashMap<String, Object>();
		int count=productNeedService.add(pn);
		
		if(count==0) {
			jsonMap.put("message", "no");
			jsonMap.put("info", "�������ʧ�ܣ�");
		}
		else {
			jsonMap.put("message", "ok");
			jsonMap.put("info", "�������ɹ���");
		}
		return jsonMap;
	}

	@RequestMapping(value="/addExampleShow")
	@ResponseBody
	public Map<String, Object> addExampleShow(ExampleShow es,
			@RequestParam(value="imgUrl_file",required=false) MultipartFile imgUrl_file) {

		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			MultipartFile[] fileArr=new MultipartFile[1];
			fileArr[0]=imgUrl_file;
			for (int i = 0; i < fileArr.length; i++) {
				String jsonStr = null;
				if(fileArr[i].getSize()>0) {
					String folder=null;
					switch (i) {
					case 0:
						folder="ExampleShow";
						break;
					}
					jsonStr = FileUploadUtils.appUploadContentImg(fileArr[i],folder);
					JSONObject fileJson = JSONObject.fromObject(jsonStr);
					if("�ɹ�".equals(fileJson.get("msg"))) {
						JSONObject dataJO = (JSONObject)fileJson.get("data");
						switch (i) {
						case 0:
							es.setImgUrl(dataJO.get("src").toString());
							break;
						}
					}
				}
			}
			int count=exampleShowService.add(es);
			
			if(count==0) {
				jsonMap.put("message", "no");
				jsonMap.put("info", "��Ӱ���ʧ�ܣ�");
			}
			else {
				jsonMap.put("message", "ok");
				jsonMap.put("info", "��Ӱ����ɹ���");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jsonMap;
	}

	@RequestMapping(value="/editExampleShow")
	@ResponseBody
	public Map<String, Object> editExampleShow(ExampleShow es,
			@RequestParam(value="imgUrl_file",required=false) MultipartFile imgUrl_file) {

		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			MultipartFile[] fileArr=new MultipartFile[1];
			fileArr[0]=imgUrl_file;
			for (int i = 0; i < fileArr.length; i++) {
				String jsonStr = null;
				if(fileArr[i].getSize()>0) {
					String folder=null;
					switch (i) {
					case 0:
						folder="ExampleShow";
						break;
					}
					jsonStr = FileUploadUtils.appUploadContentImg(fileArr[i],folder);
					JSONObject fileJson = JSONObject.fromObject(jsonStr);
					if("�ɹ�".equals(fileJson.get("msg"))) {
						JSONObject dataJO = (JSONObject)fileJson.get("data");
						switch (i) {
						case 0:
							es.setImgUrl(dataJO.get("src").toString());
							break;
						}
					}
				}
			}
			int count=exampleShowService.edit(es);
			
			if(count==0) {
				jsonMap.put("message", "no");
				jsonMap.put("info", "�༭����ʧ�ܣ�");
			}
			else {
				jsonMap.put("message", "ok");
				jsonMap.put("info", "�༭�����ɹ���");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
	
	@RequestMapping(value="/selectProductTypeUserList")
	@ResponseBody
	public Map<String, Object> selectProductTypeUserList(String userName,String phone,String createTimeStart,String createTimeEnd,
			Boolean deal,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		int count=productTypeUserService.selectForInt(userName,phone,createTimeStart,createTimeEnd,deal);
		List<ProductTypeUser> ptuList=productTypeUserService.selectForList(userName,phone,createTimeStart,createTimeEnd,deal, page, rows, sort, order);

		jsonMap.put("total", count);
		jsonMap.put("rows", ptuList);
			
		return jsonMap;
	}
	
	@RequestMapping(value="/selectExampleShowList")
	@ResponseBody
	public Map<String, Object> selectExampleShowList(String name,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		int count=exampleShowService.selectForInt(name);
		List<ExampleShow> esList=exampleShowService.selectForList(name, page, rows, sort, order);

		jsonMap.put("total", count);
		jsonMap.put("rows", esList);
			
		return jsonMap;
	}
}
