package com.sumin.spring.dto;

public class RegisterDto {
	String id;
	String pw;
	String confirm_pw;
	String email;
	String name;
	String hospital;
	String[] roles;
	
	public RegisterDto(String id, String pw, String confirm_pw, String email, String name, String hospital,
			String[] roles) {
		this.id = id;
		this.pw = pw;
		this.confirm_pw = confirm_pw;
		this.email = email;
		this.name = name;
		this.hospital = hospital;
		this.roles = roles;
	}
	public String getId() {
		return id;
	}
	public String getPw() {
		return pw;
	}
	public String getConfirm_pw() {
		return confirm_pw;
	}
	public String getEmail() {
		return email;
	}
	public String getName() {
		return name;
	}
	public String getHospital() {
		return hospital;
	}
	public String[] getRoles() {
		return roles;
	}
}
