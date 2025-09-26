package com.fundee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fundee.dto.BuyListDTO;
import com.fundee.dto.PostsDTO;

@Mapper
public interface BuyMapper {
	
//���Ź�ȣ
	public int maxNumber() throws Exception;

	//�����ϱ� �������� ���� �������� ��ǰ�� ���� ������ ���� ���
//���������� �޾Ƽ� ��ǰ�� �������, ����ڰ� ������ ����,
//�ۼ��ѻ���� ���̵�� �̸��� �����Ϳͼ� �����ؾ���
	public void buyData(int posts_num) throws Exception;
	
	
//�̰Ŵ� ������ �����ؼ� �����ϴ� ������� �ٲ�� �ҰͰ���
//�����ϱ� â���� �����ϱ� ��ư �������� - ������ ��ǰ �� ���� ����
//��ȯ�� ���� ������ ���� ���
	public void insertData(BuyListDTO dto) throws Exception;
	
    public void updateQty(BuyListDTO dto) throws Exception;

	
//���ſϷ� ���������� ����ϴ�
// ���Ź�ȣ�� ã�Ƽ� ������ǰ,����, �����ּ�, �̸� ���(�Ѱ� ���)
	public BuyListDTO checkData(int buy_no) throws Exception;

//�������������� ����ϴ� ������ ���̵�� ã�Ƽ� ��ü���ų��� ���(�ٷ��̴�)
// ������ ��ǰ, ����, �Ѱ����ݾ�, �������� �ؽ�Ʈ ���
	public List<BuyListDTO> getBuyListAll(String id) throws Exception ;

	
//-----------------------------------------
	//��ǰ��ȣ �������� posts ���̺� ���� ������(����ؾ��ϰŵ�)
	public PostsDTO selectPostsInfo(int posts_num) throws Exception;
	
	//posts ���̺� ������Ʈ �Ұž�
	public void updatePosts(PostsDTO dto)throws Exception;
	
	
	
	
	
}