package com.sumin.spring.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.sumin.spring.dto.RegisterDto;
import com.sumin.spring.dto.UserDto;

public interface AccountService {
	public HashMap<String, Object> register(RegisterDto dto);
	public UserDto getUserInfo();
	public HashMap<String, Object> modify(RegisterDto dto);
}
