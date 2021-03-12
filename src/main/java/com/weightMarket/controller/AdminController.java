package com.weightMarket.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin")
public class AdminController {

	/**
	 * Ìø×ªÖÁµÇÂ¼Ò³Ãæ
	 * @return
	 */
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login(HttpServletRequest request) {
		
		return "/admin/login";
	}
}
