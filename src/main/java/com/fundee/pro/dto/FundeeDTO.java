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
    private int postsNum; // ��ǰ��ȣ(�Խñ� ��ȣ)
    private String price;// ��ǰ���Ű���
    private String userId;// ����� id
    private String title;// ��ǰ ����
    private int goalAmount;// ��ǥ �ݾ�
    private int currentAmount; // ���� ��ݾ�
    private String startDate; // �Ǹ� ������
    private String endDate; // �Ǹ� ������
    private String regDate; // ��ǰ �����
    private String status; // �޼� ���� ����
    private String content;// ��ǰ ����
    private int hitCount; // ��ȸ��
    
    // ���� ���ε� ���� ���� �߰�
    private MultipartFile upload; // ���� ��ü�� ���� ����
    private String imageFile;     // ���ϸ��� ���� ����
    
}