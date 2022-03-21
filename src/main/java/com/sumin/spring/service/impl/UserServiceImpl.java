package com.sumin.spring.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.sumin.spring.dto.UserDto;
import com.sumin.spring.mapper.AccountMapper;
import com.sumin.spring.repository.UserRepository;
import com.sumin.spring.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository repository;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	

}