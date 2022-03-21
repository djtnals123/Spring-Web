package com.sumin.spring.dto;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class Criteria {
    
    private int page; // 현재 페이지 번호
    private int perPage; // 페이지당 보여줄 게시글의 개수
    private String keyword;
    private String option;
    
    public int getPageStart() { // 현재 페이지 첫번째 게시글
        return (this.page -1) * perPage;
    }
 
    public Criteria() { // 기본값
        this.page = 1;
        this.perPage = 10;
    }
 
    // 현재 페이지 번호 page : getter, setter
    public int getPage() {
        return page;
    }
 
    public void setPage(int page) {
        if(page <= 0) {
            this.page = 1;
            
        } else {
            this.page = page;
        }    
    }
 
    
    // 페이지당 보여줄 게시글의 개수 perPage : getter, setter
    public int getPerPage() {
        return perPage;
    }
 
    public void setPerPage(int perPage) {
    	this.perPage = perPage;
        
    }
    
    public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}
	
    public String makeQueryString(int page) {
    	UriComponentsBuilder uriComponentsBuilder = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPage", perPage);
		if(keyword != null) 
			uriComponentsBuilder
				.queryParam("keyword", keyword)
				.queryParam("option", option);
		
		UriComponents uriComponents = uriComponentsBuilder.build().encode();
		return uriComponents.toUriString();
    }


	@Override
    public String toString() {
        return "Criteria [page=" + page + ", perPage=" + perPage + "]";
    }
}