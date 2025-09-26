package com.fundee.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fundee.dto.LoginDTO;
import com.fundee.dto.NoticeDTO;
import com.fundee.dto.PostsDTO;
import com.fundee.mapper.AdminMapper;
import com.fundee.mapper.NoticeMapper;

import lombok.RequiredArgsConstructor;

@Service
public class AdminDAO {

	@Autowired
	AdminMapper adminMapper;
	
	public List<LoginDTO> getAllMember() throws Exception {
		return adminMapper.getAllMember();
	}
	
	public List<Integer> getPostsNums() throws Exception {
		return adminMapper.getPostsNums();
	}
	
	public List<PostsDTO> get4randomPosts(List<Integer> numArr) throws Exception {
		return adminMapper.get4randomPosts(numArr);
	}
	
	
}
