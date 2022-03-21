package com.sumin.spring.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sumin.spring.dto.Criteria;
import com.sumin.spring.dto.UserDto;
import com.sumin.spring.repository.UserRepository;
import com.sumin.spring.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private UserRepository repository;

	@Override
	public List<UserDto> userList(Criteria criteria) {
		return repository.findList(criteria);
	}

	@Override
	public int count(Criteria criteria) {
		return repository.count(criteria);
	}

}
