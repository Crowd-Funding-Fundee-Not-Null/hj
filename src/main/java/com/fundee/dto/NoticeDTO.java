package com.fundee.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class NoticeDTO {

	private int notice_num;
	private String id;
	private String title;
	private String content;
	private int hitcount;
	private String reg_date;
	private int importance;
	
}

