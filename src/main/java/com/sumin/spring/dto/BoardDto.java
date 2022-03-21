package com.sumin.spring.dto;

import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class BoardDto {
	String boardID;
	String title;
	String writer;
	String content;
	MultipartFile file;
	String attachment;
	String createdDate;
	
	public BoardDto() {
		
	}
	
	public BoardDto(String boardID, String title, String writer, String content, MultipartFile file,
			String createdDate) {
		super();
		this.boardID = boardID;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.setFile(file);
		this.createdDate = createdDate;
	}

	public String getBoardID() {
		return boardID;
	}

	public void setBoardID(String boardID) {
		this.boardID = boardID;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		if(!file.getOriginalFilename().equals("")) 
			this.attachment = UUID.randomUUID() + "_" + file.getOriginalFilename();
		this.file = file;
	}

	public String getAttachment() {
		return attachment;
	}

	public void setAttachment(String attachment) {
		this.attachment = attachment;
	}
	
	public String getOriginalFileName() {
		if(attachment == null) 
			return null;
		else return attachment.substring(37);
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}




	
}
