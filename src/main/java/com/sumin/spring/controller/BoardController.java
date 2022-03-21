package com.sumin.spring.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sumin.spring.dto.BoardDto;
import com.sumin.spring.dto.Criteria;
import com.sumin.spring.dto.PageMaker;
import com.sumin.spring.service.BoardService;

@Secured({"ROLE_DOCTOR", "ROLE_ADMIN"})
@RequestMapping("/board")
@Controller
public class BoardController {

	@Autowired
	BoardService service;

	@GetMapping("/list") 
	public String list(Criteria criteria, Model model) {
        
        // 페이징 객체
        PageMaker pageMaker = new PageMaker(criteria, service.count(criteria));
        
        model.addAttribute("list", service.list(criteria));    
        model.addAttribute("pageMaker", pageMaker); 

		return "board/board_list";
	} 

	@GetMapping("/read") 
	public String read(@ModelAttribute("bid") String boardID, Model model) {
		model.addAttribute("board", service.read(boardID) );
		return "board/board_read";
	} 

	@GetMapping("/delete")
	public String delete(@ModelAttribute("bid") String boardID, Model model) {
		service.delete(boardID); //뷰 권한설정하기
		model.asMap().clear();
		return "redirect:/board/list";
	}

	@GetMapping("/write") 
	public String write() { 
		return "board/board_write";
	} 

	@PostMapping("/write") 
	@ResponseBody
	public HashMap <String, Object> write(BoardDto dto) {
		System.out.println(dto.getFile().getOriginalFilename());
		return service.write(dto);
	} 

	@GetMapping("/modify") 
	public String modify(@ModelAttribute("bid") String boardID, Model model) { 
		BoardDto dto = service.getModify(boardID);
		if(dto == null) 
			return "board/board_list";
		else {
			model.addAttribute("board", dto);
			return "board/board_write"; //bid
		}
	} 

	@PostMapping("/modify") 
	@ResponseBody
	public HashMap<String, Object> modify(BoardDto dto) {
		System.out.println(dto.getBoardID());
		return service.modify(dto); //
	} 

	@GetMapping("/download")
	@ResponseBody
	public byte[] downlod(HttpServletRequest request, HttpServletResponse response, @RequestParam String filename) throws IOException{
		return service.download(request, response, filename);
	}
}
