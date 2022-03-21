package com.sumin.spring.mapper;

import com.sumin.spring.dto.BoardDto;

public interface AttachmentMapper {
	public void insert(BoardDto dto);
	public String selectOne(String boardID);
	public void delete(final String boardID);
	
}
