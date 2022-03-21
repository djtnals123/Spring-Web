package com.sumin.spring.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;

import com.sumin.spring.dto.BoardDto;
import com.sumin.spring.dto.Criteria;

public interface BoardService {
	public List<BoardDto> list(Criteria criteria);
	public int count(Criteria criteria);
	public BoardDto read(String boardID);
	public void delete(String boardID);
	public HashMap<String, Object> write(BoardDto dto);
	public BoardDto getModify(String boardID);
	public HashMap<String, Object> modify(BoardDto dto);
	public byte[] download(HttpServletRequest request, HttpServletResponse response, String filename) throws IOException;
}
