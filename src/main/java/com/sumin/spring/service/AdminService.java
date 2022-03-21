package com.sumin.spring.service;

import java.util.List;

import com.sumin.spring.dto.Criteria;
import com.sumin.spring.dto.UserDto;

public interface AdminService {
	public List<UserDto> userList(Criteria criteria);
	public int count(Criteria criteria);
}
