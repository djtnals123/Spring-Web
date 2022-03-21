package com.sumin.spring.repository;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sumin.spring.dto.Criteria;
import com.sumin.spring.dto.UserDto;
import com.sumin.spring.mapper.AccountMapper;

@Repository
public class UserRepository {
	
	@Autowired
	AccountMapper mapper;

	public UserDto findOne(String username) {
		return mapper.selectOne(username);
	}
	
	public void save(UserDto userInfo) {
		mapper.insert(userInfo);
	}
	
	public ArrayList<UserDto> findList(Criteria criteria) {
		return mapper.selectList(criteria);
	}
	
	public void modify(UserDto user) {
		mapper.update(user);
	}
	
	public int count(Criteria criteria) {
		return mapper.count(criteria);
	}
}