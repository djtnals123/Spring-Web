package com.sumin.spring.repository;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sumin.spring.dto.BoardDto;
import com.sumin.spring.dto.Criteria;
import com.sumin.spring.mapper.BoardMapper;

@Repository
public class BoardRepository {
	
	@Autowired
	BoardMapper mapper;

	public ArrayList<BoardDto> findList(Criteria criteria) {
		return mapper.selectList(criteria);
	}
	
	public BoardDto findOne(String boardID) {
		return mapper.selectOne(boardID);
	}
	
	public void save(BoardDto dto) {
		mapper.insert(dto);
	}
	
	public void delete(String boardID) {
		mapper.delete(boardID);
	}
	
	public void modify(BoardDto dto) {
		mapper.update(dto);
	}
	
	public int count(Criteria criteria) {
		return mapper.count(criteria);
	}
}