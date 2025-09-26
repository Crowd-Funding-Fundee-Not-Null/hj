package com.fundee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import com.fundee.dto.NoticeDTO;

@Mapper
public interface NoticeMapper {

	public List<NoticeDTO> getAllNotice(@Param("start") int start, @Param("end") int end) throws Exception;
	
	public List<NoticeDTO> getImportantNotice() throws Exception;
	
	public int getDataCount() throws Exception;
	
	public NoticeDTO getNoticeDetail(int notice_num) throws Exception;
	
	public void updateNoticeHitCount(int notice_num) throws Exception;
	
	public int getMaxNum() throws Exception;
	
	public void insertNotice(NoticeDTO dto) throws Exception;
	
	public void deleteNotice(int notice_num) throws Exception;
	
	
	
}