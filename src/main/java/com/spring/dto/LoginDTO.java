package com.spring.dto;

import lombok.Data;

@Data
public class LoginDTO {
	private String user_id;
	private String user_pw;
	private String user_name;
	private boolean user_type;
}
