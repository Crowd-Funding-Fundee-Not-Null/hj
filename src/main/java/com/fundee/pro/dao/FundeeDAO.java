package com.fundee.pro.dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fundee.pro.dto.FundeeDTO;
import com.fundee.pro.mapper.FundeeMapper;

@Service("fundeeDAO")
public class FundeeDAO {

	@Autowired
	FundeeMapper fundeeMapper;
	
	public int maxNum() throws Exception {
		return fundeeMapper.maxNum();
	}
	
	public void insertData(FundeeDTO dto) throws Exception {
		fundeeMapper.insertData(dto);
	}
	
	// getDataCount �޼ҵ忡 �˻� �Ű����� �߰�
	public int getDataCount(String searchKey, String searchValue) throws Exception {
		return fundeeMapper.getDataCount(searchKey, searchValue);
	}
	
	// getLists �޼ҵ忡 �˻� �Ű����� �߰�
	public List<FundeeDTO> getLists(int start, int end, String searchKey, String searchValue) throws Exception {
		return fundeeMapper.getLists(start, end, searchKey, searchValue);
	}
	
	// �� ��ȸ �޼ҵ� (��ȯ Ÿ�� ����)
	public FundeeDTO getReadData(int posts_Num) throws Exception {
		return fundeeMapper.getReadData(posts_Num);
	}
	
	public void updateHitCount(int posts_Num) throws Exception {
		fundeeMapper.updateHitCount(posts_Num);
	}
	
	public void updateData(FundeeDTO dto) throws Exception {
		fundeeMapper.updateData(dto);
	}

	public void deleteData(int posts_Num) throws Exception {
		fundeeMapper.deleteData(posts_Num);
	}
}