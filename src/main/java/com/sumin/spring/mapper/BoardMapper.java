package com.sumin.spring.mapper;

import java.util.ArrayList;

import com.sumin.spring.dto.BoardDto;
import com.sumin.spring.dto.Criteria;

public interface BoardMapper {
	public void insert(final BoardDto dto);
	public ArrayList<BoardDto> selectList(final Criteria criteria);
	public BoardDto selectOne(final String boardID);
	public void delete(final String boardID);
	public void update(final BoardDto dto);
	public int count(final Criteria criteria);
	
	
	
}
