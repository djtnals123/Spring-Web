package com.sumin.spring.dto;

import java.io.Serializable;

@SuppressWarnings("serial")
public class UserDto implements Serializable{
	
	private String id;
	private String password;
	private String email;
	private String name;
	private String hospital;
	private String auth;
	private String createdDate;
	private int enabled;
	
	public UserDto() {	
	}
	

	public UserDto(String id, String password, String email, String name, String hospital, String roles, String createdDate, int enabled) {
		this.id = id;
		this.password = password;
		this.name = name;
		this.email = email;
		this.hospital = hospital;
		this.auth = roles;
		this.createdDate = createdDate;
		this.enabled = enabled;
	}
	

	public UserDto(String id, String password, String email, String name, String hospital, String roles) {
		super();
		this.id = id;
		this.password = password;
		this.email = email;
		this.name = name;
		this.hospital = hospital;
		this.auth = roles;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getHospital() {
		return hospital;
	}


	public void setHospital(String hospital) {
		this.hospital = hospital;
	}



	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}
	
	public String getCreatedDate() {
		return createdDate;
	}


	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}


	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	@Override
	public String toString() {
		return "UserDto [id=" + id + ", password=" + password+ ", email=" + ", name=" + name 
				+ ", hospital=" + ", roles=" + ", auth=" + auth + ", enabled=" + enabled + "]";
	}
}