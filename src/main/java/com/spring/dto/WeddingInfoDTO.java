package com.spring.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class WeddingInfoDTO {
	  private int wedding_seq;
	  private Date date;
	  private int budget;
	  private String user_id;
	  private String region;
	  

}
