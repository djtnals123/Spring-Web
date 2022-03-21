package com.sumin.spring.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.sumin.spring.dto.CustomUserDetails;
import com.sumin.spring.dto.UserDto;
import com.sumin.spring.mapper.AccountMapper;
import com.sumin.spring.repository.UserRepository;


public class CustomUserDetailsServiceImpl implements UserDetailsService {

	@Autowired
	private UserRepository repository;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserDto users = repository.findOne(username);
		if(users == null) {
			 throw new UsernameNotFoundException("username " + username + " not found");
		}
		System.out.println("**************Found user***************");
		System.out.println("id : " + users.getId());
		return new CustomUserDetails(users);
	}

}