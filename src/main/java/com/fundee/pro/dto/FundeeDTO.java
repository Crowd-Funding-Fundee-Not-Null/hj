package com.fundee.pro.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Data
public class FundeeDTO {
    private int postsNum; // 상품번호(게시글 번호)
    private String price;// 상품구매가격
    private String userId;// 사용자 id
    private String title;// 상품 제목
    private int goalAmount;// 목표 금액
    private int currentAmount; // 현재 모금액
    private String startDate; // 판매 시작일
    private String endDate; // 판매 종료일
    private String regDate; // 상품 등록일
    private String status; // 달성 진행 상태
    private String content;// 상품 내용
    private int hitCount; // 조회수
    
    // 파일 업로드 관련 변수 추가
    private MultipartFile upload; // 파일 자체를 담을 변수
    private String imageFile;     // 파일명을 담을 변수
    
}