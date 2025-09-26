package com.fundee.dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fundee.dto.PostsDTO;
import com.fundee.mapper.PostsMapper;

@Service
public class PostsDAO {

	@Autowired
	PostsMapper postsMapper;
	
	public int maxNum() throws Exception {
		return postsMapper.maxNum();
	}
	
	public void insertData(PostsDTO dto) throws Exception {
		postsMapper.insertData(dto);
	}
	
	// getDataCount 메소드에 검색 매개변수 추가
	public int getDataCount(String searchKey, String searchValue) throws Exception {
		return postsMapper.getDataCount(searchKey, searchValue);
	}
	
	// getLists 메소드에 검색 매개변수 추가
	public List<PostsDTO> getLists(int start, int end, String searchKey, String searchValue) throws Exception {
		return postsMapper.getLists(start, end, searchKey, searchValue);
	}
	
	// 상세 조회 메소드 (반환 타입 수정)
	public PostsDTO getReadData(int posts_num) throws Exception {
		return postsMapper.getReadData(posts_num);
	}
	
	public void updateHitCount(int posts_num) throws Exception {
		postsMapper.updateHitCount(posts_num);
	}
	
	public void updateData(PostsDTO dto) throws Exception {
		postsMapper.updateData(dto);
	}

	public void deleteData(int posts_num) throws Exception {
		postsMapper.deleteData(posts_num);
	}
	
	public List<PostsDTO> getRecommendedProducts() throws Exception {
		return postsMapper.getRecommendedProducts();
	}
	
}