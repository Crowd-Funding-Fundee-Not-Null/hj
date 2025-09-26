package com.fundee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.fundee.dto.PostsDTO;

@Mapper
public interface PostsMapper {
	
	public int maxNum() throws Exception;
	public void insertData(PostsDTO dto) throws Exception;
	
	// 검색 매개변수를 받도록 수정
	public int getDataCount(@Param("searchKey") String searchKey, @Param("searchValue") String searchValue) throws Exception;
	
	// 검색 매개변수를 받도록 수정
	public List<PostsDTO> getLists(@Param("start") int start, @Param("end") int end, @Param("searchKey") String searchKey, @Param("searchValue") String searchValue) throws Exception;
	
	public PostsDTO getReadData(int posts_num) throws Exception;
	
	public void updateHitCount(int posts_num) throws Exception;
	public void updateData(PostsDTO dto) throws Exception;
	public void deleteData(int posts_num) throws Exception;
	
	
    List<PostsDTO> getRecommendedProducts() throws Exception;
}