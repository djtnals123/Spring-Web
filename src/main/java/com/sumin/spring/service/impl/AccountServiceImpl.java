package com.sumin.spring.service.impl;

import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.sumin.spring.dto.RegisterDto;
import com.sumin.spring.dto.UserDto;
import com.sumin.spring.repository.UserRepository;
import com.sumin.spring.service.AccountService;

@Service
public class AccountServiceImpl implements AccountService{
	
	@Autowired
	private UserRepository repository;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@Override
	public HashMap<String, Object> register(RegisterDto dto) {
		return processing(dto, "register");
	}

	@Override
	public UserDto getUserInfo() {
		String id = SecurityContextHolder.getContext().getAuthentication().getName();
		return repository.findOne(id);
	}

	@Override
	public HashMap<String, Object> modify(RegisterDto dto) {
		return processing(dto, "modify");
	}

    Pattern patternNumOrEng = Pattern.compile("^[a-zA-Z0-9]*$"); //영문 숫자만 허용
    Pattern patternIdLength = Pattern.compile("^.{8,30}$"); // ID 길이체크
    Pattern patternPassword = Pattern.compile("^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"); // 비밀번호
    Pattern patternEmail = Pattern.compile("^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$"); // 이메일 형식
    
	private String validation(RegisterDto dto, String service){

		String message = null;
		
		if(service.equals("register"))
		{
			if(repository.findOne(dto.getId()) != null)
				message = "이미 존재하는 아이디입니다.";
			else if(!patternNumOrEng.matcher(dto.getId()).matches() )
				message = "ID는 영문 또는 숫자만 가능합니다.";
			else if(!patternIdLength.matcher(dto.getId()).matches()) 
				message = "ID는 8글자이상 30글자 이하만 허용합니다.";
		}
		if(message == null) {
			if(!patternPassword.matcher(dto.getPw()).matches()) 
				message = "비밀번호는 영문, 숫자, 특수문자를 조합한 8자리 이상만 허용합니다.";
			else if(!dto.getPw().equals(dto.getConfirm_pw()))
				message = "비밀번호와 비밀번호확인이 일치하지 않습니다.";
			else if(dto.getEmail().length() == 0)
				message = "이메일을 입력해주세요.";
			else if(!patternEmail.matcher(dto.getEmail()).matches())
				message = "유효하지않는 이메일 형식입니다.";
			else if(dto.getEmail().length() > 50)
				message = "이메일은 최대 50글자까지 가능합니다.";
			else if(dto.getName().length() == 0)
				message = "이름을 입력해주세요.";
			else if(dto.getName().length() > 25)
				message = "이름은 최대 25글자까지 가능합니다.";
			else if(dto.getHospital().equals("S") == dto.getHospital().equals("K"))
				message = "병원을 선택해 주세요.";
			else if(dto.getRoles() == null)
				message = "회원형태를 선택해 주세요.";
		}

		
		return message;
	}
	
	private HashMap<String, Object> processing(RegisterDto dto, String service) {
		String message = validation(dto, service);
		if(message == null) {
			UserDto user = casting(dto, service);
			if(service.equals("register"))
				repository.save(user);
			else if(service.equals("modify"))
				repository.modify(user);
		}

		HashMap<String, Object> result = new HashMap <String,Object>();
		result.put("msg", message);
		result.put("isSuccess", message == null );
		

		return result;
	}

	private UserDto casting(RegisterDto dto, String service) {
		String endcodedPassword = bcryptPasswordEncoder.encode(dto.getPw());
		String newRoles = String.join(",", dto.getRoles())
				.replace("1", "ROLE_PATIENT")
				.replace("2", "ROLE_DOCTOR");
		String id = service.equals("register") ? dto.getId() : SecurityContextHolder.getContext().getAuthentication().getName();
		UserDto user = new UserDto(id, endcodedPassword, dto.getEmail(), dto.getName(), dto.getHospital(), newRoles); 
		return user;
	}
}
