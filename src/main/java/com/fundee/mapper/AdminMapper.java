package com.fundee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import com.fundee.dto.LoginDTO;
import com.fundee.dto.NoticeDTO;
import com.fundee.dto.PostsDTO;

@Mapper
public interface AdminMapper {

	public List<LoginDTO> getAllMember() throws Exception;
	
	public List<Integer> getPostsNums() throws Exception;
	
	public List<PostsDTO> get4randomPosts(List<Integer> numArr) throws Exception;
	
}