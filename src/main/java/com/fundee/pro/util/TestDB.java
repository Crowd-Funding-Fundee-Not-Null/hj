package com.fundee.pro.util;

import java.sql.Connection;

//jdbc 자바 데이터 베이스 커넥티드

public class TestDB {

	public static void main(String[] args) {

		//필요할때마다 이 코딩을 사용할 예정!!!, 공동사용이 안됨.
		Connection conn = DBConnFunding.getConnection();

		if(conn==null) {
			System.out.println("데이터베이스 연결 실패!!");
			System.exit(0);
		}else {
			System.out.println("데이터베이스 연결 성공!!");
		}

		DBConnFunding.close();

	}

}
