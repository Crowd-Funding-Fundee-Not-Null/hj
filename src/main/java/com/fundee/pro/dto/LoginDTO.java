package com.fundee.pro.dto;

import lombok.Data;

@Data
public class LoginDTO {
   private String id;            
	    private String password;       
	    private String passwordCheck;  //비밀번호 확인 하는 거
	    private String username;       
	    private String email;          
	    private String phone;          
	    private String birthDate;      //주민 번호 대신 생일(001111)
	    private String address;        //주소
	    private String role;           //권한 (운영자)
	    private String nickname;       //활동 이름
	    private String join_date;      //가입 날자
	
}
