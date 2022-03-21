package com.sumin.spring.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sumin.spring.dto.RegisterDto;
import com.sumin.spring.dto.UserDto;
import com.sumin.spring.service.AccountService;

@RequestMapping("/account")
@Controller
public class AccountController {
	@Autowired
	AccountService service;

	@PreAuthorize("isAnonymous()")
	@GetMapping("/register") 
	public String register(@ModelAttribute("agree") String agree) {
        if(agree.equals("on")) 
        	return "account/join_form";
        else return "redirect:/account/agree";
	} 
	
	@PreAuthorize("isAnonymous()")
	@PostMapping("/register") 
	@ResponseBody
	public HashMap <String, Object> register(RegisterDto dto) {
		System.out.println(dto.getName());
		
		return service.register(dto);
	} 

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/modify") 
	public String modify(HttpServletRequest request) {
		UserDto dto = service.getUserInfo();
		System.out.println(dto.getId());
		request.setAttribute("user", dto);
		return "account/join_form";
	} 	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/modify") 
	@ResponseBody
	public HashMap <String, Object> modify(RegisterDto dto) {
		System.out.println(dto.getEmail());
		return service.modify(dto);
	} 

	@PreAuthorize("isAnonymous()")
	@GetMapping("/agree") 
	public void agree() { 
	} 	
	@PreAuthorize("isAnonymous()")
	@PostMapping("/agree") 
	public String agree(@ModelAttribute("agree") String agree, RedirectAttributes rda) { 
		if(agree.equals("on")) {
			rda.addFlashAttribute("agree", agree);
			return "redirect:/account/register";
		}
		else return "account/agree";
	} 

}
