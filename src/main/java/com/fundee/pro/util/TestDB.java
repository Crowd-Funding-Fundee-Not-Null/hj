package com.fundee.pro.util;

import java.sql.Connection;

//jdbc �ڹ� ������ ���̽� Ŀ��Ƽ��

public class TestDB {

	public static void main(String[] args) {

		//�ʿ��Ҷ����� �� �ڵ��� ����� ����!!!, ��������� �ȵ�.
		Connection conn = DBConnFunding.getConnection();

		if(conn==null) {
			System.out.println("�����ͺ��̽� ���� ����!!");
			System.exit(0);
		}else {
			System.out.println("�����ͺ��̽� ���� ����!!");
		}

		DBConnFunding.close();

	}

}
