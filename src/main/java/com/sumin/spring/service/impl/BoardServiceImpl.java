package com.sumin.spring.service.impl;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;

import com.sumin.spring.dto.BoardDto;
import com.sumin.spring.dto.Criteria;
import com.sumin.spring.repository.AttachmentRepository;
import com.sumin.spring.repository.BoardRepository;
import com.sumin.spring.service.BoardService;
import com.sumin.spring.util.DateFormatter;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardRepository boardRepository;
	@Autowired
	private AttachmentRepository AttachmentRepository;
	@Autowired
	private DateFormatter dateFormatter;

	private final String FILE_PATH = "D:\\upload";

	@Override
	public List<BoardDto> list(Criteria criteria) {
		List<BoardDto> list = boardRepository.findList(criteria);
		for (BoardDto board : list) {
			System.out.println(board.getCreatedDate());
			String newDate = dateFormatter.changeFormat(board.getCreatedDate(), "yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd");
			board.setCreatedDate(newDate);
		}
		return list;
	}

	@Override
	public int count(Criteria criteria) {
		return boardRepository.count(criteria);
	}

	@Override
	public BoardDto read(String boardID) {
		BoardDto dto = boardRepository.findOne(boardID);
		String attachment = AttachmentRepository.findOne(dto.getBoardID());
		dto.setAttachment(attachment);
		return dto;
	}

	@Override
	public void delete(String boardID) {
		String userID = SecurityContextHolder.getContext().getAuthentication().getName();
		BoardDto boardDto = read(boardID);
		if(boardDto.getWriter().equals(userID)) 
			boardRepository.delete(boardID);
	}
	
	@Transactional
	@Override
	public HashMap<String, Object> write(BoardDto dto) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		String userID = SecurityContextHolder.getContext().getAuthentication().getName();
		dto.setWriter(userID);
		boardRepository.save(dto);
		if(upload(dto)) 
			result.put("isSuccess", true);
		else {
			result.put("isSuccess", false);
			result.put("msg", "파일업로드 에러");
		}
		return result;
	}
	
	@Override
	public BoardDto getModify(String boardID) {
		String userID = SecurityContextHolder.getContext().getAuthentication().getName();
		BoardDto boardDto = read(boardID);
		if(boardDto.getWriter().equals(userID)) 
			return boardDto;
		else return null;
	}
	@Transactional
	@Override
	public HashMap<String, Object> modify(BoardDto dto) {
		String userID = SecurityContextHolder.getContext().getAuthentication().getName();
		String writer = boardRepository.findOne(dto.getBoardID()).getWriter();
		HashMap<String, Object> result = new HashMap<String, Object>();
		if(userID.equals(writer)) {
			boardRepository.modify(dto);
			if(upload(dto)) 
				result.put("isSuccess", true);
			else {
				result.put("isSuccess", false);
				result.put("msg", "파일업로드 에러");
			}
		} 
		else {
			result = new HashMap<String, Object>();
			result.put("isSuccess", false);
			result.put("msg", "작성자만 수정할 수 있습니다.");
		}
		
		return result;
	}

	@Override
	public byte[] download(HttpServletRequest request, HttpServletResponse response, String filename) throws IOException {
		File file = new File(FILE_PATH, filename);
		byte[] bytes = FileCopyUtils.copyToByteArray(file);
		String browser = getBrowser(request);
		String uuidRemovedFilename = filename.substring(37);
		String encodedFilename = encodingFilename(browser, uuidRemovedFilename);
		
		response.setHeader("Content-Disposition", "attachment; filename=" + encodedFilename);
		if ("Opera".equals(browser)) 
			response.setContentType("application/octet-stream;charset=UTF-8");
		return bytes;
	}
	
	private String encodingFilename(String browser, String filename) throws IOException {
		String encodedFilename = null;
		if (browser.equals("MSIE")) {
			encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
		} else if (browser.equals("Trident")) { // IE11 문자열 깨짐 방지
			encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
		} else if (browser.equals("Firefox")) {
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
			encodedFilename = URLDecoder.decode(encodedFilename);
		} else if (browser.equals("Opera")) {
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Chrome")) {
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < filename.length(); i++) {
				char c = filename.charAt(i);
				if (c > '~') {
					sb.append(URLEncoder.encode("" + c, "UTF-8"));
				} else {
					sb.append(c);
				}
			}
			encodedFilename = sb.toString();
		} else if (browser.equals("Safari")) {
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
			encodedFilename = URLDecoder.decode(encodedFilename);
		} else {
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		}
		return encodedFilename;
	}

	private String getBrowser(HttpServletRequest request) {
		String header = request.getHeader("User-Agent");
		if (header.indexOf("MSIE") > -1) {
			return "MSIE";
		} else if (header.indexOf("Trident") > -1) { // IE11 문자열 깨짐 방지
			return "Trident";
		} else if (header.indexOf("Chrome") > -1) {
			return "Chrome";
		} else if (header.indexOf("Opera") > -1) {
			return "Opera";
		} else if (header.indexOf("Safari") > -1) {
			return "Safari";
		}
		return "Firefox";
	}



	private boolean upload(BoardDto dto) {
		boolean isSuccess = true;
		if (dto.getAttachment() != null) {
			try {
				File saveFile = new File(FILE_PATH, dto.getAttachment());
				dto.getFile().transferTo(saveFile);
				AttachmentRepository.delete(dto.getBoardID());
				AttachmentRepository.save(dto);
			} catch (Exception e) {
				e.printStackTrace();
				isSuccess = false;
			}
		}
		return isSuccess;
	}





}
