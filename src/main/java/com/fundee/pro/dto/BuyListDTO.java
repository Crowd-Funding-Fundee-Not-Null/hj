package com.fundee.pro.dto;

import java.util.Date;

import lombok.Data;

@Data
public class BuyListDTO {
	
	private int buy_no;
	private String buy_date;
	private String id;
	private String title;
	private int qty;
	private int buy_price;
	private int total_price;
	
	private String name;
	private int posts_num;

	
	public int getTotalPrice() {
		return buy_price*qty;
	}


}