package com.fundee.dto;

import java.util.Date;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.springframework.web.multipart.MultipartFile;


import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Data
public class PostsDTO {
    private int posts_num; // 상품번호(게시글 번호)
    private String price;// 상품구매가격
    private String userId;// 사용자 id
    private String title;// 상품 제목
    private int goal_amount;// 목표 금액
    private int current_amount; // 현재 모금액
    private String start_date; // 판매 시작일
    private String end_date; // 판매 종료일
    private String reg_date; // 상품 등록일
    private String status; // 달성 진행 상태
    private String content;// 상품 내용
    private int hitCount; // 조회수
    
    // 파일 업로드 관련 변수 추가
    @JsonIgnore //JSON형태의 데이터타입이 왔을 때 FILE을 못불러오는데 그거를 막기 위한 어노테이션
    private MultipartFile upload; // 파일 자체를 담을 변수
    private String image_file;     // 파일명을 담을 변수
    
    
    
//    ------------------------------------------------------------
    
    private MultipartFile detail_upload; //상세 페이지 이미지 업로드 변수
    private String detail_imagefile; // 상세 페이지 이미지 파일명
    
   
    
}