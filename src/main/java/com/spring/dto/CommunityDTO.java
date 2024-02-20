package com.spring.dto;

import lombok.Data;

@Data
public class CommunityDTO {
	  private int community_seq;
	  private String community_name;
	  private String community_content;
	  private String user_id;
}
