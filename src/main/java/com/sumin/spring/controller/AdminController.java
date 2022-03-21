package com.sumin.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sumin.spring.dto.Criteria;
import com.sumin.spring.dto.PageMaker;
import com.sumin.spring.service.AdminService;

@Secured("ROLE_ADMIN")
@RequestMapping("/admin")
@Controller
public class AdminController {
	@Autowired
	AdminService service;
	
	@GetMapping("/user_list") 
	public String list(Criteria criteria, Model model) {
        PageMaker pageMaker = new PageMaker(criteria, service.count(criteria));
        
		model.addAttribute("list", service.userList(criteria) ); 
        model.addAttribute("pageMaker", pageMaker); 
		return "admin/user_list";
	} 
}
