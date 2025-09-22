package com.fundee.pro.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.fundee.pro.dto.FundeeDTO;


@Mapper
public interface FundeeMapper {
	
	public int maxNum() throws Exception;
	public void insertData(FundeeDTO dto) throws Exception;
	
	// 검색 매개변수를 받도록 수정
	public int getDataCount(@Param("searchKey") String searchKey, @Param("searchValue") String searchValue) throws Exception;
	
	// 검색 매개변수를 받도록 수정
	public List<FundeeDTO> getLists(@Param("start") int start, @Param("end") int end, @Param("searchKey") String searchKey, @Param("searchValue") String searchValue) throws Exception;
	
	public FundeeDTO getReadData(int posts_Num) throws Exception;
	
	public void updateHitCount(int postsNum) throws Exception;
	public void updateData(FundeeDTO dto) throws Exception;
	public void deleteData(int posts_Num) throws Exception;
}