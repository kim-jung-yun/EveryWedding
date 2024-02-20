package com.spring.dto;

import lombok.Data;

@Data
public class UserDTO {
	private String user_id;
	private String user_pw;
	private String user_name;
	private boolean authentification;
	private String phone;
	private String email;	
	
}
