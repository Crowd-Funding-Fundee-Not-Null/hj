package com.fundee.dao;

import java.util.List;
import javax.inject.Inject;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fundee.dto.BuyListDTO;
import com.fundee.dto.PostsDTO;
import com.fundee.mapper.BuyMapper;

//이건 다오지만 서비스 역할이야
@Service
public class BuyDAO {
	
	@Autowired
	BuyMapper buyMapper;
	
	public int maxNumber() throws Exception {
		return buyMapper.maxNumber();
	}
	
	public void buyData(int proNo) throws Exception {
		buyMapper.buyData(proNo);
	}
	
	public void insertData(BuyListDTO dto) throws Exception {
		buyMapper.insertData(dto);
	}

	public void updateQty(BuyListDTO dto) throws Exception {
		buyMapper.updateQty(dto);
	}
	
	public BuyListDTO checkData(int buyNumber) throws Exception {
		return buyMapper.checkData(buyNumber);
	}
	
	public List<BuyListDTO> getBuyListAll(String id) throws Exception {
		return buyMapper.getBuyListAll(id);
	}
	
/*	public int getBuyDataCount(String id) throws Exception {
		return buyMapper.getBuyDataCount(id);
	}
	
	public List<BuyListDTO> getCountData(String id, int start, int end) throws Exception{
		return buyMapper.getCountData(id, start, end);
	} */
	
	
	
	//status를 위한거 추가
	public PostsDTO selectPostsInfo(int posts_num) throws Exception{
		return buyMapper.selectPostsInfo(posts_num);
	}

	
	public void updatePosts(PostsDTO dto)throws Exception{
		buyMapper.updatePosts(dto);
	}


}