package com.spring.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class RequestDTO {

	private int seq; 
	private String user_id;
	private String ent_id;
	private String content;
	private String count;
	private Date date;
	private int time;
	private int fund;
	
}
