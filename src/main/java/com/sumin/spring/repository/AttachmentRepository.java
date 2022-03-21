package com.sumin.spring.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sumin.spring.dto.BoardDto;
import com.sumin.spring.mapper.AttachmentMapper;

@Repository
public class AttachmentRepository {
	
	@Autowired
	AttachmentMapper mapper;
	
	public void save(BoardDto dto) {
		mapper.insert(dto);
	}
	
	public String findOne(String boardID) {
		return mapper.selectOne(boardID);
	}

	public void delete(String boardID) {
		mapper.delete(boardID);
	}
}