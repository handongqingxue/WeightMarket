package com.weightMarket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/phone")
public class PhoneController {
	
	@RequestMapping(value="/goIndex")
	public String goIndex() {
		
		System.out.println("111111111");
		return "/phone/index";
	}
}