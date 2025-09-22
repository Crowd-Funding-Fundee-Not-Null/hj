package com.fundee.pro.dto;

import lombok.Data;

@Data
public class LoginDTO {
   private String id;            
	    private String password;       
	    private String passwordCheck;  //��й�ȣ Ȯ�� �ϴ� ��
	    private String username;       
	    private String email;          
	    private String phone;          
	    private String birthDate;      //�ֹ� ��ȣ ��� ����(001111)
	    private String address;        //�ּ�
	    private String role;           //���� (���)
	    private String nickname;       //Ȱ�� �̸�
	    private String join_date;      //���� ����
	
}
