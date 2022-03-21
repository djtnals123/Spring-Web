package com.sumin.spring.mapper;


import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.security.core.userdetails.UserDetails;

import com.sumin.spring.dto.Criteria;
import com.sumin.spring.dto.UserDto;

@Mapper
public interface AccountMapper {
	public void insert(final UserDto user);
	public UserDto selectOne(final String username);
	public ArrayList<UserDto> selectList(Criteria criteria);
	public void update(final UserDto user);
	public int count(final Criteria criteria);
}
